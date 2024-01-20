import 'package:amazon_two/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class CarouselImage extends StatelessWidget {
  const CarouselImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVariables.carouselImages.map(
            (i) {
          return Builder(
            builder: (BuildContext context) => Image.network(
              i,
              fit: BoxFit.cover,
              height: 200,
            ),
          );
        },
      ).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: 200,
      ),
    );
  }
}



// Builder Widget:
//
// The Builder widget is used inside the map function to create a new build context for each item in the CarouselSlider. This is necessary because CarouselSlider requires each item to have its own build context.
// Image.network:
//
// For each image URL (i) in the GlobalVariables.carouselImages list, an Image.network widget is created. This widget loads the image from the network using the provided URL.
// This is used to provide additional options to configure the behavior of the CarouselSlider. In this case, viewportFraction: 1