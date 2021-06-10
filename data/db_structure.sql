-- PostgreSQL - this script creates the database structure for the eshop API

DROP SCHEMA IF EXISTS public, api CASCADE;
CREATE SCHEMA api;

-- ************************************** lang
CREATE TABLE api.lang (
 "id_lang"  SERIAL PRIMARY KEY,
 "name"     varchar(128) NOT NULL,
 "active"   boolean NOT NULL DEFAULT true,
 "iso_code" char(2) NOT NULL
);

-- ************************************** customer
CREATE TABLE api.customer(
 "id_customer" SERIAL PRIMARY KEY,
 "firstname"   varchar(128) NOT NULL,
 "lastname"    varchar(128) NOT NULL,
 "email"       varchar(128) NOT NULL,
 "passwd"      varchar(128) NOT NULL,
 "birthday"    date NULL,
 "newsletter"  boolean NOT NULL DEFAULT false,
 "date_add"    date NOT NULL DEFAULT CURRENT_DATE,
 "date_upd"    date NOT NULL DEFAULT CURRENT_DATE
);

-- ************************************** product
CREATE TABLE api.product(
 "id_product"          SERIAL PRIMARY KEY,
 "price"               decimal NOT NULL,
 "quantity"            int NOT NULL,
 "on_sale"             boolean NOT NULL DEFAULT true,
 "date_add"            date NOT NULL DEFAULT CURRENT_DATE,
 "date_upd"            date NOT NULL DEFAULT CURRENT_DATE,
 "id_manufacturer"     INT NOT NULL,
 "id_category_default" INT NOT NULL
);

-- ************************************** product_lang
CREATE TABLE api.product_lang
(
 "name"              varchar(128) NOT NULL,
 "description"       text NULL,
 "description_short" text NULL,
 "id_product"        int NOT NULL,
 "id_lang"           int NOT NULL,
 CONSTRAINT FK_product FOREIGN KEY ( id_product ) REFERENCES api.product ( id_product ) ON DELETE CASCADE,
 CONSTRAINT FK_lang FOREIGN KEY ( id_lang ) REFERENCES api.lang ( id_lang ) ON DELETE SET NULL
);
CREATE INDEX ON api.product_lang(id_product);
CREATE INDEX ON api.product_lang(id_lang);


-- ************************************** image
CREATE TABLE api.image
(
 "id_image"   SERIAL PRIMARY KEY,
 "order"      smallint NOT NULL,
 "cover"      boolean NOT NULL DEFAULT false,
 "id_product" int NOT NULL,
 CONSTRAINT FK_product FOREIGN KEY ( id_product ) REFERENCES api.product ( id_product ) ON DELETE CASCADE
);
CREATE INDEX ON api.image (id_product);

-- ************************************** image_lang
CREATE TABLE api.image_lang
(
 "legend"   varchar(128) NOT NULL,
 "id_image" int NOT NULL,
 "id_lang"  int NOT NULL,
 CONSTRAINT FK_image FOREIGN KEY ( id_image ) REFERENCES api.image ( id_image ) ON DELETE CASCADE,
 CONSTRAINT FK_lang FOREIGN KEY ( id_lang ) REFERENCES api.lang ( id_lang ) ON DELETE SET NULL
);
CREATE INDEX ON api.image_lang(id_image);
CREATE INDEX ON api.image_lang(id_lang);

-- ************************************** category
CREATE TABLE api.category
(
 "id_category" SERIAL PRIMARY KEY,
 "active"      boolean NOT NULL DEFAULT true,
 "date_add"    date NOT NULL DEFAULT CURRENT_DATE,
 "date_upd"    date NOT NULL DEFAULT CURRENT_DATE
);

-- ************************************** category_lang
CREATE TABLE api.category_lang
(
 "name"        varchar(128) NOT NULL,
 "description" text NULL,
 "id_category" int NOT NULL,
 "id_lang"     int NOT NULL,
 CONSTRAINT FK_category FOREIGN KEY ( id_category ) REFERENCES api.category ( id_category ) ON DELETE CASCADE,
 CONSTRAINT FK_lang FOREIGN KEY ( id_lang ) REFERENCES api.lang ( id_lang ) ON DELETE SET NULL
);
CREATE INDEX ON api.category_lang(id_category);
CREATE INDEX ON api.category_lang(id_lang);

