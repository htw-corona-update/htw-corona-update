# HTW Corona Update

This projects enables automatic email notifications for changes in the HTW-Corona-FAQs.
To get notified of changes, subscribe to this mailing list:

[https://lists.htw-berlin.de/mailman/listinfo/corona-update](https://lists.htw-berlin.de/mailman/listinfo/corona-update)

This repo contains a script - update.sh - that downloads the corona-faqs and generates a commit with the changes if any of the faqs has changed.

The script runs every 15 minutes via crontab: 

0,15,30,45 * * * * cd /home/deployer/htw-corona-update && /bin/bash update.sh 

The credits for the idea for a diff script go to Kaes3kuch3n!
His script pushes the changes to the fsr slack:[https://github.com/fsr4/htwFAQUpdates/](https://github.com/fsr4/htwFAQUpdates/) 

## History

To see the history of changes, click on "commits" : [https://github.com/htw-corona-update/htw-corona-update/commits/main](https://github.com/htw-corona-update/htw-corona-update/commits/main)

## 9.11.2020
The changes from tonight are no changes, two files were deleted and added back, the overall diff is empty: 
deployer@imi-map:~/htw-corona-update$ git diff d9680e9e28acc5da71bd25f19c3aba9a3cb61d38 HEAD
deployer@imi-map:~/htw-corona-update$

# Implementation and About

this update service is a collection of software development and unix tools:

- wget to download the four HTML files
- git as Source Code Management tool to manage and track changes
- github as a service with a web interface for git, providing colored diffs with additions (+, green) and removals (-, red) in the files and the email notification
- a good old maillist tool: mailman 
- a brief shell script to stitch all this together (update.sh)

