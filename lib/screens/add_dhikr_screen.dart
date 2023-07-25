import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter/counter_bloc.dart';
import '../bloc/dhikrs/dhikrs_bloc.dart';
import '../data/models/dhikr_model.dart';
import '../widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class AddDhikrScreen extends StatelessWidget {
  const AddDhikrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerTitle = TextEditingController();
    return Scaffold(
      backgroundColor: backgroungColor,
      appBar: AppBar(
        backgroundColor: deepBlueButtonColor,
        title: const Text('Add Dhikr'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: BlocBuilder<CounterBloc, int>(
              builder: (context, state) {
                return BlocListener<DhikrsBloc, DhikrsState>(
                  listener: (context, state) {
                    if (state is DhikrsLoaded) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 1),
                          content: Center(
                            child: Text(
                              '+Dhikr!',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          backgroundColor: blueButtonColor,
                        ),
                      );
                    }
                  },
                  child: Column(
                    children: [
                      _stateField('Dhikrs', state.toString()),
                      const SizedBox(height: 10),
                      _stateField('Date  ',
                          DateFormat('dd.MM.yyyy').format(DateTime.now())),
                      const SizedBox(height: 20),
                      _inputField('Description', controllerTitle),
                      const SizedBox(height: 40),
                      CustomBotton(
                          height: 45,
                          color: deepBlueButtonColor,
                          body: const Text(
                            'Save',
                            style: TextStyle(color: whiteColor),
                          ),
                          onTap: () {
                            context.read<DhikrsBloc>().add(
                                  AddDhikr(controllerTitle.value.text, state),
                                );
                            context
                                .read<CounterBloc>()
                                .add(CounterResetPressed());
                            Navigator.pop(context);
                          })
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
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
      ),
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
