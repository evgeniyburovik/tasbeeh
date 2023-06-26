import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/nav_bar/nav_bar_cubit.dart';
import '../widgets/widgets.dart';

class CostomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CostomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(4),
              height: 38,
              child: const Row(
                children: [
                  // Кнопки навигации
                  Expanded(
                    child: _ActivitiBottton(),
                  ),
                  Expanded(
                    child: _SavedBotton(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 30),
          CustomBotton(
            color: whiteColor,
            width: 54,
            height: 38,
            body: SvgPicture.asset('assets/icon/burger_menu.svg'),
            onTap: () {},
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}

class _SavedBotton extends StatelessWidget {
  const _SavedBotton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarCubit, NavBarInitial>(
      builder: (context, state) {
        return CustomBotton(
          color: state.savedColor,
          body: Text(
            'Saved',
            style: TextStyle(
              color: state.sevedTextColor,
              fontSize: 12,
            ),
          ),
          onTap: () {
            context.read<NavBarCubit>().tapSaved();
            context.read<DhikrVisibleCubit>().dhikrNotVisible();
          },
        );
      },
    );
  }
}

class _ActivitiBottton extends StatelessWidget {
  const _ActivitiBottton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarCubit, NavBarInitial>(
      builder: (context, state) {
        return CustomBotton(
          color: state.activityColor,
          body: Text(
            'Activiti',
            style: TextStyle(
              color: state.activityTextColor,
              fontSize: 12,
            ),
          ),
          onTap: () {
            context.read<NavBarCubit>().tapActiviti();
            context.read<DhikrVisibleCubit>().dhikrVisible();
          },
        );
      },
    );
  }
}
