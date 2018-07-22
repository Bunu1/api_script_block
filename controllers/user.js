const ModelIndex = require('../models');
const User = ModelIndex.User;
const Op = ModelIndex.Sequelize.Op;

const UserController = function() { };

UserController.checkUserEmail = function(email) {
  return User.findOne({
    where: {
      email: email
    }
  })
}

UserController.checkUserName = function(name) {
	return User.findOne({
		where: {
			name: name
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

UserController.findAll = function(id, name, email, date_insc, admin, active, enabled) {
  const where = {};
  const options = {};
  
  if(id !== undefined){
    where.id = {
      [Op.like]: `${id}%`
    }
  }
  if(name !== undefined){
    where.name = {
      [Op.like]: `${name}%`
    }
  }
  if(email !== undefined){
    where.email = {
      [Op.like]: `${email}%`
    }
  }
  if(date_insc !== undefined){
    where.date_insc = {
      [Op.like]: `${date_insc}%`
    }
  }
  if(admin !== undefined){
    where.admin = {
      [Op.like]: `${admin}%`
    }
  }
  if(active !== undefined){
    where.active = {
      [Op.like]: `${active}%`
    }
  }
  if(enabled !== undefined){
    where.enabled = {
      [Op.like]: `${enabled}%`
    }
  }
  
  return User.findAll(options);
};

UserController.update = function(id, name, admin, enabled) {
  return User.find({where: {id: id}})
  .then((User) => {
    if(User) {
      if(name === undefined) name = User.name;
      if(admin === undefined) admin = User.admin;
      if(enabled === undefined) enabled = User.enabled;
      return User.updateAttributes({
        name: name,
        admin: admin,
        enabled: enabled
      });
    }
  })
}

module.exports = UserController
