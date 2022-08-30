import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce_test/core/constants/colors.dart';
import 'package:ecommerce_test/core/utils/utils.dart';
import 'package:ecommerce_test/data/models/phone_details.dart';
import 'package:ecommerce_test/services/api_client.dart';
import 'package:ecommerce_test/view/details_screen/widgets/details_carousel.dart';
import 'package:ecommerce_test/view/splash_screen.dart';
import 'package:ecommerce_test/view/widgets/custom_icon_button.dart';
import 'package:ecommerce_test/view/widgets/custom_material_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> with TickerProviderStateMixin{

  late TabController _tabController;
  double initialRating = 4.5;

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
              CustomIconButton(
                onPressed: () => Navigator.of(context).pop(),
                color: appBlue,
                icon: const Icon(Icons.arrow_back_ios_new_rounded,size: 20,color: Colors.white,),
              ),
              Text('Product Details',style: Theme.of(context).textTheme.headline2,),
              CustomIconButton(
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
                                  CustomIconButton(
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
                              tabs: [
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
          if(snapshot.hasError) return SplashScreen();
          else return Center(
            child: CircularProgressIndicator(
              color: appOrange,
            )
          );
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
    height: MediaQuery.of(context).size.height * 0.1,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ImageIcon(
          AssetImage(icon,),
          size: 35,
          color: Colors.grey,
        ),
        Text(
            title,
            style: const TextStyle(color: Colors.grey,fontSize: 12)
        )
      ],
    ),
  );
}