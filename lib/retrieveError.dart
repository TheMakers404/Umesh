import 'package:flutter/material.dart';

import 'retrieve.dart';

void main() {
  runApp(retrieveErrorScreen());
}

class retrieveErrorScreen extends StatelessWidget {
  const retrieveErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.error_outline,
                size: 100.0,
                color: Colors.red,
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Unable to Retrieve Data',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'An error occurred while trying to retrieve data.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  runApp(const MaterialApp(home:retrieve()));
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
