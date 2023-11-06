import 'package:flutter/material.dart';

import '../../../../core/components/custom_outline_button.dart';

Row buildRowContainTwoOutlineButton() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomOutlineButton(text: 'Watch Now', onPressed: () {}),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              CustomOutlineButton(text: 'Add to Watchlist', onPressed: () {}),
        ),
      ),
    ],
  );
}
