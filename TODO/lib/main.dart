import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import '../services/theme_services.dart';
import '../ui/pages/home_page.dart';
import '../db/db_helper.dart';
import '../ui/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.ligth,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,
      title: 'TODO',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}