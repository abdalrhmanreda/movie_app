import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/components/progress_indector.dart';
import 'package:movie_app/ui/cubit/app_cubit.dart';

import '../../../../core/components/custom_smooth_indicator.dart';
import '../../../../core/components/flutter_toast.dart';
import 'build_list_view.dart';
import 'build_page_view.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var pageController = PageController();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AddFavSuccessState) {
          showToast(
              message: 'Movie Added from favourite successfully',
              state: ToastState.SUCCESS);
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: AppCubit.get(context).releasesMovieModel != null &&
              AppCubit.get(context).popularMovieModel != null &&
              AppCubit.get(context).topRatedMovieModel != null,
          builder: (context) => SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                buildPageView(context, pageController),
                CustomSmoothIndicator(pageController: pageController, count: 6),
                buildHorzListView(
                  context: context,
                  title: 'New Release',
                  model: AppCubit.get(context).releasesMovieModel!,
                ),
                buildHorzListView(
                  context: context,
                  title: 'Recomended',
                  model: AppCubit.get(context).topRatedMovieModel!,
                ),
              ],
            ),
          ),
          fallback: (context) => const CustomLoadingIndicator(),
        );
      },
    );
  }
}
