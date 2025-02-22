import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodiego/core/app_constants.dart';
import 'package:foodiego/core/app_static_route_paths.dart';
import 'package:foodiego/core/app_text_styles.dart';
import 'package:foodiego/core/app_themes.dart';
import 'package:foodiego/core/widgets/app_elevated_button.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 10,
            right: MediaQuery.of(context).size.width / 4,
            child: Hero(
              tag: 'welcome-onb',
              child: CircleAvatar(
                radius: 200,
                backgroundColor: AppThemes.primaryColor.withValues(alpha: 0.1),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('lib/assets/svg/app-icon.svg'),
                      SizedBox(width: 10,),
                      Text(
                        AppConstants.appName,
                        style: AppTextStyles.heading1.copyWith(fontSize: 28),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  SvgPicture.asset('lib/assets/svg/welcome.svg'),
                  Text(
                    'Welcome',
                    style: AppTextStyles.heading1.copyWith(fontSize: 28),
                  ),
                  Text(
                    'It’s a pleasure to meet you. We are excited that you’re here so let’s get started!',
                    style: AppTextStyles.caption,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppElevatedButton(
                    title: 'GET STARTED',
                    voidCallback: () {
                      context.pushNamed(AppStaticRoutePaths.onBoardingPage);
                    },
                    isLoading: false,
                    extraPadding: false,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
