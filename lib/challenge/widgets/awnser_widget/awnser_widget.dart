import 'package:aplicacao_nlw5/core/core.dart';
import 'package:aplicacao_nlw5/shared/models/awnser_model.dart';
import 'package:flutter/material.dart';

class AwnserWidget extends StatelessWidget {
  final AwnserModel awnser;
  final bool isSelected;
  final ValueChanged<bool> onTap;
  final bool disabled;

  const AwnserWidget({
    Key key,
    @required this.awnser,
    this.isSelected = false,
    @required this.onTap,
    this.disabled = false,
  }) : super(key: key);

  Color get selectedColorRight =>
      awnser.isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get selectedBorderRight =>
      awnser.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get selectedColorCardRight =>
      awnser.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get selectedBorderCardRight =>
      awnser.isRight ? AppColors.green : AppColors.red;

  TextStyle get selectedTextStyleRight =>
      awnser.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get selectedIconRight => awnser.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: IgnorePointer(
        ignoring: disabled,
        child: GestureDetector(
          onTap: () {
            onTap(awnser.isRight);
          },
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected ? selectedColorCardRight : AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.fromBorderSide(
                BorderSide(
                    color: isSelected
                        ? selectedBorderCardRight
                        : AppColors.border),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    awnser.title,
                    style: isSelected
                        ? selectedTextStyleRight
                        : AppTextStyles.body,
                  ),
                ),
                Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: isSelected ? selectedColorRight : AppColors.white,
                    borderRadius: BorderRadius.circular(500),
                    border: Border.fromBorderSide(
                      BorderSide(
                          color: isSelected
                              ? selectedBorderCardRight
                              : AppColors.border),
                    ),
                  ),
                  child: isSelected
                      ? Icon(
                          selectedIconRight,
                          size: 16,
                          color: Colors.white,
                        )
                      : null,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
