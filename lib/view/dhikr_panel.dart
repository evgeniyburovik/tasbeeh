import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter/counter_bloc.dart';
import '../widgets/widgets.dart';

class DhikrPanel extends StatelessWidget {
  const DhikrPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, int>(
      builder: (context, state) {
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
                onTap: () {
                  context.read<CounterBloc>().add(CounterDecrementPressed());
                },
              ),
              const SizedBox(width: 31),
              // Кнопка инкремента
              CustomBotton(
                color: deepBlueButtonColor,
                width: 154,
                height: 154,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.toString(),
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
                onTap: () {
                  context.read<CounterBloc>().add(CounterIncrementPressed());
                },
              ),
              const SizedBox(width: 31),
              // Кнопка сброса
              CustomBotton(
                color: blueButtonColor,
                height: 35,
                width: 35,
                body: SvgPicture.asset('assets/icon/increment.svg'),
                onTap: () {
                  context.read<CounterBloc>().add(CounterResetPressed());
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
