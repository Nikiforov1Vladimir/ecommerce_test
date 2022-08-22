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
      isScrollable: true,
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
            child: Icon(Icons.phone,color: currentTab == 0 ? Colors.white : Colors.grey),
          ),
          text: 'Phones',
        ),
        Tab(
          height: tabBarHeight,
          icon: CircleAvatar(
            radius: 35,
            backgroundColor: currentTab == 1 ? appOrange : Colors.white,
            child: Icon(Icons.computer,color: currentTab == 1 ? Colors.white : Colors.grey),
          ),
          text: 'Computer',
        ),
        Tab(
          height: tabBarHeight,
          icon: CircleAvatar(
            radius: 35,
            backgroundColor: currentTab == 2 ? appOrange : Colors.white,
            child: Icon(Icons.phone,color: currentTab == 2 ? Colors.white : Colors.grey),
          ),
          text: 'Phone',

        ),
        Tab(
          height: tabBarHeight,
          icon: CircleAvatar(
            radius: 35,
            backgroundColor: currentTab == 3 ? appOrange : Colors.white,
            child: Icon(Icons.phone,color: currentTab == 3 ? Colors.white : Colors.grey),
          ),
          text: 'Health',
        ),
        Tab(
          height: tabBarHeight,
          icon: CircleAvatar(
            radius: 35,
            backgroundColor: currentTab == 4 ? appOrange : Colors.white,
            child: Icon(Icons.phone,color: currentTab == 4 ? Colors.white : Colors.grey),
          ),
          text: 'Health',
        )
      ],
    );
  }
}
