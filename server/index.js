//console.log('hello world');
//**************************************
//const express = require('express');
// above is like -> import 'package:express/express.dart'
//const PORT = 3000;
//const app = express();
//********************************************
//CREATING API
// http://<youripaddress>/hello-world


//app.get('/hello-world', (req, res) => {

//res.json()   -> passes in json format
// res.send('hello world');   -> text format
//res.json({hi: 'helo world'})

//})

// GET / req json -> name: bhavya

//localhost:3000/  -> to type on google

//app.get('/', (req, res) => {
//res.json({name: 'bhavya'})
//})


//GET, PUT, POST, DELETE, UPDATE -> CRUD (create read update delete)

//app.listen(PORT, "0.0.0.0", () => {

// binds itself with host that we are
// gonna specify and listen for any connections

//console.log('Connected at port' + PORT);
//console.log(`Connected at port ${PORT} hello`);
//
//});


// npm run dev -> to run with node and nodemon (since both installed)


//**************************************************************************
//**************************************************************************


//IMPORTS FROM PACKAGE
const express = require('express');
const mongoose = require('mongoose');

//IMPORTS FROM OTHER FILES
const authRouter = require("./routes/auth");
const adminRouter = require("./routes/admin")
const productRouter = require("./routes/products")
const userRouter = require("./routes/user");

//INIT
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://bhavya7:hello.mongo77@cluster0.jfajcr1.mongodb.net/?retryWrites=true&w=majority";
//middleware
// CLIENT -> SERVER -> CLIENT (stops. for continuous listening -> socket IO (real time communication))

app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

//CONNECTIONS
mongoose.connect(DB).then(() => {
    console.log('connection successful');
})
.catch((e) => {
    console.log(e);
});

app.listen(PORT, () => {
console.log(`Connected at port ${PORT} hello`);
});