-- ************************************** category_product
CREATE TABLE api.category_product
(
 "position"    int NOT NULL,
 "id_product"  int NOT NULL,
 "id_category" int NOT NULL,
 CONSTRAINT FK_product FOREIGN KEY ( id_product ) REFERENCES api.product ( id_product ) ON DELETE CASCADE,
 CONSTRAINT FK_category FOREIGN KEY ( id_category ) REFERENCES api.category ( id_category ) ON DELETE CASCADE
);
CREATE INDEX ON api.category_product(id_product);
CREATE INDEX ON api.category_product(id_category);

-- ************************************** manufacturer
CREATE TABLE api.manufacturer
(
 "id_manufacturer" SERIAL PRIMARY KEY,
 "name"            varchar(128) NOT NULL,
 "date_add"        date NOT NULL DEFAULT CURRENT_DATE,
 "date_upd"        date NOT NULL DEFAULT CURRENT_DATE
);

-- ************************************** country
CREATE TABLE api.country
(
 "id_country" SERIAL PRIMARY KEY,
 "iso_code"   varchar(3) NOT NULL,
 "active"     boolean NOT NULL DEFAULT true
);

-- ************************************** country_lang
CREATE TABLE api.country_lang
(
 "name"       varchar(128) NOT NULL,
 "id_country" int NOT NULL,
 "id_lang"    int NOT NULL,
 CONSTRAINT FK_country FOREIGN KEY ( id_country ) REFERENCES api.country ( id_country ) ON DELETE CASCADE,
 CONSTRAINT FK_lang FOREIGN KEY ( id_lang ) REFERENCES api.lang ( id_lang ) ON DELETE SET NULL
);
CREATE INDEX ON api.country_lang(id_country);
CREATE INDEX ON api.country_lang(id_lang);

-- ************************************** currency
CREATE TABLE api.currency
(
 "id_currency" SERIAL PRIMARY KEY,
 "name"        varchar(32) NOT NULL,
 "iso_code"    varchar(3) NOT NULL,
 "decimals"    boolean NOT NULL
);

-- ************************************** cart
CREATE TABLE api.cart
(
 "id_cart"  SERIAL PRIMARY KEY,
 "date_add" date NOT NULL DEFAULT CURRENT_DATE,
 "date_upd" date NOT NULL DEFAULT CURRENT_DATE
);

-- ************************************** cart_product
CREATE TABLE api.cart_product
(
 "quantity"   int NOT NULL DEFAULT 1,
 "id_cart"    int NOT NULL,
 "id_product" int NOT NULL,
 CONSTRAINT FK_cart FOREIGN KEY ( id_cart ) REFERENCES api.cart ( id_cart ) ON DELETE CASCADE,
 CONSTRAINT FK_product FOREIGN KEY ( id_product ) REFERENCES api.product ( id_product ) ON DELETE CASCADE
);
CREATE INDEX ON api.cart_product(id_cart);
CREATE INDEX ON api.cart_product(id_product);

-- ************************************** address
CREATE TABLE api.address
(
 "id_address"  SERIAL PRIMARY KEY,
 "firstname"   varchar(128) NOT NULL,
 "lastname"    varchar(128) NOT NULL,
 "address1"    varchar(128) NOT NULL,
 "address2"    varchar(128) NOT NULL,
 "postcode"    varchar(12) NOT NULL,
 "city"        varchar(128) NOT NULL,
 "phone"       varchar(16) NOT NULL,
 "active"      boolean NOT NULL DEFAULT false,
 "date_add"    date NOT NULL DEFAULT CURRENT_DATE,
 "date_upd"    date NOT NULL DEFAULT CURRENT_DATE,
 "id_customer" int NOT NULL,
 CONSTRAINT FK_customer FOREIGN KEY ( id_customer ) REFERENCES api.customer ( id_customer )
);
CREATE INDEX ON api.address(id_customer);

ALTER TABLE api.product
ADD CONSTRAINT FK_manufacturer FOREIGN KEY ( id_manufacturer ) REFERENCES api.manufacturer ( id_manufacturer ) ON DELETE SET NULL,
ADD CONSTRAINT FK_category FOREIGN KEY ( id_category_default ) REFERENCES api.category ( id_category ) ON DELETE SET NULL
;
