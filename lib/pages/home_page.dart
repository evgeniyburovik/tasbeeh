import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/botton.dart';
import '../components/constants.dart';
import '../components/dhikrtile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroungColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: Column(
          children: [
            // Панель навигации
            Row(
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
                          child: Botton(
                            color: deepBlueButtonColor,
                            iconBody: Text(
                              'Activiti',
                              style: TextStyle(
                                color: whiteColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Botton(
                            color: whiteColor,
                            iconBody: Text(
                              'Saved',
                              style: TextStyle(
                                color: greyTextColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Кнопка меню
                const SizedBox(width: 20),
                Botton(
                  height: 38.0,
                  width: 54.0,
                  color: Colors.white,
                  iconBody: SvgPicture.asset('assets/icon/burger_menu.svg'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Dhikr панель
            Container(
              height: 202,
              padding: EdgeInsets.all(32),
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Кнопка декремента
                  Botton(
                    color: blueButtonColor,
                    height: 35.0,
                    width: 35.0,
                    iconBody: SvgPicture.asset('assets/icon/decrement.svg'),
                  ),
                  SizedBox(width: 31),
                  // Количество dhikl
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: deepBlueButtonColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '33',
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
                          ]),
                    ),
                  ),
                  SizedBox(width: 31),
                  // Кнопка инкремента
                  Botton(
                    color: blueButtonColor,
                    height: 35.0,
                    width: 35.0,
                    iconBody: SvgPicture.asset('assets/icon/increment.svg'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Кнопка сохранения dhikr
            Botton(
              color: whiteColor,
              iconBody: Text(
                'Save dhikr',
                style: TextStyle(
                  color: deepBlueButtonColor,
                  fontSize: 14,
                ),
              ),
              height: 45.0,
            ),
            const SizedBox(height: 20),
            // список сохраненных dhikr
            Expanded(
              child: Container(
                padding: EdgeInsets.all(21),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10), bottom: Radius.zero),
                ),
                child: Center(
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
                      Expanded(
                        child: ListView(
                          children: [
                            DhikrTile(
                                sumDhikr: '14',
                                nameDhikr: 'Hello dddfdff',
                                dateDhikr: '14/34/56'),
                            DhikrTile(
                                sumDhikr: '9',
                                nameDhikr: 'Hellodf  fffff',
                                dateDhikr: '14/34/56'),
                            DhikrTile(
                                sumDhikr: '15',
                                nameDhikr: 'Hello fdfdfd',
                                dateDhikr: '14/34/56'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
