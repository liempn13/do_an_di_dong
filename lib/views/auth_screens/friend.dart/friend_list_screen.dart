import 'package:flutter/material.dart';
import 'invite_list_screen.dart';

class FriendListScreen extends StatefulWidget {
  const FriendListScreen({super.key});

  @override
  _FriendListScreenState createState() => _FriendListScreenState();
}

class _FriendListScreenState extends State<FriendListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Danh sách bạn bè',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Colors.purple,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: "BẠN BÈ"),
              Tab(text: "Lời mời kết bạn"),
            ],
          ),
          if (_tabController.index == 0)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'ID người chơi',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView(
                  children: [
                    ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.person)),
                      title: const Text("Diênlimited"),
                      subtitle: const Text("Tỉ số: 5-3"),
                      trailing: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                        ),
                        child: const Text("Thách đấu"),
                      ),
                    ),
                    ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.person)),
                      title: const Text("Diên123"),
                      subtitle: const Text("Tỉ số: 7-12"),
                      trailing: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                        ),
                        child: const Text("Thách đấu"),
                      ),
                    ),
                    ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.person)),
                      title: const Text("Diên123vippro"),
                      subtitle: const Text("Tỉ số: 0-0"),
                      trailing: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                        ),
                        child: const Text("Thách đấu"),
                      ),
                    ),
                    ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.person)),
                      title: const Text("Diênn111"),
                      subtitle: const Text("Tỉ số: 5-5"),
                      trailing: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                        ),
                        child: const Text("Thách đấu"),
                      ),
                    ),
                  ],
                ),
                const InviteListScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
