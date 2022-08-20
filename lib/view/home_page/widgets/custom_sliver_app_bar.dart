import 'package:ecommerce_test/core/constants/colors.dart';
import 'package:ecommerce_test/core/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatefulWidget {
  const CustomSliverAppBar({Key? key}) : super(key: key);

  @override
  State<CustomSliverAppBar> createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: appGrey,
      floating: true,
      elevation: 2,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.location_on),
          addHorizontalSpace(MediaQuery.of(context).size.width * 0.01),
          const Text('City')
        ],
      ),
      actions: [
        IconButton(
          onPressed: (){},
          icon: const Icon(Icons.sort),
          splashRadius: 20,
        )
      ],
    );
  }
}
