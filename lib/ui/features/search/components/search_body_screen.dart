import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:movie_app/core/components/custom_divider.dart';
import 'package:movie_app/core/components/progress_indector.dart';
import 'package:movie_app/core/constant/app_constant.dart';
import 'package:movie_app/ui/features/search/controller/search_cubit.dart';

import '../../../../core/components/custom_text_form_feild.dart';
import 'build_search_list_view_item.dart';

class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 25,
            left: 15,
            right: 15,
            bottom: 10,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                CustomTextFormField(
                  isPassword: false,
                  maxLine: 1,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  onChanged: (value) {
                    SearchCubit.get(context).search(query: value!);
                  },
                  label: 'Search',
                  prefixIcon: IconlyBroken.search,
                ),
                if (state is LoadingState)
                  const Center(child: CustomLoadingIndicator()),
                if (state is SuccessState)
                  ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => buildSearchListViewItem(
                      context: context,
                      index: index,
                      searchMovieModel:
                          SearchCubit.get(context).searchMovieModel!,
                    ),
                    separatorBuilder: (context, index) =>
                        myDivider(AppConstant.deviceWidth(context), 1),
                    itemCount: SearchCubit.get(context)
                        .searchMovieModel!
                        .results
                        .length,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
