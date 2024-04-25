import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakertude/models/cart.dart';
import 'package:sneakertude/pages/into_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const IntroPage(),
        theme: ThemeData(
            dividerTheme: const DividerThemeData(color: Colors.transparent)),
      ),
    );
  }
}
