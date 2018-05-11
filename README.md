# Data interview repo
Simple containerized FlaskApp for data interviews

## Description
- 2 Containers
	- **Mysql5.7 server** (:3306)
	- **Python2.7 Flask webserver** (:5000)
		- Volume : `./:/tillerinterview`
		- Environment : 
			- **MYSQL_ROOT_PASSWORD:** root
	        - **MYSQL_DATABASE:** tillerinterview
	        - **MYSQL_USER:** tillerinterview
	        - **MYSQL_PASSWORD:** tillerinterview
	        - **AMAZON_S3_DATALAKE:** "s3://datalake-tiller.amazon.com" 
	        (Fake endpoint for the moment)
## Start project  
**Build first images and starts containers :**  
`docker-compose up -d` : Browse on http://0.0.0.0:5000/  
**ssh on python container :**  
`./ssh.sh python`  
**Connect on mysql server:**  
(From python Container)  
`mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -h $DB_1_PORT_3306`
