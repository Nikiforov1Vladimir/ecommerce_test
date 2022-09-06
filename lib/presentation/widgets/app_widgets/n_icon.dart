import 'package:flutter/material.dart';

class NIcon extends StatelessWidget {

  final String icon;
  final double? size;
  final Color? color;

  const NIcon({Key? key, required this.icon, this.size, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return ImageIcon(
        AssetImage(icon),
        size: size ?? 15,
        color: color ?? Colors.white,
      );
  }
}
