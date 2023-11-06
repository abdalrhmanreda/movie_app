import 'package:flutter/material.dart';
import 'package:movie_app/generated/assets.dart';
import 'package:movie_app/ui/cubit/app_cubit.dart';

import 'build_category_item.dart';

class BrowseScreenBody extends StatelessWidget {
  const BrowseScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      Assets.categoryAction,
      Assets.categoryAdventure,
      Assets.categoryAnimation,
      Assets.categoryComdy,
      Assets.categoryCrime,
      Assets.categoryDocumentary,
      Assets.categoryDrama,
      Assets.categoryFamaily,
      Assets.categoryFantasy,
      Assets.categoryHistory,
      Assets.categoryHorror,
      Assets.categoryMusicial,
      Assets.categoryMystery,
      Assets.categoryRomance,
      Assets.categorySceinceFraction,
      Assets.categoryTv,
      Assets.categoryThriller,
      Assets.categoryWar,
      Assets.categoryWestern
    ];
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: AppCubit.get(context).categoryModel!.genres!.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(10),
        child: buildCategoryItem(context, index, images),
      ),
    );
  }
}
