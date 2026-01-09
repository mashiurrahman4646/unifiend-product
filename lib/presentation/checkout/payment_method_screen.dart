import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String selectedMethod = 'Credit Card';

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
          'Payment Method',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              _buildPaymentOption('Credit Card'),
              const SizedBox(height: 16),
              _buildPaymentOption('Cash On Delivery'),
              const SizedBox(height: 16),
              _buildPaymentOption('Quickbook'),
              
              const Spacer(),
               SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                     // TODO: Implement final payment logic
                     Get.snackbar('Success', 'Order Placed Successfully!', 
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                     );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1B5E37),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Pay',
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

  Widget _buildPaymentOption(String title) {
    bool isSelected = selectedMethod == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMethod = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey.shade200,
          ),
           boxShadow: [
              if(isSelected) // Optional: Add shadow/elevation only if selected, or keep flat as per image
              BoxShadow(
                color: Colors.grey.withOpacity(0.05),
                spreadRadius: 1,
                blurRadius: 5,
              )
           ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2C3E50),
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? const Color(0xFF7C4DFF) : Colors.grey.shade300, // Purple for checked
                  width: 1.5,
                ),
                color: isSelected ? const Color(0xFF7C4DFF) : Colors.white,
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check,
                      size: 16,
                      color: Colors.white,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
