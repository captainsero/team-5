import 'package:flutter/material.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: AppPadding.p20),
          child: Text("Exam Score"),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppPadding.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(alignment: Alignment.centerLeft, child: Text("Your Score")),

            SizedBox(height: AppSize.s100),

            Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom().copyWith(
                  backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.onPrimary,
                  ),

                  side: WidgetStatePropertyAll(
                    BorderSide(color: Theme.of(context).colorScheme.primary),
                  ),
                  foregroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
                child: Text("Show results"),
              ),
            ),

            SizedBox(height: AppSize.s20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Start again"),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
