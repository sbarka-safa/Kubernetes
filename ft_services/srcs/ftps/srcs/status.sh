
pgrep telegraf
v_telegraf=$?

pgrep vsftpd
v_vsftpd=$?

ps > crashed
grep '\[*\]' crashed
v_crashed=$?

if [ $v_telegraf == 0 ] && [ $v_crashed == 1 ] && [ $v_vsftpd == 0 ]; then
        exit 0;
fi
exit 1;
