import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:movie_app/ui/cubit/app_cubit.dart';

BottomNavigationBar buildBottomNavigationBar(BuildContext context) {
  return BottomNavigationBar(
    items: const [
      BottomNavigationBarItem(
        icon: Icon(IconlyBroken.home),
        label: 'HOME',
      ),
      BottomNavigationBarItem(
        icon: Icon(IconlyBroken.search),
        label: 'SEARCH',
      ),
      BottomNavigationBarItem(
        icon: Icon(IconlyBroken.video),
        label: 'BROWSE',
      ),
      BottomNavigationBarItem(
        icon: Icon(IconlyBroken.bookmark),
        label: 'WATCHLIST',
      ),
    ],
    onTap: (index) {
      AppCubit.get(context).changeNavBar(index);
    },
    currentIndex: AppCubit.get(context).currentIndex,
  );
}
