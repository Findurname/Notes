#!/bin/bash

# 1 . 命令行安装pytorchviz（之前要安装graphviz，这个我keras时已经安装）

pip install git+https://github.com/szagoruyko/pytorchviz

# 2 . 使用如下代码，保存在统计目录下的pdf文件中，并打开。
# 其中，torch.rand(1,3,32,32).cuda()为伪造的数据，.cuda因为我的模型在gpu上。


print(model)
g=make_dot(model(torch.rand(1,3,32,32).cuda()),params=dict(model.named_parameters()))
g.view()
    