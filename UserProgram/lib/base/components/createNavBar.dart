import 'package:flutter/material.dart';

class CreateNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;
  CreateNavBar({required this.selectedIndex, required this.onTabSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              onTabSelected(0);
            },
            child: Text(
              "孵化大厅",
              style: TextStyle(
                fontSize: 18,
                color: selectedIndex == 0 ? Color(0xFFD9AAFF) : Colors.white,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              onTabSelected(1);
            },
            child: Text(
              "创作台",
              style: TextStyle(
                fontSize: 18,
                color: selectedIndex == 1 ? Color(0xFFD9AAFF) : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}