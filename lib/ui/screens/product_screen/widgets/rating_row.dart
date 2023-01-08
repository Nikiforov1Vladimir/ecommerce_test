import 'package:ecommerce_test/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingRow extends StatelessWidget {

  final double? rating;

  const RatingRow({Key? key, this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '$rating',
              style: const TextStyle(
                color: AppColors.white
              ),
            )
        ),
        const SizedBox(width: 5),
        RatingBar.builder(
          onRatingUpdate: (rating){},
          allowHalfRating: true,
          itemSize: 20,
          maxRating: 5,
          initialRating: rating ?? 0,
          itemBuilder: (context,index) => Icon(
            Icons.star,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
