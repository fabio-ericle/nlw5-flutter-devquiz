import 'package:aplicacao_nlw5/core/app_colors.dart';
import 'package:aplicacao_nlw5/core/core.dart';
import 'package:aplicacao_nlw5/shared/widgets/progess_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String titlte;
  final String completed;
  final double percent;
  final VoidCallback onTap;

  const QuizCardWidget(
      {Key key,
      this.titlte,
      this.completed,
      this.percent = 0,
      @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(color: AppColors.border),
          ),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              child: Image.asset(AppImages.data),
            ),
            SizedBox(height: 24),
            Text(
              titlte,
              style: AppTextStyles.heading15,
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    completed,
                    style: AppTextStyles.body11,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: ProgressIndicatorWidget(value: percent),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
