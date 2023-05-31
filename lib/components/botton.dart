import 'package:flutter/material.dart';

class Botton extends StatelessWidget {
  final height;
  final width;
  final Color color;
  final Widget iconBody;

  const Botton({
    super.key,
    this.width,
    this.height,
    required this.color,
    required this.iconBody,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('hello');
      },
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: iconBody,
      ),
    );
  }
}
