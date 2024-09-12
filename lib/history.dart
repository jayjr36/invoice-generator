import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:victech_invoice/constants.dart';

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

  Color? serviceTabColor;
  Color? productTabColor;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: AppConstants.primaryColor,
          title: const Text(
            'Invoices',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            labelColor: Colors.amber,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.amber,
            tabs: [
              Tab(
                text: 'Service Invoices',
                icon: Icon(Icons.home_repair_service_rounded,
                    color: Colors.white),
                iconMargin: EdgeInsets.only(bottom: 2),
              ),
              Tab(
                text: 'Product Invoices',
                icon: Icon(Icons.shopping_cart_rounded, color: Colors.white),
                iconMargin: EdgeInsets.only(bottom: 2),
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
                  isThreeLine: true,
                  leading: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Icon(Icons.receipt),
                  ),
                  title: Text(
                    overflow: TextOverflow.ellipsis,
                    invoice['name'],
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        invoice['customer_name'],
                        style: const TextStyle(fontSize: 12),
                      ),
                      Text(
                        invoice['date'],
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  trailing: Text(
                    NumberFormat.currency(locale: 'sw', decimalDigits: 0)
                        .format(invoice['total']),
                    style: const TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            '${invoice['name']}',
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          content: SizedBox(
                            width: double.minPositive,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                    'Customer: ${invoice['customer_name']}'),
                                Text('Address: ${invoice['address']}'),
                                Text('Contact: ${invoice['contact']}'),
                                Text(
                                    'Price: ${NumberFormat.currency(locale: 'sw', decimalDigits: 0).format(invoice['price'])}'),
                              ],
                            ),
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
                  title: Text(invoice['customer_name'], style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                  subtitle: Text(invoice['date'], style: const TextStyle(fontSize: 12,)),
                  trailing: Text(
                    NumberFormat.currency(locale: 'sw', decimalDigits: 0)
                        .format(invoice['total']),
                    style: const TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('${invoice['name']}',
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),),
                          content: SizedBox(
                           width: double.minPositive,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                    'Customer: ${invoice['customer_name']}', style: TextStyle(fontSize: 12),),
                                Text('Address: ${invoice['address']}'),
                                Text('Contact: ${invoice['contact']}'),
                                Text('Product: ${invoice['item_name']}'),
                                Text('Quantity: ${invoice['quantity']}'),
                                Text(
                                    'Price: ${NumberFormat.currency(locale: 'sw', decimalDigits: 2).format(invoice['price'])}'),
                              ],
                            ),
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
