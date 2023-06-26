import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';
import 'package:gojek_duplicate/app/router/navigation.dart';
import 'package:gojek_duplicate/data/network/firebase_api.dart';
import 'package:gojek_duplicate/features/presentation/pages/splash/splash_page.dart';
// import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        getPages: Navigation.appPages, home: const SplashPage());
  }
}
