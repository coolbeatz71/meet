import 'package:flutter/material.dart';

class HeaderItem {
  final String title;
  final int index;
  final bool isButton;

  HeaderItem({
    required this.title,
    required this.index,
    this.isButton = false,
  });
}
