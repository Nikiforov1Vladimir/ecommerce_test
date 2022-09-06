import 'package:flutter/material.dart';

class CarouselComponent extends StatelessWidget {

  final String image;

  const CarouselComponent({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
