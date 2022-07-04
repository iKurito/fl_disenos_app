import 'package:fl_disenos_app/src/models/layout_model.dart';
import 'package:fl_disenos_app/src/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:fl_disenos_app/src/pages/pages.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider<LayoutModel>(create: (_) => LayoutModel()),
      ChangeNotifierProvider<ThemeChanger>(create: (_) => ThemeChanger(2)),
    ],
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
      home: OrientationBuilder(
        builder: (BuildContext context, __) {
          final screenSize = MediaQuery.of(context).size;

          if (screenSize.width > 500) {
            return const LauncherTabletPage();
          } else {
            return const LauncherPage();
          }
        }
      )
    );
  }
}