import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_test/core/constants/colors.dart';
import 'package:ecommerce_test/core/utils/utils.dart';
import 'package:ecommerce_test/view/cart_screen/cart_screen.dart';
import 'package:ecommerce_test/view/details_screen/details_screen.dart';
import 'package:ecommerce_test/view/home_page/widgets/carousel_component.dart';
import 'package:ecommerce_test/view/home_page/widgets/custom_sliver_app_bar.dart';
import 'package:ecommerce_test/view/home_page/widgets/title_row.dart';
import 'package:ecommerce_test/view/widgets/custom_text_field.dart';
import 'package:ecommerce_test/view/widgets/phone_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'widgets/app_carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomSliverAppBar(),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  TitleRow(
                      title: 'Select Category',
                      buttonText: 'view all',
                      onPressed: ()

                      // НЕ ЗАБЫТЬ УДАЛИТЬ

                      => Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>CartScreen()))
                  ),

                  CustomTextField(
                    hintText: 'Search',
                  ),

                  TitleRow(
                      title: 'Hot Sales',
                      buttonText: 'see more',
                      onPressed: (){}
                  ),

                  AppCarousel(),

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
          height: MediaQuery.of(context).size.height * 0.12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: appBlue
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04
            ),
            child: const GNav(

              backgroundColor: Colors.transparent,
              color: Colors.white,
              activeColor: Colors.white,

              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),

                GButton(
                  icon: Icons.shopping_cart,
                  text: 'Cart',
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
