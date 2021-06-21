import 'package:aplicacao_nlw5/core/app_text_styles.dart';
import 'package:aplicacao_nlw5/shared/widgets/progess_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionsIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int length;
  const QuestionsIndicatorWidget(
      {Key key, @required this.currentPage, @required this.length})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              new Text(
                "Questão $currentPage",
                style: AppTextStyles.body,
              ),
              Text(
                "de $length",
                style: AppTextStyles.body,
              )
            ],
          ),
          SizedBox(height: 16.0),
          ProgressIndicatorWidget(value: currentPage / length),
        ],
      ),
    );
  }
}
