// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerData _$AnswerDataFromJson(Map<String, dynamic> json) => AnswerData(
      resposta: json['resposta'] as String,
      verdadeira: json['verdadeira'] as bool,
    );

Map<String, dynamic> _$AnswerDataToJson(AnswerData instance) =>
    <String, dynamic>{
      'resposta': instance.resposta,
      'verdadeira': instance.verdadeira,
    };
