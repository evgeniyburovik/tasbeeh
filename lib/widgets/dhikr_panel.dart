import 'package:flutter/material.dart';

import 'widgets.dart';

class DhikrPanel extends StatelessWidget {
  const DhikrPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Кнопка декремента
          CustomBotton(
            color: blueButtonColor,
            height: 35,
            width: 35,
            body: SvgPicture.asset('assets/icon/decrement.svg'),
          ),
          const SizedBox(width: 31),
          // Количество dhikl
          const CustomBotton(
            color: deepBlueButtonColor,
            width: 154,
            height: 154,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '33',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Dhikr',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 31),
          // Кнопка инкремента
          CustomBotton(
            color: blueButtonColor,
            height: 35,
            width: 35,
            body: SvgPicture.asset('assets/icon/increment.svg'),
          ),
        ],
      ),
    );
  }
}
