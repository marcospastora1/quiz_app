// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionData _$QuestionDataFromJson(Map<String, dynamic> json) => QuestionData(
      question: json['question'] as String,
      answer1: json['answer1'] as String,
      answer2: json['answer2'] as String,
    );

Map<String, dynamic> _$QuestionDataToJson(QuestionData instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answer1': instance.answer1,
      'answer2': instance.answer2,
    };
