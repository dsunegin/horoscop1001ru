import * as assets from './assets/assets';
const mysql = require('mysql2');
const {crc16} = require('crc');
const envconf = require('dotenv').config();
const cron = require('node-cron');
import axios from 'axios';
let iconv = require('iconv-lite');


if (envconf.error) {
    throw envconf.error;
} // ERROR if Config .env file is missing

const site = '1001goroskop.ru';
const language = 'ru';
const Zodiac = [
    {name: 'Овен', code: 'aries', href: 'https://1001goroskop.ru/?znak=aries'},
    {name: 'Телец', code: 'taurus', href: 'https://1001goroskop.ru/?znak=taurus'},
    {name: 'Близнецы', code: 'gemini', href: 'https://1001goroskop.ru/?znak=gemini'},

    {name: 'Рак', code: 'cancer', href: 'https://1001goroskop.ru/?znak=cancer'},
    {name: 'Лев', code: 'leo', href: 'https://1001goroskop.ru/?znak=leo'},
    {name: 'Дева', code: 'virgo', href: 'https://1001goroskop.ru/?znak=virgo'},

    {name: 'Весы', code: 'libra', href: 'https://1001goroskop.ru/?znak=libra'},
    {name: 'Скорпион', code: 'scorpio', href: 'https://1001goroskop.ru/?znak=scorpio'},
    {name: 'Стрелец', code: 'sagittarius', href: 'https://1001goroskop.ru/?znak=sagittarius'},

    {name: 'Козерог', code: 'capricorn', href: 'https://1001goroskop.ru/?znak=capricorn'},
    {name: 'Водолей', code: 'aquarius', href: 'https://1001goroskop.ru/?znak=aquarius'},
    {name: 'Рыбы', code: 'pisces', href: 'https://1001goroskop.ru/?znak=pisces'}
];

const connectionESOTERIC = mysql
    .createConnection({
        host: process.env.DB_ESOTERICHOST,
        port: process.env.DB_ESOTERICPORT,
        user: process.env.DB_ESOTERICUSER,
        database: process.env.DB_ESOTERICDATABASE,
        password: process.env.DB_ESOTERICPASSWORD,
    })
    .promise();



const main = async (): Promise<string> => {
    try {

        for (let ic = 0, icat; (icat = Zodiac[ic]); ++ic) {
            await assets.wait(5000);            // Timeout for Next HTTP Request - To avoid blocking from website

            let Response;
            await axios.get(icat.href,{ headers: { 'User-Agent': 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)',
                    'Accept': 'application/json;charsrt: utf-8'},
                responseType: 'arraybuffer',
                timeout: 30000
            })
                .then(response =>    {
                    Response = iconv.decode(Buffer.from(response.data), 'win1251').toString();
                })
                .catch(error => {
                    console.log(error);
                });
            if (!Response) continue;

            const regexTitleBox = /<h1.*?id=\"eje_tema_h1\".*?>(.*?)<\/h1>/gs;
            let extracted = regexTitleBox.exec(Response);
            if (!extracted) continue;
            let ZnakTitle = extracted[1].trim();

            const regexPostBox = /<div.*?class=\"eje_block\".*?<div.*?itemprop=\"description\".*?<p>(.*?)<\/p>/gs;
            extracted = regexPostBox.exec(Response);
            if (!extracted) continue;
            let ZnakPost = extracted[1].trim();

                    let sql = `SELECT * FROM horoscope WHERE post=? `;
            let result = await connectionESOTERIC.query(sql,[ZnakPost]);
            if (result[0].length > 0) continue;

            sql =
                'INSERT INTO horoscope (title, post, date, zodiac, site, lang) ' +
                'VALUES (?,?,NOW(),?,?,?)';
            const post = [ZnakTitle, ZnakPost, icat.code, site, language];
            await connectionESOTERIC.query(sql, post);


        } // End For
        return 'Successful';
    } catch (err) {
        console.log(err);
        return err.message;
    }
};

if (process.env.CRON) {
    console.log('Cron Scheduled');
    cron.schedule(
        process.env.CRON,
        () => {
            main()
                .then()
                .catch(err => console.error(err));
        },
        {scheduled: true}
    );
} else {
    main()
        .then(created => console.log(created))
        .catch(err => console.error(err));
}

