import 'dart:convert';

import 'package:campusbuzz/token.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';



class Fest extends ConsumerStatefulWidget {
  final String imageUrl;
  final String time;
  final String date;
  final String title;
  final String college_name;
  final String id;
  const Fest({super.key, required this.imageUrl, required this.time, required this.date, required this.title, required this.college_name,required this.id});

  @override
  ConsumerState<Fest> createState() => _FestState();
}

class _FestState extends ConsumerState<Fest> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


//PHONEPE
  String environment ="SANDBOX";
    String appId = "";
    String merchantId= "PGTESTPAYUAT";
    bool enableLogging= true;
    String checksum ="";
    String saltkey = "099eb0cd-02cf-4e2a-8aca-3e6c6aff0399";
    String saltIndex="1";
    String callbackUrl="https://webhook.site/d63eac9e-3533-4b6c-b361-b42443723f53";
    String body = "";
    Object? result;

    String apiEndPoint="/pg/v1/pay";




    
  


//PHONEPE

  List<String> items = [
    '1st Year',
    '2nd Year',
    '3rd Year',
    '4th Year',
  ];
  List<String> items2 = [
    'CSE',
    'AIML',
    'EEE',
    'CIVIL',
  ];
  var amountt ;
  String dropdownValue = '1st Year';
  String dropdownValue1 = 'CSE';

  TextEditingController newController = TextEditingController();
   TextEditingController College = TextEditingController();
   TextEditingController Name = TextEditingController();
   TextEditingController mail = TextEditingController();

  Widget _buildCollegeM() {
    return Column(children: [
      const Padding(
        padding: EdgeInsets.only(right: 24, bottom: 5),
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
        controller: College,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            hintText: 'Enter THE NAME',
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            filled: true),
        maxLength: null,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Name is requierd';
          }

          return null;
        },
      )
    ]);
  }

  Widget _buildName() {
    return Column(children: [
      const Padding(
        padding: EdgeInsets.only(right: 24, bottom: 5),
        child: Row(
          children: [
            Text(
              "Name",
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
        controller: Name,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            hintText: 'Enter THE NAME',
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            filled: true),
        maxLength: null,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Name is requierd';
          }

          return null;
        },
      )
    ]);
  }

  Widget _buildMailID() {
    return Column(children: [
      const Padding(
        padding: EdgeInsets.only(right: 27, bottom: 5),
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
        controller: mail,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            hintText: 'Enter Mail Id',
            hintStyle: const TextStyle(
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
      )
    ]);
  }

  Widget _buildMOBILENM() {
    return Column(children: [
      const Padding(
        padding: EdgeInsets.only(right: 24, bottom: 5),
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
        controller: newController,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            hintText: 'Enter your Number',
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            filled: true),
        keyboardType: TextInputType.phone,
        maxLength: null,
        // validator: (String? value) {
        //   if (value!.isEmpty) {
        //     return 'Number is requierd';
        //   }

        //   return null;
        // },
        // onSaved: (String? value) {
        //   _Number = value ?? '';
        // },
      )
    ]);
  }

  Widget _builddropdown1() {
    return Column(
      children: [
        const Row(
          children: [
            Text(
              "Year",
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
              color: const Color(0xffF0F0F0),
              borderRadius: BorderRadius.circular(5.5)),
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: DropdownButton<String>(
              underline: const SizedBox(),
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

  Widget _builddropdown2() {
    return Column(
      children: [
        const Row(
          children: [
            Text(
              "Branch",
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
              color: const Color(0xffF0F0F0),
              borderRadius: BorderRadius.circular(5.5)),
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: DropdownButton<String>(
              underline: const SizedBox(),
              value: dropdownValue1,
              isExpanded: true,
              borderRadius: BorderRadius.circular(5.5),
              items: items2.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue1 = newValue ?? '';
                });
              },
            ),
          ),
        ),
      ],
    );
  }
   Widget _buildamount() {
    return Row(
      children: [
        
        const SizedBox(height: 5),
        const Text(
              " ₹",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
            ),
            const SizedBox(width: 5,),
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Event').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }

            //using snapshot

            var umeshDoc = snapshot.data!.docs
                .firstWhere((doc) => doc.id == widget.id);
            int amount = umeshDoc['price'] ;

            amountt= amount;

            
            

      

         

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(amountt.toString(), style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600,),),
                
                
              ],
            );
          },
        ),
      ],
    );
  }
  getchecksum(){
      final resquestData={
  "merchantId": merchantId,
  "merchantTransactionId": "transaction_123",
  "merchantUserId": "90223250",
  "amount": 1000,
  "mobileNumber": "9999999999",
  "callbackUrl": "https://webhook.site/callback-url",
  "paymentInstrument": {
    "type": "PAY_PAGE",
    
  },
 
};

String base64Body=base64.encode(utf8.encode(json.encode(resquestData)));

checksum='${sha256.convert(utf8.encode(base64Body+apiEndPoint+saltkey)).toString()}###$saltIndex';

return base64Body;


    }



  

  @override
  void initState() {
    super.initState();
    phonepeInit();

    body=getchecksum().toString();
  }

   void phonepeInit() {


    PhonePePaymentSdk.init(environment, appId, merchantId, enableLogging)
        .then((val) => {
              setState(() {
                result = 'PhonePe SDK Initialized - $val';
              })
            })
        .catchError((error) {
      handleError(error);
      return <dynamic>{};
    });
  }
  void storeUserDataInFirestore() {
    CollectionReference eventsCollection =
        FirebaseFirestore.instance.collection('Test12');

    eventsCollection.add({
      'College Name': College.text.trim(),
      'Name': Name.text.trim(),
      'Mail Id':mail.text.trim() ,
      'Mobile No': newController.text.trim(),
      'Year': dropdownValue,
      'Branch': dropdownValue1,
      'amount': amountt,
    });
  }


  void startpgtransaction()async{
    // CollectionReference eventsCollection =
    //     FirebaseFirestore.instance.collection('Test12');
    
        //  DocumentReference documentReference = eventsCollection.doc();
    PhonePePaymentSdk.startTransaction(body, callbackUrl, checksum, "",).then((response) => {
    setState(() {
                   if (response != null) 
                        {
                           String status = response['status'].toString();
                           String error = response['error'].toString();
                           if (status == 'SUCCESS') 
                           {
                            result="Flow Completed - Status: Success!";
                            storeUserDataInFirestore();
                            Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => TokenDisplayScreen(event: Evvent(token: "token", imageUrl: widget.imageUrl, time: widget.time, date: widget.date, title: widget.title, leaderName: Name.text.trim(), college_name: widget.college_name, College_Name: "widget.College_Name", Name: "widget.Name", Mail_Id: "Mail_Id", Mobile_No: "Mobile_No", Year: "Year", Branch: "Branch", amount: 1),),
            ),
          );
                            
                             // "Flow Completed - Status: Success!";
                        //       documentReference.set({
                        // 'College Name': widget.event.college_name,
                        // 'Name': widget.event.Name,
                        // 'Mail Id': widget.event.Mail_Id,
                        // 'Mobile No': widget.event.Mobile_No,
                        // 'Year': widget.event.Year,
                        // 'Branch': widget.event.Branch,
                        // 'amount':widget.event.amount,
                        // 'College Name': widget.event.College_Name,
                        
                      //   'Name': _Name,
                      //   'Mail Id': _email,
                      //   'Mobile No': _Number,
                      //   'Year': dropdownValue,
                      //   'Branch': dropdownValue1,
                      //   'amount':amountt,
                        
                      // });
                       
                             

                            
                           } 
                           else {
                            result="Flow Completed - Status: $status and Error: $error";

                            

                       
                            
                          // "Flow Completed - Status: $status and Error: $error";
                           }
                        } 
                   else {
                    result="flow incomplete";
                          // "Flow Incomplete";
                        }
                })
  }).catchError((error) {
  // handleError(error)
  storeUserDataInFirestore();
  return <dynamic>{};
  });
  }
  
  void handleError(error) {
    setState(() {
      result={"error": error};
    });
  }

  @override
  Widget build(BuildContext context) {
    //  CollectionReference eventsCollection =
    //     FirebaseFirestore.instance.collection('Test12');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
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
          margin: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildName(),
                const SizedBox(height: 10),
                _buildCollegeM(),
                const SizedBox(
                  height: 15,
                ),
                _buildMailID(),
                const SizedBox(height: 15),
                _buildMOBILENM(),
                const SizedBox(height: 15),
                _builddropdown1(),
                const SizedBox(height: 15),
                _builddropdown2(),
                const SizedBox(height: 15),
                _buildamount(),
                // const SizedBox(height: 15),
                // _builddropdown2(),
                const SizedBox(height: 15),
                Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: 15),
                  child: MaterialButton(
                    color: const Color(0xff112031),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    onPressed: () async {
                      startpgtransaction();
                      // if (!_formKey.currentState!.validate()) {
                      //   return;
                      // }

                      

                      // _formKey.currentState?.save();
                      // await eventsCollection.add({
                      //   'College Name': _College,
                      //   'Name': _Name,
                      //   'Mail Id': _email,
                      //   'Mobile No': _Number,
                      //   'Year': dropdownValue,
                      //   'Branch': dropdownValue1,
                      //   'amount':amountt,
                        
                      // });


                      // Evvent newEvent = Evvent(
                      //     // token: "uniqueToken",
                      //      imageUrl: widget.imageUrl,
                      //      time: widget.time,
                      //      date: widget.date,
                      //      title: widget.title,
                      //      leaderName: "_Leader",
                      //      college_name: widget.college_name,
                      //     College_Name: _College,
                      //   Name: _Name,
                      //   Mail_Id: _email,
                      //   Mobile_No: _Number,
                      //   Year: dropdownValue,
                      //   Branch: dropdownValue1,
                      //   amount:amountt, 
                      //   token: '1234',
                      //   );
                      //   ref.read(eventListProvider.notifier).addEvent(newEvent);

                      

                      // Navigator.push(context, MaterialPageRoute(builder: (context) => startpgtransaction() ,));
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Register Now",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}



//testing phomepe

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("data"),),
    );
  }
}


