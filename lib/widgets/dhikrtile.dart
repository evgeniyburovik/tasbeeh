import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tasbeeh/widgets/widgets.dart';

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
          SizedBox(
            width: 12.w,
            child: Center(
              child: Text(
                sumDhikr,
                style: TextStyle(
                  color: deepBlueButtonColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          VerticalDivider(
            thickness: 1,
            indent: 10,
            endIndent: 10,
            color: whiteColor,
          ),
          SizedBox(
            width: 30.w,
            child: Text(
              nameDhikr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
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
          CustomBotton(
            width: 10.w,
            color: Colors.transparent,
            body: SvgPicture.asset('assets/icon/more.svg'),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
