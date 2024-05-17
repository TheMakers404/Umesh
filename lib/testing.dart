import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  // Number of TextFormFields to create
  final int n = 5;

  // Create a list to store the values of the TextFormFields
  List<List<String>> textFieldsValues = List.generate(5, (index) => ['', '', '']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic TextFormFields Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Create n * 3 TextFormFields using a nested loop
            for (int i = 0; i < n; i++)
              Row(
                children: [
                  for (int j = 0; j < 3; j++)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Field ${i * 3 + j}'),
                          onChanged: (value) {
                            // Update the corresponding value in the list
                            setState(() {
                              textFieldsValues[i][j] = value;
                            });
                          },
                        ),
                      ),
                    ),
                ],
              ),
            const SizedBox(height: 16),
            // Display the values in the list
            Text('Values: $textFieldsValues'),
          ],
        ),
      ),
    );
  }
}
