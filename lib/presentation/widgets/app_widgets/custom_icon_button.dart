import 'package:ecommerce_test/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AppMaterialIconButton extends StatelessWidget {
  
  final VoidCallback onPressed;
  final Color? color;
  final Widget icon;

  const AppMaterialIconButton({Key? key, required this.onPressed, this.color, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      
      minWidth: 45,
      height: 45,
      
      padding: const EdgeInsets.all(0),
      onPressed: onPressed,

      elevation: 0,
      color: color ?? appOrange,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),

      child: icon,
    );
  }
}
