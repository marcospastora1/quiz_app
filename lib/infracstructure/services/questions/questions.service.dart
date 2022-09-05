import 'dart:convert';

import 'package:quiz_app/domain/exceptions/default.exception.dart';
import 'package:quiz_app/infracstructure/services/data/question.data.dart';
import 'package:quiz_app/infracstructure/services/questions/dto/get_questions.response.dart';
import 'package:http/http.dart' as http;

class QuestionsService {
  var request =
      'https://script.googleusercontent.com/macros/echo?user_content_key=oQgSkrLfmA_b7RyTS9GsQoKTQpnApiPKYqC71JKHX71G-6SQRL9yYdavYXAUQdVnINnNX7qd2zj0ieS04gN99DvjqO3x4UwXm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnMxTZnPBTKq6S-MDBb2tInCIyE_Sbz9tPmuivj-A8nzSFUzKZ9aPUWMo9CQZrSJdwtExKWG6kt0P&lib=MPu2ZfuRQBopk6A6rW1ys4tmXoCfIqdc2';

  Future<List<QuestionData>> getQuestions() async {
    final response = await http.get(Uri.parse(request));
    final data = GetQuestionsResponse.fromJson(json.decode(response.body));

    if (response.statusCode == 200) {
      return data.questions;
    } else {
      switch (response.statusCode) {
        default:
          throw DefaultException(message: 'Falha ao pegar peguntas');
      }
    }
  }
}
