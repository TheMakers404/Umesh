import 'package:flutter/material.dart';
import 'retrieve.dart';

void main() {
  runApp(retrieveErrorScreen());
}

class retrieveErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Error'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.error_outline,
                size: 100.0,
                color: Colors.red,
              ),
              SizedBox(height: 20.0),
              Text(
                'Unable to Retrieve Data',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'An error occurred while trying to retrieve data.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  runApp(MaterialApp(home:retrieve()));
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
