### 原生方式

- 启动项目

```powershell
cd /tellsea/project/Straw-Shiro
ps -ef |grep Straw-Shiro
kill -9
nohup java -jar Straw-Shiro-1.0.0.jar > project.log &
tail -fn 500 project.log
```

- 启动redis

```powershell
cd /usr/local/redis/bin
ps aux | grep redis
kill -9
```
