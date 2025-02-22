import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodiego/core/app_constants.dart';
import 'package:foodiego/core/app_static_route_paths.dart';
import 'package:foodiego/core/app_text_styles.dart';
import 'package:foodiego/core/app_themes.dart';
import 'package:foodiego/core/widgets/app_elevated_button.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page!.round(); // Convert float to int
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            bottom: 10,
            right: 10,
            child: SizedBox(
                height: 200,
                width: 200,
                child: Lottie.asset('lib/assets/svg/pizza-maker-anim.json')),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            bottom: currentIndex == 0
                ? 80 // Higher on the first page
                : currentIndex == 1
                    ? 430 // Lower on the second page
                    : 100,
            right: currentIndex == 0
                ? MediaQuery.of(context).size.width / 1.5
                : currentIndex == 1
                    ? MediaQuery.of(context).size.width / 6
                    : MediaQuery.of(context).size.width / 2.5,
            left: currentIndex == 2
                ? MediaQuery.of(context).size.width / 5
                : null,
            child: Hero(
              tag: 'welcome-onb',
              child: CircleAvatar(
                radius: 200,
                backgroundColor: AppThemes.primaryColor.withValues(alpha: 0.4),
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
                      Hero(
                          tag: 'ai',

                          child: SvgPicture.asset('lib/assets/svg/app-icon.svg')),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        AppConstants.appName,
                        style: AppTextStyles.heading1.copyWith(fontSize: 28),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2.4,
                    child: PageView(
                      controller: pageController,
                      children: [
                        OnBoardingPageReusable(
                            image: 'lib/assets/svg/onboarding1.svg',
                            title: 'All your favorites',
                            description:
                                'Order from the best local restaurants with easy, on-demand delivery.'),
                        OnBoardingPageReusable(
                            image: 'lib/assets/svg/onboarding2.svg',
                            title: 'Free delivery offers',
                            description:
                                'Free delivery for new customers via Apple Pay and others payment methods.'),
                        OnBoardingPageReusable(
                            image: 'lib/assets/svg/onboarding3.svg',
                            title: 'Choose your food',
                            description:
                                'Easily find your type of food craving and you’ll get delivery in wide range.'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppElevatedButton(
                    title: currentIndex != 2 ? 'NEXT' : 'CONTINUE',
                    voidCallback: () {
                      if (currentIndex != 2) {
                        pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        print('Hiya');
                        context.goNamed(AppStaticRoutePaths.signInPage);
                      }
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

class OnBoardingPageReusable extends StatelessWidget {
  String image;
  String title;
  String description;

  OnBoardingPageReusable(
      {required this.image, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: SvgPicture.asset(image)),
        Text(
          title,
          style: AppTextStyles.heading1.copyWith(fontSize: 28),
        ),
        Text(
          description,
          style: AppTextStyles.caption,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
