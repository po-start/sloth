SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY','')); 
/* 变更主库连接帐号 */
change master to master_host='172.32.6.10',master_user='data-synchronization',master_password='MASDFopw89234';
/* 启动从库 */
start slave;
