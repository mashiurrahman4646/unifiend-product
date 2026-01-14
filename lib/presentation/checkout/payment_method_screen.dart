import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/responsive_helper.dart';

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
              'Payment Method',
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
            child: Padding(
              padding: EdgeInsets.all(responsive.adaptiveSize(20.0, 32.0)),
              child: Column(
                children: [
                  _buildPaymentOption(responsive, 'Credit Card'),
                  SizedBox(height: responsive.adaptiveSize(16.0, 24.0)),
                  _buildPaymentOption(responsive, 'Cash On Delivery'),
                  SizedBox(height: responsive.adaptiveSize(16.0, 24.0)),
                  _buildPaymentOption(responsive, 'Quickbook'),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: responsive.adaptiveSize(50.0, 60.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Implement final payment logic
                        Get.snackbar(
                          'Success',
                          'Order Placed Successfully!',
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
                      child: Text(
                        'Pay',
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

  Widget _buildPaymentOption(ResponsiveHelper responsive, String title) {
    bool isSelected = selectedMethod == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMethod = title;
        });
      },
      child: Container(
        padding: EdgeInsets.all(responsive.adaptiveSize(16.0, 20.0)),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey.shade200,
            ),
            boxShadow: [
              if (isSelected)
                BoxShadow(
                  color: Colors.grey.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: 5,
                )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: responsive.adaptiveSize(16.0, 18.0),
                fontWeight: FontWeight.w500,
                color: const Color(0xFF2C3E50),
              ),
            ),
            Container(
              width: responsive.adaptiveSize(24.0, 30.0),
              height: responsive.adaptiveSize(24.0, 30.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? const Color(0xFF7C4DFF) : Colors.grey.shade300,
                  width: 1.5,
                ),
                color: isSelected ? const Color(0xFF7C4DFF) : Colors.white,
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      size: responsive.adaptiveSize(16.0, 20.0),
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
