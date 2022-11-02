import 'package:quiz_app/infracstructure/services/data/answer.data.dart';

class AnswerModel {
  final String resposta;
  final bool verdadeira;

  const AnswerModel({required this.resposta, required this.verdadeira});

  factory AnswerModel.fromData(AnswerData answer) {
    return AnswerModel(
      resposta: answer.resposta,
      verdadeira: answer.verdadeira,
    );
  }
}
