import 'package:ecommerce_test/ui/widgets/app_smooth_page_indicator.dart';
import 'package:ecommerce_test/ui/widgets/network_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliverAppBarBackground extends StatelessWidget {

  final List<String> images;

  SliverAppBarBackground({Key? key, required this.images}) : super(key: key);

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: images.map((e) => AppCachedNetworkImage(imageUrl: e)).toList(),
          ),
          Align(
            alignment: const Alignment(0,0.95),
            child: AppSmoothPageIndicator(
              pageController: _pageController,
              dotCount: images.length,
            ),
          ),
        ],
      ),
    );
  }
}

//AppCachedNetworkImage(
//         imageUrl: image,
//       )