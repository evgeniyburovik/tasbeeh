import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
      print(counter);
    });
  }

  void decrement() {
    if (counter > 0) {
      setState(() {
        counter--;
      });
    }
  }

  void reset() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CostomAppBar(),
      backgroundColor: backgroungColor,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 13, 15, 0),
          child: Column(
            children: [
              // Dhikr панель
              DhikrPanel(
                text: counter.toString(),
                onTapIncrement: increment,
                onTapReset: reset,
                nTapDecrement: decrement,
              ),
              const SizedBox(height: 20),
              // Кнопка сохранения dhikr
              CustomBotton(
                color: whiteColor,
                body: const Text(
                  'Save dhikr',
                  style: TextStyle(
                    color: deepBlueButtonColor,
                    fontSize: 14,
                  ),
                ),
                height: 45,
                onTap: () {},
              ),
              const SizedBox(height: 20),
              // список сохраненных dhikr
              Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(21, 21, 21, 0),
                  decoration: const BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10), bottom: Radius.zero),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Text('Last saved dhikrs'),
                          ],
                        ),
                        const Divider(
                          height: 7,
                          thickness: 2,
                          endIndent: 268,
                          color: deepBlueButtonColor,
                        ),
                        const SizedBox(height: 21),
                        // listViev of saved dhikr
                        Expanded(
                          child: ListView(
                            children: [
                              DhikrTile(
                                  sumDhikr: '1434',
                                  nameDhikr:
                                      'Hello dddfdff dfdfdfdf f dfdfdfdfd dfdfdfdfdf  dfdfdfd',
                                  dateDhikr: '14/34/56'),
                              DhikrTile(
                                  sumDhikr: '9',
                                  nameDhikr: 'Hellodf  fffff',
                                  dateDhikr: '14/34/56'),
                              DhikrTile(
                                  sumDhikr: '152',
                                  nameDhikr: 'Hello fdfdfd',
                                  dateDhikr: '14/34/56'),
                              DhikrTile(
                                  sumDhikr: '1',
                                  nameDhikr: 'Hello fdfdfd',
                                  dateDhikr: '14/34/56'),
                              DhikrTile(
                                  sumDhikr: '15',
                                  nameDhikr: 'Hello fdfdfd',
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
        ),
      ),
    );
  }
}
