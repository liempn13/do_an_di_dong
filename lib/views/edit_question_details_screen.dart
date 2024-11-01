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
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
          centerTitle: true,
          title: CustomTextFormField(
            hintText: "Your question",
          ),
          actions: [
            SpeedDial(
              elevation: 0,
              icon: Icons.menu,
              buttonSize: Size(50, 50),
              direction: SpeedDialDirection.down,
              children: [
                SpeedDialChild(
                    label: "Points",
                    onTap: () => showDialog<Widget>(
                          context: context,
                          builder: (context) => Dialog(
                            child: Center(
                                child: Column(
                              children: [],
                            )),
                          ),
                        )),
                SpeedDialChild(
                    label: "Set time limit",
                    onTap: () => showDialog<Widget>(
                        context: context,
                        builder: (BuildContext context) => Dialog(
                              child: Center(
                                  child: Column(
                                children: [
                                  CustomGridView(
                                      dataSet: [],
                                      itemBuilder: (context, index) =>
                                          TextButton(
                                              onPressed: () {},
                                              child: Text("20 sec"))),
                                ],
                              )),
                            ))),
                SpeedDialChild(label: "Save", onTap: () {}),
                SpeedDialChild(
                    label: "Delete",
                    onTap: () => showDialog<Widget>(
                        context: context,
                        builder: (context) => Dialog(
                              child: Center(
                                  child: Column(
                                children: [],
                              )),
                            ))),
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
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(),
              ).p8(),
              ListTile(
                title: CustomTextFormField(
                  isReadOnly: true,
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
