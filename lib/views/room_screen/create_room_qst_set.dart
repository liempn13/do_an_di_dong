import 'package:do_an_di_dong/inGame.dart';
import 'package:do_an_di_dong/models/Users.dart';
import 'package:do_an_di_dong/models/questions_sets.dart';
import 'package:do_an_di_dong/models/topics.dart';
import 'package:do_an_di_dong/view_models/questions_sets_view_model.dart';
import 'package:do_an_di_dong/views/shared_layouts/custom_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class CreateRoomQstSet extends StatefulWidget {
  final Topics? topic;
  final Users? user;
  const CreateRoomQstSet({super.key, required this.user, required this.topic});

  @override
  State<CreateRoomQstSet> createState() => _CreateRoomQstSetState();
}

class _CreateRoomQstSetState extends State<CreateRoomQstSet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chọn bộ đề"),
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
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => inGame(
                  //               setID: questionSetsList[index].questionsSetID!,
                  //             )));
                });
              });
        }
      }),
    );
  }
}
