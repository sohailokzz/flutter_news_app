import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function onTap;
  const DrawerListTile({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
