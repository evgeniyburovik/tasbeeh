import 'package:flutter/material.dart';
import 'widgets.dart';

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
              child: Row(
                children: [
                  // Кнопки навигации
                  Expanded(
                    child: CustomBotton(
                      color: deepBlueButtonColor,
                      body: Text(
                        'Activiti',
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: 12,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: CustomBotton(
                      color: whiteColor,
                      body: Text(
                        'Saved',
                        style: TextStyle(
                          color: greyTextColor,
                          fontSize: 12,
                        ),
                      ),
                      onTap: () {},
                    ),
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
