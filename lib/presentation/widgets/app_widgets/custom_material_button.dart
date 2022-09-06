import 'package:ecommerce_test/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {

  final VoidCallback onPressed;
  final Widget? child;
  final Color? color;
  final double? verticalPadding;

  const CustomMaterialButton({Key? key,required this.onPressed, this.child, this.color, this.verticalPadding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,

      color: color ?? appOrange,
      
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding ?? MediaQuery.of(context).size.height * 0.01,
        horizontal: MediaQuery.of(context).size.width * 0.02
      ),

      child: child,
    );
  }
}
