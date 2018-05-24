#!/bin/bash

echo "To connect to the MySQL database, run the following:"
echo "    $ mysql -h BDD -u tillerinterview -ptillerinterview"
echo " "
echo "To execute your scripts:"
echo "    $ cd tillerinterview"
echo "    $ python testX.py"
echo " "

docker exec -it $(docker ps -aqf "name=$1") bash;
