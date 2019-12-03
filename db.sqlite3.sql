BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "products_offer" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"code"	varchar(10) NOT NULL,
	"description"	varchar(255) NOT NULL,
	"discount"	real NOT NULL
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "products_product" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"name"	varchar(255) NOT NULL,
	"price"	real NOT NULL,
	"stock"	integer NOT NULL,
	"image_url"	varchar(2083) NOT NULL
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"name"	varchar(150) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"first_name"	varchar(30) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"last_name"	varchar(150) NOT NULL
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag">=0),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL
);
INSERT INTO "django_session" VALUES ('ywh8n6s4z7rlvu31qkvsj3hydcg0wufx','NjE2MDNiMTgxMTYxNDJjMTc3NjdkNjRkYWJlZTMzZTdkZDc2OTg3Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMDk2Njc0Y2Q2Njk0MjFlOTJhZWJjOWM2Y2FiYTA1ODBiZTE4MmEwIn0=','2019-12-16 10:45:14.341638');
INSERT INTO "products_product" VALUES (1,'Orange',1.99,50,'https://images.pexels.com/photos/161559/background-bitter-breakfast-bright-161559.jpeg?cs=srgb&dl=orange-fruit-161559.jpg&fm=jpg');
INSERT INTO "products_product" VALUES (2,'Strawberry',2.99,30,'https://images.pexels.com/photos/106148/strawberries-fruit-red-sweet-106148.jpeg?cs=srgb&dl=red-strawberry-fruits-106148.jpg&fm=jpg');
INSERT INTO "products_product" VALUES (3,'Apple',1.49,40,'https://images.pexels.com/photos/102104/pexels-photo-102104.jpeg?cs=srgb&dl=healthy-apple-fruits-natural-102104.jpg&fm=jpg');
INSERT INTO "products_product" VALUES (4,'Banana',0.49,60,'https://upload.wikimedia.org/wikipedia/commons/6/69/Banana.png');
INSERT INTO "products_product" VALUES (5,'Pear',3.49,25,'https://www.needpix.com/photo/download/1110023/pear-fruit-fruits-ripe-healthy-harvest-food-macro-bio');
INSERT INTO "products_product" VALUES (6,'Kiwi',3.79,20,'https://upload.wikimedia.org/wikipedia/commons/b/b8/Kiwi_%28Actinidia_chinensis%29_1_Luc_Viatour.jpg');
INSERT INTO "products_product" VALUES (7,'Pomegranate',4.49,15,'https://upload.wikimedia.org/wikipedia/commons/7/72/Pomegranate_DSW.JPG');
INSERT INTO "auth_user" VALUES (1,'pbkdf2_sha256$150000$pILvKyAQ0YED$fIBHRN+sZnGG4AjOUcVxrSNluwal4ysrov2yqUBEWOk=','2019-12-02 10:45:14.327634',1,'admin','','cj.crown@hotmail.com',1,1,'2019-12-02 10:45:00.118682','');
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (13,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (14,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (16,4,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (25,7,'add_product','Can add product');
INSERT INTO "auth_permission" VALUES (26,7,'change_product','Can change product');
INSERT INTO "auth_permission" VALUES (27,7,'delete_product','Can delete product');
INSERT INTO "auth_permission" VALUES (28,7,'view_product','Can view product');
INSERT INTO "auth_permission" VALUES (29,8,'add_offer','Can add offer');
INSERT INTO "auth_permission" VALUES (30,8,'change_offer','Can change offer');
INSERT INTO "auth_permission" VALUES (31,8,'delete_offer','Can delete offer');
INSERT INTO "auth_permission" VALUES (32,8,'view_offer','Can view offer');
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','permission');
INSERT INTO "django_content_type" VALUES (3,'auth','group');
INSERT INTO "django_content_type" VALUES (4,'auth','user');
INSERT INTO "django_content_type" VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (6,'sessions','session');
INSERT INTO "django_content_type" VALUES (7,'products','product');
INSERT INTO "django_content_type" VALUES (8,'products','offer');
INSERT INTO "django_admin_log" VALUES (1,'2019-12-02 10:51:53.147114','1','Product object (1)','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (2,'2019-12-02 10:55:51.322465','2','Product object (2)','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (3,'2019-12-02 10:57:00.510553','3','Product object (3)','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (4,'2019-12-02 10:57:47.208641','4','Product object (4)','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (5,'2019-12-02 10:58:52.411133','5','Product object (5)','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (6,'2019-12-02 10:59:03.819552','3','Product object (3)','[]',7,1,2);
INSERT INTO "django_admin_log" VALUES (7,'2019-12-02 10:59:15.203986','3','Product object (3)','[{"changed": {"fields": ["price"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (8,'2019-12-02 10:59:21.732220','4','Product object (4)','[{"changed": {"fields": ["price"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (9,'2019-12-02 10:59:27.267042','5','Product object (5)','[{"changed": {"fields": ["price"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (10,'2019-12-02 10:59:38.685438','3','Product object (3)','[{"changed": {"fields": ["price"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (11,'2019-12-02 10:59:44.022383','4','Product object (4)','[{"changed": {"fields": ["price"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (12,'2019-12-02 11:00:42.407919','6','Product object (6)','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (13,'2019-12-02 11:01:49.125385','7','Product object (7)','[{"added": {}}]',7,1,1);
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2019-12-02 10:38:57.124481');
INSERT INTO "django_migrations" VALUES (2,'auth','0001_initial','2019-12-02 10:38:57.180452');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2019-12-02 10:38:57.272397');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2019-12-02 10:38:57.329374');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2019-12-02 10:38:57.381345');
INSERT INTO "django_migrations" VALUES (6,'contenttypes','0002_remove_content_type_name','2019-12-02 10:38:57.467293');
INSERT INTO "django_migrations" VALUES (7,'auth','0002_alter_permission_name_max_length','2019-12-02 10:38:57.505269');
INSERT INTO "django_migrations" VALUES (8,'auth','0003_alter_user_email_max_length','2019-12-02 10:38:57.542249');
INSERT INTO "django_migrations" VALUES (9,'auth','0004_alter_user_username_opts','2019-12-02 10:38:57.588734');
INSERT INTO "django_migrations" VALUES (10,'auth','0005_alter_user_last_login_null','2019-12-02 10:38:57.651698');
INSERT INTO "django_migrations" VALUES (11,'auth','0006_require_contenttypes_0002','2019-12-02 10:38:57.687405');
INSERT INTO "django_migrations" VALUES (12,'auth','0007_alter_validators_add_error_messages','2019-12-02 10:38:57.753368');
INSERT INTO "django_migrations" VALUES (13,'auth','0008_alter_user_username_max_length','2019-12-02 10:38:57.806336');
INSERT INTO "django_migrations" VALUES (14,'auth','0009_alter_user_last_name_max_length','2019-12-02 10:38:57.855308');
INSERT INTO "django_migrations" VALUES (15,'auth','0010_alter_group_name_max_length','2019-12-02 10:38:57.915280');
INSERT INTO "django_migrations" VALUES (16,'auth','0011_update_proxy_permissions','2019-12-02 10:38:57.958249');
INSERT INTO "django_migrations" VALUES (17,'products','0001_initial','2019-12-02 10:38:58.000566');
INSERT INTO "django_migrations" VALUES (18,'sessions','0001_initial','2019-12-02 10:38:58.054535');
INSERT INTO "django_migrations" VALUES (19,'products','0002_offer','2019-12-02 10:42:58.206540');
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
COMMIT;
