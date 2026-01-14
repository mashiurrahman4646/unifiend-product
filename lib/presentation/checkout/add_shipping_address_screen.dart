import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/responsive_helper.dart';
import 'payment_method_screen.dart';

class AddShippingAddressScreen extends StatelessWidget {
  const AddShippingAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: LayoutBuilder(
          builder: (context, constraints) {
            final responsive = ResponsiveHelper(context, constraints);
            return IconButton(
              icon: Icon(Icons.arrow_back_ios,
                  color: Colors.black, size: responsive.adaptiveSize(20.0, 24.0)),
              onPressed: () => Navigator.pop(context),
            );
          },
        ),
        title: LayoutBuilder(
          builder: (context, constraints) {
            final responsive = ResponsiveHelper(context, constraints);
            return Text(
              'Add Shipping Address',
              style: TextStyle(
                color: Colors.black,
                fontSize: responsive.adaptiveSize(18.0, 22.0),
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final responsive = ResponsiveHelper(context, constraints);

          return SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(responsive.adaptiveSize(20.0, 32.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextField(responsive,
                      label: 'Recipient’s Name*', hint: 'Input the real name'),
                  SizedBox(height: responsive.adaptiveSize(16.0, 24.0)),
                  _buildTextField(responsive,
                      label: 'Phone Number*', hint: 'enter your number'),
                  SizedBox(height: responsive.adaptiveSize(16.0, 24.0)),
                  _buildTextField(responsive,
                      label: 'Region/City*', hint: 'enter your region/city name'),
                  SizedBox(height: responsive.adaptiveSize(16.0, 24.0)),
                  _buildTextField(responsive, label: 'Address*', hint: 'enter your Address'),
                  SizedBox(height: responsive.adaptiveSize(16.0, 24.0)),
                  _buildTextField(responsive,
                      label: 'Delivery Date*', hint: 'enter your delivery date'),
                  SizedBox(height: responsive.adaptiveSize(40.0, 60.0)),
                  SizedBox(
                    width: double.infinity,
                    height: responsive.adaptiveSize(50.0, 60.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const PaymentMethodScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B5E37),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: responsive.adaptiveSize(18.0, 22.0),
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

  Widget _buildTextField(ResponsiveHelper responsive, {required String label, required String hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: responsive.adaptiveSize(16.0, 18.0),
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2C3E50),
          ),
        ),
        SizedBox(height: responsive.adaptiveSize(8.0, 12.0)),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF9FAFB), // Very light grey/white background
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                  color: Colors.teal[300], fontSize: responsive.adaptiveSize(14.0, 16.0)),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: responsive.adaptiveSize(16.0, 20.0),
                  vertical: responsive.adaptiveSize(14.0, 18.0)),
            ),
          ),
        ),
      ],
    );
  }
}
