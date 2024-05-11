import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../themes/text_styles.dart';
import '../../utilities/cyrillic_formatter.dart';
import '../../utilities/hardcode_image_picker.dart';

Widget musicOfferItem({
  required int? id,
  required String title,
  required String town,
  required int price,
}) {
  return Padding(
    padding: const EdgeInsets.only(right: 80, left: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getImageWidget(
          id: id,
          width: 190,
          height: 190,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: AppTextStyles.titleMusic,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          town,
          style: AppTextStyles.inputText,
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/images/airoplan2.svg',
              height: 21,
            ),
            Text(
              " от ${formattedPrice(price)} ₽",
              style: AppTextStyles.inputText,
            ),
          ],
        ),
      ],
    ),
  );
}
