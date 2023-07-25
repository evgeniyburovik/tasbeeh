import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasbeeh/bloc/dhikrs/dhikrs_bloc.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DhikrsBloc, DhikrsState>(
      builder: (context, state) {
        if (state is DhikrsLoaded) {
          return Scaffold(
              body: Center(
            child: Text(state.dhikrs[3].id),
          ));
        } else {
          return Text('Что-то пошло не так');
        }
      },
    );
  }
}
