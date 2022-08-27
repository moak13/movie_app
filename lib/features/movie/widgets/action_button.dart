import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  const ActionButton({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onTap,
      icon: Icon(icon),
      label: Text(title),
    );
  }
}
