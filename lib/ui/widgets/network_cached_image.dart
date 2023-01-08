import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppCachedNetworkImage extends StatelessWidget {

  final String imageUrl;

  const AppCachedNetworkImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.fitHeight,
      placeholder: (context,url) => const Center(
          child: CircularProgressIndicator(
            color: Colors.deepPurpleAccent,
          )
      ),
    );
  }
}
