import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'carousel_component.dart';

class AppCarousel extends StatelessWidget {
  const AppCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: const [
          CarouselComponent(
            title: 'Iphone 12',
            subTitle: 'Супер.Мега.Быстро',
            image: 'assets/images/test_carousel_image.jpeg',
            isProductNew: true,
          ),
          CarouselComponent(
            title: 'Trade In',
            subTitle: 'Супер.Мега.Быстро',
            image: 'assets/images/test_carousel_image.jpeg',
            isProductNew: false,
          )
        ],
        options: CarouselOptions(
          viewportFraction: 0.9,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 10),
          autoPlayAnimationDuration: const Duration(seconds: 1),
        )
    );
  }
}
