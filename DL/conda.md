# Anaconda Notes


## conda常用的命令

```bash
1）conda list 查看安装了哪些包。

2）conda env list 或 conda info -e 查看当前存在哪些虚拟环境

3）conda update conda 检查更新当前conda

```

## Env

```bash
conda create -n your_env_name python=X.X（2.7、3.6等)

## Linux: 
source activate your_env_name(虚拟环境名称)

## Windows: 
activate your_env_name(虚拟环境名称)
```

### 对虚拟环境中安装额外的包

```
conda install -n your_env_name [package]

```
### 关闭虚拟环境

```bash
## Linux
source deactivate

## Windows
deactivate
```

### 删除虚拟环境

```bash
conda remove -n your_env_name(虚拟环境名称) --all
```

### 删除环境中的某个包

```bash
conda remove --name your_env_name  package_name
```
