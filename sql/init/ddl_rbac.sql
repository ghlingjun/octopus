DROP TABLE IF EXISTS man_user;
DROP TABLE IF EXISTS man_role;
DROP TABLE IF EXISTS man_authority;
DROP TABLE IF EXISTS man_user_role;
DROP TABLE IF EXISTS man_role_auth;

/* 用户表 */
CREATE TABLE man_user (
  user_id         VARCHAR(32)  NOT NULL,
  password        VARCHAR(128) NOT NULL,
  username        VARCHAR(32),
  status_cd       INTEGER COMMENT '状态编码：1-已注册， 2-已激活，3-禁用',
  last_login_time DATETIME,
  last_login_ip   VARCHAR(20),
  session_id      VARCHAR(128),
  fail_times      INTEGER,
  created_by      VARCHAR(32),
  updated_by      VARCHAR(32),
  created_at      DATETIME,
  updated_at      DATETIME,
  record_flag     INTEGER COMMENT '记录标志：1-有效,2-无效',
  PRIMARY KEY (user_id)
)
  ENGINE = innodb
  DEFAULT CHARSET = utf8;

/* 角色表 */
CREATE TABLE man_role (
  role_id     VARCHAR(32) NOT NULL,
  role_name   VARCHAR(64),
  description VARCHAR(128),
  created_by  VARCHAR(32),
  updated_by  VARCHAR(32),
  created_at  DATETIME,
  updated_at  DATETIME,
  record_flag INTEGER COMMENT '记录标志：1-有效,2-无效',
  PRIMARY KEY (role_id)
)
  ENGINE = innodb
  DEFAULT CHARSET = utf8;

/* 权限表 */
CREATE TABLE man_authority (
  id             VARCHAR(32) NOT NULL,
  parent_id      VARCHAR(32),
  auth_type_code INTEGER COMMENT '权限类型：1-菜单，2-按钮',
  text           VARCHAR(16),
  auth_url       VARCHAR(128),
  auth_icon      VARCHAR(128),
  description    VARCHAR(256),
  leaf           BOOLEAN,
  auth_order     INTEGER,
  visible        BOOLEAN,
  init_function  VARCHAR(32),
  created_by     VARCHAR(32),
  updated_by     VARCHAR(32),
  created_at     DATETIME,
  updated_at     DATETIME,
  record_flag    INTEGER COMMENT '记录标志：1-有效,2-无效',
  PRIMARY KEY (id)
)
  ENGINE = innodb
  DEFAULT CHARSET = utf8;

/* 用户角色关系表 */
CREATE TABLE man_user_role (
  user_id VARCHAR(32) NOT NULL,
  role_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (user_id, role_id)
)
  ENGINE = innodb
  DEFAULT CHARSET = utf8;

/* 角色权限关系表 */
CREATE TABLE man_role_auth (
  role_id      VARCHAR(32) NOT NULL,
  authority_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (role_id, authority_id)
)
  ENGINE = innodb
  DEFAULT CHARSET = utf8;
