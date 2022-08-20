import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_test/core/utils/utils.dart';
import 'package:ecommerce_test/view/home_page/widgets/carousel_component.dart';
import 'package:ecommerce_test/view/home_page/widgets/custom_sliver_app_bar.dart';
import 'package:ecommerce_test/view/home_page/widgets/title_row.dart';
import 'package:ecommerce_test/view/widgets/custom_text_field.dart';
import 'package:ecommerce_test/view/widgets/phone_card.dart';
import 'package:flutter/material.dart';

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
                      onPressed: (){}
                  ),

                  CustomTextField(),

                  TitleRow(
                      title: 'Hot Sales',
                      buttonText: 'see more',
                      onPressed: (){}
                  ),

                  CarouselSlider(
                      items: [
                        CarouselComponent(
                          image: 'assets/images/test_carousel_image.jpeg',
                        ),
                        CarouselComponent(
                          image: 'assets/images/test_carousel_image.jpeg',
                        )
                      ],
                      options: CarouselOptions(
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 30),
                        autoPlayAnimationDuration: const Duration(seconds: 1),
                      )
                  ),

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
                      child: const PhoneCard(),
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
      );
  }
}
