// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_questions.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetQuestionsResponse _$GetQuestionsResponseFromJson(
        Map<String, dynamic> json) =>
    GetQuestionsResponse(
      questions: (json['questions'] as List<dynamic>)
          .map((e) => QuestionData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetQuestionsResponseToJson(
        GetQuestionsResponse instance) =>
    <String, dynamic>{
      'questions': instance.questions.map((e) => e.toJson()).toList(),
    };
