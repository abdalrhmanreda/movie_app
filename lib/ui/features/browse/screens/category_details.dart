import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/components/progress_indector.dart';
import 'package:movie_app/ui/cubit/app_cubit.dart';

import '../components/build_grid_view_item_in_category_details.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: AppCubit.get(context).categoryData != null,
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .75,
              ),
              itemBuilder: (context, index) =>
                  buildGridViewItemInCategoryDetails(context, index),
              itemCount: AppCubit.get(context).categoryData!.results.length,
            ),
          ),
          fallback: (context) => const CustomLoadingIndicator(),
        );
      },
    );
  }
}
