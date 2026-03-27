class ExamModel {
  final String id;
  final String title;
  final int duration;
  final int numberOfQuestions;
  final String subject;
  final bool active;
  final DateTime createdAt;

  ExamModel({
    required this.id,
    required this.title,
    required this.duration,
    required this.numberOfQuestions,
    required this.subject,
    required this.active,
    required this.createdAt,
  });
}