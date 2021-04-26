pgrep nginx
v_nginx=$?

pgrep php-fpm7
v_php=$?

pgrep telegraf
v_telegraf=$?

ps > crashed
grep '\[*\]' crashed
v_crashed=$?

if [ $v_telegraf == 0 ] && [ $v_crashed == 1 ] && [ $v_nginx == 0 ] && [ $v_php == 0 ]; then
        exit 0;
fi
exit 1;
