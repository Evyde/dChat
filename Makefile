# A general java project makefile
# Author: Wu Jiqing (jiqingwu@gmail.com)
# create: 2012-06-12
# update: 2012-06-13
# version: 0.7

# 声明：著作权归原作者所有！
# 本人仅对部分内容进行修改和汉化！
# 未经作者允许，禁止复制和修改！
# 摘自作者博客，原文地址：
# http://www.cnblogs.com/jiqingwu/archive/2012/06/13/java_makefile.html
# 若有侵权请联系我：(life.app.hanfeng@hotmail.com)

# 设置你要生成的jar包的文件名
# Set the file name of your jar package:
SERVER_JAR_PKG = dChat-server.jar
# 本项目需要两种包名
CLIENT_JAR_PKG = dChat-client.jar

# 设置你的项目的入口点
# Set your entry point of your java app:
SERVER_ENTRY_POINT = dChat.Server.server-main
# 项目特殊性，需要两种入口点
CLIENT_ENTRY_POINT = dChat.Client.client-main

# 此处未确定，注释
# # 是否需要res目录，如果你的程序有图片、文档等，
# # 最好放入res目录中。
# # yes: 需要；no：不需要
# SERVER_RES_DIR = yes
# CLIENT_RES_DIR = yes

# 设置你项目包含的源文件
# 如果你使用了package，请自己在src下建立相应的目录层次，
# 并将源文件放在对应的目录中。
# 如你要生成的一个类是 com.game.A，
# 那么你的源文件应该是 com/game/A.java。
# 多个类之间用空格间隔，如果一行太长，用'\'换行， # 建议一行一个。
# 另外注意顺序，如果class A 引用 class B，那么B.java应该放在A.java前。
SERVER_SOURCE_FILES = \
dChat/Server/Class/SQL.java \
dChat/Server/server-main.java

CLIENT_SOURCE_FILES = \
dChat/Client/Class/SQL.java \
dChat/Client/client-main.java

SERVER_RES = res/Server
CLIENT_RES = res/Cilent

SERVER_BIN = bin/Server
CILENT_BIN = bin/Cilent


# 设置你的java编译器
# Set your java compiler here:
JAVAC = javac

# 设置你的编译选项
JFLAGS = -encoding UTF-8

# 用法：
# make new: 在你的工程目录下生成src, bin, res子目录。
# 如果你定义的类包含在某个包里：请自己在src下建立相应的目录层次。
# 最终的目录结构如下：
# ├── a.jar
# ├── bin
# │     └── test
# │             ├── A.class
# │             └── B.class
# ├── makefile
# ├── res
# │     └── doc
# │            └── readme.txt
# └── src
#        └── test
#                ├── A.java
#                └── B.java

# make server-build: 编译服务器程序，在bin目录下生成 java classes
# make client-build: 编译客户端程序，在bin目录下生成 java classes
# make clean: 清理编译结果，以便重新编译
# make run: make 之后，可以通过make run查看运行结果
# make server-jar: 生成可执行的server-jar包
# make client-jar: 生成可执行的client-jar包

#############下面的内容建议不要修改####################

vpath %.class bin
vpath %.java src

# show help message by default
Default:
	@echo "make new: 新建一个项目，并创建res,src,bin文件夹."
	@echo "make server-build: 编译服务器程序."
	@echo "make client-build: 编译客户端程序."
	@echo "make clean: 删除已编译文件."
	@echo "make run-server: 运行服务器程序."
	@echo "make run-client: 运行客户端程序."
	@echo "make server-jar: 把服务器程序打包."
	@echo "make client-jar: 把客户端程序打包."

# 编译服务器程序
server-build: $(SERVER_SOURCE_FILES)
	$(JAVAC) -cp $(SERVER_BIN) -d $(SERVER_BIN) $(JFLAGS) $<
# 编译客户端程序
client-build: $(CLIENT_SOURCE_FILES)
	$(JAVAC) -cp $(CLIENT_BIN) -d $(CLIENT_BIN) $(JFLAGS) $<

.PHONY: new clean server-run client-run server-jar client-jar

new:
	ifeq ($(RES_DIR),yes)
	mkdir -pv src bin res
	else mkdir -pv src bin
	endif

clean:
	rm -frv bin/*

server-run:
	java -cp $(SERVER_BIN) $(SERVER_ENTRY_POINT)

client-run:
	java -cp $(CLIENT_BIN) $(CLIENT_ENTRY_POINT)

server-jar:
	ifeq ($(SERVER_RES_DIR),yes)
		jar cvfe $(SERVER_JAR_PKG) $(SERVER_ENTRY_POINT)  -C $(SERVER_BIN) . $(SERVER_RES)
	else
		jar cvfe $(SERVER_JAR_PKG) $(SERVER_ENTRY_POINT) -C $(SERVER_BIN) .
	endif

client-jar:
	ifeq ($(CLIENT_RES_DIR),yes)
		jar cvfe $(CLIENT_JAR_PKG) $(CLIENT_ENTRY_POINT)  -C $(CLIENT_BIN) . $(CLIENT_RES)
	else
		jar cvfe $(CLIENT_JAR_PKG) $(CLIENT_ENTRY_POINT) -C $(CLIENT_BIN) .
	endif