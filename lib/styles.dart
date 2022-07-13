import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class AppStyles {


  ///
  /// Colors
  ///
  ///
  /// RGB 43, 80, 161
  static const Color mainColor = Color(0xff2B50A1);

  //static const Color mainColor = Color(0xff0bb494);

  /// RGB 56, 58, 81
  static const Color mainColorDark = Color(0xff383a51);

  /// RGB 51, 196, 168
  static const Color secondaryColor = Color(0xff33C4A8);

  /// RGB 51, 196, 168
  static const Color scaffoldColor = Color(0xfff8f8f8);
  // static const Color scaffoldColor = Colors.blue;

  static const Color infoHeaderColor = Color.fromRGBO(40, 52, 74, 0.7);
  ///
  /// Text
  ///

  static const Color mainTextColor = Color(0xff172030);

  static const TextStyle headerTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 26,
    color: mainColorDark
  );

  static const TextStyle keyTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: mainColorDark
  );

  /// header textstyle with 18 font size
  static const TextStyle headerTextStyleLess = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: mainColorDark
  );

 static const TextStyle infoTextStyleHeader = TextStyle(
    fontSize: 16,
    color: infoHeaderColor
 );

  static const TextStyle infoTextStyleHeaderBlue = TextStyle(
    fontSize: 18,
    color: mainColor
 );

  static const TextStyle infoTextStyleHeaderRed = TextStyle(
    fontSize: 18,
    color: Colors.red
 );


  static const TextStyle buttonTextColor = TextStyle(
    fontSize: 14,
    color: scaffoldColor
  );

  static TextStyle labelTextStyle = TextStyle(
    fontSize: 18,
    color: Colors.grey.withOpacity(0.6)
  );


  static const TextStyle infoTextStyle = TextStyle(
    fontSize: 12,
    color: mainColorDark
  );


  ///
  /// Inputs
  ///

  static InputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: mainColor.withOpacity(0.2)
    )
  );

  static InputBorder inputBorderUnderline = UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppStyles.mainColor.withOpacity(0.1)
    )
  );

  static TextStyle inputLabelStyle = TextStyle(
    color: mainColorDark.withOpacity(0.5)
  );

  static TextStyle inputLabelUnderlineStyle = TextStyle(
    fontSize: 18,
    color: AppStyles.mainColorDark.withOpacity(0.6),
  );

  // static TextStyle inputHintStyle = TextStyle(
  //   color: Color(0xff9D9D9F)
  //   // color: Color(0xff383A51)
  // );

  static double inputIconSize = 24;

  static const Color inputIconColor = Color(0xff9D9D9F);

  
}