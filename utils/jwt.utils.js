var jwt = require('jsonwebtoken');
var jwtUtils = {};

const JWT_SIGN_SECRET = 'drgfsrgh45r6th465t4h65r4thr65th4r65trth4trh564rth565aziu6h8n';

jwtUtils.generateToken = function(user) {
  return jwt.sign({
    id: user.id,
    isAdmin: user.admin
  }, JWT_SIGN_SECRET, {
    expiresIn: '1h'
  });
}

module.exports = jwtUtils;