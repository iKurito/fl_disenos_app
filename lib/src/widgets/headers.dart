import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff615AAB)
    );
  }
}

class HeaderBorderRedondeados extends StatelessWidget {
  const HeaderBorderRedondeados({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70), bottomRight: Radius.circular(70)),
        color: Color(0xff615AAB),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderDiagonalPainter()
      )
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    // Propiedades
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .stroke
    lapiz.strokeWidth = 5;

    final path = Path();

    // Dibujar con el path y el lapiz
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    // path.lineTo(0, size.height * 0.5);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderTriangular extends StatelessWidget {
  const HeaderTriangular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderTriangularPainter()
      )
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    // Propiedades
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .stroke
    lapiz.strokeWidth = 5;

    final path = Path();

    // Dibujar con el path y el lapiz
    path.moveTo(0, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPico extends StatelessWidget {
  const HeaderPico({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderPicoPainter()
      )
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    // Propiedades
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .stroke
    lapiz.strokeWidth = 20;

    final path = Path();

    // Dibujar con el path y el lapiz
    // path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.30);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderCurvoPainter()
      )
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    // Propiedades
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .stroke
    lapiz.strokeWidth = 20;

    final path = Path();

    // Dibujar con el path y el lapiz
    // path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.4, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWave extends StatelessWidget {
  const HeaderWave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderWavePainter()
      )
    );
  }
}

class _HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    // Propiedades
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .stroke
    lapiz.strokeWidth = 20;

    final path = Path();

    // Dibujar con el path y el lapiz
    // path.moveTo(0, 0);
    // path.lineTo(0, size.height * 0.25);
    // path.quadraticBezierTo(size.width * 0.25, size.height * 0.3, size.width * 0.5, size.height * 0.25);
    // path.quadraticBezierTo(size.width * 0.75, size.height * 0.2, size.width, size.height * 0.25);
    // path.lineTo(size.width, 0);

    path.moveTo(0, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.7, size.width * 0.5, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.8, size.width, size.height * 0.75);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWaveGradient extends StatelessWidget {
  const HeaderWaveGradient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderWaveGradientPainter()
      )
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(
      center: const Offset(0.0, 55.0),
      radius: 180
    );

    const Gradient gradiente = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color> [
        Color(0xff6D05E8),
        Color(0xffC012FF),
        Color(0xff6D05FA)
      ],
      stops: [
        0.0,
        0.5,
        1.0
      ]
    );

    final lapiz = Paint()..shader = gradiente.createShader(rect);
    // Propiedades
    // lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .stroke
    lapiz.strokeWidth = 20;

    final path = Path();

    // Dibujar con el path y el lapiz
    // path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.3, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.2, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    // path.moveTo(0, size.height * 0.75);
    // path.quadraticBezierTo(size.width * 0.25, size.height * 0.7, size.width * 0.5, size.height * 0.75);
    // path.quadraticBezierTo(size.width * 0.75, size.height * 0.8, size.width, size.height * 0.75);
    // path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}