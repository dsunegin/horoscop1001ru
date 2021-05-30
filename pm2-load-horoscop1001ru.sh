#!/bin/sh

npm run compile


pm2 status | grep load-horoscop1001ru && pm2 delete load-horoscop1001ru
pm2 status | grep load-horoscop1001ru-refact && pm2 delete load-horoscop1001ru-refact
# Load Start each 6 hours
CRON="0 */6 * * *" pm2 start npm --name load-horoscop1001ru  -- run start
# Refact Start at 20:00
CRON="00 20 * * *" pm2 start npm --name load-horoscop1001ru-refact  build/src/refact.js

pm2 save