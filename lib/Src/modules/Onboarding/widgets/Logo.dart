import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        
        child: SvgPicture.asset(
          height: 150,
        width: 160,
          'asset/image/Logo.png',
        ));
  }
}
