import 'package:campusbuzz/token.dart';
import 'package:campusbuzz/your_Events/ymodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormScreen extends ConsumerStatefulWidget {
  final String imageUrl;
  final String time;
  final String date;
  final String title;
  final String college_name;
  

  const FormScreen(
      {super.key,
      required this.imageUrl,
      required this.time,
      required this.date,
      required this.title,
      required this.college_name});

  @override
  ConsumerState<FormScreen> createState() {
    return _FormScreen();
  }
}

class _FormScreen extends ConsumerState<FormScreen> {
  
  


  //adding event to yourevent screen:-
  //  List<Evvent> events = [];
  //  void addEvent(Evvent event) {
  //   setState(() {
  //     events.add(event);
  //   });
  // }

  List<String> items = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];
  String dropdownValue = '1';
  String _name = '';
  String _email = '';
  String _Leader = '';
  String _CLGNAME = '';
  String _phoneNumber = '';
  String _AboutAbstract = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  Widget _buildName() {
    return Column(children: [
      const Padding(
        padding: EdgeInsets.only(right: 27.0, bottom: 5),
        child: Row(
          children: [
            Text(
              "Team Name",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "*",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ],
        ),
      ),
      TextFormField(
        controller: data1,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            hintText: 'Enter your Name',
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            filled: true),
        maxLength: null,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Name is Required';
          }

          return null;
        },
        onSaved: (String? value) {
          _name = value ?? '';
        },
      ),
    ]);
  }

  Widget _buildEmail() {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(right: 27, bottom: 5),
        child: Row(
          children: [
            Text(
              'Email ID',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '*',
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ],
        ),
      ),
      TextFormField(
        controller: data2,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            hintText: 'Enter Mail Id',
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            filled: true),
        maxLength: null,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Name is Required';
          }
          if (!RegExp(r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                  r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                  r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                  r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                  r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                  r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                  r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])')
              .hasMatch(value)) {
            return 'Please enter a valid email Address';
          }

          return null;
        },
        onSaved: (String? value) {
          _email = value ?? '';
        },
      )
    ]);
  }

  Widget _buildLeader() {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(right: 22, bottom: 5),
        child: Row(
          children: [
            Text(
              "Team Leader",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "*",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ],
        ),
      ),
      TextFormField(
        controller: data3,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            hintText: 'Enter your Name',
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            filled: true),
        maxLength: null,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Name is Required';
          }

          return null;
        },
        onSaved: (String? value) {
          _Leader = value ?? '';
        },
      ),
    ]);
  }

  Widget _buildCLGNAME() {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(right: 21, bottom: 5),
        child: Row(
          children: [
            Text(
              "College Name",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "*",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ],
        ),
      ),
      TextFormField(
        controller: data4,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            hintText: 'Enter Collage Name',
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            filled: true),
        maxLength: null,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Name is Required';
          }

          return null;
        },
        onSaved: (String? value) {
          _CLGNAME = value ?? '';
        },
      )
    ]);
  }

  Widget _buildPhoneNumber() {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(right: 24, bottom: 5),
        child: Row(
          children: [
            Text(
              "Mobile No",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "*",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ],
        ),
      ),
      TextFormField(
        controller: data5,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            hintText: 'Enter your Number',
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            filled: true),
        keyboardType: TextInputType.phone,
        maxLength: null,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Number is requierd';
          }

          return null;
        },
        onSaved: (String? value) {
          _phoneNumber = value ?? '';
        },
      )
    ]);
  }

  Widget _buiLdAboutAbstract() {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(right: 20, bottom: 5),
        child: Row(
          children: [
            Text(
              "About Abstract",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "*",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ],
        ),
      ),
      TextFormField(
        controller: data6,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            hintText: '       brief description...............    ',
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            filled: true),
        maxLength: null,
        maxLines: 10,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'requierd';
          }

          return null;
        },
        onSaved: (String? value) {
          _AboutAbstract = value ?? '';
        },
      )
    ]);
  }

  Widget _builddropdownbox() {
    return Column(
      children: [
        const Row(
          children: [
            Text(
              "Team Size",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "*",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
              color: Color(0xffF0F0F0),
              borderRadius: BorderRadius.circular(5.5)),
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: DropdownButton<String>(
              underline: SizedBox(),
              value: dropdownValue,
              isExpanded: true,
              borderRadius: BorderRadius.circular(5.5),
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue ?? '';
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  TextEditingController data1 = new TextEditingController();
  TextEditingController data2 = new TextEditingController();
  TextEditingController data3 = new TextEditingController();
  TextEditingController data4 = new TextEditingController();
  TextEditingController data5 = new TextEditingController();
  TextEditingController data6 = new TextEditingController();
  TextEditingController data7 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Form Demo",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _buildName(),
                SizedBox(height: 15),
                _buildEmail(),
                SizedBox(height: 15),
                _buildPhoneNumber(),
                SizedBox(height: 15),
                _buildCLGNAME(),
                SizedBox(height: 15),
                _buildLeader(),
                SizedBox(height: 15),
                _buiLdAboutAbstract(),
                SizedBox(height: 15),
                _builddropdownbox(),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: MaterialButton(
                    color: Color(0xff112031),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    onPressed: () {
                      
                       //final eventListNotifier = context.read();
                       
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      Map<String, dynamic> data = {
                        "Team Name": data1.text,
                        "Email Id": data2.text,
                        "Leader Name": data3.text,
                        "collage Name": data4.text,
                        "phone Number": data5.text,
                        "About Abstract": data6.text,
                        "Teamsize": dropdownValue,
                      };
                      

                      // Firestore.Instance.collection("test").add(data);
                      //  FirebaseFirestore.instance.collection("User").add(data).then((value) {
                      // print("Data added with ID: ${value.id}");
                      //    }
                      FirebaseFirestore.instance
                          .collection("User")
                          .add(data)
                          .then((value) {
                        String uniqueToken = value.id;
                        print("Data added with ID: $uniqueToken");

                        uniqueToken = uniqueToken;

                        //testing #2
                        Evvent newEvent = Evvent(
                          token: uniqueToken,
                          imageUrl: widget.imageUrl,
                          time: widget.time,
                          date: widget.date,
                          title: widget.title,
                          leaderName: _Leader,
                          college_name: widget.college_name,
                        );
                        ref.read(eventListProvider.notifier).addEvent(newEvent);
                        //eventListNotifier.addEvent(newEvent);

                        // YourEvents yourEventsWidget = YourEvents(
                        //     events: widget.events); 
                        // yourEventsWidget.addEvent(newEvent);
                        //addEvent(newEvent);

                        // Navigate to the new screen to display the token
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TokenDisplayScreen(
                                // token: uniqueToken,
                                // imageUrl: widget.imageUrl,
                                // time: widget.time,
                                // date: widget.date,
                                // title: widget.title,
                                // leaderName: _Leader,
                                // college_name: widget.college_name,
                                event: newEvent
                                //  Evvent(
                                //     token: uniqueToken,
                                //     imageUrl: widget.imageUrl,
                                //     time: widget.time,
                                //     date: widget.date,
                                //     title: widget.title,
                                //     leaderName: _Leader,
                                //     college_name: widget.college_name),
                                ),
                          ),
                        );
                      }).catchError((error) {
                        print("Error adding data: $error");
                      });

                      _formKey.currentState?.save();

                      //adding event to yourevent screen
                      // _img = DataStorage.imageUrl;
                      // _e_name = DataStorage.title;

                      //addUser(Ticket(_img, _e_name));

                      //  print(_name);
                      //  print(_email);
                      //  print(_phoneNumber);
                      //  print(_Leader);
                      //  print(_CLGNAME);
                      //  print(_AboutAbstract);
                      //  print(dropdownValue);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Submit",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // ElevatedButton(
                //   child: const Text(
                //     'Submit',
                //     style: TextStyle(color: Colors.white, fontSize: 16),
                //   ),
                //   onPressed: () {
                //     if (!_formKey.currentState!.validate()) {
                //       return;
                //     }

                //     _formKey.currentState?.save();

                //     print(_name);
                //     print(_email);
                //     print(_phoneNumber);
                //      print(_Leader);
                //     print(_CLGNAME);

                //      print(_AboutAbstract);
                //   print(dropdownValue);

                //     //Send to API
                //   },
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// #testing2


