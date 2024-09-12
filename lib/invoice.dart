import 'package:flutter/material.dart';
import 'package:victech_invoice/constants.dart';
import 'package:victech_invoice/item_invoice.dart';
import 'package:victech_invoice/service_invoice.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: AppConstants.primaryColor,
          title: const Text('Generate Invoices', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          bottom: const TabBar(
            labelColor: Colors.amber,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.amber,
            tabs: [
              Tab(
                text: 'Service Invoice',
                icon: Icon(Icons.home_repair_service_rounded, color: Colors.white),
              ),
              Tab(
                text: 'Product Invoice', 
                icon: Icon(Icons.shopping_cart_rounded, color: Colors.white),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ServiveInvoiceScreen(),
            ItemInvoiceScreen(),
          ],
        ),
      ),
    );
  }
}