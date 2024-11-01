import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  Color BGEXP = Color.fromARGB(255, 173, 73, 225);
  Color BGWin = Color.fromARGB(255, 235, 211, 248);
  Color TextEXP = Colors.white;
  Color TextWin = Colors.black;
  double fsexp = 20;
  double fswin = 15;
  int count = 4;
  int newValue = 0;

  void updateEXP() {
    setState(() {
      BGEXP = Color.fromARGB(255, 173, 73, 225);
      TextEXP = Colors.white;
      BGWin = Color.fromARGB(255, 235, 211, 248);
      TextWin = Colors.black;
      fsexp = 20;
      fswin = 15;
    });
  }

  void updateWin() {
    setState(() {
      BGWin = Color.fromARGB(255, 173, 73, 225);
      TextWin = Colors.white;
      BGEXP = Color.fromARGB(255, 235, 211, 248);
      TextEXP = Colors.black;
      fsexp = 15;
      fswin = 20;
    });
  }
//   int incrementAndReturn() {
//   setState(() {
//     count++;
//   });
//   return count; // Trả về giá trị mới
// }
  // int updateCount(){
  //   setState(() {
  //     count++;
  //   });
  //   return count;
  // }
//   Future<void> incrementCounter() async {
//   setState(() {
//     count++;
//   });

//   // Đợi một chút để `setState` hoàn thành
//   await Future.delayed(Duration.zero);

//   print(count);

// }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Gọi setState sau khi build hoàn thành
      setState(() {
        // Cập nhật trạng thái ở đây
        count++;
      });
    });
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 122, 28, 172),
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 60,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 235, 211, 248),
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                children: [
                  const SizedBox(
                    width: 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      updateEXP();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.39,
                      height: 55,
                      decoration: BoxDecoration(
                          color: BGEXP,
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(
                        child: Text(
                          'BXH EXP',
                          style: TextStyle(
                              color: TextEXP,
                              fontSize: fsexp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: updateWin,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 55,
                      decoration: BoxDecoration(
                          color: BGWin,
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(
                        child: Text('BXH Thắng',
                            style: TextStyle(
                                color: TextWin,
                                fontSize: fswin,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                height: 400,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/ranked.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: Row(
                  children: [
                    // Hạng nhì
                    Padding(
                        padding: const EdgeInsets.only(left: 20, top: 140),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                left: 0,
                              ),
                              child: Text(
                                'Cristiano Ronaldo',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child: Container(
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 2),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: const Center(
                                    child: Text('Avatar'),
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(top: 7),
                              child: Container(
                                width: 80,
                                height: 30,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    color: Color.fromARGB(255, 235, 211, 248)),
                                child: const Center(
                                  child: Text('1024 exp'),
                                ),
                              ),
                            ),
                          ],
                        )),
                    // Hạng nhất
                    Padding(
                        padding: const EdgeInsets.only(left: 7, top: 25),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 0),
                              child: Text(
                                'Huynh Gia Bao',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child: Container(
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 2),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: const Center(
                                    child: Text('Avatar'),
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(top: 7),
                              child: Container(
                                width: 80,
                                height: 30,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    color: Color.fromARGB(255, 235, 211, 248)),
                                child: const Center(
                                  child: Text('2024 exp'),
                                ),
                              ),
                            ),
                          ],
                        )),
                    // Hạng ba
                    Padding(
                        padding: const EdgeInsets.only(left: 25, top: 145),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 0),
                              child: Text(
                                'Leneol Messi',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child: Container(
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 2),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: const Center(
                                    child: Text('Avatar'),
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(top: 7),
                              child: Container(
                                width: 80,
                                height: 30,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    color: Color.fromARGB(255, 235, 211, 248)),
                                child: const Center(
                                  child: Text('998 exp'),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            // Top >3
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
              child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: 300,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                    color: Color.fromARGB(255, 235, 211, 248),
                  ),
                  child: ListView.builder(
                      itemCount: 18,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 15, right: 15),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 80,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 173, 73, 255),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
                                        color:
                                            Color.fromARGB(255, 235, 211, 248),
                                      ),
                                      child: Center(
                                        child: Text((index + 3).toString()),
                                      )),
                                ),
                                Padding(padding: const EdgeInsets.only(left: 13),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                                  color: Colors.black,
                                  ),
                                  
                                ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                    Padding(
                                      padding: EdgeInsets.only(top: 17),
                                      child: Text('Tên người dùng', style: TextStyle(fontSize: 20),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 6),
                                      child: Text('000 EXP', style: TextStyle(fontSize: 13),),
                                    )
                                  ]),
                                )
                              ],
                            ),
                          ),
                        );
                      })),
            ),
          ],
        ),
      ),
    );
  }
}
