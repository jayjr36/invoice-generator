import 'package:flutter/material.dart';
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
          title: const Text('Create Invoices'),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Service Invoice',
                icon: Icon(Icons.home_repair_service_rounded)),
              Tab(
                text: 'Product Invoice', 
                icon: Icon(Icons.shopping_cart_rounded)),
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