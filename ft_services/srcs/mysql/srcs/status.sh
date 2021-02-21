
pgrep mysql 

v_mysql=$?

pgrep telegraf

v_telegraf=$?

ps > crashed

grep '\[*\]' crashed

v_crashed=$?

if [ $v_mysql -eq 0 ] && [ $v_telegraf -eq 0 ] && [ $v_crashed -eq 1 ]; then
        exit 0;
fi
exit 1;
