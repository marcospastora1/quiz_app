import 'dart:convert';

import 'package:quiz_app/domain/exceptions/default.exception.dart';
import 'package:quiz_app/infracstructure/services/data/question.data.dart';
import 'package:quiz_app/infracstructure/services/questions/dto/get_questions.response.dart';
//import 'package:quiz_app/infracstructure/services/questions/questions.mock.dart';
import 'package:http/http.dart' as http;

class QuestionsService {
  var request =
      'https://script.googleusercontent.com/macros/echo?user_content_key=6vgH0KQF0y8DaTVME4qE-1-kqInCd9IODaqeGzyQZbvYsdejl7bJXDEOpDygOAu8Um0pwnzfjV6yebP6FHtYZjhgxiRuRPNom5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnPHhAIyNtut0jdqAytUnQem1ru6dt32eHtj1SeeMjmoeAg44UbP78IO8RDDCkE0h31Jzu3sMuDS7AciAoZ5lwdKReRHvKOLBEtz9Jw9Md8uu&lib=MPu2ZfuRQBopk6A6rW1ys4tmXoCfIqdc2';

  Future<List<QuestionData>> getQuestionsCiencias() async {
    final response = await http.get(Uri.parse(request));
    final data = GetQuestionsResponse.fromJson(json.decode(response.body));

    // const response = getQuestionsMock;

    if (response.statusCode == 200) {
      return data.questions;
    } else {
      switch (response.statusCode) {
        default:
          throw DefaultException(message: 'Falha ao pegar perguntas');
      }
    }
  }
}
