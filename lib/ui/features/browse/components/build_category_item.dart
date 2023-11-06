import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/components/custom_navigatation.dart';
import 'package:movie_app/ui/features/browse/screens/category_details.dart';

import '../../../../core/constant/app_constant.dart';
import '../../../cubit/app_cubit.dart';

InkWell buildCategoryItem(
    BuildContext context, int index, List<String> images) {
  return InkWell(
    onTap: () {
      AppCubit.get(context).getCategoryData(
          id: AppCubit.get(context).categoryModel!.genres![index].id!);
      CustomNavigation.navigateTo(
          context,
          CategoryDetailsScreen(
              title:
                  '${AppCubit.get(context).categoryModel!.genres?[index].name}'));
    },
    child: Row(
      children: [
        Container(
          width: AppConstant.deviceWidth(context) / 3,
          height: AppConstant.deviceHeight(context) / 7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(images[index]),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: AppConstant.deviceWidth(context) / 25,
        ),
        Text(
          '${AppCubit.get(context).categoryModel!.genres?[index].name}',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 17.sp,
              ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            IconlyBroken.arrowRight2,
            size: 35,
          ),
        )
      ],
    ),
  );
}
