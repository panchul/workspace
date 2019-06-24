
## UNDER CONSTRUCTION

# cron

See Also:

  - [bash](bash.md)
  - [Linux](Linux.md)

---

Nice thread about manipulating cron jobs in bash, etc. 

https://stackoverflow.com/questions/878600/how-to-create-a-cron-job-using-bash-automatically-without-the-interactive-editor

Some infor here:

https://www.cyberciti.biz/faq/how-do-i-add-jobs-to-cron-under-linux-or-unix-oses/

    croncmd="/home/me/myfunction myargs > /home/me/myfunction.log 2>&1"
    cronjob="0 */15 * * * $croncmd"

Redirect the output to a file(or /dev/null) to avoid sending emails to local email account.
To add it to the crontab, with no duplication:

    ( crontab -l | grep -v -F "$croncmd" ; echo "$cronjob" ) | crontab -

To remove it from the crontab whatever its current schedule:

    ( crontab -l | grep -v -F "$croncmd" ) | crontab -

```grep -F``` matches the string literally(not a regex)

Cron line

    * * * * * "command to be executed"
    - - - - -
    | | | | |
    | | | | ----- Day of week (0 - 7) (Sunday=0 or 7)
    | | | ------- Month (1 - 12)
    | | --------- Day of month (1 - 31)
    | ----------- Hour (0 - 23)
    ------------- Minute (0 - 59)

Special string	Meaning

    @reboot	  Run once, at startup.
    @yearly	  Run once a year, “0 0 1 1 *”.
    @annually (same as @yearly)
    @monthly  Run once a month, “0 0 1 * *”.
    @weekly   Run once a week, “0 0 * * 0”.
    @daily    Run once a day, “0 0 * * *”.
    @midnight (same as @daily)
    @hourly   Run once an hour, “0 * * * *”.

---