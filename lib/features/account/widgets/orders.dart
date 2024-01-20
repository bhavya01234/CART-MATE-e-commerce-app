import 'package:amazon_two/constants/global_variables.dart';
import 'package:amazon_two/features/account/widgets/single_product.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  // List<Order>? orders;
  // final AccountServices accountServices = AccountServices();
  List list = [
    {
      // 'https://images.unsplash.com/photo-1704774801340-7d23d2d3868b?q=80&w=2875&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      // 'https://images.unsplash.com/photo-1704774801340-7d23d2d3868b?q=80&w=2875&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      // 'https://images.unsplash.com/photo-1704774801340-7d23d2d3868b?q=80&w=2875&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      // 'https://images.unsplash.com/photo-1704774801340-7d23d2d3868b?q=80&w=2875&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',

      // 'https://images.unsplash.com/photo-1682687982502-b05f0565753a?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      // 'https://images.unsplash.com/photo-1682687982502-b05f0565753a?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      // 'https://images.unsplash.com/photo-1682687982502-b05f0565753a?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      // 'https://images.unsplash.com/photo-1682687982502-b05f0565753a?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',


      // 'https://i.pinimg.com/originals/a6/3a/e4/a63ae47cdd394c6a33249a6e90d336b3.jpg',
      // 'https://i.pinimg.com/originals/a6/3a/e4/a63ae47cdd394c6a33249a6e90d336b3.jpg',
      // 'https://i.pinimg.com/originals/a6/3a/e4/a63ae47cdd394c6a33249a6e90d336b3.jpg',
      // 'https://i.pinimg.com/originals/a6/3a/e4/a63ae47cdd394c6a33249a6e90d336b3.jpg',


      'https://plus.unsplash.com/premium_photo-1701094772229-0d39c346d06a?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://plus.unsplash.com/premium_photo-1701094772229-0d39c346d06a?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://plus.unsplash.com/premium_photo-1701094772229-0d39c346d06a?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://plus.unsplash.com/premium_photo-1701094772229-0d39c346d06a?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',

    }
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: const Text(
                'Your Orders',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                right: 15,
              ),
              child: Text(
                'See all',
                style: TextStyle(
                  color: GlobalVariables.selectedNavBarColor,
                ),
              ),
            ),
          ],
        ),
        // display orders
        Container(
          height: 170,
          padding: const EdgeInsets.only(
            left: 10,
            top: 20,
            right: 0,
          ),

          child:
          ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index)

              {
                var item = list[index];
                // Convert the set to a list and get the first element
                var imageUrl = item.toList()[index];
                return SingleProduct(image: imageUrl,);
              }
          ),

          // child: ListView.builder(
          //   scrollDirection: Axis.horizontal,
          //   itemCount: orders!.length,
          //   itemBuilder: (context, index) {
          //     return GestureDetector(
          //       onTap: () {
          //         Navigator.pushNamed(
          //           context,
          //           OrderDetailScreen.routeName,
          //           arguments: orders![index],
          //         );
          //       },
          //       child: SingleProduct(
          //         image: orders![index].products[0].images[0],
          //       ),
          //     );
          //   },
          // ),
        ),
      ],
    );
  }
}