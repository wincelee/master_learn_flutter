import 'package:flutter/material.dart';

class MenuItem {

  final String text;
  final IconData icon;

  const MenuItem({required this.text, required this.icon});

  static const saveMenuItem = MenuItem(text: "Save", icon: Icons.save_rounded);
  static const shareMenuItem = MenuItem(text: "Share", icon: Icons.share_rounded);

}
