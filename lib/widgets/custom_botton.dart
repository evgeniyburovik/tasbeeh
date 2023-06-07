import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {
  final double? height;
  final double? width;
  final Color color;
  final Widget body;

  const CustomBotton({
    super.key,
    this.width,
    this.height,
    required this.color,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: color,
        child: InkWell(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            height: height,
            width: width,
            child: body,
          ),
        ),
      ),
    );
  }
}
