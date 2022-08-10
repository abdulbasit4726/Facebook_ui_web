import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final VoidCallback onPressed;

  CircleButton({
    required this.onPressed,
    required this.icon,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        splashRadius: iconSize,
        onPressed: onPressed,
        icon: Icon(icon),
        iconSize: iconSize,
        color: Colors.black,
      ),
    );
  }
}
