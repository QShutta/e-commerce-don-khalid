import 'package:e_commerce_halfa/controller/order_details_controller.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/view/widgets/custome_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});
  @override
  Widget build(BuildContext context) {
    
  Get.put(OrderDetailsController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomeAppBar(searchTextTitle: 'OrderDetails', textColor: AppColor.primaryColor,),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
             
            children: [
            TableRow(children: [

              Text("الصنف",textAlign: TextAlign.center,style: TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.bold,fontSize: 18)),
              Text("العدد",textAlign: TextAlign.center,style: TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.bold,fontSize: 18)),
              Text("السعر",textAlign: TextAlign.center,style: TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.bold,fontSize: 18))
            ]),
            TableRow(
      children: [
        SizedBox(height: 10), // 👈 space between rows
        SizedBox(height: 10),
        SizedBox(height: 10),
      ],
    ),
                   TableRow(children: [
              Text("جلابية الدون",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey),),
              Text("2",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey)),
              Text("3000",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey))
            ]), TableRow(
      children: [
        SizedBox(height: 10), // 👈 space between rows
        SizedBox(height: 10),
        SizedBox(height: 10),
      ],
    ),
                   TableRow(children: [
              Text("توب الدون",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey),),
              Text("6",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey)),
              Text("5000",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey))
            ])
          ],),
        ),
        SizedBox(height: 20,),
        SizedBox(width: double.infinity,
        
        child: Text("Order Price:\$3500",
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.bold,fontSize: 18),),)
        ,SizedBox(height: 10,)
        ,Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.white,
            child:ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColor.primaryColor,
                child: Icon(Icons.location_on_outlined,color: Colors.white,),),
              title:Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                width: double.infinity,
                child: Text("Shipping Address",textAlign: TextAlign.start,style: 
                TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16))), subtitle: Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                width: double.infinity,
                child: Text("Alhajyosif Street",textAlign: TextAlign.start,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15))),)),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Card(
        //     color: Colors.white,
        //     child: Column(children: [
        //     Container(
        //       padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        //       width: double.infinity,
        //       child: Text("Shipping Address",textAlign: TextAlign.start,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16))),
        //        Container(
        //       padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        //       width: double.infinity,
        //       child: Text("Alhajyosif Street",textAlign: TextAlign.start,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15)))
        //   ],),),
        // )
      ],),
    );
  }
}