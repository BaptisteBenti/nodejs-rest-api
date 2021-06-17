'use strict';

const { pool } = require('../config/database');
const { body } = require('express-validator');
const { validationResult } = require('express-validator');

exports.customer_get_all = function(req, res) {
  const SQL = `
  SELECT id_customer, firstname, lastname, email, birthday, newsletter, date_add, date_upd
  FROM api.customer;
  `;
  pool.query(SQL, (error, results) => {
      if (error) {
        throw error;
      }
      res.status(200).json(results.rows);
    })
};

exports.customer_get_one = function(req, res) {
  const SQL = `
  SELECT id_customer, firstname, lastname, email, birthday, newsletter, date_add, date_upd
  FROM api.customer
  WHERE id_customer = ${req.params.id};
  `;
  pool.query(SQL, (error, result) => {
      if (error) {
        throw error;
      }
      res.status(200).json(result.rows);
    })
};

exports.customer_create = function(req, res) {

  console.log(req.body.firstname)

  // validate and sanitize fields
  body('firstname').not().isEmpty().trim().escape().isLength({max:128});
  body('lastname').not().isEmpty().trim().escape().isLength({max:128});
  body('password').not().isEmpty().isLength({min:8 , max:128}).trim().escape();
  body('passwordConfirm').not().isEmpty().isLength({min:8 , max:128}).trim().escape();
  body('email').not().isEmpty().isEmail().normalizeEmail().isLength({max:128});
  body('birthday').isISO8601().toDate();
  // body('newsletter').isBoolean().default(false);

  const errors = validationResult(req);

  // if (req.body.password === req.body.passwordConfirm) {
  //   errors.array().push({msg: 'Oops, passwords do not match.'});
  // }

  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }

  // hash password
  // const hash = ...

  const query = 'INSERT INTO api.customer("firstname", "lastname", "passwd", "email", "birthday") VALUES($1, $2, $3, $4, $5)';
  const params= [req.body.firstname, req.body.lastname, req.body.password, req.body.email, req.body.birthday];

  pool.query(query, params, (error, results) => {
      if (error) {
        throw error;
      }
      res.status(200).json(results.rows);
    })
};

exports.customer_update = function(req, res) {
  const SQL = `
  SELECT id_customer, firstname, lastname, email, birthday, newsletter, date_add, date_upd
  FROM api.customer
  WHERE id_customer = ${req.params.id};
  `;
  pool.query(SQL, (error, results) => {
      if (error) {
        throw error;
      }
      res.status(200).json(results.rows);
    })
};


exports.customer_delete = function(req, res) {
    pool.query(`DELETE FROM api.customer WHERE id_customer = ${req.params.id};`, (error, results) => {
      if (error) {
        throw error
      }
      res.status(200).json(results.rows);
    })
};
