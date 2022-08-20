import 'package:ecommerce_test/core/constants/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBlue,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            const CircleAvatar(
              backgroundColor: appOrange,
              radius: 60,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.3
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.08,
                child: const FittedBox(
                  child: Text(
                    'Ecommerce \nConcept',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
