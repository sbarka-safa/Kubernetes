
pgrep telegraf
v_telegraf=$?

pgrep grafana-server
v_grafana=$?

ps > crashed
grep '\[*\]' crashed
v_crashed=$?

if [ $v_telegraf == 0 ] && [ $v_crashed == 1 ] && [ $v_grafana == 0 ]; then
        exit 0;
fi
exit 1;
