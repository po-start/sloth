SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
/* 创建从库链接帐号 */
GRANT REPLICATION SLAVE ON *.* to 'data-synchronization'@'172.32.6.%' identified by 'MASDFopw89234';
/* 查看链接 */
show processlist;
/* 查看半同步信息 */
show global status like '%semi%';
