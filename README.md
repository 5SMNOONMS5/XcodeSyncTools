# XcodeSyncTools
===============================

中文版 [這邊](https://github.com/5SMNOONMS5/XcodeSyncTools/blob/master/README_CN.md)

My personal xcode **code-snippets** and **file-template** sync tool.

## What is code-snippet and file-template in Xcode??

### code-snippet

![](imgs/git_xcode_sinppets.gif)

Place your customize keyword and your buildin snippets will popup, it save times for you.

### file-template

![](imgs/git_xcode_filetemplate.gif)

Like code-snippet, but additional it creates files and xibs for you.  

## What is this project do??

Sync multiply code-snippet and file-template in different computer.

## Quick Start

* Git clone first.
* Run the script, this will copy all the files into your Xcode load path.

```bash
git clone git@github.com:5SMNOONMS5/XcodeSyncTools.git
cd XcodeSyncTools
sh xcode-sync.sh -s
```

## More detail

```bash
sh xcode-sync.sh -h
``` 

## Keyword

### II

Type **II** for initialization

![II](imgs/II.png)

### DD

Type **DD** for Delegate And Datasource

![II](imgs/DD.png)

### FF

Type **FF** for FIXME

![II](imgs/FF.png)

### MM

Type **MM** for Mark

![II](imgs/MM.png)

### VV

Type **VV** for View Life Cycle

![II](imgs/VV.png)
