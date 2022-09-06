import 'package:ecommerce_test/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {

  const CustomTabBar({Key? key}) : super(key: key);

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> with TickerProviderStateMixin{

  int currentTab = 0;
  late TabController _tabController;
  double tabBarHeight = 120;
  double iconSize = 30;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(

      indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(
              color: Colors.transparent
          )
      ),

      unselectedLabelStyle: const TextStyle(
          color: appBlue,
          fontSize: 12,
          fontWeight: FontWeight.w500
      ),
      unselectedLabelColor: appBlue,
      labelStyle: const TextStyle(
          color: appBlue,
          fontWeight: FontWeight.w500,
          fontSize: 12
      ),
      labelColor: appOrange,

      isScrollable: true,
      physics: const BouncingScrollPhysics(),
      controller: _tabController,
      onTap: (index) {
        setState(() {
          currentTab = index;
        });
      },
      tabs: [
        Tab(
          height: tabBarHeight,
          icon: CircleAvatar(
            radius: 35,
            backgroundColor: currentTab == 0 ? appOrange : Colors.white,
            child: ImageIcon(
              const AssetImage('assets/icons/smartphone.png'),
              color: currentTab == 0 ? Colors.white : Colors.grey,
              size: iconSize,
            ),
          ),
          text: 'Phones',
        ),
        Tab(
          height: tabBarHeight,
          icon: CircleAvatar(
            radius: 35,
            backgroundColor: currentTab == 1 ? appOrange : Colors.white,
            child: Icon(
                Icons.computer,
                color: currentTab == 1 ? Colors.white : Colors.grey,
              size: iconSize,
            ),
          ),
          text: 'Computer',
        ),

        Tab(
          height: tabBarHeight,
          icon: CircleAvatar(
            radius: 35,
            backgroundColor: currentTab == 2 ? appOrange : Colors.white,
            child: ImageIcon(
              const AssetImage('assets/icons/heart.png'),
              color: currentTab == 2 ? Colors.white : Colors.grey,
              size: iconSize,
            ),
          ),
          text: 'Health',
        ),

        Tab(
          height: tabBarHeight,
          icon: CircleAvatar(
            radius: 35,
            backgroundColor: currentTab == 3 ? appOrange : Colors.white,
            child: ImageIcon(
              const AssetImage('assets/icons/book.png'),
              color: currentTab == 3 ? Colors.white : Colors.grey,
              size: iconSize,
            ),
          ),
          text: 'Books',
        ),

        Tab(
          height: tabBarHeight,
          icon: CircleAvatar(
            radius: 35,
            backgroundColor: currentTab == 4 ? appOrange : Colors.white,
            child: ImageIcon(
              const AssetImage('assets/icons/wrench.png'),
              color: currentTab == 4 ? Colors.white : Colors.grey,
              size: iconSize,
            ),
          ),
          text: 'Tools',
        )
      ],
    );
  }
}
