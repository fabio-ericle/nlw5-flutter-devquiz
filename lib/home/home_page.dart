import 'package:aplicacao_nlw5/challenge/challenge_page.dart';
import 'package:aplicacao_nlw5/core/app_colors.dart';
import 'package:aplicacao_nlw5/home/home_controller.dart';
import 'package:aplicacao_nlw5/home/home_state.dart';
import 'package:aplicacao_nlw5/home/widgets/appbar/app_bar_widget.dart';
import 'package:aplicacao_nlw5/home/widgets/level_button/level_button_widget.dart';
import 'package:aplicacao_nlw5/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  @override
  void initState() {
    super.initState();
    controller.fetchUser();

    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBarWidget(
          user: controller.user,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LeveButtonWidget(
                    label: "Fácil",
                  ),
                  LeveButtonWidget(
                    label: "Médio",
                  ),
                  LeveButtonWidget(
                    label: "Difícil",
                  ),
                  LeveButtonWidget(
                    label: "Perito",
                  ),
                ],
              ),
              SizedBox(height: 24.0),
              Expanded(
                  child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: controller.quizzes
                    .map(
                      (e) => QuizCardWidget(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChallengePage(
                                        questions: e.questions,
                                        title: e.title,
                                      )));
                        },
                        titlte: e.title,
                        completed:
                            "${e.questionsAnswered}/${e.questions.length}",
                        percent: e.questionsAnswered / e.questions.length,
                      ),
                    )
                    .toList(),
              ))
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
