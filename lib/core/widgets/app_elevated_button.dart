import 'package:flutter/material.dart';

import '../app_text_styles.dart';
import '../app_themes.dart';

class AppElevatedButton extends StatelessWidget {
  String title;
  VoidCallback? voidCallback;
  bool isLoading;
  bool extraPadding;
  bool isInverted;

  AppElevatedButton(
      {required this.title,
      required this.voidCallback,
      required this.isLoading,
      this.extraPadding = false,
      this.isInverted = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
              onPressed: isLoading ? null : voidCallback,
              style: isInverted
                  ? ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                      foregroundColor:
                          WidgetStatePropertyAll(AppThemes.primaryColor),
                      overlayColor: WidgetStatePropertyAll(
                          AppThemes.primaryColor.withValues(alpha: 0.1)))
                  : null,
              child: Padding(
                padding: extraPadding ? EdgeInsets.all(8) : EdgeInsets.all(0),
                child: isLoading
                    ? Center(
                        child: SizedBox(
                          height: 26,
                          width: 26,
                          child: CircularProgressIndicator(
                            color: isInverted
                                ? AppThemes.primaryColor
                                : Colors.white,
                          ),
                        ),
                      )
                    : Text(
                        title,
                        style: extraPadding
                            ? AppTextStyles.heading3.copyWith(
                                color: isInverted
                                    ? AppThemes.primaryColor
                                    : Colors.white,
                              )
                            : null,
                      ),
              )),
        ),
      ],
    );
  }
}
