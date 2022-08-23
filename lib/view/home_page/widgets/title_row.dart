import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce_test/core/constants/colors.dart';
import 'package:flutter/material.dart';

class TitleRow extends StatelessWidget {

  final String title;
  final String buttonText;
  final VoidCallback onPressed;

  const TitleRow({Key? key, required this.title, required this.buttonText, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.01,
        horizontal: MediaQuery.of(context).size.width * 0.04
      ),
      child: Row(
        children: [
          Expanded(
            flex: 8,
              child: AutoSizeText(
                title,
                maxLines: 1,
                style: Theme.of(context).textTheme.headline1,
              )
          ),
          Expanded(
            flex: 2,
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
                ),
                onPressed: onPressed,
                child: AutoSizeText(
                    buttonText,
                    maxLines: 1,
                    textAlign: TextAlign.right,
                    style: const TextStyle(color: appOrange,fontSize: 15)
                ),
              )
          )
        ],
      ),
    );
  }
}
