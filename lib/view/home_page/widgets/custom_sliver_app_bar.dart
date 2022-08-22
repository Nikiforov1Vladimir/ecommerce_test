import 'package:ecommerce_test/core/constants/colors.dart';
import 'package:ecommerce_test/core/utils/utils.dart';
import 'package:ecommerce_test/view/widgets/NIcon.dart';
import 'package:ecommerce_test/view/widgets/custom_icon_button.dart';
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
                builder: (context) => BottomSheetContent(context)
            );
          },
          iconSize: 20,
          icon: NIcon('assets/icons/sort.png'),
          splashRadius: 20,
        ),
        addHorizontalSpace(MediaQuery.of(context).size.width * 0.02)
      ],
    );
  }
}

Widget BottomSheetContent(BuildContext context){
  return Container(
    height: MediaQuery.of(context).size.height * 0.41,
    padding: EdgeInsets.symmetric(
      vertical: MediaQuery.of(context).size.height * 0.025,
      horizontal: MediaQuery.of(context).size.width * 0.08
    ),

    decoration: BoxDecoration(
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
          children: [
            CustomIconButton(
                onPressed: (){},
                icon: const Icon(Icons.cancel)
            )
          ],
        )


      ],
    ),

  );
}