#!/usr/bin/env bash

set -e

SCRIPT_PATH=$(cd `dirname $0`; pwd)
TMPDIR=$(mktemp -d /tmp/XXXXXX)

clear

dialog --menu "选择动作" \
25 80 40 \
1 "== 语文 == 导出增量数据" \
2 "== 数学 == 导出增量数据" \
3 "== 英语 == 导出增量数据" \
4 "== 物理 == 导出增量数据" \
5 "安装导出工具binlog2sql" \
6 "安装工具插件" \
2> "${TMPDIR}"/choice.txt

CHOICE=$(cat "${TMPDIR}"/choice.txt)

case ${CHOICE} in
	1)
		eval "${SCRIPT_PATH}/binlog2sql.sh question_bank_cn"
	;;  
	2)
		eval "${SCRIPT_PATH}/binlog2sql.sh question_bank_math"
	;;  
	3)
		eval "${SCRIPT_PATH}/binlog2sql.sh question_bank_en"
	;;  
	4)  
		eval "${SCRIPT_PATH}/binlog2sql.sh question_bank_phy"
	;;  
	5)
		eval "${SCRIPT_PATH}/git_clone_binlog2sql.sh"
	;;
	6)
		eval "${SCRIPT_PATH}/install_pip_mysql.sh"
	;;
esac

rm -rf "${TMPDIR}"

echo ""
printf "\x1B[32m"
echo "执行完毕"
printf "\x1B[0m"
