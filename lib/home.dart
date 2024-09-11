import 'package:flutter/material.dart';
import 'package:victech_invoice/constants.dart';
import 'package:victech_invoice/history.dart';
import 'package:victech_invoice/invoice.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
       // backgroundColor: AppConstants.primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/victech.png', height: h*0.15),
            
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const InvoiceScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppConstants.primaryColor
              ),
              child: const Text('Generate Invoice', style: TextStyle(color: Colors.white),),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
               Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const InvoiceHistory()));
              },
               style: ElevatedButton.styleFrom(
                backgroundColor: AppConstants.primaryColor
              ),
              child: const Text('View Invoices', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
