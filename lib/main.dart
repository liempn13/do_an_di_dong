import 'package:do_an_di_dong/homePage.dart';
import 'package:do_an_di_dong/view_models/list_rooms_view_model.dart';
import 'package:do_an_di_dong/view_models/users_view_model.dart';
import 'package:do_an_di_dong/views/edit_question_details_screen.dart';
import 'package:do_an_di_dong/views/question_set_screen.dart';
import 'package:do_an_di_dong/views/room_screen/list_rooms.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(providers: [
    
    ChangeNotifierProvider<ListRoomsViewModel>(
      create: (context) => ListRoomsViewModel(),
    ),
  ], child: LocalizedApp(child: MainApp())));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ListRoomScreen(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

// void main() {
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: ListRoomScreen(),
//     );
//   }
// }
