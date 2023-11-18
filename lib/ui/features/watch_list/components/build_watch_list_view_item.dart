import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/ui/features/home/components/build_branch_container.dart';

import '../../../../core/api/api_constant.dart';
import '../../home/models/movie_model.dart';
import '../../search/components/build_textsIn_list_view_item.dart';

Row buildWatchListViewItem({
  required BuildContext context,
  required int index,
  required num id,
  required List<Results> list,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      buildBranchContainer(
        context: context,
        image: '${ApiConstant.imagePath}${list[index].posterPath}',
        id: id,
      ),
      SizedBox(
        width: 15.w,
      ),
      buildTextsInListViewItem(context, list[index]),
    ],
  );
}
