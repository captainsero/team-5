import 'package:flutter/material.dart';
import 'package:team_5_examapp/generated/l10n.dart';

Widget buildPasswordBox(BuildContext context) {
  String maskedPassword =
      S.of(context).star * 8; // Display 8 asterisks for masked password
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.black26),
    ),
    child: Row(
      children: [
        Expanded(
          child: Text(
            maskedPassword,
            style: const TextStyle(
              fontSize: 18,
              letterSpacing: 2.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            /* Navigate to password change screen */
          },
          child: Text(S.of(context).change),
        ),
      ],
    ),
  );
}
