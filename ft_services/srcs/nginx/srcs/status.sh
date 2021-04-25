
pgrep telegraf
v_telegraf=$?

pgrep nginx
v_nginx=$?

pgrep sshd
v_sshd=$?

ps > crashed
grep '\[*\]' crashed
v_crashed=$?

if [ $v_telegraf == 0 ] && [ $v_crashed == 1 ] && [ $v_nginx == 0 ] &&[ $v_sshd == 0 ]; then
        exit 0;
fi
exit 1;
