import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/ui/features/home/components/build_branch_container.dart';

import '../../../../config/routes/routes_path.dart';
import '../../../../core/api/api_constant.dart';
import '../../../../core/components/custom_navigatation.dart';
import '../../../cubit/app_cubit.dart';
import '../../home/models/movie_model.dart';
import '../../search/components/build_textsIn_list_view_item.dart';

InkWell buildWatchListViewItem({
  required BuildContext context,
  required int index,
  required num id,
  required List<Results> list,
}) {
  return InkWell(
    onTap: () {
      AppCubit.get(context).getMovieDetails(movieId: id);
      CustomNavigation.navigateByNamedTo(context, RoutePath.movieDetails);
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildBranchContainer(
          context: context,
          image: '${ApiConstant.imagePath}${list[index].posterPath}',
          id: id,
          addToFav: false,
          index: index,
        ),
        SizedBox(
          width: 15.w,
        ),
        buildTextsInListViewItem(context, list[index]),
      ],
    ),
  );
}
