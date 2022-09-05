import 'package:json_annotation/json_annotation.dart';
import 'package:quiz_app/infracstructure/services/data/question.data.dart';

part 'get_questions.response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetQuestionsResponse {
  final List<QuestionData> questions;

  const GetQuestionsResponse({required this.questions});

  factory GetQuestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetQuestionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetQuestionsResponseToJson(this);
}
