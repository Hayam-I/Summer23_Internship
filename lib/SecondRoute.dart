import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:simple_nav/FirstRoute.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Tongass National Forest',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Juneau, AK 99801, United States',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('85'),
        ],
      ),
    );

    Column buildButtonColumn(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.green,
              ),
            ),
          ),
        ],
      );
    }

    Color color = Colors.green;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildButtonColumn(color, Icons.call, 'CALL'),
        buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'The Tongass National Forest in Southeast Alaska is the largest U.S. National Forest at 16.7 million acres. Most of its area is temperate rain forest and is remote enough to be home to many species of endangered and rare flora and fauna.',
        softWrap: true,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Forest'),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'info',
                child: Text('More Information'),
              ),
              const PopupMenuItem(
                value: 'settings',
                child: Text('Settings'),
              ),
              const PopupMenuItem(
                value: 'exit',
                child: Text('Exit'),
              ),
            ],
            onSelected: (value) {
              if (value == 'exit') {
                SystemNavigator.pop();
              } else if (value == 'settings') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondRoute()),
                );
              } else if (value == 'info') {
                Fluttertoast.showToast(
                  msg: 'For more information please visit our website!',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.grey[600],
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              }
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Image.asset(
            'images/forest.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,
          //why is the button width and height not changing?
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const FirstRoute()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
              ),
              child: const Text('Back'),
            ),
          ),
        ],
      ),
    );
  }
}
