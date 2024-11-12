import 'package:do_an_di_dong/inGame.dart';
import 'package:do_an_di_dong/models/questions.dart';
import 'package:do_an_di_dong/models/questions_sets.dart';
import 'package:do_an_di_dong/view_models/options_view_model.dart';
import 'package:do_an_di_dong/view_models/questions_set_details_view_model.dart';
import 'package:do_an_di_dong/view_models/questions_view_model.dart';
import 'package:do_an_di_dong/views/shared_layouts/base_screen.dart';
import 'package:do_an_di_dong/views/shared_layouts/custom_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';

import '../models/options.dart';

class QuestionListScreen extends StatefulWidget {
  QuestionsSets set;

  QuestionListScreen({super.key, required this.set});

  @override
  State<QuestionListScreen> createState() => _QuestionListScreenState();
}

class _QuestionListScreenState extends State<QuestionListScreen> {
  List<Questions> list = [];

  @override
  void dispose() {
    //đặt lại mã bộ đề nếu thoát trang
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
        .getQuestionsSetsList(widget.set.questionsSetID!);
    list = List.from(
        Provider.of<QuestionsSetDetailsViewModel>(context).listQuestions);
  }

  @override
  void didChangeDependencies() {
    // Xử lí gọi danh sách câu hỏi ra ở đây, thứ tự câu đã được random ở APi
    super.didChangeDependencies();
    Provider.of<QuestionsSetDetailsViewModel>(context)
        .getQuestionsSetsList(widget.set.questionsSetID!);
    list = List.from(
        Provider.of<QuestionsSetDetailsViewModel>(context).listQuestions);
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
        showAppBar: true,
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: Text(widget.set.questionsSetName),
          centerTitle: true,
          backgroundColor: Colors.purple,
          actions: [
            SpeedDial(
              direction: SpeedDialDirection.down,
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
              elevation: 0,
              child: Icon(Icons.menu),
              children: [
                SpeedDialChild(
                  label: "Thêm câu hỏi",
                  onTap: () => showDialog<Widget>(
                      builder: (context) {
                        return Dialog();
                      },
                      context: context),
                )
              ],
            )
          ],
        ),
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
          body: Container(),
          isExpanded: false,
        );
      }).toList(),
    );
  }
}
