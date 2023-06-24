part of 'nav_bar_cubit.dart';

@immutable
abstract class NavBarState {}

class NavBarInitial extends NavBarState {
  final Color savedColor;
  final Color activityColor;
  final Color sevedTextColor;
  final Color activityTextColor;

  NavBarInitial({
    required this.savedColor,
    required this.activityColor,
    required this.activityTextColor,
    required this.sevedTextColor,
  });
}

class DhikrVisibleInitial extends NavBarState {
  final bool dhikrVisibility;

  DhikrVisibleInitial(this.dhikrVisibility);
}
