import 'package:flutter/cupertino.dart';
class StarRating extends StatelessWidget {
  final double size;
  final double rating;  // Rating value (0.0 to 5.0)

  StarRating( {required this.rating, this.size = 10,});

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];

    for (int i = 1; i <= 5; i++) {
      if (rating >= i) {
        // Full star
        stars.add(Icon(CupertinoIcons.star_fill, color: CupertinoColors.activeOrange, size: size));
      } else if (rating > i - 1 && rating < i) {
        // Half star
        stars.add(Icon(CupertinoIcons.star_lefthalf_fill, color: CupertinoColors.activeOrange, size: size));
      } else {
        // Empty star
        stars.add(Icon(CupertinoIcons.star, color: CupertinoColors.systemGrey, size: size));
      }

      // Add space between stars
      stars.add(SizedBox(width: 4));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: stars,
    );
  }
}
