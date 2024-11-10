import 'dart:async';

import 'package:do_an_di_dong/custombutton_popup.dart';
import 'package:do_an_di_dong/models/options.dart';
import 'package:do_an_di_dong/models/questions.dart';
import 'package:do_an_di_dong/view_models/options_view_model.dart';
import 'package:do_an_di_dong/view_models/questions_set_details_view_model.dart';
import 'package:do_an_di_dong/views/shared_layouts/custom_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class inGame extends StatefulWidget {
  int setID;
  inGame({
    super.key,
    required this.setID,
  });

  @override
  State<inGame> createState() => _inGameState();
}

class _inGameState extends State<inGame> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionsSetDetailsViewModel?>(
        builder: (builder, viewModel, child) {
      Provider.of<QuestionsSetDetailsViewModel>(context, listen: false)
          .getQuestionsSetsList(widget.setID);
      List<Questions> list = viewModel!.listQuestions;
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              showSettingsDialog(context);
            },
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 32.0), // Khoảng cách giữa AppBar đến phần câu hỏi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                height: 300,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 236, 231, 231),
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "${list.first.questionContent}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32.0), // Khoảng cách giữa câu hỏi và đáp án

            // Consumer<OptionsViewModel>(builder: (context, viewModel, child) {
            //   Provider.of<OptionsViewModel>(context, listen: false)
            //       .getOption(list.iterator.current.questionID);
            //   List<Options> listOptions = viewModel.listOption;
            //   return CustomListView(
            //       dataSet: listOptions,
            //       itemBuilder: (context, index) {
            //         return RadioListTile(
            //             title: Text("${listOptions[index].optionContent}"),
            //             value: listOptions[index].optionValue,
            //             groupValue: listOptions[index],
            //             onChanged: (value) {});
            //       });
            // })
          ],
        ),
        backgroundColor: Colors.white,
      );
    });
  }
}

// Hàm hiển thị bảng pop-up cài đặt
void showSettingsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                text: 'Tiếp tục',
                onPressed: () {
                  Navigator.of(context)
                      .pop(); // Close the dialog and stay on the current page
                },
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: 'Quay trở lại trang tiêu đề',
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(
                      '/homePage'); // Navigate to the home page
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
