import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/config/routes/router.dart';
import 'package:movie_app/config/routes/routes_path.dart';
import 'package:movie_app/config/themes/themes.dart';
import 'package:movie_app/core/api/dio_helper.dart';
import 'package:movie_app/ui/cubit/app_cubit.dart';
import 'package:movie_app/ui/cubit/observer/blocObserver.dart';
import 'package:movie_app/ui/features/authentication/controller/auth_cubit.dart';
import 'package:movie_app/ui/features/search/controller/search_cubit.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
              BlocProvider(
                create: (context) => AuthCubit(),
              ),
            ],
            child: SafeArea(
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                themeMode: ThemeMode.dark,
                initialRoute: RoutePath.login,
                onGenerateRoute: generateRoute,
                theme: Style.darkTheme,
              ),
            ),
          );
        });
  }
}
