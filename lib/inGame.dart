import 'dart:async';
import 'dart:math';

import 'package:do_an_di_dong/custombutton_popup.dart';
import 'package:do_an_di_dong/models/questions.dart';
import 'package:do_an_di_dong/models/options.dart';
import 'package:do_an_di_dong/view_models/options_view_model.dart';
import 'package:do_an_di_dong/view_models/questions_set_details_view_model.dart';
import 'package:do_an_di_dong/views/shared_layouts/ui_spacer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class inGame extends StatelessWidget {
  int setID;
  inGame({
    super.key,
    required this.setID,
  });

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
      body: QuestionsView(setID: setID),
      backgroundColor: Colors.white,
    );
  }
}

class QuestionsView extends StatefulWidget {
  int setID;
  QuestionsView({super.key, required this.setID});

  @override
  State<QuestionsView> createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> {
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
        .getQuestionsSetsList(widget.setID);
    list = List.from(
        Provider.of<QuestionsSetDetailsViewModel>(context, listen: false)
            .listQuestions);
    // Đặt timer để tự động load dữ liệu mới mỗi 5 giây
    // _timer = Timer.periodic(Duration(seconds: 5), (timer) {
    //   setState(() {
    //     _questionIndex++;
    Provider.of<OptionsViewModel>(context, listen: false)
        .getOption(list[_questionIndex].questionID);
    // });
    // });
  }

  Widget _buildCurrentItem() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _questionIndex == 0
                ? UiSpacer.emptySpace()
                : IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      setState(() {
                        _questionIndex--;
                        Provider.of<OptionsViewModel>(context, listen: false)
                            .getOption(list[_questionIndex].questionID);
                      });
                    }, // Câu trước
                  ),
            _questionIndex == list.lastIndex
                ? UiSpacer.emptySpace()
                : IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      setState(() {
                        _questionIndex++;
                        Provider.of<OptionsViewModel>(context, listen: false)
                            .getOption(list[_questionIndex].questionID);
                      });
                    }, // Câu tiếp theo
                  ),
          ],
        ),
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
                    answer = value!;
                  });
                },
              ),
              RadioListTile<Options>(
                title: Text('${listOptions[1].optionContent}'),
                value: listOptions[1],
                groupValue: answer,
                onChanged: (Options? value) {
                  setState(() {
                    answer = value!;
                  });
                },
              ),
              RadioListTile<Options>(
                title: Text('${listOptions[2].optionContent}'),
                value: listOptions[2],
                groupValue: answer,
                onChanged: (Options? value) {
                  setState(() {
                    answer = value!;
                  });
                },
              ),
              RadioListTile<Options>(
                title: Text('${listOptions.last.optionContent}'),
                value: listOptions.last,
                groupValue: answer,
                onChanged: (Options? value) {
                  setState(() {
                    answer = value!;
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
