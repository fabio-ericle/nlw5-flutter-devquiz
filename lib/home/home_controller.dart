import 'package:aplicacao_nlw5/home/home_repository.dart';
import 'package:aplicacao_nlw5/home/home_state.dart';
import 'package:aplicacao_nlw5/shared/models/quiz_model.dart';
import 'package:aplicacao_nlw5/shared/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel user;
  List<QuizModel> quizzes;

  final repository = HomeRespository();

  void getUser() async {
    //state = HomeState.loading;

    user = await repository.getUser();
    //state = HomeState.success;
  }

  void getQuizzes() async {
    //state = HomeState.loading;

    quizzes = await repository.getQuizzes();

    //state = HomeState.success;
  }

  Future<void> fetchUser() async {
    state = HomeState.loading;
    await getUser();
    await getQuizzes();
    state = HomeState.success;
  }
}
