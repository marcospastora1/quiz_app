import 'package:json_annotation/json_annotation.dart';
import 'package:quiz_app/infracstructure/services/data/answer.data.dart';

part 'question.data.g.dart';

@JsonSerializable()
class QuestionData {
  final String question;
  final List<AnswerData> answers;

  const QuestionData({required this.answers, required this.question});

  factory QuestionData.fromJson(Map<String, dynamic> json) =>
      _$QuestionDataFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionDataToJson(this);
}
