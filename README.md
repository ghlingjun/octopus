## What is this repository for?
此项目用于生成 maven 工程模版文件，便于快速创建一个包含基础功能项目。

## How to use it?
### Create an archetype from a multi-module project
mvn archetype:create-from-project

### Install the archetype
cd target/generated-sources/archetype/
mvn install

### Use it
mvn archetype:generate -DarchetypeCatalog=local
