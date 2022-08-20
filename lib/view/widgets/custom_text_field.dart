import 'package:ecommerce_test/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final IconData? icon;
  final String hintText;

  const CustomTextField({Key? key, this.icon, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: MediaQuery.of(context).size.height * 0.05,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04
        ),
        child: TextField(

          cursorColor: appOrange,
          decoration: TextFieldDecoration(icon ?? Icons.search,hintText),
        ),
      );
  }
}

InputDecoration TextFieldDecoration(IconData icon,String hintText){
  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(
      fontSize: 12,
      color: Colors.black54
    ),
    prefixIconColor: appOrange,
    filled: true,
    fillColor: Colors.white,
    prefixIcon: Icon(icon,color: appOrange,),
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
