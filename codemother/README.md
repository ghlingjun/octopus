注意：
    模版是基于 MyBatis 与 MySql

codemother 使用方法：
1、参照 config.properties-tmpl 创建 config.properties；
2、了解 config.properties 文件中各个参数的含义；
3、通过 GenerateSchema 类去生成 tables 对应的 schema 文件；codemother 将通过 schema 文件来生成 table 对应的 entity 类以及其他代码；
4、复制生成的 schema 文件到 project 或者 module 的资源目录（resources/com/ethanxx/codemother/dbschema）中；
5、idea 中可以使用 alt + F12 快捷键调出 Terminal，进入project 或者 module 根目录下，执行代码生成命令：
    mvn codemother:code-generate
    命令执行成功后会根据配置生成相应层次的代码；

【结束】
