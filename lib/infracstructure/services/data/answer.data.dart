import 'package:json_annotation/json_annotation.dart';

part 'answer.data.g.dart';

@JsonSerializable()
class AnswerData {
  final String resposta;
  final bool verdadeira;

  const AnswerData({required this.resposta, required this.verdadeira});

  factory AnswerData.fromJson(Map<String, dynamic> json) =>
      _$AnswerDataFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerDataToJson(this);
}
