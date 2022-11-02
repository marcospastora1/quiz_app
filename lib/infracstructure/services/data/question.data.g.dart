// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionData _$QuestionDataFromJson(Map<String, dynamic> json) => QuestionData(
      answers: (json['answers'] as List<dynamic>)
          .map((e) => AnswerData.fromJson(e as Map<String, dynamic>))
          .toList(),
      question: json['question'] as String,
    );

Map<String, dynamic> _$QuestionDataToJson(QuestionData instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answers': instance.answers,
    };
