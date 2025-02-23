import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodiego/core/app_text_styles.dart';
import 'package:foodiego/core/app_themes.dart';
import 'package:foodiego/core/widgets/star_rating_widget.dart';
import 'package:parallax_cards/parallax_cards.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Row(
              spacing: 4,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.location, size: 10, color: AppThemes.primaryColor,),
                Text('Your Location', style: AppTextStyles.microPrimary,),
              ],
            ),
            Text('Hey Steet Perth', style: AppTextStyles.bodyText,),
          ],
        ),

      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: Stack(
                    children: [
                      PageView(
                        controller: pageController,
                        children: [
                          PageViewWidget(),
                          PageViewWidget(),
                          PageViewWidget(),
                          PageViewWidget(),
                          PageViewWidget(),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: SmoothPageIndicator(
                                effect: SlideEffect(
                                    spacing: 8.0,
                                    radius: 4.0,
                                    dotWidth: 10.0,
                                    dotHeight: 6.0,
                                    strokeWidth: 1.5,
                                    dotColor:
                                        Colors.white.withValues(alpha: 0.2),
                                    activeDotColor: AppThemes.primaryColor),
                                controller: pageController,
                                count: 5)),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Featured Partners',
                      style: AppTextStyles.heading3,
                    ),
                    Text(
                      'see all',
                      style: AppTextStyles.captionPrimary,
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                SizedBox(
                  height: 240,
                  child: ListView(
                    scrollDirection:Axis.horizontal,
                    children: [
                      CarouselListTile(),
                      CarouselListTile(),
                      CarouselListTile(),
                      CarouselListTile(),
                      CarouselListTile(),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                SvgPicture.asset('lib/assets/svg/banner.svg',fit: BoxFit.cover,),
                SizedBox(height: 10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Best Picks',
                      style: AppTextStyles.heading3,
                    ),
                    Text(
                      'see all',
                      style: AppTextStyles.captionPrimary,
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                SizedBox(
                  height: 240,
                  child: ListView(
                    scrollDirection:Axis.horizontal,
                    children: [
                      CarouselListTile(),
                      CarouselListTile(),
                      CarouselListTile(),
                      CarouselListTile(),
                      CarouselListTile(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.asset(
            'lib/assets/svg/pic1.png',
            fit: BoxFit.cover,
          )),
    );
  }
}

class CarouselListTile extends StatelessWidget {
  const CarouselListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage(
                        'lib/assets/svg/pic1.png',
                      ),
                      fit: BoxFit.cover)),
            ),
          ),
          Text('Krispy Creme', style: AppTextStyles.bodyText,),
          Text('St Georgece Terrace, Perth', style: AppTextStyles.caption,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 5,
            children: [
              Text('3.5', style: AppTextStyles.micro,),
              StarRating(rating: 3.5),
              Text('25 min', style: AppTextStyles.micro,),
              Text('Free Delivery', style: AppTextStyles.micro,),

            ],
          )
        ],
      ),
    );
  }
}
