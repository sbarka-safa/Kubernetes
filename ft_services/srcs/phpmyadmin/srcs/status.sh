
pgrep telegraf
v_telegraf=$?

pgrep nginx
v_nginx=$?

pgrep php-fpm7
v_php=$?

ps > crashed
grep '\[*\]' crashed
v_crashed=$?

if [ $v_nginx -eq 0 ] && [ $v_telegraf -eq 0 ] && [ $v_crashed -eq 1 ] && [ $v_php -eq 0 ]; then
        exit 0;
fi
exit 1;
