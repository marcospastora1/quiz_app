import 'dart:math';

import 'package:get/get.dart';
import 'package:quiz_app/domain/questions/models/question.model.dart';
import 'package:quiz_app/domain/questions/questions.repository.dart';
import 'package:quiz_app/domain/utils/snackbar.util.dart';
import 'package:quiz_app/presentation/shared/loading/loading.controller.dart';

class HomeController extends GetxController {
  final QuestionsRepository _questionsRepository;

  final _loading = Get.find<LoadingController>();

  HomeController({required QuestionsRepository questionsRepository})
      : _questionsRepository = questionsRepository;

  final questions = <QuestionModel>[].obs;
  final random = Random();
  final hitNumber = 0.obs;
  final questionIndex = 0.obs;
  late final bool shiftAnswer;

  int get questionsNumber => questions.length;
  QuestionModel get question => questions[questionIndex.value];

  @override
  onReady() {
    super.onReady();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    try {
      _loading.isLoading = true;
      final response = await _questionsRepository.getQuestions();
      questions.assignAll(response);
      questions.shuffle();
      questions[questionIndex.value].answers.shuffle();
      shiftAnswer = random.nextBool();
    } catch (err) {
      SnackbarUtil.showWarning(message: err.toString());
      rethrow;
    } finally {
      _loading.isLoading = false;
    }
  }

  void nextQuestion() {
    questionIndex.value = ++questionIndex.value % questions.length;
    question.answers.shuffle();
  }

  String getQuestion() {
    return questions[questionIndex.value].question;
  }

  String getAnswer1() {
    return shiftAnswer
        ? questions[questionIndex.value].answers[0].resposta
        : shiftAnswer
            ? questions[questionIndex.value].answers[1].resposta
            : shiftAnswer
                ? questions[questionIndex.value].answers[2].resposta
                : questions[questionIndex.value].answers[3].resposta;
  }

  String getAnswer2() {
    return shiftAnswer
        ? questions[questionIndex.value].answers[1].resposta
        : shiftAnswer
            ? questions[questionIndex.value].answers[2].resposta
            : shiftAnswer
                ? questions[questionIndex.value].answers[3].resposta
                : questions[questionIndex.value].answers[0].resposta;
  }

  String getAnswer3() {
    return shiftAnswer
        ? questions[questionIndex.value].answers[2].resposta
        : shiftAnswer
            ? questions[questionIndex.value].answers[3].resposta
            : shiftAnswer
                ? questions[questionIndex.value].answers[0].resposta
                : questions[questionIndex.value].answers[1].resposta;
  }

  String getAnswer4() {
    return shiftAnswer
        ? questions[questionIndex.value].answers[3].resposta
        : shiftAnswer
            ? questions[questionIndex.value].answers[0].resposta
            : shiftAnswer
                ? questions[questionIndex.value].answers[1].resposta
                : questions[questionIndex.value].answers[2].resposta;
  }

  bool correctAnswer(String answer) {
    var correct = questions[questionIndex.value].answers[0].verdadeira
        ? questions[questionIndex.value].answers[0].resposta == answer
        : questions[questionIndex.value].answers[1].verdadeira
            ? questions[questionIndex.value].answers[1].resposta == answer
            : questions[questionIndex.value].answers[2].verdadeira
                ? questions[questionIndex.value].answers[2].resposta == answer
                : questions[questionIndex.value].answers[3].verdadeira
                    ? questions[questionIndex.value].answers[3].resposta ==
                        answer
                    : false;
    hitNumber.value = hitNumber.value + (correct ? 1 : 0);
    return correct;
  }
}
