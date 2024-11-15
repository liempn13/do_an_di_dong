import 'package:do_an_di_dong/inGame.dart';
import 'package:do_an_di_dong/models/users.dart';
import 'package:do_an_di_dong/models/questions_sets.dart';
import 'package:do_an_di_dong/models/topics.dart';
import 'package:do_an_di_dong/view_models/questions_sets_view_model.dart';
import 'package:do_an_di_dong/views/question_list_screen.dart';
import 'package:do_an_di_dong/views/shared_layouts/base_screen.dart';
import 'package:do_an_di_dong/views/shared_layouts/custom_grid_view.dart';
import 'package:do_an_di_dong/views/shared_layouts/custom_text_form_field.dart';
import 'package:do_an_di_dong/views/shared_layouts/ui_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class QuestionSetScreen extends StatefulWidget {
  Topics? topic;
  Users? user;
  QuestionSetScreen({super.key, this.topic, this.user});

  @override
  State<QuestionSetScreen> createState() => _QuestionSetScreenState();
}

class _QuestionSetScreenState extends State<QuestionSetScreen> {
  @override
  void initState() {
    Provider.of<QuestionsSetViewModel>(context, listen: false)
        .getQuestionsSetsList(widget.topic!.topicID!);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController setNameTxt = TextEditingController();
    TextEditingController questionQuantityTxt = TextEditingController();

    return BasePage(
      showAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Center(
          child: Text(
            widget.topic!.topicName,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          widget.user!.isAdmin
              ? SpeedDial(
                  elevation: 0,
                  icon: Icons.menu,
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  buttonSize: Size(50, 50),
                  direction: SpeedDialDirection.down,
                  children: [
                    SpeedDialChild(
                        label: "Tạo",
                        onTap: () => showDialog<Widget>(
                            context: context,
                            builder: (context) => Dialog(
                                  child: Container(
                                      height: 250,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomTextFormField(
                                            hintText: "Tên bộ đề ",
                                            textEditingController: setNameTxt,
                                          ).px8(),
                                          CustomTextFormField(
                                            hintText: "Số lượng câu ",
                                            textEditingController:
                                                questionQuantityTxt,
                                          ).p8(),
                                          ElevatedButton(
                                              onPressed: () {
                                                Provider.of<
                                                    QuestionsSetViewModel>(
                                                  context,
                                                ).addQuestionsSets(QuestionsSets(
                                                    topicID:
                                                        widget.topic!.topicID!,
                                                    questionQuantity: int.parse(
                                                        questionQuantityTxt
                                                            .text),
                                                    questionsSetName:
                                                        setNameTxt.text));
                                                initState();
                                              },
                                              child: Text("Thêm"))
                                        ],
                                      )),
                                ))),
                    SpeedDialChild(
                        label: "Sửa",
                        onTap: () => showDialog<Widget>(
                            context: context, builder: (context) => Dialog()))
                  ],
                ).px4()
              : UiSpacer.emptySpace()
        ],
      ),
      body:
          Consumer<QuestionsSetViewModel>(builder: (context, viewModel, child) {
        if (!viewModel.fetchingData && viewModel.listQuestionSets.isEmpty) {
          Provider.of<QuestionsSetViewModel>(context, listen: false)
              .getQuestionsSetsList(widget.topic!.topicID!);
        }
        if (viewModel.fetchingData) {
          // While data is being fetched
          return const Center(child: CircularProgressIndicator());
        } else {
          List<QuestionsSets> questionSetsList = viewModel.listQuestionSets;
          return CustomGridView(
              dataSet: questionSetsList,
              itemBuilder: (context, index) {
                return Card(
                        child: Center(
                            child:
                                Text(questionSetsList[index].questionsSetName)))
                    .onInkTap(() {
                  widget.user!.isAdmin
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuestionListScreen(
                                    set: questionSetsList[index],
                                  )))
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => inGame(
                                    set: questionSetsList[index],
                                    topics: widget.topic!,
                                    loginUser: widget.user!,
                                  )));
                });
              });
        }
      }),
    );
  }
}
