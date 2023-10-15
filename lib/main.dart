import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:my_lol_profile/pages/mainpage/main_page.dart';

void main() async {
  await dotenv.load(fileName: ".env");
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
          toolbarTextStyle: Theme.of(context).textTheme.bodyMedium,
          titleTextStyle: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: const MainPage(),
    );
  }
}
