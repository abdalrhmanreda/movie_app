import 'package:flutter/material.dart';
import 'package:movie_app/ui/features/search/components/search_body_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SearchScreenBody(),
    );
  }
}
