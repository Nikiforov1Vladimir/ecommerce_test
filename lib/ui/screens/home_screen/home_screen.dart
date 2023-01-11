import 'package:carousel_slider/carousel_controller.dart';
import 'package:ecommerce_test/core/constants/colors.dart';
import 'package:ecommerce_test/ui/screens/home_screen/widgets/sales_list_view.dart';
import 'package:ecommerce_test/ui/widgets/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final CarouselController _salesCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.green, // <-- SEE HERE
              statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
              statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
            ),
            toolbarHeight: 80,
            expandedHeight: 150,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.none,
              background: SafeArea(
                child: Container(
                  color: const Color(0xffF6F6F6),
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 16
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'М.видео',
                          style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: Colors.red
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              titlePadding: EdgeInsets.zero,
              expandedTitleScale: 1,
              title: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  color: Theme.of(context).colorScheme.background,
                ),
                height: 80,
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: const Center(
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.orange,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.transparent
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                        ),
                      )
                    ),
                  ),
                ),
              ),
              ),
            ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
              SalesListView(),
                SalesListView(),
                SalesListView(),
                SalesListView(),
                SalesListView(),
                SalesListView(),
                SalesListView(),

              ],
            ),
          )
        ],
      ),
    );
  }
}
