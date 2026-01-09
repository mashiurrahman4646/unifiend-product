import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Add Shipping Address',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(label: 'Recipient’s Name*', hint: 'Input the real name'),
              const SizedBox(height: 16),
              _buildTextField(label: 'Phone Number*', hint: 'enter your number'),
              const SizedBox(height: 16),
              _buildTextField(label: 'Region/City*', hint: 'enter your region/city name'),
              const SizedBox(height: 16),
              _buildTextField(label: 'Address*', hint: 'enter your Address'),
              const SizedBox(height: 16),
              _buildTextField(label: 'Delivery Date*', hint: 'enter your delivery date'),
              const SizedBox(height: 40),
              
              SizedBox(
                width: double.infinity,
                height: 50,
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
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, required String hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2C3E50),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF9FAFB), // Very light grey/white background
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.teal[300], fontSize: 14),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
          ),
        ),
      ],
    );
  }
}
