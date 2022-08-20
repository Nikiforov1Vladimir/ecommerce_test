import 'package:ecommerce_test/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final IconData? icon;

  const CustomTextField({Key? key, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04
        ),
        child: TextField(
          decoration: TextFieldDecoration(icon ?? Icons.search),
        ),
      );
  }
}

InputDecoration TextFieldDecoration(IconData icon){
  return InputDecoration(
    filled: true,
    fillColor: Colors.white,
    prefixIcon: Icon(icon),
    iconColor: appOrange,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20)
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
        color: Colors.transparent
      )
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
            color: Colors.transparent
        )
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
        color: Colors.redAccent
      )
    )
  );
}
