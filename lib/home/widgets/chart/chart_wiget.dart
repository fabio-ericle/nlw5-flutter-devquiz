import 'package:flutter/material.dart';

import 'package:aplicacao_nlw5/core/app_colors.dart';
import 'package:aplicacao_nlw5/core/app_text_styles.dart';

class ChartWidget extends StatefulWidget {
  final double percente;
  const ChartWidget({
    Key key,
    @required this.percente,
  }) : super(key: key);
  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  void _initAnimation() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation =
        Tween<double>(begin: 0.0, end: widget.percente).animate(_controller);
    _controller.forward();
  }

  @override
  void initState() {
    _initAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) => Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Container(
                height: 80,
                width: 80,
                child: CircularProgressIndicator(
                  value: _animation.value,
                  strokeWidth: 10.0,
                  backgroundColor: AppColors.chartSecondary,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                ),
              ),
            ),
            Center(
              child: Text(
                '${(_animation.value * 100).toInt()}%',
                style: AppTextStyles.heading,
              ),
            )
          ],
        ),
      ),
    );
  }
}
