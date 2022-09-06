import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_test/core/constants/colors.dart';
import 'package:ecommerce_test/core/utils/utils.dart';
import 'package:ecommerce_test/domain/models/basket.dart';
import 'package:ecommerce_test/domain/models/phone.dart';
import 'package:ecommerce_test/data/api/services/api_client.dart';
import 'package:ecommerce_test/presentation/widgets/app_widgets/custom_text_field.dart';
import 'package:ecommerce_test/presentation/widgets/app_widgets/phone_card.dart';
import 'package:ecommerce_test/presentation/widgets/home_page_widgets/custom_sliver_app_bar.dart';
import 'package:ecommerce_test/presentation/widgets/home_page_widgets/tab_bar.dart';
import 'package:ecommerce_test/presentation/widgets/home_page_widgets/title_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../widgets/home_page_widgets/carousel_component.dart';
import 'cart_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: CustomScrollView(
          slivers: [
            const CustomSliverAppBar(),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  TitleRow(
                      title: 'Select Category',
                      buttonText: 'presentation all',
                      onPressed: (){}
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.12,
                    child: const CustomTabBar()
                  ),

                  addVerticalSpace(MediaQuery.of(context).size.height * 0.03),

                  const CustomTextField(
                    hintText: 'Search',
                  ),

                  TitleRow(
                      title: 'Hot Sales',
                      buttonText: 'see more',
                      onPressed: (){}
                  ),

                  FutureBuilder(
                    future: ApiClient().getHomePageInfo(),
                      builder: (context, AsyncSnapshot<Phone> snapshot){
                      if(snapshot.hasData){
                        return CarouselSlider(
                            items: snapshot.data!.homeStore.map((e) =>
                                CarouselComponent(
                                    image: e.picture,
                                    isProductNew: e.isNew,
                                    title: e.title,
                                    subTitle: e.subtitle
                                )
                            ).toList(),
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
                        if(snapshot.hasError){
                          return const SizedBox();
                        }
                        else {
                          return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: appOrange,
                            ),
                          ),
                        );
                        }
                      },

                  ),

                  TitleRow(
                      title: 'Best Seller',
                      buttonText: 'see more',
                      onPressed: (){}
                  ),
                ],
              ),
            ),

            FutureBuilder(
              future: ApiClient().getHomePageInfo(),
              builder: (context,AsyncSnapshot<Phone> snapshot){
                  if(snapshot.hasData){
                    return  SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                            (context,index) =>
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: MediaQuery.of(context).size.width * 0.02
                              ),
                              child: PhoneCard(
                                priceWithoutDiscount: snapshot.data!.bestSeller[index].priceWithoutDiscount,
                                discountPrice: snapshot.data!.bestSeller[index].discountPrice,
                                picture: snapshot.data!.bestSeller[index].picture,
                                title: snapshot.data!.bestSeller[index].title,
                                isFavorites: false,
                                loadingCard: false,
                              ),
                            ),
                        childCount: snapshot.data!.bestSeller.length,
                      ),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3/3.7,
                      ),
                    );
                  }
                  if(snapshot.hasError){
                    return SizedBox();
                    print(snapshot.error.toString());
                  }
                  else {
                    return  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                          (context,index) =>
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: MediaQuery.of(context).size.width * 0.02
                            ),
                            child: PhoneCard(
                              priceWithoutDiscount: 1,
                              discountPrice: 1,
                              picture: '',
                              title: '',
                              isFavorites: false,
                              loadingCard: true,
                            ),
                          ),
                      childCount: 4,
                    ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3/3.7,
                    ),
                  );
                  }
                }
              )
          ],
        ),

        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20)
            ),
            color: appBlue
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04
            ),
            child: GNav(

              backgroundColor: Colors.transparent,
              color: Colors.white,
              activeColor: Colors.white,

              tabs: [

                const GButton(
                  leading: ImageIcon(
                      AssetImage('assets/icons/home-2.png'),
                      color: Colors.white
                  ),
                  text: 'Explore',
                  icon: Icons.home,
                ),

                GButton(
                  onPressed: () => Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => const CartScreen()
                    )
                  ),
                  leading: FutureBuilder(
                    future: ApiClient().getBasket(),
                    builder: (context,AsyncSnapshot<Basket> snapshot) {
                      if(snapshot.hasData){
                        return Badge(
                          badgeContent: Text('${snapshot.data!.basket.length}'),
                          badgeColor: appOrange,
                          child: const ImageIcon(AssetImage('assets/icons/shopping-bag.png'),color: Colors.white,),
                        );
                      }
                      else{
                        return const ImageIcon(AssetImage('assets/icons/shopping-bag.png'),color: Colors.white,);
                      }
                    }
                  ),
                  icon: Icons.shopping_cart,
                ),

                const GButton(
                  icon: Icons.favorite_border,
                  text: 'Favorites',
                ),

                const GButton(
                  leading: ImageIcon(
                    AssetImage('assets/icons/user.png'),
                    color: Colors.white,
                  ),
                  text: 'Profile',
                  icon: Icons.person,
                )
              ],
            ),
          ),
        ),
      );
  }
}
