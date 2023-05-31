import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasbeeh/components/constants.dart';

class DhikrTile extends StatelessWidget {
  final String sumDhikr;
  final String nameDhikr;
  final String dateDhikr;

  const DhikrTile({
    super.key,
    required this.sumDhikr,
    required this.nameDhikr,
    required this.dateDhikr,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: backgroungColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            sumDhikr,
            style: TextStyle(
              color: deepBlueButtonColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            nameDhikr,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            dateDhikr,
            style: TextStyle(
              color: greyTextColor,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          SvgPicture.asset('assets/icon/more.svg'),
        ],
      ),
    );
  }
}
