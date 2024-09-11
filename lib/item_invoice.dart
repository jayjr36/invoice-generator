import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:victech_invoice/constants.dart';

class ItemInvoiceScreen extends StatefulWidget {
  const ItemInvoiceScreen({super.key});

  @override
  State<ItemInvoiceScreen> createState() => _ItemInvoiceScreenState();
}

class _ItemInvoiceScreenState extends State<ItemInvoiceScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _invoiceData = {
    'items': [
      {
        'description': '',
        'quantity': 1,
        'unitPrice': 0.0,
      },
    ],
  };

  void _addItem() {
    setState(() {
      _invoiceData['items'].add({
        'description': '',
        'quantity': 1,
        'unitPrice': 0.0,
      });
    });
  }

  void _removeItem(int index) {
    setState(() {
      _invoiceData['items'].removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.primaryColor ,
        title: const Text('Create Invoice'),
      ),
      
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (picked != null) {
                  final DateFormat formatter = DateFormat('yyyy-MM-dd');
                  final String formatted = formatter.format(picked);
                  setState(() {
                    _invoiceData['invoiceDate'] = formatted;
                  });
                }
              },
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Invoice Date',
                ),
                initialValue: _invoiceData['invoiceDate'],
                readOnly: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an invoice date';
                  }
                  return null;
                },
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Customer Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a bill to address';
                }
                return null;
              },
              onSaved: (value) {
                _invoiceData['billTo'] = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Address',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a ship to address';
                }
                return null;
              },
              onSaved: (value) {
                _invoiceData['shipTo'] = value;
              },
            ),
            Column(
              children: List.generate(
                _invoiceData['items'].length,
                (index) => ItemForm(
                  index: index,
                  item: _invoiceData['items'][index],
                  onRemove: () {
                    _removeItem(index);
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _addItem,
              child: const Text('Add Item'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  print(_invoiceData);
                }
              },
              child: const Text('Generate Invoice'),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemForm extends StatelessWidget {
  final int index;
  final Map<String, dynamic> item;
  final VoidCallback onRemove;

  const ItemForm({
    super.key,
    required this.index,
    required this.item,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
                initialValue: item['description'],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                onSaved: (value) {
                  item['description'] = value;
                },
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Quantity',
                ),
                initialValue: item['quantity'].toString(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a quantity';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Quantity must be an integer';
                  }
                  return null;
                },
                onSaved: (value) {
                  item['quantity'] = int.parse(value ?? '');
                },
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Unit Price',
                ),
                initialValue: item['unitPrice'].toString(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a unit price';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Unit price must be a number';
                  }
                  return null;
                },
                onSaved: (value) {
                  item['unitPrice'] = double.parse(value ?? '');
                },
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Spacer(),
            ElevatedButton(
              onPressed: onRemove,
              child: const Text('Remove'),
            ),
          ],
        ),
      ],
    );
  }
}
 