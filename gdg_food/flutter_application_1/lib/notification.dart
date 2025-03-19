import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotificationsScreen(),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      "image": "assets/fall.jpeg",
      "name": "Darrell Trivedi",
      "message": "has a new story up.",
      "time": "2 hours ago"
    },
    {
      "image": "assets/winter.jpeg",
      "name": "Darrell Trivedi",
      "message": "has a new story up.",
      "time": "2 hours ago"
    },
    {
      "image": "assets/spring1.jpeg",
      "name": "Darrell Trivedi",
      "message": "has a new story up.",
      "time": "2 hours ago"
    },
    {
      "image": "assets/snow.jpeg",
      "name": "Darrell Trivedi",
      "message": "has a new story up.",
      "time": "2 hours ago"
    },
    {
      "image": "assets/library.jpeg",
      "name": "Darrell Trivedi",
      "message": "has a new story up.",
      "time": "2 hours ago"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Notifications",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(icon: Icon(Icons.search, color: Colors.black), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionTitle("New"),
            notificationList(notifications, isNew: true),
            sectionTitle("Earlier"),
            notificationList(notifications, isNew: false),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget notificationList(List<Map<String, String>> items, {bool isNew = false}) {
    return Column(
      children: items
          .map(
            (item) => Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: isNew ? Colors.blue.shade50 : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(item["image"]!),
                    radius: 25,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            children: [
                              TextSpan(
                                text: "${item["name"]} ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: item["message"]),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          item["time"]!,
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.more_horiz, color: Colors.grey),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
