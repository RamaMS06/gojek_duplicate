import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:gojek_duplicate/app/router/navigation.dart';
import 'package:gojek_duplicate/features/presentation/blocs/bloc/home_bloc.dart';

import '../../features/presentation/pages/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        getPages: Navigation.appPages,
        home: BlocProvider(
          create: (context) => HomeBloc(),
          child: const MyHomePage(),
        ));
  }
}
