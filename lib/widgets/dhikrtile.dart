import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sizer/sizer.dart';
import 'package:tasbeeh/screens/update_dhikr_screen.dart';

import '../bloc/dhikrs/dhikrs_bloc.dart';
import '../models/dhikr_model.dart';
import 'widgets.dart';

class DhikrTile extends StatelessWidget {
  final String sumDhikr;
  final String nameDhikr;
  final String dateDhikr;
  final Dhikr dhikr;

  const DhikrTile({
    super.key,
    required this.sumDhikr,
    required this.nameDhikr,
    required this.dateDhikr,
    required this.dhikr,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) =>
                  context.read<DhikrsBloc>().add(DeleteDhikr(dhikr: dhikr)),
              icon: Icons.delete,
              backgroundColor: const Color.fromARGB(255, 247, 69, 87),
              borderRadius: BorderRadius.circular(100),
            ),
          ],
        ),
        child: Container(
          height: 49,
          //margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: backgroungColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 12.w,
                child: Center(
                  child: Text(
                    sumDhikr,
                    style: const TextStyle(
                      color: deepBlueButtonColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const VerticalDivider(
                thickness: 1,
                indent: 10,
                endIndent: 10,
                color: whiteColor,
              ),
              SizedBox(
                width: 30.w,
                child: Text(
                  nameDhikr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                dateDhikr,
                style: const TextStyle(
                  color: greyTextColor,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomBotton(
                width: 10.w,
                color: Colors.transparent,
                body: SvgPicture.asset('assets/icon/more.svg'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UpdateDhikrScreen(dhikr: dhikr)),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
