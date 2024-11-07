import 'package:do_an_di_dong/models/options.dart';
import 'package:do_an_di_dong/models/questions.dart';
import 'package:do_an_di_dong/view_models/options_view_model.dart';
import 'package:do_an_di_dong/views/shared_layouts/custom_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class inGame extends StatefulWidget {
  Questions? questions;
  inGame({super.key, this.questions});

  @override
  State<inGame> createState() => _inGameState();
}

class _inGameState extends State<inGame> {
  @override
  void initState() {
    Provider.of<OptionsViewModel>(context, listen: false)
        .getOption(widget.questions!.questionID);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.settings, color: Colors.black),
          onPressed: () {
            showSettingsDialog(context);
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
              height: 32.0), // Khoảng cách giữa AppBar đến phần câu hỏi
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
                //Noi dung cau hoi
                child: Text(
                  widget.questions!.questionContent,
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
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Consumer<OptionsViewModel>(
                  builder: (context, viewModel, child) {
                Provider.of<OptionsViewModel>(context, listen: false)
                    .getOption(widget.questions!.questionID);
                List<Options> optionList = viewModel.listOption;
                return CustomListView(
                    dataSet: optionList,
                    itemBuilder: (context, index) {
                      return OptionButton(
                          option: optionList[index].optionContent);
                    });
              })),
          const SizedBox(
              height: 32.0), // Cách đều phần dưới với các câu trả lời
        ],
      ),
      backgroundColor: Colors.white,
    );
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
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(text: 'Option 1'),
                SizedBox(height: 16),
                CustomButton(text: 'Option 2'),
                SizedBox(height: 16),
                CustomButton(text: 'Option 3'),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;

  const CustomButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final String option;
  const OptionButton({super.key, required this.option});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, // Màu nền của nút
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0, // Loại bỏ đổ bóng cho nút
          ),
          onPressed: () {},
          child: Align(
            alignment: Alignment.centerLeft, // Căn chữ về bên trái
            child: Text(
              option,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
