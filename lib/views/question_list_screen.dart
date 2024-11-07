import 'package:do_an_di_dong/view_models/questions_view_model.dart';
import 'package:do_an_di_dong/views/shared_layouts/base_screen.dart';
import 'package:do_an_di_dong/views/shared_layouts/custom_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuestionListScreen extends StatefulWidget {
  const QuestionListScreen({super.key});

  @override
  State<QuestionListScreen> createState() => _QuestionListScreenState();
}

class _QuestionListScreenState extends State<QuestionListScreen> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
        body: Column(
      children: [
        Consumer<QuestionsViewModel>(builder: (context, viewModel, child) {
          return CustomListView(
            dataSet: const [],
            itemBuilder: (context, index) {
              return const Placeholder();
            },
          );
        })
      ],
    ));
  }
}
