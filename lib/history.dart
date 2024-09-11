import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InvoiceHistory extends StatefulWidget {
  const InvoiceHistory({super.key});

  @override
  State<InvoiceHistory> createState() => _InvoiceHistoryState();
}
class _InvoiceHistoryState extends State<InvoiceHistory> {
  List<Map<String, dynamic>> serviceInvoices = [
    {
      'name': 'Service Invoice 1',
      'date': '2022-01-01',
      'total': 100.0,
      'customer_name': 'John Doe',
      'address': '123 Main St',
      'contact': 'john.doe@example.com',
      'price': 100.0,
    },
    {
      'name': 'Service Invoice 2',
      'date': '2022-01-02',
      'total': 200.0,
      'customer_name': 'Jane Doe',
      'address': '456 Elm St',
      'contact': 'jane.doe@example.com',
      'price': 200.0,
    },
  ];
  List<Map<String, dynamic>> productInvoices = [
    {
      'name': 'Product Invoice 1',
      'date': '2022-01-03',
      'total': 300.0,
      'customer_name': 'John Doe',
      'address': '123 Main St',
      'contact': 'john.doe@example.com',
      'item_name': 'Product 1',
      'quantity': 1,
      'price': 300.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Invoice History'),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Service Invoices',
                icon: Icon(Icons.home_repair_service_rounded),
              ),
              Tab(
                text: 'Product Invoices',
                icon: Icon(Icons.shopping_cart_rounded),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: serviceInvoices.length,
              itemBuilder: (context, index) {
                final invoice = serviceInvoices[index];
                return ListTile(
                  leading: const Icon(Icons.receipt),
                  title: Text(invoice['name']),
                  subtitle: Text(invoice['date']),
                  trailing: Text(
                    NumberFormat.currency(decimalDigits: 2).format(invoice['total']),
                    style: const TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  onTap: () {
                    // Show a dialog with the items of the invoice
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Items of ${invoice['name']}'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Customer Name: ${invoice['customer_name']}'),
                              Text('Address: ${invoice['address']}'),
                              Text('Contact: ${invoice['contact']}'),
                              Text('Price: ${NumberFormat.currency(decimalDigits: 2).format(invoice['price'])}'),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
            ListView.builder(
              itemCount: productInvoices.length,
              itemBuilder: (context, index) {
                final invoice = productInvoices[index];
                return ListTile(
                  leading: const Icon(Icons.receipt),
                  title: Text(invoice['name']),
                  subtitle: Text(invoice['date']),
                  trailing: Text(
                    NumberFormat.currency(decimalDigits: 2).format(invoice['total']),
                    style: const TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  onTap: () {
                    // Show a dialog with the items of the invoice
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Items of ${invoice['name']}'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Customer Name: ${invoice['customer_name']}'),
                              Text('Address: ${invoice['address']}'),
                              Text('Contact: ${invoice['contact']}'),
                              Text('Item Name: ${invoice['item_name']}'),
                              Text('Quantity: ${invoice['quantity']}'),
                              Text('Price: ${NumberFormat.currency(decimalDigits: 2).format(invoice['price'])}'),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

