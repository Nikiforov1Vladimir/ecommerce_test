import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_test/ui/widgets/network_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SalesListView extends StatelessWidget {

  final salesList;

  const SalesListView({Key? key, this.salesList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: 16
          ),
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          separatorBuilder: (context,index)=> const SizedBox(
            width: 10,
          ),
          itemBuilder: (context,index) => SalesItem(
            image: 'https://www.adweek.com/wp-content/uploads/files/2016_Mar/iphone-se-hed-2016.png',
          )
      ),
    );
  }
}

class SalesItem extends StatelessWidget {

  final String image;

  const SalesItem({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(
            image,
          )
        )
      ),
    );
  }
}

