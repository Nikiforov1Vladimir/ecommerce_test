import 'package:flutter/material.dart';

class CarouselComponent extends StatelessWidget {

  final String image;

  const CarouselComponent({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: ContainerDecoration(image),
          )
        ],
      ),
    );
  }
}

BoxDecoration ContainerDecoration(String image){
  return BoxDecoration(
    color: const Color(0xff101010),
    borderRadius: BorderRadius.circular(20),
    image: DecorationImage(
      fit: BoxFit.cover,
        image: AssetImage(image)
    )

  );
}