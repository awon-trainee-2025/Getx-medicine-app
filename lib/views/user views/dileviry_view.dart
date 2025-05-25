import 'package:flutter/material.dart';
import 'package:medicine_app/main.dart';

class DileviryView extends StatefulWidget {
  const DileviryView({super.key});

  @override
  State<DileviryView> createState() => _DileviryViewState();
}

class _DileviryViewState extends State<DileviryView> {
  int currentStep = 0;
  String newStatus = '';

  @override
  void initState() {
    final stream = supabase.from('orders').stream(primaryKey: ['id']);

    stream.listen((data) {
      // [{id: 1, status: Ordered, product_id: 3}]
      final currentStatus = data[0]['status'];

      setState(() {
        newStatus = currentStatus;

        switch (currentStatus) {
          case 'Dilevered':
            currentStep = 0;
            break;
          case 'Shipment':
            currentStep = 1;
            break;
          case 'test':
            currentStep = 2;
          default:
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stepper(
        onStepTapped: (index) async {
          setState(() {
            currentStep = index;
          });
          switch (currentStep) {
            case 0:
              newStatus = 'Dilevered';
              break;
            case 1:
              newStatus = 'Shipment';
              break;
            case 2:
              newStatus = 'test';
              break;
            default:
              newStatus = 'Dilevered';
          }
          await supabase
              .from('orders')
              .update({'status': newStatus})
              .eq('id', 3);
        },
        currentStep: currentStep,
        steps: [
          Step(
            title: Text('Dilevered'),
            content: Text('Dilevered'),
            isActive: currentStep >= 0,
          ),
          Step(
            title: Text('Shipment'),
            content: Text('Shipment'),
            isActive: currentStep >= 1,
          ),
          Step(
            title: Text('test'),
            content: Text('test'),
            isActive: currentStep >= 2,
          ),
        ],
      ),
    );
  }
}
