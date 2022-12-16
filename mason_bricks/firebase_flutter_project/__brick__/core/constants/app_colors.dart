import 'package:flutter/material.dart';

class AppColors{
  static const Color backgroundColor = Color(0xff{{backgroundColor}});

  static const Color primaryColor = Color(0xff{{primaryColor}});

  {{#addGrey}}
  static const Color lightGrey = Color(0xFFECECEC);
  static const Color grey =Color(0xffBDBFC1);//878787
  static const Color darkGrey = Color(0xFF474747);
  {{/addGrey}}

  static const Color white = Colors.white;
  static const Color black = Color(0xFF313131);

  {{#addRed}}
  static const Color darkRed = Color(0xFFAC0000);
  static const Color lightRed = Color(0xFFff8886);
  {{/addRed}}
}