import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/dhikrs/dhikrs_bloc.dart';
import '../cubit/nav_bar/nav_bar_cubit.dart';
import '../screens/add_dhikr_screen.dart';
import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CostomAppBar(),
      backgroundColor: backgroungColor,
      body: BlocBuilder<DhikrVisibleCubit, DhikrVisibleInitial>(
        builder: (context, state) {
          return SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 13, 15, 0),
              child: Column(
                children: [
                  // Dhikr панель
                  Visibility(
                    visible: state.dhikrVisibility,
                    child: const DhikrPanel(),
                  ),
                  state.dhikrVisibility
                      ? const SizedBox(height: 20)
                      : const SizedBox(height: 0),
                  // Кнопка сохранения dhikr
                  Visibility(
                    visible: state.dhikrVisibility,
                    child: const _DhikrSaveBotton(),
                  ),
                  state.dhikrVisibility
                      ? const SizedBox(height: 20)
                      : const SizedBox(height: 0),

                  // список сохраненных dhikr
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(21, 21, 21, 0),
                      decoration: const BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(10), bottom: Radius.zero),
                      ),
                      child: const Center(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text('Last saved dhikrs'),
                              ],
                            ),
                            Divider(
                              height: 7,
                              thickness: 2,
                              endIndent: 268,
                              color: deepBlueButtonColor,
                            ),
                            SizedBox(height: 21),
                            // listViev of saved dhikr
                            _ListViev(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ListViev extends StatelessWidget {
  const _ListViev({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DhikrsBloc, DhikrsState>(
      builder: (context, state) {
        if (state is DhikrsLoding) {
          return const CircularProgressIndicator();
        }
        if (state is DhikrsLoaded) {
          return Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.dhikrs.length,
              itemBuilder: (BuildContext context, int index) {
                index = (state.dhikrs.length - 1) - index;
                return DhikrTile(
                  dhikr: state.dhikrs[index],
                  sumDhikr: state.dhikrs[index].count,
                  nameDhikr: state.dhikrs[index].title ?? '',
                  dateDhikr: state.dhikrs[index].date,
                );
              },
            ),
          );
        } else {
          return Text('Что-то пошло не по плану');
        }
      },
    );
  }
}

class _DhikrSaveBotton extends StatelessWidget {
  const _DhikrSaveBotton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBotton(
      color: whiteColor,
      body: const Text(
        'Save dhikr',
        style: TextStyle(
          color: deepBlueButtonColor,
          fontSize: 14,
        ),
      ),
      height: 45,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddDhikrScreen()),
        );
      },
    );
  }
}
