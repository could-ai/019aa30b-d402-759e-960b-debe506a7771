import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double size;

  const LogoWidget({super.key, this.size = 50});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [Color(0xFF6C63FF), Color(0xFF03DAC6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6C63FF).withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.rocket_launch,
          color: Colors.white,
          size: size * 0.6,
        ),
      ),
    );
  }
}
