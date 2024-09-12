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
      // appBar: AppBar(
      //   toolbarHeight: h*0.2,
      //  // backgroundColor: AppConstants.primaryColor,
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Image.asset('assets/victech.png', width: h*0.15),
            
      //     ],
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: h * 0.2,
              child: Center(
                child: Image.asset('assets/victech.png',
               height: h*0.2,
              ),),),
                const Text(
                'Welcome to Victech Electronics!',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange, // Replace with your brand's color
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              Text(
                'Our easy-to-use invoice app is designed to help you handle both service fees and product sales professionally.',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              Text(
                'Enjoy hassle-free invoicing and keep your business organized with Victech\'s trusted solution.',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: h*0.2,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const InvoiceScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppConstants.primaryColor
                ),
                child: const Text('Generate Invoice', style: TextStyle(color: Colors.white),),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                 Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const InvoiceHistory()));
                },
                 style: ElevatedButton.styleFrom(
                  backgroundColor: AppConstants.primaryColor
                ),
                child: const Text('View Invoices', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
