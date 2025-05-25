import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moyasar/moyasar.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  TextEditingController amountController = TextEditingController();
  String? error;
  PaymentConfig? paymentConfig;

  void onPaymentResult(result) {
    if (result is PaymentResponse) {
      switch (result.status) {
        case PaymentStatus.paid:
          print('payment successfull');
          break;
        case PaymentStatus.failed:
          print('payment failed');
          break;
        case PaymentStatus.initiated:
          throw UnimplementedError();
        case PaymentStatus.authorized:
          throw UnimplementedError();
        case PaymentStatus.captured:
          throw UnimplementedError();
      }
    }
  }

  _changeAmount() {
    final amount = amountController.text;

    if (amount.isEmpty) {
      setState(() {
        error = 'Enter amount';
      });
    }

    setState(() {
      error = null;
      paymentConfig = PaymentConfig(
        publishableApiKey: 'pk_test_LaH8zUBVcJFqskjnXj9w6e5dBHzFHjVkkYYHYPQh',
        amount: int.parse(amount),
        description: 'order #1324',
        metadata: {'size': '250g'},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 100, horizontal: 10),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            controller: amountController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'number only',
              errorText: error,
            ),
          ),
          ElevatedButton(
            onPressed: _changeAmount,
            child: Text('Change amount'),
          ),
          if(paymentConfig != null)
          CreditCard(config: paymentConfig!, onPaymentResult: onPaymentResult),
        ],
      ),
    );
  }
}
