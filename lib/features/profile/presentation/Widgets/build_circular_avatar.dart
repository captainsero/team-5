import 'package:flutter/material.dart';

Widget buildAvatar(ThemeData theme) {
  return Center(
    child: Stack(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundColor: Color(0xFFECECEC),
          child: Icon(Icons.person, size: 52, color: Colors.black54),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              color: theme.primaryColor,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            padding: const EdgeInsets.all(8),
            child: const Icon(Icons.camera_alt, size: 18, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
