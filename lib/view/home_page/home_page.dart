import 'package:badges/badges.dart';
import 'package:ecommerce_test/core/constants/colors.dart';
import 'package:ecommerce_test/core/utils/utils.dart';
import 'package:ecommerce_test/view/cart_screen/cart_screen.dart';
import 'package:ecommerce_test/view/home_page/widgets/custom_sliver_app_bar.dart';
import 'package:ecommerce_test/view/home_page/widgets/tab_bar.dart';
import 'package:ecommerce_test/view/home_page/widgets/title_row.dart';
import 'package:ecommerce_test/view/widgets/custom_text_field.dart';
import 'package:ecommerce_test/view/widgets/phone_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'widgets/app_carousel.dart';

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
                      buttonText: 'view all',
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

                  const AppCarousel(),

                  TitleRow(
                      title: 'Best Seller',
                      buttonText: 'see more',
                      onPressed: (){}
                  ),
                ],
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                    (context,index) =>
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.02
                      ),
                      child: PhoneCard(index: index),
                    ),
                childCount: 6,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3/3.7,
              ),
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
                GButton(
                  icon: Icons.home,
                  text: 'Explore',
                ),

                GButton(
                  onPressed: () => Get.to(()=>const CartScreen()),
                  leading: Badge(
                    badgeContent: const Text('3'),
                      child: const ImageIcon(
                          AssetImage('assets/icons/shopping-bag.png'),
                          color: Colors.white
                      )
                  ),
                  icon: Icons.shopping_cart,
                ),

                GButton(
                  icon: Icons.favorite_border,
                  text: 'Favorites',
                ),

                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                )
              ],
            ),
          ),
        ),
      );
  }
}
