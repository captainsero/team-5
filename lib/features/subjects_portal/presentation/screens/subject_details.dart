import 'package:flutter/material.dart';

class SubjectDetails extends StatelessWidget {
  const SubjectDetails({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Subject Details Screen')));
  }
}
