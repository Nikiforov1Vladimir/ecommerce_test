import 'package:ecommerce_test/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTheme{

  static ThemeData lightTheme = ThemeData(

    scaffoldBackgroundColor: appGrey,

    fontFamily: 'Mark-Pro',

    tabBarTheme:  TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
      unselectedLabelStyle: const TextStyle(
        color: appBlue,
        fontSize: 12,
        fontWeight: FontWeight.w400
      ),
      unselectedLabelColor: Colors.grey,
      labelStyle: const TextStyle(
        color: appBlue,
        fontWeight: FontWeight.bold,
        fontSize: 12
      ),
      labelColor: appOrange,
      indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(
              color: Colors.transparent
          )
      ),
      splashFactory: NoSplash.splashFactory,
      overlayColor: MaterialStateProperty.resolveWith((states) => Colors.transparent),
    ),

    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: appBlue,
        fontSize: 18,
        fontWeight: FontWeight.w600
      ),
      iconTheme: IconThemeData(
        color: appOrange,
      )
    ),

    textButtonTheme:  TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateColor.resolveWith((states) => Colors.black.withOpacity(0.05)),
      )
    ),

    textTheme: const TextTheme(

      headline1: TextStyle(
        color: appBlue,
        fontSize: 25,
        fontWeight: FontWeight.bold
      ),
      headline2: TextStyle(
        color: appBlue,
        fontSize: 20,
        fontWeight: FontWeight.w600
      ),
      headline3: TextStyle(
          color: appBlue,
          fontSize: 24,
          fontWeight: FontWeight.w600
      ),
      headline4: TextStyle(
        color: appBlue,
        fontSize: 16,
        fontWeight: FontWeight.w600
      ),

      //bold bodyText for buttons
      button: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white
      ),

      bodyText1: TextStyle(
        color: Colors.white,
        fontSize: 15
      ),

      //bold
      bodyText2: TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.bold
      )

    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: appOrange
      ),
      selectedLabelStyle: TextStyle(
        color: appOrange
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.white
      ),

    )

  );

  static ThemeData darkTheme = ThemeData(



  );

}