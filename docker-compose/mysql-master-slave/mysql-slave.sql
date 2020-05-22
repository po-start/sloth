SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
/* 变更主库连接帐号 */
change master to master_host='mysql-master',master_user='data-synchronization',master_password='MASDFopw89234';
/* 安装Slave数据半同步插件 */
INSTALL PLUGIN rpl_semi_sync_slave SONAME 'semisync_slave.so';
/*INSTALL PLUGIN rpl_semi_sync_master SONAME 'semisync_master.so';*/
/* 启动从库 */
start slave;

/* 功能命令 */
/* 锁表 注会影响到全局同步 */
flush tables with read lock;
/* 解锁 */
unlock tables;
/* 查看主库状态 */
show master status;
/* 查看从库状态 */
show slave status;
/* 停止从库 */
stop slave;
/* 跳过一个事务 */
SET GLOBAL SQL_SLAVE_SKIP_COUNTER = 1;
/* 开启从库 */
start slave;
