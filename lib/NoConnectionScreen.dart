import 'package:flutter/material.dart';

void main() {
  runApp(NoConnectionScreen());
}

class NoConnectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('No Internet'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.signal_wifi_off,
                size: 100.0,
                color: Colors.red,
              ),
              SizedBox(height: 20.0),
              Text(
                'No Internet Connection',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Please check your internet connection and try again.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Add functionality to retry connecting to the internet
                },
                child: Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
