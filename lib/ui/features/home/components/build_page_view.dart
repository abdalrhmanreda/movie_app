import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:movie_app/core/api/api_constant.dart';
import 'package:movie_app/ui/cubit/app_cubit.dart';

import '../../../../core/constant/app_constant.dart';
import 'build_branch_container.dart';
import 'bulid_main_container.dart';

Column buildPageView(BuildContext context, PageController pageController) {
  return Column(
    children: [
      SizedBox(
        height: AppConstant.deviceHeight(context) / 2.2,
        width: AppConstant.deviceWidth(context),
        child: PageView.builder(
          controller: pageController,
          itemBuilder: (context, index) => Stack(
            alignment: Alignment.bottomLeft,
            children: [
              buildMainContainer(
                context: context,
                image:
                    '${ApiConstant.imagePath}${AppCubit.get(context).popularMovieModel!.results[index].backdropPath}',
                title: AppCubit.get(context)
                    .popularMovieModel!
                    .results[index]
                    .title!,
                date: AppCubit.get(context)
                    .popularMovieModel!
                    .results[index]
                    .releaseDate!,
                pageController: pageController,
                id: AppCubit.get(context).popularMovieModel!.results[index].id!,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: buildBranchContainer(
                    context: context,
                    id: AppCubit.get(context)
                        .popularMovieModel!
                        .results[index]
                        .id!,
                    image:
                        '${ApiConstant.imagePath}${AppCubit.get(context).popularMovieModel!.results[index].backdropPath}'),
              ),
              const Align(
                alignment: Alignment.center,
                child: Icon(
                  IconlyBroken.play,
                  size: 60,
                ),
              ),
            ],
          ),
          physics: const BouncingScrollPhysics(),
          itemCount: 6,
        ),
      ),
      SizedBox(
        height: AppConstant.deviceHeight(context) / 70,
      ),
    ],
  );
}
