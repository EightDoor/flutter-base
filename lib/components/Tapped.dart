import 'package:flutter/material.dart';

/// 点击tap
class Tapped extends StatelessWidget {
  final Widget child;
  final Function onTap;
  Tapped({required this.child, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        this.onTap();
      },
      child: child,
    );
  }
}
