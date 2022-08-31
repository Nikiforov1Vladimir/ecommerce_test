import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce_test/core/constants/colors.dart';
import 'package:ecommerce_test/core/utils/utils.dart';
import 'package:ecommerce_test/view/widgets/custom_material_button.dart';
import 'package:flutter/material.dart';

class CarouselComponent extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final bool isProductNew;
  final VoidCallback? onButtonPressed;

  const CarouselComponent(
      {Key? key,
        required this.image,
        required this.isProductNew,
        required this.title,
        required this.subTitle,
        this.onButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: const Color(0xff101010),
          borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          alignment: Alignment.centerRight,
            fit: BoxFit.cover,
            image: NetworkImage(image)
        )
      
      ),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.06,
                  top: MediaQuery.of(context).size.height * 0.03,
                  bottom: MediaQuery.of(context).size.height * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isProductNew
                      ? const CircleAvatar(
                    radius: 20,
                    backgroundColor: appOrange,
                    child: Center(
                      child: Text(
                        'New',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10),
                      ),
                    ),
                  )
                      : const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.transparent,
                  ),
                  AutoSizeText(
                    title,
                    maxLines: 1,
                    style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  AutoSizeText(
                    subTitle,
                    style: const TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  CustomMaterialButton(
                      onPressed: () {},
                      color: Colors.white,
                      child: const Text(
                        'Buy Now!',
                        style: TextStyle(
                            color: appBlue,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
          ),
          Expanded(
              flex: 6,
              child: Padding(
                  padding: const EdgeInsets.only(left: 30.0),
              )
          )
        ],
      ),
    );
  }
}