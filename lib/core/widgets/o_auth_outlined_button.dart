import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../app_themes.dart';

class OAuthOutlinedButton extends StatelessWidget {
  String title;
  String assetPath;
  Color? backgroundColor;
  VoidCallback? onPressed;
  bool extraPadding;

  OAuthOutlinedButton(
      {required this.title,
      required this.assetPath,
      this.backgroundColor,
      this.onPressed,
      this.extraPadding = false});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        backgroundColor: backgroundColor != null
            ? WidgetStatePropertyAll(backgroundColor)
            : null,
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 12, horizontal: 20)),
      ),
      onPressed: onPressed,
      child: Padding(
        padding:
            extraPadding ? const EdgeInsets.all(8) : const EdgeInsets.all(0),
        child: Row(
          children: [
            assetPath.endsWith('svg')
                ? SvgPicture.asset(
                    assetPath,
                    height: 24,
                    width: 24,
                  )
                : Image.asset(
                    assetPath,
                    height: 24,
                    width: 24,
                    color: AppThemes.scaffoldBackgroundColor,
                  ),
            Expanded(
                child: Text(
              '$title',
              textAlign: TextAlign.center,
              style: backgroundColor != null
                  ? TextStyle(color: AppThemes.scaffoldBackgroundColor)
                  : null,
            )),
            Visibility(visible: false, child: Icon(Icons.done)),
          ],
        ),
      ),
    );
  }
}

class OAuthOutlinedButtonWithIcon extends StatelessWidget {
  String title;
  IconData iconData;
  bool extraPadding;

  OAuthOutlinedButtonWithIcon({required this.title, required this.iconData, this.extraPadding = false});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 12, horizontal: 20)),
      ),
      onPressed: () {},
      child: Padding(
        padding: extraPadding ? const EdgeInsets.all(8.0) :  const EdgeInsets.all(0.0),
        child: Row(
          children: [
            Icon(iconData),
            Expanded(
                child: Text(
              'Continue with $title',
              textAlign: TextAlign.center,
            )),
            Visibility(visible: false, child: Icon(Icons.done)),
          ],
        ),
      ),
    );
  }
}
