'use strict';

const express     = require('express');
const cors        = require('cors');
const compression = require('compression');
const helmet      = require('helmet');
const logger      = require('morgan');
const path        = require('path');
const {pool}      = require('./api/config/database');

const index = require('./api/routes/index');

const app = express();

// setup authentication strategy somewhere...

app.use(logger('dev'));
// doc: https://github.com/expressjs/morgan#dev

app.use(compression());
// doc: https://github.com/expressjs/compression#readme

app.use(helmet());
// doc: https://helmetjs.github.io/

app.use(cors())
// doc: https://github.com/expressjs/cors#readme

app.use(express.json())
// doc: https://expressjs.com/en/api.html#express.json

app.use(express.urlencoded({extended: true}))
// doc: https://expressjs.com/en/api.html#express.urlencoded

app.use('/', index);

module.exports = app;