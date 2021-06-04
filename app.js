const express = require('express');
const path = require('path');
const helmet = require('helmet');

const app = express();

// setup database connection
// setup authentication strategy

app.use(helmet());

// ...

module.exports = app;