# 计算机技能基础
🐘TO-DO🐘

### Linux
* Bash

### Programming
* Perl
* Python

### Databases
数据库是按照一定的数据结构组织、存储和管理数据的仓库，它可以被看作电子化的文件柜，用户可以对文件中的数据进行增加、删除、修改和查找等操作。
* 数据库有多种存储模型，最常见的是关系型数据库，例如MySQL、Oracle、PostgreSQL等，数据以表的结构进行存储，在查询和修改的时候统一使用SQL语言，每种数据库也会有独特的语言和特性。
* 另一种是NoSQL(Not Only SQL)数据库，它是所有以非表格为存储结构的数据库的统称，例如使用文档(document)的MongoDB，使用键值(key-value)的Redis和DynamoDB等。它们都有自己的查询和修改语言，需要针对不同的数据库单独进行学习。

在服务器应用中访问关系型数据库可以直接使用驱动编写原生SQL语句，也可以使用ORM(Object Relation Mapping)框架进行访问，而对于NoSQL数据库则使用原生驱动访问的情况较多，也有类似ORM的框架，如MongoDB有ODB(Object Document Mapping)。
ORM是一种解决面向对象与关系数据库互不匹配问题的技术，用于实现面向对象编程语言中模型对象到关系数据库数据的映射。对于Python语言来说，ORM会将底层的SQL语句操作的数据实体转化成Python对象，这样一来，我们无须了解SQL语句的编写规则，通过Python代码即可完成数据库操作。ORM主要实现了以下3种映射关系：
* 数据表 - Python类
* 字段（列） - 类属性
* 记录（行） - 类实例


### Algorithms
* DP
* HMM

### References
1. Mariano, D., Martins, P., Santos, L. H. & Melo‐ Minardi, R. C. de. Introducing Programming Skills for Life Science Students. Biochemistry and Molecular Biology Education 47, 288–295 (2019).
