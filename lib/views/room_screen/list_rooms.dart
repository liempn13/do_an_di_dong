import 'package:flutter/material.dart';

class ListRoomScreen extends StatefulWidget {
  const ListRoomScreen({super.key});

  @override
  State<ListRoomScreen> createState() => _ListRoomScreenState();
}

class _ListRoomScreenState extends State<ListRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 122, 28, 172),
      appBar: AppBar(
        title: const Text("Room Screen"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'ID',
                      suffixIcon: const Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            color: Colors.blueAccent, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    // Thêm hành động khi nhấn vào nút "Tạo phòng"
                    print('Tạo phòng được nhấn');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 235, 211, 248),
                    ),
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 50,
                    child: const Center(
                      child: Text(
                        'Tạo phòng',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      width: double.infinity,
                      height: 230,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage('assets/img/bgroom.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 4, color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(child: Text('Avatar')),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 7),
                                      child: Center(
                                        child: Text(
                                          'Tên người chơi',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ]),

                                  Column(children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 50),
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 4, color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(child: Text('Avatar')),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 7),
                                      child: Center(
                                        child: Text(
                                          'Tên người chơi',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ]),
                                  Column(children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 50),
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 4, color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(child: Text('Avatar')),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 7),
                                      child: Center(
                                        child: Text(
                                          'Tên người chơi',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ]),
                                  Column(children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 1),
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 4, color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(child: Text('Avatar')),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 7),
                                      child: Center(
                                        child: Text(
                                          'Tên người chơi',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ]),
                                ],
                              ),

                              Padding(padding: EdgeInsets.only(top: 17),
                              child: Center(
                                child: Text('Tên chủ đề', style: TextStyle(fontSize: 25, color: Colors.white),),
                              ),),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.join_inner_outlined), label: Text('Vào Phòng'))
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}