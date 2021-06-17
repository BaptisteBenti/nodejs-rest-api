-- PostgreSQL - this script creates the database structure for the eshop API

DROP SCHEMA IF EXISTS public, api CASCADE;
CREATE SCHEMA api;

-- ************************************** lang
CREATE TABLE api.lang (
 "id_lang"  SERIAL PRIMARY KEY,
 "name"     VARCHAR(128) NOT NULL,
 "active"   BOOLEAN NOT NULL DEFAULT true,
 "iso_code" UNIQUE CHAR(2) NOT NULL
);

-- ************************************** customer
CREATE TABLE api.customer(
 "id_customer" SERIAL PRIMARY KEY,
 "firstname"   VARCHAR(128) NOT NULL,
 "lastname"    VARCHAR(128) NOT NULL,
 "email"       UNIQUE VARCHAR(128) NOT NULL,
 "passwd"      VARCHAR(128) NOT NULL,
 "birthday"    DATE NULL,
 "newsletter"  BOOLEAN NOT NULL DEFAULT false,
 "DATE_add"    DATE NOT NULL DEFAULT CURRENT_DATE,
 "DATE_upd"    DATE NOT NULL DEFAULT CURRENT_DATE
);

ALTER TABLE api.customer
  ADD CONSTRAINT check_min_length check (length(passwd) >= 8);

-- ************************************** product
CREATE TABLE api.product(
 "id_product"          SERIAL PRIMARY KEY,
 "price"               DECIMAL NOT NULL,
 "quantity"            INT NOT NULL,
 "on_sale"             BOOLEAN NOT NULL DEFAULT true,
 "DATE_add"            DATE NOT NULL DEFAULT CURRENT_DATE,
 "DATE_upd"            DATE NOT NULL DEFAULT CURRENT_DATE,
 "id_manufacturer"     INT NOT NULL,
 "id_category_default" INT NOT NULL
);

-- ************************************** product_lang
CREATE TABLE api.product_lang
(
 "name"              UNIQUE VARCHAR(128) NOT NULL,
 "description"       TEXT NULL,
 "description_short" TEXT NULL,
 "id_product"        INT NOT NULL,
 "id_lang"           INT NOT NULL,
 CONSTRAINT FK_product FOREIGN KEY ( id_product ) REFERENCES api.product ( id_product ) ON DELETE CASCADE,
 CONSTRAINT FK_lang FOREIGN KEY ( id_lang ) REFERENCES api.lang ( id_lang ) ON DELETE SET NULL
);
CREATE INDEX ON api.product_lang(id_product);
CREATE INDEX ON api.product_lang(id_lang);

-- ************************************** image
CREATE TABLE api.image
(
 "id_image"   SERIAL PRIMARY KEY,
 "order"      smallINT NOT NULL,
 "cover"      BOOLEAN NOT NULL DEFAULT false,
 --"url"        ,
 "id_product" INT NOT NULL,
 CONSTRAINT FK_product FOREIGN KEY ( id_product ) REFERENCES api.product ( id_product ) ON DELETE CASCADE
);
CREATE INDEX ON api.image (id_product);

-- ************************************** image_lang
CREATE TABLE api.image_lang
(
 "legend"   VARCHAR(128) NOT NULL,
 "id_image" INT NOT NULL,
 "id_lang"  INT NOT NULL,
 CONSTRAINT FK_image FOREIGN KEY ( id_image ) REFERENCES api.image ( id_image ) ON DELETE CASCADE,
 CONSTRAINT FK_lang FOREIGN KEY ( id_lang ) REFERENCES api.lang ( id_lang ) ON DELETE SET NULL
);
CREATE INDEX ON api.image_lang(id_image);
CREATE INDEX ON api.image_lang(id_lang);

-- ************************************** category
CREATE TABLE api.image_type
(
 "id_image_type" SERIAL PRIMARY KEY,
 "name"          UNIQUE VARCHAR(64) NOT NULL,
);

-- ************************************** category
CREATE TABLE api.category
(
 "id_category" SERIAL PRIMARY KEY,
 "active"      BOOLEAN NOT NULL DEFAULT true,
 "DATE_add"    DATE NOT NULL DEFAULT CURRENT_DATE,
 "DATE_upd"    DATE NOT NULL DEFAULT CURRENT_DATE
);

-- ************************************** category_lang
CREATE TABLE api.category_lang
(
 "name"        VARCHAR(128) NOT NULL,
 "description" text NULL,
 "id_category" INT NOT NULL,
 "id_lang"     INT NOT NULL,
 CONSTRAINT FK_category FOREIGN KEY ( id_category ) REFERENCES api.category ( id_category ) ON DELETE CASCADE,
 CONSTRAINT FK_lang FOREIGN KEY ( id_lang ) REFERENCES api.lang ( id_lang ) ON DELETE SET NULL
);
CREATE INDEX ON api.category_lang(id_category);
CREATE INDEX ON api.category_lang(id_lang);

