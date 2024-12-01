import 'package:flutter/material.dart';

class PageData {
  final String title; 
  final String description; 
  final String? imagePath; 
  final Color bgColor; 
  final Color textColor;

  const PageData({
    required this.title, 
    required this.description, 
    this.imagePath,
    this.bgColor = Colors.white,
    this.textColor = Colors.black,
  });
}
