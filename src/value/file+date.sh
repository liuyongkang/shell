#!/bin/bash

#value方面的一些小笔记

# 正常来说，当我们执行一个shell script时，先是产生了一个sub-shell的子线程，然后sub-shell再去fork命令子线程。
# source就是让 shell script在当前shell内执行，而不是产生一个sub-shell来执行
# exec

# 在设定变量的时候要注意以下5点：
#         1)'='两边不能使用区域符号(IFS)，也应该避免使用 shell 的保留元字符(meta charactor)
#         2)变量名称不能使用$符号
#         3)变量名称第一个个字母不能是数字
#         4)变量名称长度不可超过256个字母
#         5)变量名称区分大小写

# ''   ""  转义区别
# '' -- 单引号，又叫硬转义，其内部所有的shell元字符、通配符都会被关掉。注意：硬转义中不允许出现'单引号。
# "" -- 双引号，又叫软转义，其内部只允许出现特定的shell元字符，:$用于参数替换，``(反引号)用于命令代替.
# \(反斜杠)又叫转义，去除其后紧跟的元字符或通配符的特殊意义
# 双引号 只经过参数拓展、命令代换和算术代换就可以送入执行步骤，而单引号转义符会直接被送入执行步骤.

# 有一个叫变量扩展技巧的东西，内容很丰富，可以google之.

# 变量的赋值必须直接跟“=”号，中间不能有空格。
# 注意：使用圆括号()，会启动一个子shell
#       使用话括号{}，会对一串命令在当前shell执行.
#       () {},都把一串命令放在括号里面，并且命令之间用;隔开
#       ()最后一个命令可以不用分号
#       {}最后一个命令要用分号
#       {}第一个命令和左括号之间必须要有空格
#
# cat /etc/passwd aaaa 2> error.txt 1> cont.txt
#
# 注意：重定向 &> 和  >& 表示为将标准的正确输出与错误输出都重定向过去
# 注意一些重定向的非常规用法
#  1>&2 表示将 标准输出 重定向到与错误输出到同一位置
#  2>&1 表示将 标准错误输出重定向到于标准输出同一位置
#
#  cat /etc/passwd aaaa 2>&1 >1.txt
#  执行到 2>&1 时候，这条命令把错误输出也重定向到标准输出了，此时标准输出还没有重定向，
#  也就是说，标准错误和标准输出都发送给shell。
#  之后，执行 >1.txt，此时默认将标准输出重定向给了1.txt,错误输出输出到shell。
#  其实这条命令可以直接这么写：
#  cat /etc/passwd aaaa 1>1.txt
#  一开始的复杂写法，个人觉得真心没意义。
#
#  总之注意一点，在重定向符号>前面的1，2代表着不同的输出，后面的1，2就是文件名，除非加了&
#
# “”将date后面的参数用引号引起来，方便日期格式的控制
# shell会运行反引号中的命令，并将其输出赋给变量
# $* 

DATE=`date "+%Y%m%d"`
echo $DATE

# “”将date变量引起来，可以防止空格等字符对命令造成的影响
touch file."$DATE".log

#利用花括号可以处理多个有规律的文件
touch file{a..c}{1..3}.log
#filea1.log filea2.log filea3.log fileb1.log fileb2.log fileb3.log filec1.log filec2.log filec3.log
