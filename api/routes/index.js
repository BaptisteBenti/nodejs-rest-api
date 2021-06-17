'use strict';

const express = require('express');
const router = express.Router();

// required controllers
const customer_controller = require('../controllers/customerController');
const product_controller = require('../controllers/productController');
const category_controller = require('../controllers/categoryController');

// customer
router.get('/customer', customer_controller.customer_get_all); // get all customers
router.post('/customer', customer_controller.customer_create); // add a new customer (not idempotent)
router.get('/customer/:id', customer_controller.customer_get_one); // get a customer by its id
router.put('/customer/:id', customer_controller.customer_update); // update a customer (idempotent)
router.delete('/customer/delete/:id', customer_controller.customer_delete);// delete a customer based on its id

// orders
// get all orders (of a customer)
// get an order (of a customer)
// update an order (of a customer)
// add an order (for a customer)
// delete an order (of a customer)

// cart
// get cart of a customer
// add a product to the cart of a customer
// update a product to the cart of a customer
// remove a product to the cart of a customer
// delete cart of a customer

// product
router.get('/product', product_controller.product_get_all); // get all products
router.get('/product/:id', product_controller.product_get_by_id); // get a product
// add a product
// update a product
// delete a product

// associate a category to a product
// associate a manufacturer to a product
// associate an image to a product

// lang
// get all
// get one
// add one
// update one
// delete one

// category
router.get('/category', category_controller.category_get_all); // get all
router.get('/category/:id', category_controller.category_get_by_id); // get one
// get all
// get one
// add one
// update one
// delete one

// manufacturer
// get all
// get one
// add one
// update one
// delete one

module.exports = router;