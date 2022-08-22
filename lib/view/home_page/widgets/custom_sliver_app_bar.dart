import 'package:ecommerce_test/core/constants/colors.dart';
import 'package:ecommerce_test/core/utils/utils.dart';
import 'package:ecommerce_test/view/widgets/n_icon.dart';
import 'package:ecommerce_test/view/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

import 'filter_dropdown_element.dart';

class CustomSliverAppBar extends StatefulWidget {
  const CustomSliverAppBar({Key? key}) : super(key: key);

  @override
  State<CustomSliverAppBar> createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {

  List<String> firstList = ['Samsung','Iphone','Sony'];
  List<String> secondList = ['300-500','500-1000'];
  List<String> thirdList = ['4.5 to 5.5 inches'];

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: appGrey,
      pinned: true,
      elevation: 2,
      centerTitle: true,
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
          onPressed: (){
            showModalBottomSheet(
              barrierColor: Colors.transparent,
                context: context,
                builder: (context) => BottomSheetContent(context,firstList,secondList,thirdList)
            );
          },
          icon: const NIcon(
            icon: 'assets/icons/sort.png',
            color: appOrange,
            size: 20,
          ),
          splashRadius: 20,
        ),
        addHorizontalSpace(MediaQuery.of(context).size.width * 0.02)
      ],
    );
  }
}

Widget BottomSheetContent(BuildContext context,List<Object> firstList,List<Object> secondList,List<Object> thirdList){
  return Container(
    height: MediaQuery.of(context).size.height * 0.5,
    padding: EdgeInsets.symmetric(
      vertical: MediaQuery.of(context).size.height * 0.025,
      horizontal: MediaQuery.of(context).size.width * 0.06
    ),

    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      ),
      boxShadow: [
        BoxShadow(
          blurRadius: 10,
          color: Colors.black26
        )
      ]
    ),

    child: Column(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconButton(
              color: appBlue,
                onPressed: () => Navigator.pop(context),
                icon: const NIcon(
                  icon: 'assets/icons/close.png',
                )
            ),
            Text('Filter Options',style: Theme.of(context).textTheme.headline2),

            CustomIconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Text('Done',style: TextStyle(color: Colors.white)
                )
            ),
          ],
        ),

        addVerticalSpace(MediaQuery.of(context).size.height * 0.03),

        FilterDropdowmElement(
          title: 'Brand',
          dropDownList: ['Samsung','Iphone','Sony'],
          dropDownValue: 'Samsung',
        ),
        FilterDropdowmElement(
          title: 'Price',
          dropDownList: secondList,
          dropDownValue: secondList[0],
        ),
        FilterDropdowmElement(
          title: 'Size',
          dropDownList: thirdList,
          dropDownValue: thirdList[0],
        ),
      ],
    ),
  );
}