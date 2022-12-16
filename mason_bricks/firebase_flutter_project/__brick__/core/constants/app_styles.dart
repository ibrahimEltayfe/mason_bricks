import 'package:flutter/material.dart';
import 'app_colors.dart';


TextStyle _getTextStyle(double fontSize, Color color,String fontFamily,FontWeight? fontWeight,TextDecoration? textDecoration){
  return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      decoration: textDecoration
  );
}

TextStyle getRegularTextStyle({
  double fontSize = 16,
  Color color = Colors.black,
  String fontFamily = 'sen',
  FontWeight? fontWeight,
  TextDecoration? textDecoration,
}) {
  return _getTextStyle(fontSize,color,fontFamily,fontWeight,textDecoration);
}

TextStyle getBoldTextStyle({
  double fontSize = 18,
  Color color = Colors.black,
  String fontFamily = 'sen',
  FontWeight fontWeight = FontWeight.bold,
  TextDecoration? textDecoration
}) {
  return _getTextStyle(fontSize,color,fontFamily,fontWeight,textDecoration);
}
