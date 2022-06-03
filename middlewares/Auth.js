const passport = require("passport");

exports.isAuth = (role) => {
	if (!role) return passport.authenticate("jwt", { session: false })
	return [
		passport.authenticate("jwt", { session: false }),
		can(role),
	];
};


function can(Profile) {
	return async (req, res, next) => {
		console.log(req.user.ProfileId);
		if (req.user.ProfileId !== Profile) {
			res.status(403)
			return res.send("not allowed")
		}

		next()
	}
};
