class ResultModel {
  final String id;
  final String title;
  final String subject;
  final int duration;
  final int questions;
  final int correctAnswers;
  final int timeTaken;

  ResultModel({
    required this.id,
    required this.title,
    required this.subject,
    required this.duration,
    required this.questions,
    required this.correctAnswers,
    required this.timeTaken,
  });
}