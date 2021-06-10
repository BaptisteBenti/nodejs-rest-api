const express = require('express')
const cors = require('cors')
const {pool} = require('./config')
const path = require('path')
const logger = require('helmet')

const app = express();

// setup authentication strategy

app.use(express.json())
app.use(express.urlencoded({extended: true}))
app.use(cors())

const getCustomer = (req, res) => {
  pool.query('SELECT * FROM api.customer', (error, results) => {
    if (error) {
      throw error
    }
    res.status(200).json(results.rows)
  })
}

app
  .route('/customer')
  .get(getCustomer)

module.exports = app;