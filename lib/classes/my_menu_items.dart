import 'package:flutter/material.dart';

class MyMenuItems {

  final String text;
  final IconData icon;

  const MyMenuItems({required this.text, required this.icon});

  static const saveMenuItem = MyMenuItems(text: "Save", icon: Icons.save_rounded);
  static const shareMenuItem = MyMenuItems(text: "Share", icon: Icons.share_rounded);

}

