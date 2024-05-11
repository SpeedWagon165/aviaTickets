import 'package:flutter/cupertino.dart';

Map<int, String> imageMap = {
  1: 'assets/images/Die_antwoors.png',
  2: 'assets/images/socrat-i-lera.png',
  3: 'assets/images/lampabi.png',
};

Widget getImageWidget({
  required int? id,
  required double width,
  required double height,
}) {
  String imagePath = imageMap[id] ??
      'assets/images/lampabi.png'; // Fallback на изображение по умолчанию

  return ClipRRect(
    borderRadius: BorderRadius.circular(30),
    child: Image.asset(
      imagePath,
      height: height,
      width: width,
    ),
  );
}
