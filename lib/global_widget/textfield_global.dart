import 'package:flutter/cupertino.dart';

Text textoutfit({String? text, double? fontSize, required Color color, maxLine, textAlign, overflow,fontWeight,textDecoration}) {
  return Text(
    text!,
    style: TextStyle(
        fontSize: fontSize, color: color, fontWeight: fontWeight,decoration: textDecoration,fontFamily:'poppins' ),
    textAlign: textAlign,
    overflow:overflow ,
    maxLines: maxLine,
  );
}