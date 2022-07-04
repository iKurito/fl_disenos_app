import 'package:fl_disenos_app/src/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:fl_disenos_app/src/pages/pages.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (_) => ThemeChanger(1),
    child: const MyApp()
  )
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: const LauncherPage()
    );
  }
}