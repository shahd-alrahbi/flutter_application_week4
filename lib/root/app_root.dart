import 'package:flutter/material.dart';
import 'package:flutter_application_20/cubits/auth/auth_cubit.dart';
import 'package:flutter_application_20/cubits/main/main_cubit.dart';
import 'package:flutter_application_20/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => MainCubit()),
          BlocProvider(create: (context) => AuthCubit()),
        ],
        child: BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            if (state is LightThemeState) {
              print("light");
            }
            if (state is DarkThemeState) {
              print("dark");
            }
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: HomeScreen(),
              theme: ThemeData.light(useMaterial3: true),
              darkTheme: ThemeData.dark(useMaterial3: true),
              themeMode: MainCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
            );
          },
        ));
  }
}
