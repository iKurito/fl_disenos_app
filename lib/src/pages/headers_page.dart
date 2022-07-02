import 'package:flutter/material.dart';

import 'package:fl_disenos_app/src/widgets/headers.dart';

class HeadersPage extends StatelessWidget {
   
  const HeadersPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HeaderWaveGradient()
    );
  }
}