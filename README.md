

![sirt](https://github.com/itzortzis/SIRT/assets/105294556/15262f4b-c564-4b7f-b2ad-617d42e16171)


# SIRT

SIRT stands for Server Info Report Tool.
It consists of a simple shell script, initially created for reporting the IP address of the host server when it is changed.
Potentially, the tool could be used for reporting more details of the server.


## Requirements

In order for this tool to be executed successfully, an SMTP(Simple Mail Transfer Protocol) should be installed and configured properly.


## Run as a service in Linux

SIRT has been tested using the cron; daemon to execure scheduled task.

In a terminal type

```sh
crontab -e
```

and add the following lines at the end of the file

```sh
SHELL=/bin/bash
* * * * * /path_to_the_tool/server_info_report.sh
```

If you need a custom scheduling, change the asterisks of the final line according to the manual of cron. If you leave the asterisks as is, the script will be executed every minute.







