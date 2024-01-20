const express = require("express");
const User = require("../models/user");
// .. -> one back
const bcryptjs = require('bcryptjs');

const authRouter = express.Router();
const jwt = require('jsonwebtoken');
const auth = require('../middlewares/auth');
//SIQN UP ROUTE
authRouter.post('/api/signup', async (req, res)=>{

    try{
        //get data from client
            //post that data in database
                //return that data to user
            const{name, email, password} = req.body;
            //above written for body (json)

            //findone finds the same email
            const existingUser = await User.findOne({ email });
            if(existingUser){
            //http status codes -> search what status code is for the error we are catching (here 400)
                return res.status(400).json({msg: 'User with same email already exists!'});
            }
            //hash function encrypts pw
            // salt -> random string -> gets automatically included
            const hashedPassword = await bcryptjs.hash(password, 8);

            let user = new User({
            //order doesnt matter, just mention required arguments
                email,
                //password,
                    // since hashedpw: hashedpw  (this is not the case so ...)
                password: hashedPassword,
                name
            })

            //below -> thing entered in record
            user = await user.save();
            res.json({user});

    }
    catch(e){
    //we are using error* for server error and msg* for validation error
        res.status(500).json({error: e.message});
    }
});

authRouter.post('/api/signin', async(req, res) => {
   try{
    const {email, password} = req.body;
    const user = await User.findOne({email});
    if(!user){
        return res.status(400).json({msg: 'User with this email does not exist!'});
    }
    bcryptjs.compare(password, user.password);
    const isMatch = await bcryptjs.compare(password, user.password);
    if(!isMatch){
    return res.status(400).json({msg: 'Incorrect password.'});
    //two same pw wont have same hashed pws
    }
    const token = jwt.sign({id: user._id}, "passwordKey");
    res.json({token, ...user._doc});
    //above gives -> token : tokensomething notation
   }catch(e){
    res.status(500).json({error: e.message});
   }
});
//authRouter.get('/user', (req, res) => {
//    res.json({msg: 'rivaan'});
//});

//to access authRouter outside this file too


authRouter.post("/tokenIsValid", async (req, res) => {
  try {
    const token = req.header("x-auth-token");
    if (!token) return res.json(false);
    const verified = jwt.verify(token, "passwordKey");
    if (!verified) return res.json(false);


    const user = await User.findById(verified.id);
    if (!user) return res.json(false);
    res.json(true);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// get user data
authRouter.get("/", auth, async (req, res) => {
  const user = await User.findById(req.user);
  res.json({ ...user._doc, token: req.token });
});


module.exports = authRouter;