#!/bin/sh

# Start each 6 hours

pm2 status | grep load-horoscop1001ru && pm2 delete load-horoscop1001ru
CRON="0 */6 * * *" pm2 start npm --name load-horoscop1001ru  -- run start
pm2 save