import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasbeeh/models/dhikr_model.dart';
import '../bloc/dhikrs/dhikrs_bloc.dart';
import '../widgets/widgets.dart';

class UpdateDhikrScreen extends StatelessWidget {
  final Dhikr dhikr;
  const UpdateDhikrScreen({super.key, required this.dhikr});

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerTitle = TextEditingController();
    return Scaffold(
        backgroundColor: backgroungColor,
        appBar: AppBar(
          backgroundColor: deepBlueButtonColor,
          title: const Text('Update Dhikr'),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: BlocBuilder<DhikrsBloc, DhikrsState>(
                builder: (context, state) {
                  return BlocListener<DhikrsBloc, DhikrsState>(
                    listener: (context, state) {
                      if (state is DhikrsLoaded) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          duration: Duration(seconds: 1),
                          content: Center(
                            child: Text(
                              '✓ Update Dhikr',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          backgroundColor: blueButtonColor,
                        ));
                      }
                    },
                    child: Column(
                      children: [
                        _stateField('Dhikrs', dhikr.count),
                        SizedBox(height: 10),
                        _stateField('Date  ', dhikr.date),
                        SizedBox(height: 20),
                        _inputField('Описание', controllerTitle),
                        const SizedBox(height: 40),
                        CustomBotton(
                            height: 45,
                            color: deepBlueButtonColor,
                            body: const Text(
                              'Update',
                              style: TextStyle(color: whiteColor),
                            ),
                            onTap: () {
                              print(state);
                              context.read<DhikrsBloc>().add(
                                    UpdateDhikr(
                                      dhikr: dhikr.copyWith(
                                          title: controllerTitle.value.text),
                                    ),
                                  );
                              print(state);
                              Navigator.pop(context);
                            })
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}

Column _inputField(
  String field,
  TextEditingController controller,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '$field: ',
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      Container(
        height: 50,
        margin: const EdgeInsets.only(bottom: 10),
        width: double.infinity,
        child: TextFormField(
          autofocus: true,
          controller: controller,
        ),
      )
    ],
  );
}

Row _stateField(
  String field,
  String value,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        '$field → ',
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      SizedBox(width: 5),
      Text(value,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
    ],
  );
}
