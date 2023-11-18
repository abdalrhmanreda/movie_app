import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/components/custom_sliver_bar.dart';
import 'package:movie_app/core/components/custom_sliver_to_box_adapter.dart';
import 'package:movie_app/core/constant/app_constant.dart';
import 'package:movie_app/ui/cubit/app_cubit.dart';
import 'package:movie_app/ui/features/home/components/build_list_view.dart';

import '../../../../core/api/api_constant.dart';
import '../../../../core/components/progress_indector.dart';
import '../components/column_that_contain_overview.dart';
import '../components/name_and_date_of_flim.dart';
import '../components/outline_buttons.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: AppCubit.get(context).movieModel != null &&
              AppCubit.get(context).similarMoviesModel != null,
          builder: (context) => Scaffold(
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                CustomSliverAppBar(
                  image:
                      '${ApiConstant.imagePath}${AppCubit.get(context).movieModel!.backdropPath}',
                  height: AppConstant.deviceHeight(context) / 2.5,
                ),
                CustomSliverToBoxAdapter(
                  widget: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildColumnContainNameAndReleaseDate(context),
                        buildRowContainTwoOutlineButton(),
                        buildColumnContainOverView(context),
                        buildHorzListView(
                          context: context,
                          title: 'More Like that',
                          model: AppCubit.get(context).similarMoviesModel!,
                        ),
                      ],
                    ),
                  ),
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
