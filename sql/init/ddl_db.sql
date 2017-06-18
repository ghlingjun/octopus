-- 查看 MySql 配置
-- 1. 确保不区分大小写：unix下lower_case_table_names默认值为 0（大小写敏感） Windows下默认值是 1 Mac OS X下默认值是 2
-- 2. 查看数据库编码，确保为 utf-8

DROP DATABASE octopus;
CREATE DATABASE octopus
  DEFAULT CHARACTER SET utf8;
GRANT ALL PRIVILEGES ON octopus.* TO primecocn@"%"
IDENTIFIED BY 'primecocn';
