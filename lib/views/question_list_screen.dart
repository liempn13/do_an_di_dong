import 'package:do_an_di_dong/models/questions.dart';
import 'package:do_an_di_dong/view_models/options_view_model.dart';
import 'package:do_an_di_dong/view_models/questions_set_details_view_model.dart';
import 'package:do_an_di_dong/view_models/questions_view_model.dart';
import 'package:do_an_di_dong/views/shared_layouts/base_screen.dart';
import 'package:do_an_di_dong/views/shared_layouts/custom_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/options.dart';

class QuestionListScreen extends StatefulWidget {
  int setID;

  QuestionListScreen({super.key, required this.setID});

  @override
  State<QuestionListScreen> createState() => _QuestionListScreenState();
}

class _QuestionListScreenState extends State<QuestionListScreen> {
  List<Questions> list = [];

  @override
  void dispose() {
    widget.setID = 0; //đặt lại mã bộ đề nếu thoát trang
    list = [];
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    // Gọi API hoặc load dữ liệu tại đây
    await Provider.of<QuestionsSetDetailsViewModel>(context)
        .getQuestionsSetsList(widget.setID);
    list = List.from(
        Provider.of<QuestionsSetDetailsViewModel>(context).listQuestions);
  }

  // @override
  // void didChangeDependencies() {
  //   // Xử lí gọi danh sách câu hỏi ra ở đây, thứ tự câu đã được random ở APi
  //   super.didChangeDependencies();
  //   Provider.of<QuestionsSetDetailsViewModel>(context)
  //       .getQuestionsSetsList(widget.setID);
  //   list = List.from(
  //       Provider.of<QuestionsSetDetailsViewModel>(context).listQuestions);
  // }

  @override
  Widget build(BuildContext context) {
    return BasePage(
        body: SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    ));
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {});
      },
      children: list.map<ExpansionPanel>((Questions item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.questionContent),
            );
          },
          body:
              Consumer<OptionsViewModel>(builder: (context, viewModel, child) {
            Provider.of<OptionsViewModel>(context, listen: false)
                .getOption(item.questionID);
            List listOptions = viewModel.listOption;
            return Column(
              children: [
                ListTile(
                  title: Text('${listOptions.first.optionContent}'),
                ),
                ListTile(
                  title: Text('${listOptions[1].optionContent}'),
                ),
                ListTile(
                  title: Text('${listOptions[2].optionContent}'),
                ),
                ListTile(
                  title: Text('${listOptions.last.optionContent}'),
                ),
              ],
            );
          }),
          isExpanded: true,
        );
      }).toList(),
    );
  }
}
