import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz_app/domain/questions/models/question.model.dart';
import 'package:quiz_app/domain/questions/questions.repository.dart';
import 'package:quiz_app/domain/utils/snackbar.util.dart';
import 'package:quiz_app/presentation/shared/loading/loading.controller.dart';

class QuizController extends GetxController {
  final QuestionsRepository _questionsRepository;

  final _loading = Get.find<LoadingController>();
  late final String quiz;

  QuizController({required QuestionsRepository questionsRepository})
      : _questionsRepository = questionsRepository {
    quiz = Get.arguments;
  }

  final questions = <QuestionModel>[].obs;
  final questionsEscolhidas = <QuestionModel>[].obs;
  final scoreKeeper = <Widget>[].obs;
  final totalEscolhidas = 5;
  final random = Random();
  final hitNumber = 0.obs;
  final questionIndex = 0.obs;
  late final bool shiftAnswer;

  int get questionsNumber => questionsEscolhidas.length;
  QuestionModel get question => questionsEscolhidas[questionIndex.value];

  @override
  onReady() {
    super.onReady();
    loadQuestions();
    shiftAnswer = random.nextBool();
  }

  Future<void> loadQuestions() async {
    try {
      _loading.isLoading = true;
      final response = await _questionsRepository.getQuestions(quiz: quiz);
      questions.assignAll(response);
      // questions.shuffle();
      // questions[questionIndex.value].answers.shuffle();
      for (var i = 0; i < totalEscolhidas; i++) {
        questions.shuffle();
        questionsEscolhidas.add(questions.last);
        questions.remove(questions.last);
        questionsEscolhidas[questionIndex.value].answers.shuffle();
      }
    } catch (err) {
      SnackbarUtil.showWarning(
          message: 'Não foi possível pegar as perguntas 😢');
      rethrow;
    } finally {
      _loading.isLoading = false;
    }
  }

  void nextQuestion() {
    questionIndex.value = ++questionIndex.value % questionsEscolhidas.length;
    question.answers.shuffle();
  }

  String getQuestion() {
    return questionsEscolhidas[questionIndex.value].question;
  }

  String getAnswer1() {
    return shiftAnswer
        ? questionsEscolhidas[questionIndex.value].answers[0].resposta
        : shiftAnswer
            ? questionsEscolhidas[questionIndex.value].answers[1].resposta
            : shiftAnswer
                ? questionsEscolhidas[questionIndex.value].answers[2].resposta
                : questionsEscolhidas[questionIndex.value].answers[3].resposta;
  }

  String getAnswer2() {
    return shiftAnswer
        ? questionsEscolhidas[questionIndex.value].answers[1].resposta
        : shiftAnswer
            ? questionsEscolhidas[questionIndex.value].answers[2].resposta
            : shiftAnswer
                ? questionsEscolhidas[questionIndex.value].answers[3].resposta
                : questionsEscolhidas[questionIndex.value].answers[0].resposta;
  }

  String getAnswer3() {
    return shiftAnswer
        ? questionsEscolhidas[questionIndex.value].answers[2].resposta
        : shiftAnswer
            ? questionsEscolhidas[questionIndex.value].answers[3].resposta
            : shiftAnswer
                ? questionsEscolhidas[questionIndex.value].answers[0].resposta
                : questionsEscolhidas[questionIndex.value].answers[1].resposta;
  }

  String getAnswer4() {
    return shiftAnswer
        ? questionsEscolhidas[questionIndex.value].answers[3].resposta
        : shiftAnswer
            ? questionsEscolhidas[questionIndex.value].answers[0].resposta
            : shiftAnswer
                ? questionsEscolhidas[questionIndex.value].answers[1].resposta
                : questionsEscolhidas[questionIndex.value].answers[2].resposta;
  }

  bool correctAnswer(String answer) {
    var correct = questionsEscolhidas[questionIndex.value].answers[0].verdadeira
        ? questionsEscolhidas[questionIndex.value].answers[0].resposta == answer
        : questionsEscolhidas[questionIndex.value].answers[1].verdadeira
            ? questionsEscolhidas[questionIndex.value].answers[1].resposta ==
                answer
            : questionsEscolhidas[questionIndex.value].answers[2].verdadeira
                ? questionsEscolhidas[questionIndex.value]
                        .answers[2]
                        .resposta ==
                    answer
                : questionsEscolhidas[questionIndex.value].answers[3].verdadeira
                    ? questionsEscolhidas[questionIndex.value]
                            .answers[3]
                            .resposta ==
                        answer
                    : false;
    hitNumber.value = hitNumber.value + (correct ? 1 : 0);
    return correct;
  }

  void jogarNovamente() {
    questionIndex.value = 0;
    hitNumber.value = 0;
    questions.value = [];
    scoreKeeper.value = [];
    questionsEscolhidas.value = [];
    loadQuestions();
    Get.back();
  }
}
