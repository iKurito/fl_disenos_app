import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  const Slideshow({
    Key? key,
    required this.slides,
    this.puntosArriba = false, 
    this.colorPrimario = Colors.blue, 
    this.colorSecundario = Colors.grey,
    this.bulletPrimario = 12,
    this.bulletSecundario = 12
  }) : super(key: key);

  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<_SlideshowModel>(context).colorPrimario = colorPrimario;
              Provider.of<_SlideshowModel>(context).colorSecundario = colorSecundario;
              Provider.of<_SlideshowModel>(context).bulletPrimario = bulletPrimario;
              Provider.of<_SlideshowModel>(context).bulletSecundario = bulletSecundario;
              return _CrearEstucturaSlideshow(puntosArriba: puntosArriba, slides: slides);
            },
          )
        ),
      ),
    );
  }
}

class _CrearEstucturaSlideshow extends StatelessWidget {
  const _CrearEstucturaSlideshow({
    Key? key,
    required this.puntosArriba,
    required this.slides,
  }) : super(key: key);

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      if (puntosArriba)
        _Dots(
          size: slides.length,
        ),
      Expanded(
        child: _Slides(slides: slides)
      ),
      if (!puntosArriba)
        _Dots(
          size: slides.length,
        ),
    ],
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({
    Key? key, 
    required this.size,
  }) : super(key: key);

  final int size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          size, (index) => _Dot(
            index: index
          )
        ),
      )
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SlideshowModel>(context);
    double tamano = 0;
    Color color;

    if (ssModel.currentPage >= index - 0.5 && ssModel.currentPage < index + 0.5) {
      tamano = ssModel.bulletPrimario;
      color = ssModel.colorPrimario;
    } else {
      tamano = ssModel.bulletSecundario;
      color = ssModel.colorSecundario;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: tamano,
      height: tamano,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  const _Slides({
    Key? key, 
    required this.slides
  }) : super(key: key);

  final List<Widget> slides;

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage = pageViewController.page!;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        physics: const BouncingScrollPhysics(),
        // children: const <Widget> [
        //   _Slide(svg: 'assets/svgs/slide-1.svg'),
        //   _Slide(svg: 'assets/svgs/slide-2.svg'),
        //   _Slide(svg: 'assets/svgs/slide-3.svg'),
        // ],
        children: widget.slides.map((slide) => _Slide(slide: slide)).toList(),
      )
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    Key? key,
    required this.slide
  }) : super(key: key);

  final Widget slide;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: slide
    );
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;
  double _bulletPrimario = 12;
  double _bulletSecundario = 12;

  double get currentPage => _currentPage;
  
  set currentPage(double value) {
    _currentPage = value;
    notifyListeners();
  }

  Color get colorPrimario => _colorPrimario;

  set colorPrimario(Color color) {
    _colorPrimario = color;
  }

  Color get colorSecundario => _colorSecundario;

  set colorSecundario(Color color) {
    _colorSecundario = color;
  }

  double get bulletPrimario => _bulletPrimario;

  set bulletPrimario(double bullet) {
    _bulletPrimario = bullet;
  }

  double get bulletSecundario => _bulletSecundario;

  set bulletSecundario(double bullet) {
    _bulletSecundario = bullet;
  }
}