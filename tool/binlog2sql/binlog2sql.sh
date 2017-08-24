#! /usr/bin/env bash

set -e

SCRIPTPATH=$(cd `dirname $0`; pwd)
DATATIME=$(date +"%Y-%m-%d %H:%M:%S")
DATEPATTERN="^[0-9]{4}-[0-9]{2}-[0-9]{2} [0-2][0-9]:[0-5][0-9]:[0-5][0-9]$"

DB_HOST="127.0.0.1"
DB_USER="root"
DB_PASSWORD="hello123"
DB_PORT=3306
DATABASE=""
BINLOGFILE=""
BEGINTIME=""
ENDTIME=""

if [ "$1x" == "x" ]
then
	while true
	do
		printf "\x1B[32m"
		echo -n "请输入导出的数据库: "
		printf "\x1B[0m"
		read results	
		if [ "${results}x" != "x" ]
		then
			DATABASE=${results}
			break
		fi
	done
else
	DATABASE=$1
fi

if [ "$2x" == "x" ]
then
    while true
    do  
		printf "\x1B[32m"
		echo -n "请输入导出binlog文件: "
		printf "\x1B[0m"
        read results  
        if [ "${results}x" != "x" ]
        then
            BINLOGFILE=${results}
            break
        fi  
    done
else
	BINLOGFILE=$2
fi

if [ "$3x" == "x" ]
then
    while true
    do  
		printf "\x1B[32m"
		echo -n "请输入导出数据开始时间: "
		printf "\x1B[0m"
        read results  
        if [[ "${results}x" != "x" ]] && [[ "${results}" =~ ${DATEPATTERN} ]]
        then
            BEGINTIME=${results}
            break
        fi  
    done
else
	BEGINTIME=$3
fi

if [ "$4x" == "x" ]
then
    while true
    do  
		printf "\x1B[32m"
		echo -n "请输入导出数据结束时间(默认为当前时间): "
		printf "\x1B[0m"
        read results  
        if [ "${results}x" != "x" ]
        then
			if [[ "${results}" =~ ${DATEPATTERN} ]] 
			then
				ENDTIME=${results}
				break
			fi
		else
			ENDTIME=${DATATIME}
			break
        fi  
    done
else
	ENDTIME=$4
fi

EXECUTE_COMMAND="${SCRIPTPATH}/bin/binlog2sql/binlog2sql.py -h${DB_HOST} -P${DB_PORT} -u${DB_USER} -p${DB_PASSWORD} -d${DATABASE} --start-file='${BINLOGFILE}' --start-datetime='${BEGINTIME}' --stop-datetime='${ENDTIME}'"
printf "\x1B[32m"
echo -n "生成脚本语句: "
printf "\x1B[0m"
echo ${EXECUTE_COMMAND}
printf "\x1B[31m"
echo -n "确认真的要执行吗? [Y/N] "
printf "\x1B[0m"
read -t 10 results
if [ "${results}" == "Y" ] || [ "${results}" == "y" ]
then
	SQL_FILE=${SCRIPTPATH}/online_sql/$(date +"%Y-%m-%d.%H-%M-%S.%z").${DATABASE}.${BINLOGFILE}.sql
	eval ${EXECUTE_COMMAND} | tee ${SQL_FILE}
	gzip ${SQL_FILE} 
	echo "数据库: ${DATABASE}  Binglog文件: ${BINLOGFILE}  开始时间: ${BEGINTIME}  结束时间: ${ENDTIME}      操作时间: $(date +"%Y-%m-%d %H:%M:%S")" >> ${SCRIPTPATH}/online_log/${DATABASE}_online.log
else
	exit 1
fi

