import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tasbeeh/bloc/dhikrs/dhikrs_bloc.dart';
import 'package:tasbeeh/data/repository/dhikr_repository.dart';

import 'bloc/counter/counter_bloc.dart';
import 'cubit/nav_bar/nav_bar_cubit.dart';
import 'view/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavBarCubit>(
          create: (context) => NavBarCubit(),
        ),
        BlocProvider<DhikrVisibleCubit>(
          create: (context) => DhikrVisibleCubit(),
        ),
        BlocProvider<CounterBloc>(create: (context) => CounterBloc()),
        BlocProvider<DhikrsBloc>(
          create: (context) => DhikrsBloc(
            RepositoryProvider.of<DhikrRepository>(context),
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
