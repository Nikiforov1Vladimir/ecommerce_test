import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce_test/core/constants/colors.dart';
import 'package:ecommerce_test/core/utils/utils.dart';
import 'package:ecommerce_test/view/details_screen/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneCard extends StatefulWidget {

  bool loadingCard;
  String title;
  int priceWithoutDiscount;
  int discountPrice;
  String picture;
  bool isFavorites;

  PhoneCard({Key? key,required this.loadingCard, required this.isFavorites, required this.title, required this.priceWithoutDiscount, required this.discountPrice, required this.picture}) : super(key: key);

  @override
  State<PhoneCard> createState() => _PhoneCardState();
}

class _PhoneCardState extends State<PhoneCard> {

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Ink(
            height: MediaQuery.of(context).size.height * 0.27,
            width: MediaQuery.of(context).size.width * 0.47,
            decoration: ContainerDecoration(widget.picture),
            child: widget.loadingCard ? const Center(
              child: CircularProgressIndicator(
                color: appBlue,
              ),
            )
                :
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () => Get.to(()=>const DetailsScreen()),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("\$${widget.priceWithoutDiscount}",style: Theme.of(context).textTheme.headline2),
                            addHorizontalSpace(MediaQuery.of(context).size.width * 0.02),
                            Text('\$${widget.discountPrice}',style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey
                              )
                            )
                          ],
                        ),

                        //Title
                        AutoSizeText(
                          widget.title,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 10,
                            color: appBlue
                          ),
                        ),
                      ],
                    ),
                  ),

                  Align(
                    alignment: const Alignment(1.3, -0.9),
                    child: MaterialButton(
                      onPressed: (){
                        setState(() {
                          widget.isFavorites = !widget.isFavorites;
                        });
                      },
                      color: Colors.white,
                      elevation: 0,
                      shape: const CircleBorder(),
                      child: Icon(
                          Icons.favorite_border,
                        color: widget.isFavorites ? Colors.red : Colors.grey,
                      ),
                    )
                  )
                ],
              ),
            ),
          ),

          //Mark Button
        ],
    );
  }
}

BoxDecoration ContainerDecoration(String image){
  return BoxDecoration(
    borderRadius: BorderRadius.circular(20),
      color: const Color(0xffFBFBFB),
    image: DecorationImage(
      alignment: Alignment.topCenter,
      image: NetworkImage(image)
    )
  );
}