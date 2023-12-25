[Home](Readme.md)
# cron

Cron jobs scheculing. Also cron expressions used in other places, like Azure Function triggers.

See Also:

  - [bash](bash.md)
  - [Linux](Linux.md)

---

**Contents**

- [Miscellaneous](Cron.md#miscellaneous)

---

## Miscellaneous

---

The expression has 5 parts:

    minute hour day(month) month day(week)

The modifiers include:

    *	any value
    ,	value list separator
    - range of values
    /	step values
    @yearly	(non-standard)
    @annually	(non-standard)
    @monthly	(non-standard)
    @weekly	(non-standard)
    @daily	(non-standard)
    @hourly	(non-standard)
    @reboot	(non-standard)

Examples:

    */15 * * * *               --- every 15th minute
    */15,*/10 * * * *          --- every 15h minute and every 10th minute


---

Cron editor

https://crontab.guru/

---

TODO: do the summary of the link.

Neat refresher on creating cron jobs:
https://www.cyberciti.biz/faq/how-do-i-add-jobs-to-cron-under-linux-or-unix-oses/

---

Nice thread about manipulating cron jobs in bash, etc. 

https://stackoverflow.com/questions/878600/how-to-create-a-cron-job-using-bash-automatically-without-the-interactive-editor

Some info here:

https://www.cyberciti.biz/faq/how-do-i-add-jobs-to-cron-under-linux-or-unix-oses/

    croncmd="/home/me/myfunction myargs > /home/me/myfunction.log 2>&1"
    cronjob="0 */15 * * * $croncmd"

Redirect the output to a file(or /dev/null) to avoid sending emails to local email account.
To add it to the crontab, with no duplication:

    ( crontab -l | grep -v -F "$croncmd" ; echo "$cronjob" ) | crontab -

To remove it from the crontab whatever its current schedule:

    ( crontab -l | grep -v -F "$croncmd" ) | crontab -

`grep -F` matches the string literally(not a regex)

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
