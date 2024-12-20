import 'package:do_an_di_dong/models/users.dart';
import 'package:do_an_di_dong/models/topics.dart';
import 'package:do_an_di_dong/view_models/topics_view_model.dart';
import 'package:do_an_di_dong/views/question_set_screen.dart';
import 'package:do_an_di_dong/views/shared_layouts/base_screen.dart';
import 'package:do_an_di_dong/views/shared_layouts/custom_grid_view.dart';
import 'package:do_an_di_dong/views/shared_layouts/custom_text_form_field.dart';
import 'package:do_an_di_dong/views/shared_layouts/ui_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class TopicsListScreen extends StatefulWidget {
  Users? users;
  TopicsListScreen({super.key, this.users});

  @override
  State<TopicsListScreen> createState() => _TopicsListScreenState();
}

class _TopicsListScreenState extends State<TopicsListScreen> {
  @override
  void initState() {
    Provider.of<TopicsViewModel>(context, listen: false).getTopicsList();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController topicNameTxt = TextEditingController();
    return BasePage(
      showAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Center(
          child: Text(
            "Chọn chủ đề",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          widget.users!.isAdmin
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
                                      height: 200,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Center(
                                              child: CustomTextFormField(
                                            hintText: "Tên chủ đề",
                                            textEditingController: topicNameTxt,
                                          ).p8()),
                                          ElevatedButton(
                                              onPressed: () {
                                                Provider.of<TopicsViewModel>(
                                                        context,
                                                        listen: false)
                                                    .addTopic(Topics(
                                                        topicName:
                                                            topicNameTxt.text));
                                                Navigator.pop(context, true);
                                                initState();
                                              },
                                              child: Text("Thêm"))
                                        ],
                                      )),
                                ))),
                  ],
                ).px4()
              : UiSpacer.emptySpace()
        ],
      ),
      body: Consumer<TopicsViewModel>(builder: (context, viewModel, child) {
        if (!viewModel.fetchingData && viewModel.listTopics.isEmpty) {
          Provider.of<TopicsViewModel>(context, listen: false).getTopicsList();
        }
        if (viewModel.fetchingData) {
          // While data is being fetched
          return const Center(child: CircularProgressIndicator());
        } else {
          List<Topics> topicList = viewModel.listTopics;
          return CustomGridView(
              dataSet: topicList,
              itemBuilder: (context, index) {
                return Card(
                        child: Center(child: Text(topicList[index].topicName)))
                    .onInkTap(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuestionSetScreen(
                                topic: topicList[index],
                                user: widget.users!,
                              )));
                });
              });
        }
      }),
    );
  }
}
