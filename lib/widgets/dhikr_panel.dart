import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_bloc.dart';
import 'widgets.dart';

class DhikrPanel extends StatelessWidget {
  final String text;
  final void Function()? onTapIncrement;
  final void Function()? onTapReset;
  final void Function()? nTapDecrement;

  const DhikrPanel({
    super.key,
    required this.text,
    required this.onTapIncrement,
    required this.onTapReset,
    required this.nTapDecrement,
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
            onTap: nTapDecrement,
          ),
          const SizedBox(width: 31),
          // Количество dhikl
          CustomBotton(
            color: deepBlueButtonColor,
            width: 154,
            height: 154,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
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
            onTap: onTapIncrement,
          ),
          const SizedBox(width: 31),
          // Кнопка инкремента
          CustomBotton(
            color: blueButtonColor,
            height: 35,
            width: 35,
            body: SvgPicture.asset('assets/icon/increment.svg'),
            onTap: onTapReset,
          ),
        ],
      ),
    );
  }
}
