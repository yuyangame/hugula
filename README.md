###Hugula 游戏框架 for slua

Hugula是一个基于unity3d+slua技术的全LUA免费开源游戏框架。
特点 全lua逻辑，基于状态模式，成熟项目中提取。
下载完成后切换到IOS或者android平台。
qq群：19324776。
 
##本框架需要以下条件

1)unity3d 版本为 5.0以上 （5.1以上需要自行清理lua wrap file，后重新make）

2)slua项目 地址 https://github.com/pangweiwei/slua

3)如需使用tools辅助功能 需要配置python2.7 lua5.1环境

##框架目录

Assets

-Config               （存放xxx.csv 配置文件 使用菜单 Hugula/export config [Assets\Config]导出）

-CustomerResource     （存放美术资源）

-Hugula               （核心代码）

-Lan                  （多国语言包 csv   使用菜单 Hugula/export language [Assets\Lan]导出 lua中可直接调用）

-Scene                （场景 begin为开始场景）

-Slua                 （Slua插件）

-Tmp                  （编译lua文件临时存放目录）

-Lua                  （lua脚本）


##运行发布

1 导出assetbundle资源 菜单 AssetBundles/Build AssetBundles

2 导出其他

 2.1 Hugula/export lua [Assets\Lua]          打包编译脚本
 
 2.2 Hugula/export config [Assets\Config]    打包配置
 
 2.3 Hugula/export language [Assets\Lan]     打包语言包
 
3 导出slua接口

 3.1 Slua/All/Make   导出slua所需要的wrap类。
 
 3.2 如果打开有报错 Slua/All/Clear	清理已经生成的wrap类

### lua架构图

![](Client/Assets/Doc/hugula lua framework.png)

##自带demo

俄罗斯方块小游戏 apk下载地址：http://pan.baidu.com/s/1o6L4E86
