import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'bloc/counter_bloc.dart';
import 'cubit/nav_bar/nav_bar_cubit.dart';
import 'pages/home_page.dart';

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
          create: (BuildContext context) => CounterBloc(),
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
