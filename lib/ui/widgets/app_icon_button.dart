import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIconButton extends StatelessWidget {

  final String icon;

  const AppIconButton({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      width: 25,
      child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: (){},
          icon: SvgPicture.asset(
              icon,
          ),
      ),
    );
  }
}
