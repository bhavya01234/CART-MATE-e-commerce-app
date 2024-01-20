import 'package:amazon_two/common/widgets/loader.dart';
import 'package:amazon_two/constants/global_variables.dart';
import 'package:amazon_two/features/account/widgets/single_product.dart';
import 'package:amazon_two/features/admin/screens/add_product_screen.dart';
import 'package:amazon_two/features/admin/services/admin_services.dart';
import 'package:amazon_two/models/product.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Product>? products;
  final AdminServices adminServices = AdminServices();
  @override
  void initState() {
    //cant be asynchronous, so created a function below that is async afterwards
    super.initState();
    fetchAllProducts();
  }
  fetchAllProducts() async{
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  void deleteProduct(Product product, int index) {
    adminServices.deleteProduct(
      context: context,
      product: product,
      onSuccess: () {
        products!.removeAt(index);
        setState(() {});
      },
    );
  }

  @override
  void navigateToAddProduct(){
    Navigator.pushNamed(context, AddProductScreen.routeName);
}
  Widget build(BuildContext context) {
    return products == null ? const Loader() :
      Scaffold(
      body:
      // const Center(child: Text('Products'),),
      GridView.builder(
        itemCount: products!.length,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
        itemBuilder: (context, index){
          final productData = products![index];
          return Column(
            children: [
            SizedBox(
            height: 140,
            child: SingleProduct(
              image: productData.images[0],
            ),
          ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      productData.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  IconButton(
                    onPressed: ()=>
                    deleteProduct(productData, index),
                    icon: const Icon(
                      Icons.delete_outline,
                    ),
                  ),
                ],
              )
        ],
          );
        }
      ),
        floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.tealAccent.shade700,
        child: const Icon(Icons.add),
        onPressed: navigateToAddProduct,
        tooltip: 'Add a product',
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
