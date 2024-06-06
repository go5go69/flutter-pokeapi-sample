import 'package:flutter/material.dart';
import 'package:poke_match/constants/app_sizes.dart';

class AppIconButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final void Function()? onTap;
  const AppIconButton({
    super.key,
    required this.color,
    required this.icon,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(Sizes.p32),
      onTap: onTap,
      child: Container(
        height: Sizes.p64,
        width: Sizes.p64,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: color),
        ),
        child: Icon(
          icon,
          size: Sizes.p32,
          color: color,
        ),
      ),
    );
  }
}
