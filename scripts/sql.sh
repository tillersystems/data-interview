#!/bin/bash

mysql -hBDD -proot -e "grant all privileges on *.* to 'tillerinterview'@'%' ;FLUSH PRIVILEGES;"

for i in {1..3}
do
    mysql -hBDD -proot tillerinterview < ./data/sql/schemas$i.sql;
    mysql -hBDD -proot tillerinterview < ./data/sql/stores$i.sql;
    mysql -hBDD -proot tillerinterview < ./data/sql/products$i.sql;
    mysql -hBDD -proot tillerinterview < ./data/sql/relations$i.sql;
    mysql -hBDD -proot tillerinterview < ./data/sql/sales$i.sql;
done