-- ************************************** category_product
CREATE TABLE api.category_product
(
 "position"    INT NOT NULL,
 "id_product"  INT NOT NULL,
 "id_category" INT NOT NULL,
 CONSTRAINT FK_product FOREIGN KEY ( id_product ) REFERENCES api.product ( id_product ) ON DELETE CASCADE,
 CONSTRAINT FK_category FOREIGN KEY ( id_category ) REFERENCES api.category ( id_category ) ON DELETE CASCADE
);
CREATE INDEX ON api.category_product(id_product);
CREATE INDEX ON api.category_product(id_category);

-- ************************************** manufacturer
CREATE TABLE api.manufacturer
(
 "id_manufacturer" SERIAL PRIMARY KEY,
 "name"            VARCHAR(128) NOT NULL,
 "DATE_add"        DATE NOT NULL DEFAULT CURRENT_DATE,
 "DATE_upd"        DATE NOT NULL DEFAULT CURRENT_DATE
);

-- ************************************** country
CREATE TABLE api.country
(
 "id_country" SERIAL PRIMARY KEY,
 "name"       VARCHAR(128) NOT NULL,
 "iso_code"   VARCHAR(2) NOT NULL,
 "active"     BOOLEAN NOT NULL DEFAULT true
);

-- ************************************** country_lang
CREATE TABLE api.country_lang
(
 "name"       VARCHAR(128) NOT NULL,
 "id_country" INT NOT NULL,
 "id_lang"    INT NOT NULL,
 CONSTRAINT FK_country FOREIGN KEY ( id_country ) REFERENCES api.country ( id_country ) ON DELETE CASCADE,
 CONSTRAINT FK_lang FOREIGN KEY ( id_lang ) REFERENCES api.lang ( id_lang ) ON DELETE SET NULL
);
CREATE INDEX ON api.country_lang(id_country);
CREATE INDEX ON api.country_lang(id_lang);

-- ************************************** currency
CREATE TABLE api.currency
(
 "id_currency" SERIAL PRIMARY KEY,
 "name"        VARCHAR(32) NOT NULL,
 "iso_code"    VARCHAR(3) NOT NULL,
 "decimals"    BOOLEAN NOT NULL
);

-- ************************************** cart
CREATE TABLE api.cart
(
 "id_cart"  SERIAL PRIMARY KEY,
 "DATE_add" DATE NOT NULL DEFAULT CURRENT_DATE,
 "DATE_upd" DATE NOT NULL DEFAULT CURRENT_DATE
);

-- ************************************** cart_product
CREATE TABLE api.cart_product
(
 "quantity"   INT NOT NULL DEFAULT 1,
 "id_cart"    INT NOT NULL,
 "id_product" INT NOT NULL,
 CONSTRAINT FK_cart FOREIGN KEY ( id_cart ) REFERENCES api.cart ( id_cart ) ON DELETE CASCADE,
 CONSTRAINT FK_product FOREIGN KEY ( id_product ) REFERENCES api.product ( id_product ) ON DELETE CASCADE
);
CREATE INDEX ON api.cart_product(id_cart);
CREATE INDEX ON api.cart_product(id_product);

-- ************************************** address
CREATE TABLE api.address
(
 "id_address"  SERIAL PRIMARY KEY,
 "firstname"   VARCHAR(128) NOT NULL,
 "lastname"    VARCHAR(128) NOT NULL,
 "address1"    VARCHAR(128) NOT NULL,
 "address2"    VARCHAR(128) NOT NULL,
 "postcode"    VARCHAR(12) NOT NULL,
 "city"        VARCHAR(128) NOT NULL,
 "phone"       VARCHAR(16) NOT NULL,
 "active"      BOOLEAN NOT NULL DEFAULT false,
 "DATE_add"    DATE NOT NULL DEFAULT CURRENT_DATE,
 "DATE_upd"    DATE NOT NULL DEFAULT CURRENT_DATE,
 "id_customer" INT NOT NULL,
 CONSTRAINT FK_customer FOREIGN KEY ( id_customer ) REFERENCES api.customer ( id_customer )
);
CREATE INDEX ON api.address(id_customer);

ALTER TABLE api.product
ADD CONSTRAINT FK_manufacturer FOREIGN KEY ( id_manufacturer ) REFERENCES api.manufacturer ( id_manufacturer ) ON DELETE SET NULL,
ADD CONSTRAINT FK_category FOREIGN KEY ( id_category_default ) REFERENCES api.category ( id_category ) ON DELETE SET NULL
;
-- CREATE INDEX FOR FK on api.product ?

-- CREATE TABLE api.orders ...