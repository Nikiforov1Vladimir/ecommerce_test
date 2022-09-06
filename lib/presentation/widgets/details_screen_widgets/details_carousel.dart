import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'carousel_component.dart';

class DetailsCarousel extends StatefulWidget {

  final List<String> imagesList;

  const DetailsCarousel({Key? key, required this.imagesList}) : super(key: key);

  @override
  State<DetailsCarousel> createState() => _DetailsCarouselState();
}

class _DetailsCarouselState extends State<DetailsCarousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: widget.imagesList.map((e) => CarouselComponent(image: e)).toList(),
        options: CarouselOptions(

            enlargeCenterPage: true,
            aspectRatio: 9/8,
            viewportFraction: 0.7

        )
    );
  }
}