import 'package:team_5_examapp/config/models/exam_model.dart';
import 'package:team_5_examapp/features/questions/data/models/answer_dto.dart';

class QuestionEntity {
  final String? id;
  final String? question;
  final List<AnswerDto>? answers;
  final String? type;
  final String? correct;
  final dynamic subject;
  final ExamModel? exam;
  bool? isAnswerd;
  AnswerDto? userAnswer;

  QuestionEntity(
    this.isAnswerd,
    this.userAnswer, {
    this.id,
    this.question,
    this.answers,
    this.type,
    this.correct,
    this.subject,
    this.exam,
  });

  QuestionEntity copyWith({
    bool? isAnswerd,
    AnswerDto? userAnswer,
    String? id,
    String? question,
    List<AnswerDto>? answers,
    String? type,
    String? correct,
    dynamic subject,
    ExamModel? exam,
  }) {
    return QuestionEntity(
      isAnswerd ?? this.isAnswerd,
      userAnswer ?? this.userAnswer,
      id: id ?? this.id,
      question: question ?? this.question,
      answers: answers ?? this.answers,
      type: type ?? this.type,
      correct: correct ?? this.correct,
      subject: subject ?? this.subject,
      exam: exam ?? this.exam,
    );
  }
}
