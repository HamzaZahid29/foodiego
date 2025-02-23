
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Destination {
  const Destination({required this.label, required this.icon});

  final String label;
  final IconData icon;
}

final destinations = [
  Destination(label: 'Home', icon: CupertinoIcons.home),
  Destination(label: 'Search', icon: CupertinoIcons.search),
  Destination(label: 'Orders', icon: CupertinoIcons.cart),
  Destination(label: 'Profile', icon: CupertinoIcons.profile_circled),
];
