import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/responsive_helper.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: LayoutBuilder(
          builder: (context, constraints) {
            final responsive = ResponsiveHelper(context, constraints);
            return Padding(
              padding: EdgeInsets.only(left: responsive.adaptiveSize(16.0, 24.0)),
              child: Center(
                child: Container(
                  width: responsive.adaptiveSize(40.0, 50.0),
                  height: responsive.adaptiveSize(40.0, 50.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade100,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_new,
                        size: responsive.adaptiveSize(18.0, 22.0), color: Colors.black),
                    onPressed: () => Get.back(),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final responsive = ResponsiveHelper(context, constraints);

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(responsive.adaptiveSize(20.0, 32.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: responsive.adaptiveSize(10.0, 20.0)),
                  Text(
                    'Change Name',
                    style: TextStyle(
                      fontSize: responsive.adaptiveSize(16.0, 20.0),
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: responsive.adaptiveSize(12.0, 20.0)),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Type ....',
                      hintStyle: TextStyle(
                          color: Colors.grey.shade400, fontSize: responsive.adaptiveSize(14.0, 16.0)),
                      filled: true,
                      fillColor: Colors.grey.shade50,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: responsive.adaptiveSize(16.0, 20.0),
                          vertical: responsive.adaptiveSize(14.0, 18.0)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                    ),
                  ),
                  SizedBox(height: responsive.adaptiveSize(30.0, 48.0)),
                  SizedBox(
                    width: double.infinity,
                    height: responsive.adaptiveSize(50.0, 60.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF004D40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: responsive.adaptiveSize(16.0, 20.0),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
