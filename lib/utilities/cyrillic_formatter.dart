import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CyrillicInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    RegExp regex = RegExp(r'^[а-яА-ЯёЁ\s]*$');
    if (regex.hasMatch(newValue.text)) {
      return newValue;
    }
    return oldValue;
  }
}

String formattedPrice(int price) {
  final formatter = NumberFormat('#,###', 'ru_RU');
  return formatter.format(price);
}
