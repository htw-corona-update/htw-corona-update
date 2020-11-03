# HTW Corona Update

This projects enables automatic email notifications for changes in the HTW-Corona-FAQs.
To get notified of changes, subscribe to this mailing list:

[https://lists.htw-berlin.de/mailman/listinfo/corona-update](https://lists.htw-berlin.de/mailman/listinfo/corona-update)

This repo contains a script - update.sh - that downloads the corona-faqs and generates a commit with the changes if any of the faqs has changed.

The script runs every 15 minutes via crontab: 

0,15,30,45 * * * * cd /home/deployer/htw-corona-update && /bin/bash update.sh 

Thanks to Kaes3kuch3n for the brilliant idea! His script pushes the changes to the fsr slack:[https://github.com/fsr4/htwFAQUpdates/](https://github.com/fsr4/htwFAQUpdates/) 
