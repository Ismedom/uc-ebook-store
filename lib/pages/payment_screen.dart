// payment_screen.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Payment'),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CupertinoTextField(
              placeholder: 'Phone Number',
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
            const SizedBox(height: 20),
            const CupertinoTextField(
              placeholder: 'Address',
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
            const SizedBox(height: 20),
            const CupertinoTextField(
              placeholder: 'Card Number',
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
            const SizedBox(height: 20),
            const CupertinoTextField(
              placeholder: 'Expiry Date',
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
            const SizedBox(height: 20),
            const CupertinoTextField(
              placeholder: 'CVV',
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                color: CupertinoColors.activeBlue,
                child: const Text(
                  'Pay Now',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
