import 'package:flutter/material.dart';

class BattleRecord {
  final String player1Name;
  final String player2Name;
  final int player1Score;
  final int player2Score;
  final String time;
  final String topic;

  BattleRecord({
    required this.player1Name,
    required this.player2Name,
    required this.player1Score,
    required this.player2Score,
    required this.time,
    required this.topic,
  });
}

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<BattleRecord> battleRecords = [
    BattleRecord(
        player1Name: 'DiênFake',
        player2Name: 'Diênlimited',
        player1Score: 5,
        player2Score: 3,
        time: '9:41',
        topic: 'Chủ đề: Phản xạ nhanh'),
    BattleRecord(
        player1Name: 'DiênFake',
        player2Name: 'Diênlimited',
        player1Score: 4,
        player2Score: 3,
        time: '9:41',
        topic: 'Chủ đề: Nhớ nhanh'),
    BattleRecord(
        player1Name: 'DiênFake',
        player2Name: '',
        player1Score: 43,
        player2Score: 0,
        time: '9:41',
        topic: 'Chủ đề: Kỹ năng đặc biệt'),
    BattleRecord(
        player1Name: 'DiênFake',
        player2Name: 'Diênlimited',
        player1Score: 3,
        player2Score: 2,
        time: '9:41',
        topic: 'Chủ đề: Đối đầu kịch tính'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lịch sử đấu',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        itemCount: battleRecords.length,
        itemBuilder: (context, index) {
          //thẻ cho mỗi bản ghi trận đấu
          return BattleRecordCard(record: battleRecords[index]);
        },
      ),
    );
  }
}

// Thẻ hiển thị thông tin từng trận đấu
class BattleRecordCard extends StatelessWidget {
  final BattleRecord record; // Bản ghi trận đấu hiện tại

  BattleRecordCard({required this.record});

  @override
  Widget build(BuildContext context) {
    // kt nếu chỉ có một người chơi (người chơi 2 rỗng)
    bool isSinglePlayer = record.player2Name.isEmpty;

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PlayerInfo(
                    name:
                        record.player1Name), // Hiển thị thông tin người chơi 1
                if (!isSinglePlayer) // 2 ng chơi thì có chữ vs
                  Text('VS',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                if (!isSinglePlayer) PlayerInfo(name: record.player2Name),
              ],
            ),
            SizedBox(height: 8),
            Text(record.topic,
                style: TextStyle(fontSize: 14, color: Colors.black54)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ScoreBox(score: record.player1Score), // điểm của người chơi 1
                Text(record.time,
                    style:
                        TextStyle(color: Colors.black54)), // thời gian trận đấu
                if (!isSinglePlayer)
                  ScoreBox(
                      score:
                          record.player2Score), // điểm của người chơi 2 nếu có
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// thông tin người chơi
class PlayerInfo extends StatelessWidget {
  final String name;

  PlayerInfo({required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 20,
          child: Icon(Icons.person, color: Colors.white),
        ),
        SizedBox(height: 4),
        Text(
          name,
          style: TextStyle(fontSize: 14),
          overflow: TextOverflow.ellipsis, // cắt chữ khi tên quá dài
        ),
      ],
    );
  }
}

// điểm của người chơi
class ScoreBox extends StatelessWidget {
  final int score;

  ScoreBox({required this.score});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        score.toString(),
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
