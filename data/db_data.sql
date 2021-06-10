-- ************************************** lang
-- id_lang
-- name
-- active
-- iso_code
INSERT INTO api.lang ("id_lang", "name", "iso_code")
VALUES
(1, 'french', 'fr'),
(2, 'english', 'en')
;
-- ************************************** customer
-- id_customer
-- firstname
-- lastname
-- email
-- passwd
-- birthday
-- newsletter
-- date_add
-- date_upd
INSERT INTO api.customer ("id_customer", "firstname", "lastname", "email", "passwd", "newsletter")
VALUES
(1, 'Ernest', 'Urgeon', 'ernesturgeon@janus.net', 'password', false),
(2, 'Celestine', 'Garcia', 'celestinegarcia@martes.net', 'password', true),
(3, 'Andrea', 'Carces', 'andreacarces@april.net', 'password', true),
(4, 'Giuseppe', 'Verdi', 'giuseppeverdi@februs.net', 'password', false)
;
-- ************************************** manufacturer
-- id_manufacturer
-- name
-- date_add
-- date_upd
INSERT INTO api.manufacturer ("id_manufacturer", "name")
VALUES
(1, 'Byamba'),
(2, 'Eskal'),
(3, 'Dyomos')
;
-- ************************************** category
-- id_category
-- active
-- date_add
-- date_upd
INSERT INTO api.category ("id_category")
VALUES
(1),
(2),
(3)
;
-- ************************************** category_lang
-- name
-- description
-- id_category
-- id_lang
INSERT INTO api.category_lang ("name", "description", "id_category", "id_lang")
VALUES
('hauts', '', 1, 1), -- FR
('bas', '', 2, 1), -- FR
('accessoires', '', 3, 1), -- FR
('top', '', 1, 2), -- EN
('bottom', '', 2, 2), -- EN
('accessories', '', 3, 2)  -- EN
;
-- ************************************** product
-- id_product
-- price
-- quantity
-- on_sale
-- date_add
-- date_upd
-- id_manufacturer
-- id_category_default
INSERT INTO api.product ("id_product", "price", "quantity", "on_sale", "id_manufacturer", "id_category_default")
VALUES
(1, 15, 15, true, 1, 1),
(2, 8, 0, true, 2, 2),
(3, 12, 100, false, 3, 3),
(4, 16, 100, true, 1, 1),
(5, 0, 20, true, 2, 1)
;
-- ************************************** product_lang
-- name
-- description
-- description_short
-- id_product
-- id_lang
INSERT INTO api.product_lang ("name", "description", "description_short", "id_product", "id_lang")
VALUES
('T-Shirt Fitness Homme', 'description longue', 'description courte', 1, 1), -- FR
('T-Shirt Fitness Man', 'long description', 'short description', 1, 2), -- EN
('T-shirt Escalade Homme', 'description longue', 'description courte', 2, 1), -- FR
('T-shirt Climbing Man', 'long description', 'short description', 2, 2), -- EN
('T-shirt Technique Merinos', 'description longue', 'description courte', 3, 1), -- FR
('T-shirt Technic Merinos', 'long description', 'short description', 3, 2), -- EN
('T-shirt Rando Homme', 'description longue', 'description courte', 4, 1), -- FR
('T-shirt Hiking Man', 'long description', 'short description', 4, 2), -- EN
('T-shirt MESH Fitness', 'description longue', 'description courte', 5, 1), -- FR
('T-shirt MESH Fitness', 'long description', 'short description', 5, 2) -- EN
;
-- ************************************** image
-- id_image
-- order
-- cover
-- id_product
INSERT INTO api.image ("id_image", "order", "cover", "id_product")
VALUES
(1, 1, true, 1),
(2, 1, true, 2),
(3, 1, true, 3),
(4, 1, true, 4)
;
-- ************************************** image_lang
-- legend
-- id_image
-- id_lang
INSERT INTO api.image_lang ("legend", "id_image", "id_lang")
VALUES
('T-Shirt Fitness Homme', 1, 1), -- FR
('T-shirt Escalade Homme', 2, 1), -- FR
('T-shirt Technique Merinos', 3, 1), -- FR
('T-shirt Rando Homme', 4, 1), -- FR
('T-Shirt Fitness Man', 1, 2), -- EN
('T-shirt Climbing Man', 2, 2), -- EN
('T-shirt Technic Merinos', 3, 2), -- EN
('T-shirt Hiking Man', 4, 2)  -- EN
;