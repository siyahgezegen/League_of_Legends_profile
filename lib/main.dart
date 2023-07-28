// ignore_for_file: library_prefixes,depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_lol_profile/pages/mainpage/main_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

Future main() async {
  await DotEnv.dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: Theme.of(context).iconTheme,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          toolbarTextStyle: Theme.of(context).textTheme.bodySmall,
          titleTextStyle: Theme.of(context).textTheme.bodySmall,
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: const MainPage(),
    );
  }
}
