# HTW Corona Update

This projects enables automatic email notifications for changes in the HTW-Corona-FAQs.
To get notified of changes, subscribe to this maillist:

[https://lists.htw-berlin.de/mailman/listinfo/corona-update](https://lists.htw-berlin.de/mailman/listinfo/corona-update)

This repo contains a script - update.sh - that downloads the corona-faqs and generates a commit with the changes if any of the faqs has changed.

The script runs every 15 minutes: 

0,15,30,45 * * * * cd /home/deployer/htw-corona-update && /bin/bash update.sh > /tmp/update2.output

