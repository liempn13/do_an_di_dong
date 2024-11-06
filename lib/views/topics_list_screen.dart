import 'package:do_an_di_dong/models/topics.dart';
import 'package:do_an_di_dong/view_models/topics_view_model.dart';
import 'package:do_an_di_dong/views/shared_layouts/base_screen.dart';
import 'package:do_an_di_dong/views/shared_layouts/custom_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopicsListScreen extends StatefulWidget {
  const TopicsListScreen({super.key});

  @override
  State<TopicsListScreen> createState() => _TopicsListScreenState();
}

class _TopicsListScreenState extends State<TopicsListScreen> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      title: "CHỌN CHỦ ĐỀ",
      actions: [],
      body: Consumer<TopicsViewModel>(builder: (context, viewModel, child) {
        if (!viewModel.fetchingData && viewModel.listTopics.isEmpty) {
          Provider.of<TopicsViewModel>(context, listen: false).getTopicsList();
        }
        if (viewModel.fetchingData) {
          // While data is being fetched
          return Center(child: CircularProgressIndicator());
        } else {
          List<Topics> topicList = viewModel.listTopics;
          return CustomGridView(
              dataSet: topicList,
              itemBuilder: (context, index) {
                return Card(
                    child: Center(child: Text(topicList[index].topicName)));
              });
        }
      }),
    );
  }
}
