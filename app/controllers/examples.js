'use strict';

const controller = require('lib/wiring/controller');
const models = require('app/models');
const Example = models.example;

const authenticate = require('./concerns/authenticate');
// req-request res-response
// if you don't use next, you won't be notified of errors
const index = (req, res, next) => {
  Example.find()
    .then(examples => res.json({ examples }))
    .catch(err => next(err));
};

const show = (req, res, next) => {
  // req is an object that will be passed in
  Example.findById(req.params.id)
  // checking to see if it exists
    .then(example => example ? res.json({ example }) : next())
    .catch(err => next(err));
};

const create = (req, res, next) => {
  // .assign is JS, creating a new object as a copy
  let example = Object.assign(req.body.example, {
    // checking for authentication via token
    _owner: req.currentUser._id,
  });
  Example.create(example)
    //sending back json of example that was just created
    .then(example => res.json({ example }))
    .catch(err => next(err));
};

const update = (req, res, next) => {
  let search = { _id: req.params.id, _owner: req.currentUser._id };
  Example.findOne(search)
    .then(example => {
      if (!example) {
        return next();
      }

      delete req.body._owner;  // disallow owner reassignment.
      return example.update(req.body.example)
        .then(() => res.sendStatus(200));
    })
    .catch(err => next(err));
};

const destroy = (req, res, next) => {
  let search = { _id: req.params.id, _owner: req.currentUser._id };
  Example.findOne(search)
    .then(example => {
      if (!example) {
        return next();
      }

      return example.remove()
        .then(() => res.sendStatus(200));
    })
    .catch(err => next(err));
};

module.exports = controller({
  index,
  show,
  create,
  update,
  destroy,
}, { before: [
  { method: authenticate, except: ['index', 'show'] },
], });
