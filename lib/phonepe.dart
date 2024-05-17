import 'dart:convert';

import 'package:campusbuzz/token.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';

class Phonepee extends StatefulWidget {
  final Evvent event;

  final int amount;
  const Phonepee({super.key, required this.amount, required this.event});

  @override
  State<Phonepee> createState() => _PhonepeState();
}

class _PhonepeState extends State<Phonepee> {

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
    // TODO: implement initState
    super.initState();

    phonepeInit();

    body=getchecksum().toString();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: const Text("Payment"),),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            startpgtransaction();
          }, child: const Text("Pay Now")),
          const SizedBox(height: 10,),
          Text("result \n $result"),
          Text(widget.amount.toString()),
        ],
      ),
    );
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


  void startpgtransaction()async{
    CollectionReference eventsCollection =
        FirebaseFirestore.instance.collection('Test12');
         DocumentReference documentReference = eventsCollection.doc();
    PhonePePaymentSdk.startTransaction(body, callbackUrl, checksum, "",).then((response) => {
    setState(() {
                   if (response != null) 
                        {
                           String status = response['status'].toString();
                           String error = response['error'].toString();
                           if (status == 'SUCCESS') 
                           {
                            result="Flow Completed - Status: Success!";
                            
                             // "Flow Completed - Status: Success!";
                              documentReference.set({
                        'College Name': widget.event.college_name,
                        'Name': widget.event.Name,
                        'Mail Id': widget.event.Mail_Id,
                        'Mobile No': widget.event.Mobile_No,
                        'Year': widget.event.Year,
                        'Branch': widget.event.Branch,
                        'amount':widget.event.amount,
                        'College Name': widget.event.College_Name,
                        
                      //   'Name': _Name,
                      //   'Mail Id': _email,
                      //   'Mobile No': _Number,
                      //   'Year': dropdownValue,
                      //   'Branch': dropdownValue1,
                      //   'amount':amountt,
                        
                      });
                             

                             Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => TokenDisplayScreen(event: widget.event,),
            ),
          );
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
  return <dynamic>{};
  });
  }
  
  void handleError(error) {
    setState(() {
      result={"error": error};
    });
  }
}