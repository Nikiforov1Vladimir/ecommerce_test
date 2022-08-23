import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce_test/core/constants/colors.dart';
import 'package:ecommerce_test/core/utils/utils.dart';
import 'package:ecommerce_test/view/details_screen/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneCard extends StatefulWidget {

  final int index;

  const PhoneCard({Key? key, required this.index}) : super(key: key);

  @override
  State<PhoneCard> createState() => _PhoneCardState();
}

class _PhoneCardState extends State<PhoneCard> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(()=>DetailsScreen()) ,
      child: Stack(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              height: MediaQuery.of(context).size.height * 0.27,
              width: MediaQuery.of(context).size.width * 0.47,
              decoration: ContainerDecoration(),
              child: Stack(
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 3,
                        child: Image(
                          image: AssetImage('assets/images/test_phone_image.jpeg'),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                //Cost
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("\$1,047",style: Theme.of(context).textTheme.headline2),
                                    addHorizontalSpace(MediaQuery.of(context).size.width * 0.02),
                                    const Text('\$1500',style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.grey
                                      )
                                    )
                                  ],
                                ),

                                //Title
                                const AutoSizeText(
                                  'Samsung Galaxy S20 Ultra',
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: appBlue
                                  ),
                                ),
                              ],
                            ),
                          )
                      )
                    ],
                  ),

                  Align(
                    alignment: const Alignment(1.3, -0.9),
                    child: MaterialButton(
                      onPressed: (){},
                      color: Colors.white,
                      elevation: 0,
                      shape: const CircleBorder(),
                      child: const Icon(Icons.favorite_border),
                    )
                  )
                ],
              ),
            ),

            //Mark Button
          ],
      ),
    );
  }
}

BoxDecoration ContainerDecoration(){
  return BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Color(0xffFBFBFB)
  );
}