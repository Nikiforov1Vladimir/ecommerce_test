import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
        items: widget.imagesList.map((e) => CarouselComponent(e,context)).toList(),
        options: CarouselOptions(

            enlargeCenterPage: true,
            aspectRatio: 9/8,
            viewportFraction: 0.7

        )
    );
  }
}

Widget CarouselComponent(String image,context){
  return Padding(
    padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.02
    ),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(image)
          ),
          boxShadow: const [
            BoxShadow(
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0,10),
                color: Colors.black12
            )
          ]
      ),
    ),
  );
}
