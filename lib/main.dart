import 'package:flutter/material.dart';
import 'package:fantastic_assistant/cubits/MainNavigation/main_navigation.dart';
import 'package:fantastic_assistant/views/register.dart';
import 'package:fantastic_assistant/views/register_or_login.dart';

import 'package:fantastic_assistant/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fantastic Assistant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.iris),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MainNavigationCubit(),
          ),
        ],
        child: BlocBuilder<MainNavigationCubit, int>(
          builder: (context, mainNavigationIndex) {
            return Scaffold(
              body: Navigator(
                pages: [
                  if (mainNavigationIndex == 0) const MaterialPage(child: RegisterOrLoginView()),
                  if (mainNavigationIndex == 1) const MaterialPage(child: RegisterView()),
                ],
                onPopPage: (route, result) {
                  return route.didPop(result);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
