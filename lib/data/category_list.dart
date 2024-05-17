import 'package:campusbuzz/categories.dart';
import 'package:flutter/material.dart';



class Categ extends StatelessWidget {
  const Categ({super.key,required this.categori,required this.onSelectCategory});

  final Categori categori;

  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return 
    // Padding(
    //   padding: const EdgeInsets.all(5),
    //   child: GestureDetector(
    //     //insted of inkwell using GestureDetector
    //     onTap: onSelectCategory, //for navigations or any other function
    //     child: Container(
    //       width: 90,
    //       decoration: BoxDecoration(
    //           color: categori.color,
    //           borderRadius: BorderRadius.circular(22)),
    //       child:Center(
    //         child: Text(
    //           categori.Ctitle,
    //           style:const TextStyle(
    //               color: Colors.white,
    //               fontSize: 16,
    //               fontWeight: FontWeight.w600),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        //insted of inkwell using GestureDetector
        onTap: onSelectCategory, //for navigations or any other function
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: categori.color,
                  boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        spreadRadius: -4,
                        blurRadius: 11,
                        offset: const Offset(0, 9), // changes position of shadow
                      ),
                    ],
                ),
                width: 70,
                height: 70,
              
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Image.asset(categori.categimg,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 2,),
            Padding(
              padding: const EdgeInsets.only(left:15),
              child: Text(categori.Ctitle,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black87),),
            )
          ],
        ),
      ),
    );

  }
}



















































