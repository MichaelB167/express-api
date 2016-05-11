'use strict';

const mongoose = require('mongoose');

const exampleSchema = new mongoose.Schema({
  text: {
    type: String,
    required: true,
  },
  _owner: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    // references user model
    required: true,
  },
}, {
  timestamps: true,
  toJSON: { virtuals: true },
});

exampleSchema.virtual('length').get(function length() {
  return this.text.length;
});
// not using fat arrow because of 'this'

const Example = mongoose.model('Example', exampleSchema);

module.exports = Example;
