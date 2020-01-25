// setup JSDOM
require('jsdom-global')()

// make expect available globally
const chai = require('chai')
global.expect = chai.expect
