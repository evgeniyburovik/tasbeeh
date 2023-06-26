import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tasbeeh/bloc/dhikrs/dhikrs_bloc.dart';
import 'package:uuid/uuid.dart';

import 'bloc/counter/counter_bloc.dart';
import 'cubit/nav_bar/nav_bar_cubit.dart';
import 'models/dhikr_model.dart';
import 'view/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavBarCubit>(
          create: (BuildContext context) => NavBarCubit(),
        ),
        BlocProvider<DhikrVisibleCubit>(
          create: (BuildContext context) => DhikrVisibleCubit(),
        ),
        BlocProvider<CounterBloc>(
            create: (BuildContext context) => CounterBloc()),
        BlocProvider<DhikrsBloc>(
          create: (BuildContext context) => DhikrsBloc()
            ..add(
              LoadDhikrs(
                dhikrs: [
                  Dhikr(
                    id: '1',
                    count: '234',
                    title: 'Какое-то описание но не понимаю какое',
                    date: '23/06/2023',
                  ),
                  Dhikr(
                    id: '2',
                    count: '23',
                    title: 'Какое-то описание но не понимаю какое',
                    date: '23/06/2023',
                  ),
                ],
              ),
            ),
        ),
      ],
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Tasbeeh',
          theme: ThemeData(
            fontFamily: 'Gilroy',
          ),
          home: const HomePage(),
        );
      }),
    );
  }
}
