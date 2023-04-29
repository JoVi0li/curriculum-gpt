import 'package:curriculumgpt/firebase_options.dart';
import 'package:curriculumgpt/modules/auth/presenter/screens/sign_in_screen.dart';
import 'package:curriculumgpt/shared/inject/inject.dart';
import 'package:curriculumgpt/shared/themes/button_theme.dart';
import 'package:curriculumgpt/shared/themes/text_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Inject.call();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF1A1A1A),
        textTheme: CustomTextTheme()(),
        elevatedButtonTheme: CustomButtonTheme.elevatedButtonLightTheme(),
      ),
      home: const SignInScreen(),
    );
  }
}
