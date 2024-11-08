import 'package:do_an_di_dong/inGame.dart';
import 'package:do_an_di_dong/models/questions_sets.dart';
import 'package:do_an_di_dong/models/topics.dart';
import 'package:do_an_di_dong/view_models/questions_sets_view_model.dart';
import 'package:do_an_di_dong/views/shared_layouts/base_screen.dart';
import 'package:do_an_di_dong/views/shared_layouts/custom_grid_view.dart';
import 'package:do_an_di_dong/views/shared_layouts/custom_text_form_field.dart';
import 'package:do_an_di_dong/views/topics_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class QuestionSetScreen extends StatefulWidget {
  final Topics? topic;

  const QuestionSetScreen({super.key, this.topic});

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
      actions: [
        SpeedDial(
          elevation: 0,
          icon: Icons.menu,
          buttonSize: Size(50, 50),
          direction: SpeedDialDirection.down,
          children: [
            // SpeedDialChild(label: "Save", onTap: () {}),
            // SpeedDialChild(
            //     label: "Delete",
            // onTap: () => showDialog<Widget>(
            //     context: context,
            //     builder: (context) => Dialog(
            //           child: Center(
            //               child: Column(
            //             children: [

            //             ],
            //           )),
            //         ))),
            SpeedDialChild(
                label: "New",
                onTap: () => showDialog<Widget>(
                    context: context,
                    builder: (context) => Dialog(
                          child: Center(
                              child: Column(
                            children: [
                              CustomTextFormField(
                                hintText: "Tên bộ đề ",
                                textEditingController: setNameTxt,
                              ),
                              CustomTextFormField(
                                hintText: "Số lượng câu ",
                                textEditingController: questionQuantityTxt,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Provider.of<QuestionsSetViewModel>(context,
                                            listen: false)
                                        .addQuestionsSets(QuestionsSets(
                                            topicID: widget.topic!.topicID!,
                                            questionQuantity: int.parse(
                                                questionQuantityTxt.text),
                                            questionsSetName: setNameTxt.text));
                                    initState();
                                  },
                                  child: Text("Thêm"))
                            ],
                          )),
                        ))),
          ],
        ).px4()
      ],
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => inGame()));
                });
              });
        }
      }),
    );
  }
}
