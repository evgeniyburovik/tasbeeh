import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tasbeeh/observer.dart';
import 'app.dart';

void main() {
  Bloc.observer = const AppBlocObserver();
  runApp(const MyApp());
}
