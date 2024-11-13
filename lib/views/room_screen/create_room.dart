import 'package:do_an_di_dong/models/Users.dart';
import 'package:do_an_di_dong/models/topics.dart';
import 'package:do_an_di_dong/view_models/topics_view_model.dart';
import 'package:do_an_di_dong/views/question_set_screen.dart';
import 'package:do_an_di_dong/views/room_screen/create_room_qst_set.dart';
import 'package:do_an_di_dong/views/shared_layouts/custom_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class CreateRoom extends StatefulWidget {
  final Users? users;
  const CreateRoom({super.key, required this.users});

  @override
  State<CreateRoom> createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Quay lại trang trước
          },
        ),
        title: const Text("Chọn chủ đề"),
        backgroundColor: Colors.deepPurple,
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
                          builder: (context) => CreateRoomQstSet(
                                topic: topicList[index],
                                user: widget.users,
                              )));
                });
              });
        }
      }),
    );
  }
}