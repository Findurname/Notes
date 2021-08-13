



###### 获取目录 ######

# 当前目录
current_path="$PWD"  # 同 "`pwd`"
# 上一级目录
path=$(dirname "$PWD") 
# 上上级目录 (原理同上)
path=$(dirname $(dirname "$PWD"))
# 目录的最后部分
last_component=$(basename "$PWD")


