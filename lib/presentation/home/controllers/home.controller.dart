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
  late final bool shitfAnswer;

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
      shitfAnswer = random.nextBool();
    } catch (err) {
      SnackbarUtil.showWarning(message: err.toString());
      rethrow;
    } finally {
      _loading.isLoading = false;
    }
  }

  void nextQuestion() {
    questionIndex.value = ++questionIndex.value % questions.length;
  }

  String getQuestion() {
    return questions[questionIndex.value].question;
  }

  String getAnswer1() {
    return shitfAnswer
        ? questions[questionIndex.value].answer1
        : questions[questionIndex.value].answer2;
  }

  String getAnswer2() {
    return shitfAnswer
        ? questions[questionIndex.value].answer2
        : questions[questionIndex.value].answer1;
  }

  bool correctAnswer(String answer) {
    var correct = questions[questionIndex.value].answer1 == answer;
    hitNumber.value = hitNumber.value + (correct ? 1 : 0);
    return correct;
  }
}
