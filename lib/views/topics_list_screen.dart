import 'package:do_an_di_dong/views/shared_layouts/base_screen.dart';
import 'package:do_an_di_dong/views/shared_layouts/custom_grid_view.dart';
import 'package:flutter/material.dart';

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
        body: CustomGridView(
            dataSet: [],
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    
                  ],
                ),
              );
            }));
  }
}
