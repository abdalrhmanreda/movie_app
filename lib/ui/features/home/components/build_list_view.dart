import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/config/colors/app_colors.dart';
import 'package:movie_app/core/api/api_constant.dart';
import 'package:movie_app/ui/features/home/models/movie_model.dart';

import '../../../../core/constant/app_constant.dart';
import 'build_branch_container.dart';

Column buildHorzListView({
  required BuildContext context,
  required String title,
  required MovieModel model,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(
          top: 12,
          left: 10,
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 16.sp,
              ),
        ),
      ),
      SizedBox(
        height: AppConstant.deviceHeight(context) / 60,
      ),
      SizedBox(
        height: AppConstant.deviceHeight(context) / 3.2,
        child: ListView.separated(
          itemBuilder: (context, index) => SizedBox(
            width: AppConstant.deviceWidth(context) / 3,
            child: Column(
              children: [
                Stack(
                  children: [
                    buildBranchContainer(
                        context: context,
                        id: model.results[index].id!,
                        image:
                            '${ApiConstant.imagePath}${model.results[index].backdropPath}'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Text(
                            model.results[index].voteAverage!
                                .toStringAsFixed(1),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: const Color(AppColors.kPrimaryColor),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${model.results[index].title}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          itemCount: model.results.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (context, index) => SizedBox(
            width: AppConstant.deviceWidth(context) / 40,
          ),
        ),
      ),
      SizedBox(
        height: AppConstant.deviceHeight(context) / 60,
      ),
    ],
  );
}
