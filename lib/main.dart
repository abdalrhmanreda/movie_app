import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/config/routes/router.dart';
import 'package:movie_app/config/routes/routes_path.dart';
import 'package:movie_app/config/themes/themes.dart';
import 'package:movie_app/core/api/dio_helper.dart';
import 'package:movie_app/ui/cubit/app_cubit.dart';
import 'package:movie_app/ui/cubit/observer/blocObserver.dart';
import 'package:movie_app/ui/features/search/controller/search_cubit.dart';

import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AppCubit()
                  ..getPopular()
                  ..getReleases()
                  ..getTopRated()
                  ..getCategory(),
              ),
              BlocProvider(
                create: (context) => SearchCubit(),
              ),
            ],
            child: SafeArea(
              child: MaterialApp(
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                debugShowCheckedModeBanner: false,
                themeMode: ThemeMode.dark,
                initialRoute: RoutePath.splash,
                onGenerateRoute: generateRoute,
                theme: Style.darkTheme,
              ),
            ),
          );
        });
  }
}
