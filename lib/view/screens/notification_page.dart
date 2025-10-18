import 'package:dartz/dartz.dart';
import 'package:e_commerce_halfa/controller/view_notfication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotficationPage extends StatelessWidget {
  const NotficationPage({super.key});

  @override
  Widget build(BuildContext context) {
Get.put(ViewNotificationControllerImp());
    return Scaffold(
      body: GetBuilder<ViewNotificationControllerImp>(builder: (controller) {
        return ListView.builder(
            // Added padding to the list itself
            padding: const EdgeInsets.symmetric(vertical: 10), 
            itemCount: controller.notificationList!.length,
            itemBuilder: (context, index) {
              final notification = controller.notificationList![index];
              
              // 4. Replaced the complex Card/Row/Column with a clean Card/ListTile
              return Card(
                elevation: 2.0,
                // Added a slight border radius
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  // The leading icon
                  leading: const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 83, 134, 243),
                    child: Icon(Icons.shopping_cart_outlined, color: Colors.white),
                  ),
                  
                  // The title
                  title: Text(
                    notification.notficationTitle!,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  
                  // The subtitle
                  subtitle: Text(
                    notification.notficationBody!,
                    style: const TextStyle(color: Colors.black54, fontSize: 14),
                  ),

                  // 5. Added 'trailing' for the timestamp (assumes backend change)
                  // Make sure your NotificationModel parses 'notification_datetime' as a DateTime
                  trailing: Text(
                    Jiffy.parse(notification.dateOfCreate!).fromNow(),
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),

                  // 6. Added onTap for interactivity
                  onTap: () {
                    print('Tapped on notification ID: ${notification.notficationId}');
                    // Example: Navigate to order details page
                    // Get.toNamed("/orderdetails", arguments: { "order_id": notification.orderId }); 
                    // (You would need to add order_id to your notification data)
                  },
                ),
              );
            },
          );
        },
      ));
    
      }
    
  }

