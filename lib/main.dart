import 'package:do_an_di_dong/view_models/options_view_model.dart';
import 'package:do_an_di_dong/view_models/questions_set_details_view_model.dart';
import 'package:do_an_di_dong/view_models/questions_sets_view_model.dart';
import 'package:do_an_di_dong/view_models/questions_view_model.dart';
import 'package:do_an_di_dong/view_models/topics_view_model.dart';
import 'package:do_an_di_dong/views/auth_screens/login/login_screen.dart';
import 'package:do_an_di_dong/views/auth_screens/profile/profile_screen.dart';
import 'package:do_an_di_dong/views/ranked_screen.dart';
import 'package:do_an_di_dong/views/topics_list_screen.dart';
import 'package:do_an_di_dong/view_models/rooms_view_model.dart';
import 'package:do_an_di_dong/view_models/users_view_model.dart';
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
    ),
    ChangeNotifierProvider<QuestionsSetDetailsViewModel>(
      create: (context) => QuestionsSetDetailsViewModel(),
    ),
    ChangeNotifierProvider<RoomsViewModel>(
      create: (context) => RoomsViewModel(),
    ),
    ChangeNotifierProvider<OptionsViewModel>(
        create: (context) => OptionsViewModel()),
    ChangeNotifierProvider<UsersViewModel>(
      create: (context) => UsersViewModel(),
    ),
    ChangeNotifierProvider<QuestionsViewModel>(
      create: (context) => QuestionsViewModel(),
    )
  ], child: const LocalizedApp(child: MainApp())));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes: {
      //   '/homePage': (context) => const homePage(),
      //   '/settingHomepage': (context) => const settingHomepage(),
      //   '/profileScreen': (context) => const ProfileScreen(),
      //   '/loginPage': (context) => const LoginScreen(),
      // },
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
      title: 'Walnut Quizzes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
