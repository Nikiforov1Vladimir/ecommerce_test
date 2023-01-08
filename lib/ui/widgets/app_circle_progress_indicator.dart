import 'package:flutter/material.dart';

class AppCircleProgressIndicator extends StatelessWidget {
  const AppCircleProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).colorScheme.secondary,
        strokeWidth: 4,
      ),
    );
  }
}
