import 'package:ecommerce_test/core/constants/colors.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final int rating;
  final String title;
  final String description;

  const ReviewCard(
      {Key? key,
      required this.rating,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.04),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '$rating',
                        style: const TextStyle(color: AppColors.white),
                      ),
                      const SizedBox(width: 3),
                      const Icon(
                        Icons.star,
                        size: 15,
                        color: AppColors.white,
                      ),
                    ],
                  )),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}
