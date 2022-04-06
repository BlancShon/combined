import 'package:flutter/material.dart';
import 'package:medicine/pages/mainPage.dart';
import 'package:medicine/repositories/hive.dart';
import 'package:medicine/repositories/medicine_history_repository.dart';
import 'package:medicine/repositories/medicine_repository.dart';
import 'package:medicine/services/notification_service.dart';
import 'package:medicine/calendar/calendar.dart';
import 'package:medicine/calendar/event.dart';
import 'package:medicine/calendar/sp_utils.dart';
import 'package:medicine/calendar/todo_storage.dart';
import 'package:flutter/cupertino.dart';

final notification = NotificationService();
final hive = HiveStorage();
final medicineRepository = MedicineRepository();
final historyRepository = MedicineHistoryRepository();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final notification = NotificationService();
  await notification.initializeTimeZone();
  await notification.initializeNotification();
  await hive.initializeHive();
  await SpUtils().init().then((value) => null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do List',
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('To Do List With Medicine',
            style: Theme.of(context).textTheme.headline4),
        backgroundColor: Colors.blue[600],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 1,
            ),
            SizedBox(
              height: 250,
              width: 250,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/icon.png'),
                backgroundColor: Colors.blue[600],
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new Calendar()),
                );
              },
              icon: Icon(
                Icons.calendar_month,
                size: 30,
                color: Colors.grey[850],
              ),
              label: Text(
                'Calendar',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey[850],
                ),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue[400],
                  onSurface: Colors.pink,
                  minimumSize: Size(250, 50)),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Homepage()),
                );
              },
              icon: Icon(
                Icons.add_alert_rounded,
                size: 30,
                color: Colors.grey[850],
              ),
              label: Text(
                'New Schedule',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey[850],
                ),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue[400],
                  onSurface: Colors.pink,
                  minimumSize: Size(250, 50)),
            ),
            ElevatedButton.icon(
              onPressed: () {
                print('Exit to App');
              },
              icon: Icon(
                Icons.exit_to_app,
                size: 30,
                color: Colors.grey[850],
              ),
              label: Text(
                'Exit',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey[850],
                ),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue[400],
                  onSurface: Colors.pink,
                  minimumSize: Size(250, 50)),
            ),
          ],
        ),
      ),
    );
  }
}
