const express = require('express');
const adminRouter = express.Router();
const admin = require('../middlewares/admin');
const Product = require('../models/product');

adminRouter.post('/admin/add-product', admin, async(req, res) => {
    try{
        const {name, description, images, quantity, price, category}=req.body;
        let product = new Product({
            name,
            description,
            images,
            quantity,
            price,
            category,
        });
        //to save to db
        product = await product.save();
        res.json(product);
    }catch(e){
        res.status(500).json({error : e.message});
    }
});

//get all products
//admin before async since -> admin middleware
adminRouter.get('/admin/get-products', admin, async(req, res) => {
    try{
    //since no condition in find -> fetches all products
        const products = await Product.find({});
        res.json(products);
    }
    catch(e){
        res.status(500).json({error : e.message});
    }
})


//delete product

adminRouter.post('/admin/delete-product', admin, async(req, res) => {
    try{
        const {id} = req.body;
        let product = await Product.findByIdAndDelete(id);
        //product = await product.save();
        res.json(product);

    }catch(e){
        res.status(500).json({error: e.message});
    }
})

module.exports = adminRouter;