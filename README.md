# HTW Corona Update

## Disclaimer

This is an __unofficial__ service to be notified of updates in the [HTW Corona FAQs](https://www.htw-berlin.de/coronavirus/).

It is an IT art project; you will see git diffs. 
It will send emails in the middle of the night.

It may stop or pause functioning as it runs clandestinely on a server that was 
not meant for this.

Credits for the idea go to [Kaes3kuch3n!](https://github.com/Kaes3kuch3n) who 
wrote a script that pushes the changes to the FSR 4 Slack: [https://github.com/fsr4/htwFAQUpdates/](https://github.com/fsr4/htwFAQUpdates/)


## Subscribe
If want to get notified of changes in the HTW Corona FAQs, subscribe to the mailing list (there is also an option for daily digests:)

[https://lists.htw-berlin.de/mailman/listinfo/corona-update](https://lists.htw-berlin.de/mailman/listinfo/corona-update)

## History

To see the history of changes, click on "commits" : [https://github.com/htw-corona-update/htw-corona-update/commits/main](https://github.com/htw-corona-update/htw-corona-update/commits/main)


# Implementation and About

this update service is a collection of software development and unix tools:

- wget to download the four HTML files
- git as Source Code Management tool to manage and track changes
- github as a service with a web interface for git, providing colored diffs with additions (+, green) and removals (-, red) in the files and the email notification
- a good old maillist tool: mailman 
- a brief shell script to stitch all this together (update.sh)

The script runs every 15 minutes via crontab:

0,15,30,45 * * * * cd /home/deployer/htw-corona-update && /bin/bash update.sh 

