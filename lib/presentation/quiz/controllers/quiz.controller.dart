import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quiz_app/domain/core/constants/storage.constants.dart';
import 'package:quiz_app/domain/questions/models/question.model.dart';
import 'package:quiz_app/domain/questions/questions.repository.dart';
import 'package:quiz_app/domain/utils/snackbar.util.dart';
import 'package:quiz_app/presentation/quiz/widgets/dialogs/finish_dialog.widget.dart';
import 'package:quiz_app/presentation/quiz/widgets/dialogs/result_dialog.widget.dart';
import 'package:quiz_app/presentation/shared/loading/loading.controller.dart';

class QuizController extends GetxController {
  final QuestionsRepository _questionsRepository;
  final _storage = Get.find<GetStorage>();

  final _loading = Get.find<LoadingController>();
  late final String quiz, nomeRanking;

  QuizController({required QuestionsRepository questionsRepository})
      : _questionsRepository = questionsRepository {
    quiz = Get.arguments['quiz'];
    nomeRanking = Get.arguments['nome'];
  }

  final questions = <QuestionModel>[].obs;
  final questionsEscolhidas = <QuestionModel>[].obs;
  final scoreKeeper = <Widget>[].obs;
  final totalEscolhidas = 5;
  final random = Random();
  final hitNumber = 0.obs;
  final questionIndex = 0.obs;
  late final bool shiftAnswer;
  final cronometro = 20.obs;
  final click = false.obs;

  int get questionsNumber => questionsEscolhidas.length;
  QuestionModel get question => questionsEscolhidas[questionIndex.value];

  @override
  onReady() async {
    super.onReady();
    await loadQuestions();
    shiftAnswer = random.nextBool();
    await cronometroFunc();
  }

  Future<void> loadQuestions() async {
    try {
      _loading.isLoading = true;
      final response = await _questionsRepository.getQuestions(quiz: quiz);
      questions.assignAll(response);
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

  void nextQuestion() async {
    questionIndex.value = ++questionIndex.value % questionsEscolhidas.length;
    click.value = true;
    question.answers.shuffle();
    if (scoreKeeper.length >= 5) {
      salvarRanking();
      Get.dialog(
        barrierDismissible: false,
        FinishDialog(
          hitNumber: hitNumber.value,
          questionNumber: scoreKeeper.length,
          questions: question,
          jogarNovamente: jogarNovamente,
        ),
      );
    } else {
      cronometro.value = 20;
      cronometroFunc();
    }
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

  void jogarNovamente() async {
    questionIndex.value = 0;
    hitNumber.value = 0;
    questions.value = [];
    scoreKeeper.value = [];
    questionsEscolhidas.value = [];
    loadQuestions();
    Get.back();
    cronometro.value = 20;
    await cronometroFunc();
  }

  Future<void> cronometroFunc() async {
    click.value = false;
    while (cronometro.value > 0) {
      await Future.delayed(const Duration(seconds: 1));
      cronometro.value -= 1;
      if (click.value) {
        break;
      }
    }
    if (cronometro.value == 0 && scoreKeeper.length < 5) {
      Get.dialog(
        barrierDismissible: false,
        ResultDialog(
          question: question,
          correct: false,
          questionNow: scoreKeeper.length,
          questionNumber: questionsNumber,
          jogarNovamente: jogarNovamente,
          nextQuestion: nextQuestion,
          hitNumber: hitNumber.value,
        ),
      );
      scoreKeeper.add(
        const Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    } else if (cronometro.value == 0 && scoreKeeper.length == 5) {
      ResultDialog(
        question: question,
        correct: false,
        questionNow: scoreKeeper.length,
        questionNumber: questionsNumber,
        jogarNovamente: jogarNovamente,
        nextQuestion: nextQuestion,
        hitNumber: hitNumber.value,
      );
    }
  }

  void salvarRanking() async {
    final List<Map<String, dynamic>> ranking =
        List.castFrom(_storage.read(StorageConstants.ranking));

    final Map<String, dynamic> rankingAdd = {};
    final List<String> listNomes = [];

    if (ranking.isEmpty) {
      ranking.add({"Nome": nomeRanking, "Pontos": hitNumber.value});
    } else {
      for (var e in ranking) {
        listNomes.add(e['Nome'].toLowerCase());
        if (e.containsValue(nomeRanking)) {
          e['Pontos'] += hitNumber.value;
        }
      }

      if (listNomes.isNotEmpty) {
        rankingAdd.addAllIf(
          !(listNomes.contains(nomeRanking.toLowerCase())),
          {"Nome": nomeRanking, "Pontos": hitNumber.value},
        );
      }
    }

    ranking.addIf(rankingAdd.isNotEmpty, rankingAdd);
    await _storage.write(StorageConstants.ranking, ranking);
  }
}
