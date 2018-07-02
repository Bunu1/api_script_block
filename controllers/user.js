const ModelIndex = require('../models');
const User = ModelIndex.User;
const Op = ModelIndex.Sequelize.Op;

const UserController = function() { };

UserController.checkUser = function(email) {
  return User.findOne({
    where: {
      email: email
    }
  })
}

UserController.createUser = function(email, password, name) {
  return User.create({
    email: email,
    password: password,
    name: name
  });
}

module.exports = UserController
