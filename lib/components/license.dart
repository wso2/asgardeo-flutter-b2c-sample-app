import 'package:flutter/material.dart';

import '../constants/strings.dart';

class License extends StatelessWidget{
  final double gap;
  const License(this.gap, {super.key});

  @override
  Widget build(BuildContext context) {

    return  Column(
      children: [
        SizedBox(height: gap),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Text(Strings.license),
        ),
      ],
    );
  }

}
