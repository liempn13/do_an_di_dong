import 'package:do_an_di_dong/views/shared_layouts/base_screen.dart';
import 'package:do_an_di_dong/views/shared_layouts/custom_grid_view.dart';
import 'package:do_an_di_dong/views/shared_layouts/custom_list_view.dart';
import 'package:do_an_di_dong/views/shared_layouts/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:velocity_x/velocity_x.dart';

class EditQuestionDetailsScreen extends StatefulWidget {
  const EditQuestionDetailsScreen({super.key});

  @override
  State<EditQuestionDetailsScreen> createState() =>
      _EditQuestionDetailsScreenState();
}

class _EditQuestionDetailsScreenState extends State<EditQuestionDetailsScreen> {
  final timeLimit = 0;
  @override
  Widget build(BuildContext context) {
    return BasePage(
        showAppBar: true,
        // showLeadingAction: true,
        appBar: AppBar(
          leading:
              IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
          centerTitle: true,
          title: CustomTextFormField(
            hintText: "Nội dung câu hỏi",
          ),
          actions: [
            SpeedDial(
              elevation: 0,
              icon: Icons.menu,
              buttonSize: const Size(50, 50),
              direction: SpeedDialDirection.down,
              children: [
                SpeedDialChild(
                    label: "Điểm",
                    onTap: () => showDialog<Widget>(
                          context: context,
                          builder: (context) => const Dialog(
                            child: Center(
                                child: Column(
                              children: [],
                            )),
                          ),
                        )),
                SpeedDialChild(
                    label: "Đặt thời gian",
                    onTap: () => showDialog<Widget>(
                        context: context,
                        builder: (BuildContext context) => Dialog(
                              child: Center(
                                  child: Column(
                                children: [
                                  CustomGridView(
                                      dataSet: const [],
                                      itemBuilder: (context, index) =>
                                          TextButton(
                                              onPressed: () {},
                                              child: const Text("20 giây"))),
                                ],
                              )),
                            ))),
                SpeedDialChild(label: "Lưu", onTap: () {}),
                SpeedDialChild(label: "Xoá", onTap: () {}),
                SpeedDialChild(label: "New", onTap: () {}),
              ],
            ).px4()
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Image
              Container(
                width: MediaQuery.of(context).size.width,
                height: 180,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: const Center(),
              ).p8(),
              ListTile(
                title: CustomTextFormField(
                  isReadOnly: true,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {},
                ),
              ),
              //
              ListTile(
                title: CustomTextFormField(
                  isReadOnly: false,
                ),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                ),
              ),
              //
              ListTile(
                title: CustomTextFormField(
                  isReadOnly: false,
                ),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                ),
              ),
              //
              ListTile(
                title: CustomTextFormField(
                  isReadOnly: false,
                ),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ));
  }
}
