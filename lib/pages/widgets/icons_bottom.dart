import 'package:flutter/material.dart';

class IconsBottom extends StatelessWidget {
  final IconData icon;
  final double opacity;
  const IconsBottom({Key key, this.icon, this.opacity}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Icon(icon,
        color: Theme.of(context).secondaryHeaderColor.withOpacity(opacity));
  }
}
