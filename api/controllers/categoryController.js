'use strict';

const {pool} = require('../config/database');

exports.category_get_all = [
  function(req, res) {
    pool.query('SELECT * FROM api.category', (error, results) => {
      if (error) {
        throw error;
      }
      res.status(200).json(results.rows);
    })
  }
];

exports.category_get_by_id = [
  function(req, res) {
    pool.query(`SELECT * FROM api.category WHERE id_category = ${req.params.id};`, (error, results) => {
      if (error) {
        throw error;
      }
      res.status(200).json(results.rows);
    })
  }
];