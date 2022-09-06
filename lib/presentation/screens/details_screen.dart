import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce_test/core/constants/colors.dart';
import 'package:ecommerce_test/domain/models/phone_details.dart';
import 'package:ecommerce_test/data/api/services/api_client.dart';
import 'package:ecommerce_test/presentation/widgets/app_widgets/custom_icon_button.dart';
import 'package:ecommerce_test/presentation/widgets/app_widgets/custom_material_button.dart';
import 'package:ecommerce_test/presentation/widgets/details_screen_widgets/details_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'splash_screen.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> with TickerProviderStateMixin{

  late TabController _tabController;
  int selectedColor = 0;
  int selectedCapacity = 0;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        automaticallyImplyLeading: false,

        title: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppMaterialIconButton(
                onPressed: () => Navigator.of(context).pop(),
                color: appBlue,
                icon: const Icon(Icons.arrow_back_ios_new_rounded,size: 20,color: Colors.white,),
              ),
              Text('Product Details',style: Theme.of(context).textTheme.headline2,),
              AppMaterialIconButton(
                onPressed: (){},
                icon: const ImageIcon(AssetImage('assets/icons/shopping-bag.png'),size: 20,color: Colors.white,),
              )
            ],
          ),
        ),
      ),

      body: FutureBuilder(
        future: ApiClient().getPhoneInfo(),
        builder: (BuildContext context, AsyncSnapshot<PhoneDetails> snapshot) {
          if(snapshot.hasData) {
            return Column(
              children: [

                Expanded(
                    flex: 4,
                    child: DetailsCarousel(
                      imagesList: snapshot.data!.images,
                    )
                ),

                Expanded(
                    flex: 4,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.08,
                          vertical: MediaQuery.of(context).size.height * 0.025
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              spreadRadius: 10,
                              blurRadius: 10
                          )
                        ],
                        borderRadius: BorderRadius.circular(35),
                        color: Colors.white,
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AutoSizeText(snapshot.data!.title,maxLines: 1,style: Theme.of(context).textTheme.headline3,),
                                  AppMaterialIconButton(
                                      color: appBlue,
                                      onPressed: (){},
                                      icon: const Icon(Icons.favorite_border,size: 20,color: Colors.white,)
                                  )
                                ],
                              ),

                              RatingBar(
                                  itemSize: 20,
                                  minRating: 1,
                                  maxRating: 5,
                                  initialRating: snapshot.data!.rating,
                                  allowHalfRating: true,

                                  ratingWidget: RatingWidget(
                                      half: const Icon(Icons.star_half_outlined,color: Color(0xffffb800)),
                                      full: const Icon(Icons.star,color: Color(0xffffb800),),
                                      empty: const Icon(Icons.star_outline,color: Color(0xffffb800))
                                  ),

                                  onRatingUpdate: (value){

                                  }
                              ),
                            ],
                          ),


                          //Не стал делать TabBarView, т.к ни в т.з, ни в дизайне прилоежиня
                          //не увидел ничего с ним связанного, так что это просто таббат
                          //без ничего :)

                          TabBar(
                              controller: _tabController,
                              tabs: const [
                                Tab(text: 'Shop'),
                                Tab(text: 'Details'),
                                Tab(text: 'Features')
                              ]
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CharacteristicIcon(snapshot.data!.cpu,'assets/icons/cpu.png',context),
                              CharacteristicIcon(snapshot.data!.camera,'assets/icons/camera.png',context),
                              CharacteristicIcon(snapshot.data!.ssd,'assets/icons/ram.png',context),
                              CharacteristicIcon(snapshot.data!.sd,'assets/icons/micro-sd.png',context),
                            ],
                          ),

                          Text('Select color and capacity',style: Theme.of(context).textTheme.headline4),

                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,

                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: snapshot.data!.color.length,
                                      separatorBuilder: (context,index) {
                                        return SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.04,
                                        );
                                      },
                                      itemBuilder: (context,index){
                                        return GestureDetector(
                                          onTap:(){
                                            setState(() {
                                              selectedColor = index;
                                            });
                                          },
                                          child: CircleAvatar(
                                            radius: 20,
                                            backgroundColor: _colorFromHex(snapshot.data!.color[index]),
                                            child: selectedColor == index ? const Icon(Icons.done,color: Colors.white) : const SizedBox(),
                                          ),
                                        );
                                      },
                                    )
                                ),
                                Expanded(
                                  flex: 5,
                                    child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context,index) =>
                                            MaterialButton(
                                                onPressed: (){
                                                  setState(() {
                                                    selectedCapacity = index;
                                                  });
                                                },
                                              color: selectedCapacity == index ? appOrange : Colors.transparent,
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10)
                                              ),
                                              minWidth: MediaQuery.of(context).size.width * 0.2,
                                              child: Text(
                                                  '${snapshot.data!.capacity[index]} GB',
                                                style: TextStyle(
                                                  color: selectedCapacity == index ? Colors.white : Colors.grey,
                                                  fontSize: selectedCapacity == index ? 12 : 10
                                                ),
                                              ),
                                        ),
                                        separatorBuilder: (context,index) {
                                          return SizedBox(
                                            width: MediaQuery.of(context).size.width * 0.04,
                                          );
                                        },
                                        itemCount: snapshot.data!.capacity.length
                                    )
                                )

                              ],
                            ),
                          ),


                          CustomMaterialButton(
                            verticalPadding: MediaQuery.of(context).size.height * 0.015,
                            onPressed: (){},
                            child: Row(

                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                Text('Add to Cart',style: Theme.of(context).textTheme.button,),
                                Text('${snapshot.data!.price}.00',style: Theme.of(context).textTheme.button)
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                )

              ],
          );}
          if(snapshot.hasError) {
            return const SplashScreen();
          } else {
            return const Center(
            child: CircularProgressIndicator(
              color: appOrange,
            )
          );
          }
        },
      ),

    );
  }
}

Widget CharacteristicIcon(String title,String icon,BuildContext context){
  return Container(
    padding: EdgeInsets.symmetric(
      vertical: MediaQuery.of(context).size.height * 0.01
    ),
    width: MediaQuery.of(context).size.width * 0.2,
    height: MediaQuery.of(context).size.height * 0.08,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ImageIcon(
          AssetImage(icon,),
          size: 30,
          color: Colors.grey,
        ),
        Text(
            title,
            style: const TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w400)
        )
      ],
    ),
  );
}

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}