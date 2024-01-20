const mongoose = require('mongoose');
const { productSchema } = require("./product");
//to create a new structure
const userSchema = mongoose.Schema({
    name:{
        require: true,
        type: String,
        trim: true, //removing leading and trailing spaces
    },
    email:{
            require: true,
            type: String,
            trim: true, //removing leading and trailing spaces
            validate: {
                validator: (value) => {

                    // regex -> identifies search patterns
                    const re =  /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                    // if value matches -> pattern ok for email
                    return value.match(re);
                },
                message: "please enter valid email address",
              },
           },
    password:{
        require: true,
        type: String,
//        validate: {
//                validator: (value) => {
//                return value.length > 6 ;
//                },
//                message: "please enter a long password",
//        },
    },
    address:{
        type: String,
        default: '',
    },
    type:{
        type: String,
        default: 'user',
    },
    //cart
    cart: [
       {
        product: productSchema,
        quantity: {
            type: Number,
            required: true,
        }
       }
    ]
});

const User = mongoose.model("User", userSchema);
module.exports = User;