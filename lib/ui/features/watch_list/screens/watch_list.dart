import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/components/custom_divider.dart';
import 'package:movie_app/core/components/flutter_toast.dart';
import 'package:movie_app/core/components/progress_indector.dart';
import 'package:movie_app/core/constant/app_constant.dart';
import 'package:movie_app/generated/assets.dart';
import 'package:movie_app/ui/cubit/app_cubit.dart';
import 'package:swipe_to/swipe_to.dart';

import '../components/build_watch_list_view_item.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is DeleteFavSuccessState) {
          showToast(
              message: 'Movie deleted from favourite successfully',
              state: ToastState.WARNING);
        }
      },
      builder: (context, state) {
        if (AppCubit.get(context).favMovies.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 25,
              left: 15,
              right: 15,
              bottom: 10,
            ),
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => SwipeTo(
                child: buildWatchListViewItem(
                  context: context,
                  index: index,
                  id: AppCubit.get(context).favMovies[index].id!,
                  list: AppCubit.get(context).favMovies,
                ),
                onRightSwipe: () {
                  AppCubit.get(context).removeFromFav(
                      id: AppCubit.get(context).favMoviesId[index]);
                  AppCubit.get(context).favMoviesId.removeAt(index);
                },
              ),
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: myDivider(AppConstant.deviceWidth(context), 1),
              ),
              itemCount: AppCubit.get(context).favMovies.length,
            ),
          );
        } else if (AppCubit.get(context).favMovies.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.imagesEmpty,
                width: AppConstant.deviceWidth(context),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'No Favourite Movies Yet',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 25),
              )
            ],
          );
        } else {
          return const Center(child: CustomLoadingIndicator());
        }
      },
    );
  }
}
/*
*  return ConditionalBuilder(
          condition: AppCubit.get(context).favMovies.isNotEmpty,
          builder: (context) => Padding(
            padding: const EdgeInsets.only(
              top: 25,
              left: 15,
              right: 15,
              bottom: 10,
            ),
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildWatchListViewItem(
                context: context,
                index: index,
                id: AppCubit.get(context).favMovies[index].id!,
                list: AppCubit.get(context).favMovies,
              ),
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: myDivider(AppConstant.deviceWidth(context), 1),
              ),
              itemCount: AppCubit.get(context).favMovies.length,
            ),
          ),
          fallback: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.imagesEmpty,
                width: AppConstant.deviceWidth(context),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'No Favourite Movies Yet',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 25),
              )
            ],
          ),
        );
* */
