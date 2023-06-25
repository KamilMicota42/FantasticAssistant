import 'package:fantastic_assistant/cubits/AuthFlowNavigation/auth_flow_navigation.dart';
import 'package:fantastic_assistant/cubits/CircularLoading/circular_loading.dart';
import 'package:fantastic_assistant/utils/colors.dart';
import 'package:fantastic_assistant/views/authFlow/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:fantastic_assistant/cubits/MainNavigation/main_navigation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthFlowNavigationCubit(),
          ),
          BlocProvider(
            create: (context) => MainNavigationCubit(),
          ),
          BlocProvider(
            create: (context) => CircularLoadingCubit(),
          ),
        ],
        child: BlocBuilder<MainNavigationCubit, int>(
          builder: (context, mainNavigationIndex) {
            return Stack(
              children: [
                const AuthPage(),
                BlocBuilder<CircularLoadingCubit, bool>(
                  builder: (context, state) {
                    if (state == true) {
                      return const Center(
                        child: SizedBox(
                          height: 60,
                          width: 60,
                          child: CircularProgressIndicator(
                            color: MyColors.white,
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
