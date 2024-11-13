import 'package:do_an_di_dong/models/options.dart';
import 'package:do_an_di_dong/models/questions.dart';
import 'package:do_an_di_dong/models/questions_sets.dart';
import 'package:do_an_di_dong/view_models/options_view_model.dart';
import 'package:do_an_di_dong/view_models/questions_set_details_view_model.dart';
import 'package:do_an_di_dong/views/shared_layouts/base_screen.dart';
import 'package:do_an_di_dong/views/shared_layouts/custom_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';

class QuestionListScreen extends StatefulWidget {
  final QuestionsSets? set;

  QuestionListScreen({super.key, this.set});

  @override
  State<QuestionListScreen> createState() => _QuestionListScreenState();
}

class _QuestionListScreenState extends State<QuestionListScreen> {
  bool _expanded = false;
  int _questionIndex = 0;

  List<Questions> list = [];
  List<Options> listOptions = [];

  @override
  void initState() {
    super.initState();
    Provider.of<QuestionsSetDetailsViewModel>(context, listen: false)
        .getQuestionsSetsList(widget.set!.questionsSetID!);
    list = List.from(
        Provider.of<QuestionsSetDetailsViewModel>(context, listen: false)
            .listQuestions);
  }

  @override
  void dispose() {
    //đặt lại mã bộ đề nếu thoát trang
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(widget.set!.questionsSetName),
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
      body: Consumer<QuestionsSetDetailsViewModel>(
          builder: (context, viewModel, child) {
        if (!viewModel.fetchingData && viewModel.listQuestions.isEmpty) {
          Provider.of<QuestionsSetDetailsViewModel>(context, listen: false)
              .getQuestionsSetsList(widget.set!.questionsSetID!);
        }
        if (viewModel.fetchingData) {
          // While data is being fetched
          return const Center(child: CircularProgressIndicator());
        } else {
          list = viewModel.listQuestions;
          return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, questionIndex) {
                return Column(
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: ExpansionPanelList(
                          children: [
                            ExpansionPanel(
                              headerBuilder: (context, isExpanded) {
                                return ListTile(
                                  title: Text(
                                    list[questionIndex].questionContent,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              },
                              body: Container(
                                  height: 300,
                                  child: Consumer<OptionsViewModel>(
                                    builder: (context, option, child) {
                                      listOptions = option.listOption;
                                      return ListView.builder(
                                          itemCount: listOptions.length,
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              title: Text(listOptions[index]
                                                  .optionContent),
                                            );
                                          });
                                    },
                                  )),
                              isExpanded: _expanded,
                              canTapOnHeader: true,
                            )
                          ],
                          dividerColor: Colors.grey,
                          expansionCallback: (panelIndex, isExpanded) {
                            _expanded = !_expanded;
                            setState(() {});
                          },
                        ),
                      ),
                    )
                  ],
                );
              });
        }
      }),
    );
  }
}
