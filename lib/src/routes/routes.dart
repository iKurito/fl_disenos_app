import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:fl_disenos_app/src/pages/pages.dart';

final pageRoutes = <_Route> [
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', const SlideshowPage()),
  _Route(FontAwesomeIcons.truckMedical, 'Slideshow', const EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Encabezados', const HeadersPage()),
  _Route(FontAwesomeIcons.peopleCarryBox, 'Cuadrado Animado', const AnimacionesPage()),
  _Route(FontAwesomeIcons.circleNotch, 'Barra Progreso', const GraficasCircularesPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', const PinterestPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', const SliverListPage()),
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);
}