import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/ui/cubit/app_cubit.dart';

import '../components/build_bottom_nav_bar.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body:
              AppCubit.get(context).screens[AppCubit.get(context).currentIndex],
          bottomNavigationBar: buildBottomNavigationBar(context),
        );
      },
    );
  }
}
