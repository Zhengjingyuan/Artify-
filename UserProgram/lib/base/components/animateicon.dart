import 'package:flutter/material.dart';

class AnimatedIconContainer extends StatelessWidget {
  final IconData iconData;
  final String label;
  final VoidCallback? onPressed;
  AnimatedIconContainer({
    required this.iconData,
    required this.label,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: InkResponse(
        highlightShape: BoxShape.circle,
        splashColor: Colors.blue.withOpacity(0.5),
        radius: 24.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: Colors.white.withOpacity(0.7),
            ),
            SizedBox(height: 4.0),
            Text(
              label,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}