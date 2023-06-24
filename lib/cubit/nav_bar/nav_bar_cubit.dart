import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../config/constants.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarInitial> {
  NavBarCubit()
      : super(NavBarInitial(
          savedColor: whiteColor,
          activityColor: deepBlueButtonColor,
          sevedTextColor: greyTextColor,
          activityTextColor: whiteColor,
        ));

  void tapSaved() {
    emit(NavBarInitial(
      savedColor: deepBlueButtonColor,
      activityColor: whiteColor,
      sevedTextColor: whiteColor,
      activityTextColor: greyTextColor,
    ));
  }

  void tapActiviti() {
    emit(NavBarInitial(
      savedColor: whiteColor,
      activityColor: deepBlueButtonColor,
      sevedTextColor: greyTextColor,
      activityTextColor: whiteColor,
    ));
  }
}

class DhikrVisibleCubit extends Cubit<DhikrVisibleInitial> {
  DhikrVisibleCubit() : super(DhikrVisibleInitial(true));

  void dhikrVisible() {
    emit(DhikrVisibleInitial(true));
  }

  void dhikrNotVisible() {
    emit(DhikrVisibleInitial(false));
  }
}
