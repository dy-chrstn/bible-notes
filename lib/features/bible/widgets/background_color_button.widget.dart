import 'package:flutter/material.dart';

class BackgroundColorButtonWidget extends StatelessWidget {
  const BackgroundColorButtonWidget({
    super.key,
    required this.color,
    required this.tooltip,
    required this.onTapButton,
  });

  final Color color;
  final String tooltip;
  final VoidCallback onTapButton;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
        padding: const EdgeInsets.all(4), // Optional space between icon and border
        decoration: BoxDecoration(
          color: Colors.black54, // Optional background color
          shape: BoxShape.circle, // Can be BoxShape.rectangle
          border: Border.all(
            color: Colors.white, // Border color
            width: 2.0, // Border thickness
          ),
        ),
        child: Icon(
          Icons.circle,
          color: color,
        ),
      ),
      tooltip: tooltip,
      onPressed: onTapButton,
    );
  }
}
