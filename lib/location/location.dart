import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {

//date picker
    late DateTime _dateTime;
  late String _formattedDate;

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.now();
    _formattedDate = _formatDate(_dateTime);
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    ).then((value) {
      if (value != null) {
        setState(() {
          _dateTime = value;
          _formattedDate = _formatDate(value);
        });
      }
    });
  }

  String _formatDate(DateTime date) {
    return "${date.day}-${date.month}-${date.year}";
  }



  void _saveToFirestore() {
    final hours = time.hour.toString().padLeft(2, '0');
  final minutes = time.minute.toString().padLeft(2, '0');
  final String combinedTime = '$hours:$minutes $selectedPeriod';
    FirebaseFirestore.instance.collection('webfs').add({

      'formattedDate': _formattedDate,
      'combinedTime': combinedTime,
    }).then((value) {
      // Do something after successfully saving to Firestore
      print('Data saved to Firestore');
    }).catchError((error) {
      // Handle error if saving to Firestore fails
      print('Error saving to Firestore: $error');
    });
  }


  //time picker


  TimeOfDay time =const TimeOfDay(hour:12, minute: 30, );
  String selectedPeriod = '';
  String combinedTime = '';


  
  final TextEditingController nController = TextEditingController();

  List<List<String>> textFieldsValues = List.generate(0, (index) => ['', '', '']);
  List<String> sportNames = [];
  List<String> participantCounts = [];
  List<String> entryFees = [];

  // List of field names
  List<String> fieldNames = ['Sport Name', 'No of Participants', 'Entry Fee'];

  // Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {

    //time picker
    final hours =time.hour.toString().padLeft(2,'0');
    final minutes= time.minute.toString().padLeft(2,'0');
    
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic TextFormFields Example'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: nController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Enter the value of n'),
              ),
              const SizedBox(height: 16),
              // Create n * 3 TextFormFields using a nested loop
              ElevatedButton(
                onPressed: () {
                  // Get the value of n from the TextFormField
                  int n = int.tryParse(nController.text) ?? 0;

                  // Update the UI with the new number of rows
                  setState(() {
                    textFieldsValues = List.generate(n, (index) => ['', '', '']);
                    sportNames = List.filled(n, '');
                    participantCounts = List.filled(n, '');
                    entryFees = List.filled(n, '');
                  });
                },
                child: const Text('Generate TextFields'),
              ),
              const SizedBox(height: 16),
              if (textFieldsValues.isNotEmpty)
                // Create n * 3 TextFormFields using a nested loop
                for (int i = 0; i < textFieldsValues.length; i++)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sport ${i + 1}"),
                      for (int j = 0; j < 3; j++)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(labelText: '${fieldNames[j]}'),
                            onChanged: (value) {
                              // Update the corresponding value in the list
                              setState(() {
                                textFieldsValues[i][j] = value;

                                // Update the separate arrays
                                if (j == 0) {
                                  sportNames[i] = value;
                                } else if (j == 1) {
                                  participantCounts[i] = value;
                                } else if (j == 2) {
                                  entryFees[i] = value;
                                }
                              });
                            },
                          ),
                        ),
                    ],
                  ),
              const SizedBox(height: 16),
              // Display the values in the lists
              Text('Sport Names: $sportNames'),
              Text('No of Participants: $participantCounts'),
              Text('Entry Fees: $entryFees'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  // Submit data to Firestore
                  await _firestore.collection('Event').doc("sample_event").set({
                    'sportNames': sportNames,
                    'participantCounts': participantCounts,
                    'entryFees': entryFees,
                  });
                  // Show a snackbar to indicate successful submission
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Data submitted to Firestore!'),
                    ),
                  );
                },
                child: const Text('Submit to Firestore'),
              ),


              // Text("Testing date picker",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),

              // MaterialButton(onPressed:_showDatePicker,child: Text("Select date"),),

              // Text(_dateTime.day.toString(),style: TextStyle(fontSize: 40),)
              const Text(
              "Testing date picker",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            MaterialButton(
              onPressed: _showDatePicker,
              child: const Text("Select date"),
            ),
            Text(
              _formattedDate,
              style: const TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 20),
            

            //time picker




            const Text("Time Picker"),
              Text('$hours:$minutes $selectedPeriod', style: const TextStyle(fontSize: 39)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  TimeOfDay? newTime = await showTimePicker(context: context, initialTime: time);
                  if (newTime == null) return;
                  String period = newTime.period == DayPeriod.am ? 'AM' : 'PM';
                  setState(() {
                    time = newTime;
                    selectedPeriod = period;
                    combinedTime = '$hours:$minutes $selectedPeriod';
                  });
                },
                child: const Text("Pick time"),
              ),

              ElevatedButton(
              onPressed: _saveToFirestore,
              child: const Text('Save to Firestore'),
            ),


              ElevatedButton(onPressed: (){
                Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Hack(
                              
                               
                                ),
                          ),
                        );

              }, child: const Text("hackbutton",style: TextStyle(fontSize: 50),))


            ],
          ),
        ),
      ),
    );
  }
}



//hack testing class:-


class Hack extends StatefulWidget {
  const Hack({Key? key}) : super(key: key);

  @override
  State<Hack> createState() => _HackState();
}

class _HackState extends State<Hack> {

   
  bool? _currentHackStatus; // Initialize as null

  // Function to update the hack field in Firestore
  Future<void> updateHackStatus(bool status) async {
    try {
      await FirebaseFirestore.instance.collection('User').doc('4MwYiindWvDZO0OJvS3c').update({
        'hack': status,
      });
      setState(() {
        _currentHackStatus = status;
      });
      print('Hack status updated successfully!');
    } catch (error) {
      print('Error updating hack status: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hack Testing")),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('User').doc('4MwYiindWvDZO0OJvS3c').get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Text('Document not found');
          }

          if (_currentHackStatus == null) {
            // Set _currentHackStatus only if it's not set yet
            _currentHackStatus = snapshot.data!['hack'];
          }

          bool hackStatus = _currentHackStatus ?? false;
          String name = snapshot.data!['Leader Name'] ?? 'Name not found';


          //url launcher

          _launchurl() async {

  var url = Uri.parse(name
       );

  if (!await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Cannot launch URL';
  }
}

          return Column(
            children: [
              ElevatedButton(onPressed: _launchurl, child: const Text("click here")),
              Text("Name: $name"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  updateHackStatus(true);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: hackStatus ? Colors.green : null,
                ),
                child: const Text("Accept"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  updateHackStatus(false);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: hackStatus ? null : Colors.red,
                ),
                child: const Text("Deny"),
              ),
            ],
          );
        },
      ),
    );
  }
}

//hfjgkj
                 