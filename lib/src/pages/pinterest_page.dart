import 'package:fl_disenos_app/src/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fl_disenos_app/src/widgets/widgets.dart';

class PinterestPage extends StatelessWidget {
   
  const PinterestPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: const [
            PinterestGrid(),
            _PinterestMenuLocation()
          ],
        )
        // body: PinterestMenu(),
      ),
    );
    // return const Scaffold(
    //   body: SingleChildScrollView(
    //     child: SafeArea(
    //       child: PinterestGrid()
    //     ),
    //   ),
    // );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  const _PinterestMenuLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthPantalla = MediaQuery.of(context).size.width;
    final mostrar = Provider.of<_MenuModel>(context).mostrar;
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    if (widthPantalla > 500) {
      widthPantalla = widthPantalla - 300;
    }

    return Positioned(
      bottom: 30,
      child: SizedBox(
        width: widthPantalla,
        child: Row(
          children: [
            const Spacer(),
            PinterestMenu(
              mostrar: mostrar,
              backgroundColor: appTheme!.scaffoldBackgroundColor,
              activeColor: appTheme.colorScheme.secondary,
              items: <PinterestButton> [
                PinterestButton(icon: Icons.pie_chart, onPressed: () {}),
                PinterestButton(icon: Icons.search, onPressed: () {}),
                PinterestButton(icon: Icons.notifications, onPressed: () {}),
                PinterestButton(icon: Icons.supervised_user_circle, onPressed: () {}),
              ],
            ),
            const Spacer(),
          ],
        )
      )
    );
  }
}

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({Key? key}) : super(key: key);

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  ScrollController controller = ScrollController();
  double scrollAnterior = 0.0;
  
  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > scrollAnterior && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }
      scrollAnterior = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<int> items = List.generate(200, (index) => index);
    int count;
    if (MediaQuery.of(context).size.width > 500) {
      count = 3;
    } else {
      count = 2;
    }

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      controller: controller,
      child: SafeArea(
        child: StaggeredGrid.count(
          crossAxisCount: count,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,      
          children: items.map(
            (item) => StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: item.isEven ? 1 : 2,          
              child: _PinterestItem(index: item)
            )
          ).toList()
        ),
      ),
    );
  }
}

class _PinterestItem extends StatelessWidget {
  const _PinterestItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(30))
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        )
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => _mostrar;

  set mostrar(bool valor) {
    _mostrar = valor;
    notifyListeners();
  }
}