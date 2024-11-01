import 'package:flutter/material.dart';

class InviteListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'ID người chơi',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: CircleAvatar(child: Icon(Icons.person)),
                  title: Text("Diên111"),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    child: Text("Kết bạn"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(child: Icon(Icons.person)),
                  title: Text("Diên321"),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    child: Text("Kết bạn"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(child: Icon(Icons.person)),
                  title: Text("Diên1111111"),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    child: Text("Kết bạn"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(child: Icon(Icons.person)),
                  title: Text("DiênDiên"),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    child: Text("Kết bạn"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
