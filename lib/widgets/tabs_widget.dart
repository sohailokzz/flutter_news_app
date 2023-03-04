import 'package:flutter/material.dart';

class TabsWidget extends StatelessWidget {
  final String label;
  final Function function;
  final double fontSize;
  final Color color;
  const TabsWidget({
    super.key,
    required this.label,
    required this.function,
    required this.fontSize,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
