import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:team_5_examapp/core/constants/color_manager.dart';
import 'package:team_5_examapp/core/routing/routes_path.dart';
import 'package:team_5_examapp/features/subjects_portal/domain/models/subject_model.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({super.key, required this.subject});
  final SubjectModel subject;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Card(
        shadowColor: AppColors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ListTile(
          leading: Image.network(subject.icon),
          title: Text(subject.name),
          onTap: () {
            GoRouter.of(context).go(RoutesPath.getExamsRoute, extra: subject);
          },
        ),
      ),
    );
  }
}
