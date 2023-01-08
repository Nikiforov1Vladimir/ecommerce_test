import 'package:ecommerce_test/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AppSmoothPageIndicator extends StatelessWidget {

  final PageController pageController;
  final int dotCount;

  const AppSmoothPageIndicator({Key? key, required this.pageController, required this.dotCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(dotCount <= 1){
      return SizedBox();
    } {
      return SmoothPageIndicator(
        controller: pageController,
        count: dotCount,
        effect: CustomizableEffect(
            dotDecoration: DotDecoration(
                borderRadius: BorderRadius.circular(20),
                width: 15,
                height: 6,
                color: AppColors.grey
            ),
            activeDotDecoration: DotDecoration(
                borderRadius: BorderRadius.circular(20),
                width: 30,
                height: 6,
                color: Theme.of(context).colorScheme.secondary
            )
        ),
        onDotClicked: (index){
          pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut
          );
        },
      );
    }
  }
}
