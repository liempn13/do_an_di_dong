import 'dart:async';
import 'dart:math';

import 'package:do_an_di_dong/custombutton_popup.dart';
import 'package:do_an_di_dong/models/questions.dart';
import 'package:do_an_di_dong/models/options.dart';
import 'package:do_an_di_dong/models/questions_sets.dart';
import 'package:do_an_di_dong/models/topics.dart';
import 'package:do_an_di_dong/models/users.dart';
import 'package:do_an_di_dong/view_models/options_view_model.dart';
import 'package:do_an_di_dong/view_models/questions_set_details_view_model.dart';
import 'package:do_an_di_dong/views/shared_layouts/ui_spacer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class inGame extends StatefulWidget {
  Users loginUser;
  Topics topics;
  QuestionsSets set;
  inGame({
    super.key,
    required this.set,
    required this.topics,
    required this.loginUser,
  });

  @override
  State<inGame> createState() => _inGameState();
}

class _inGameState extends State<inGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: Icon(Icons.settings, color: Colors.black),
          onPressed: () {
            showSettingsDialog(context);
          },
        ),
      ),
      body: QuestionsView(set: widget.set),
      backgroundColor: Colors.white,
    );
  }
}

class QuestionsView extends StatefulWidget {
  QuestionsSets set;
  QuestionsView({super.key, required this.set});

  @override
  State<QuestionsView> createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> {
  int score = 0;
  int _questionIndex = 0;
  List<Questions> list = [];
  Options? answer;
  Timer? _timer;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Provider.of<QuestionsSetDetailsViewModel>(context, listen: false)
        .getQuestionsSetsList(widget.set.questionsSetID!);
    list = List.from(
        Provider.of<QuestionsSetDetailsViewModel>(context, listen: false)
            .listQuestions);
    // Đặt timer để tự động load dữ liệu mới mỗi 5 giây
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        _questionIndex++;
        Provider.of<OptionsViewModel>(context, listen: false)
            .getOption(list[_questionIndex].questionID);
      });
    });
  }

  Widget _buildCurrentItem() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
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
                list[_questionIndex].questionContent,
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
        Consumer<OptionsViewModel>(builder: (context, viewModel, child) {
          List<Options> listOptions = viewModel.listOption;
          return Column(
            children: [
              RadioListTile<Options>(
                title: Text('${listOptions.first.optionContent}'),
                value: listOptions.first,
                groupValue: answer,
                onChanged: (Options? value) {
                  setState(() {
                    listOptions.first.optionValue ? score++ : 0;
                    _questionIndex++;
                    answer = value!;
                    Provider.of<OptionsViewModel>(context, listen: false)
                        .getOption(list[_questionIndex].questionID);
                  });
                },
              ),
              RadioListTile<Options>(
                title: Text('${listOptions[1].optionContent}'),
                value: listOptions[1],
                groupValue: answer,
                onChanged: (Options? value) {
                  setState(() {
                    listOptions[1].optionValue ? score++ : 0;
                    _questionIndex++;
                    answer = value!;
                    Provider.of<OptionsViewModel>(context, listen: false)
                        .getOption(list[_questionIndex].questionID);
                  });
                },
              ),
              RadioListTile<Options>(
                title: Text('${listOptions[2].optionContent}'),
                value: listOptions[2],
                groupValue: answer,
                onChanged: (Options? value) {
                  setState(() {
                    listOptions[2].optionValue ? score++ : 0;
                    _questionIndex++;
                    answer = value!;
                    Provider.of<OptionsViewModel>(context, listen: false)
                        .getOption(list[_questionIndex].questionID);
                  });
                },
              ),
              RadioListTile<Options>(
                title: Text('${listOptions.last.optionContent}'),
                value: listOptions.last,
                groupValue: answer,
                onChanged: (Options? value) {
                  setState(() {
                    listOptions.last.optionValue ? score++ : 0;
                    _questionIndex++;
                    answer = value!;
                    Provider.of<OptionsViewModel>(context, listen: false)
                        .getOption(list[_questionIndex].questionID);
                  });
                },
              ),
            ],
          );
        }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildCurrentItem();
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
        child: Container(
          width: MediaQuery.of(context).size.width *
              0.7, // Điều chỉnh độ rộng hộp thoại
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                    text: 'Tiếp tục',
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: 'Quay trở lại trang tiêu đề',
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/homePage');
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
