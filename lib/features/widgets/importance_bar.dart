import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idea_note3/constants/sizes.dart';

class ImportanceBar extends StatelessWidget {
  const ImportanceBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: const EdgeInsets.only(
          left: Sizes.size12,
          bottom: Sizes.size6,
        ),
        child: RatingBar.builder(
          initialRating: 3,
          itemCount: 5,
          minRating: 1,
          itemSize: Sizes.size16,
          itemPadding: const EdgeInsets.symmetric(
            horizontal: 0,
          ),
          ignoreGestures: true,
          updateOnDrag: false,
          direction: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return const FaIcon(
              FontAwesomeIcons.star,
              color: Colors.amberAccent,
            );
          },
          onRatingUpdate: (double value) {},
        ),
      ),
    );
  }
}