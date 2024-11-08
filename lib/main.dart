import 'package:do_an_di_dong/homePage.dart';
import 'package:do_an_di_dong/inGame.dart';
import 'package:do_an_di_dong/view_models/questions_sets_view_model.dart';
import 'package:do_an_di_dong/view_models/topics_view_model.dart';
import 'package:do_an_di_dong/views/topics_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<TopicsViewModel>(
      create: (context) => TopicsViewModel(),
    ),
    ChangeNotifierProvider<QuestionsSetViewModel>(
      create: (context) => QuestionsSetViewModel(),
    )
  ], child: const LocalizedApp(child: MainApp())));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homePage(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
