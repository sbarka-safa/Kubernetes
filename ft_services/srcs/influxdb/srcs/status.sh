pgrep influxd
v_influxd=$?

pgrep telegraf
v_telegraf=$?

ps > crashed
grep '\[*\]' crashed
v_crashed=$?

if [ $v_telegraf == 0 ] && [ $v_crashed == 1 ] && [ $v_influxd == 0 ]; then
        exit 0;
fi
exit 1;
