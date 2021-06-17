'use strict';

const {pool} = require('../config/database');

exports.product_get_all = [
  function(req, res) {
    pool.query('SELECT * FROM api.product', (error, results) => {
      if (error) {
        throw error;
      }
      res.status(200).json(results.rows);
    })
  }
];

exports.product_get_by_id = [
  function(req, res) {
    pool.query(`SELECT * FROM api.product WHERE id_product = ${req.params.id};`, (error, results) => {
      if (error) {
        throw error;
      }
      res.status(200).json(results.rows);
    })
  }
];