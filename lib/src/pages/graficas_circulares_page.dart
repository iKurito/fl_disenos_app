import 'package:fl_disenos_app/src/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:fl_disenos_app/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({Key? key}) : super(key: key);

  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            porcentaje += 10;
            if (porcentaje > 100) {
              porcentaje = 0;
            }
          });
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.blue),
              CustomRadialProgress(porcentaje: porcentaje * 1.2, color: Colors.red)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(porcentaje: porcentaje * 1.4, color: Colors.pink),
              CustomRadialProgress(porcentaje: porcentaje * 1.6, color: Colors.purple)
            ],
          )
        ],
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress({
    Key? key,
    required this.porcentaje,
    required this.color
  }) : super(key: key);

  final double porcentaje;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    
    return SizedBox(
      width: 180,
      height: 180,
      // color: Colors.red,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: color,
        coloSecundario: appTheme!.textTheme.bodyText1!.color!,
        grosorPrimario: 10,
        grosorSecundario: 4

      )
    );
  }
}