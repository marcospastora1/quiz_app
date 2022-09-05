import 'package:json_annotation/json_annotation.dart';

part 'question.data.g.dart';

@JsonSerializable()
class QuestionData {
  final String question;
  final String answer1;
  final String answer2;

  const QuestionData({
    required this.question,
    required this.answer1,
    required this.answer2,
  });

  factory QuestionData.fromJson(Map<String, dynamic> json) =>
      _$QuestionDataFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionDataToJson(this);
}
