import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'package:tasbeeh/data/repository/dhikr_repository.dart';

import 'package:tasbeeh/observer.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );

  runApp(RepositoryProvider(
    create: (context) => DhikrRepository(),
    child: const MyApp(),
  ));

  Bloc.observer = const AppBlocObserver();
}
