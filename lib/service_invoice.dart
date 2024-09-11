import 'package:flutter/material.dart';

class ServiveInvoiceScreen extends StatefulWidget {
  const ServiveInvoiceScreen({super.key});

  @override
  State<ServiveInvoiceScreen> createState() => _ServiveInvoiceScreenState();
}

class _ServiveInvoiceScreenState extends State<ServiveInvoiceScreen> {
  List<Map<String, dynamic>> services = [];

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _serviceNameController = TextEditingController();
  final TextEditingController _servicePriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Invoice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Service Name',
                ),
                controller: _serviceNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a service name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Service Price',
                ),
                controller: _servicePriceController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a service price';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      services.add({
                        'serviceName': _serviceNameController.text,
                        'servicePrice':
                            double.parse(_servicePriceController.text),
                      });
                      _serviceNameController.clear();
                      _servicePriceController.clear();
                    });
                  }
                },
                child: const Text('Add Service'),
              ),
              const SizedBox(height: 16),
              services.isEmpty
                  ? const Text('No services added')
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: services.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(services[index]['serviceName']),
                          subtitle: Text(
                              '\Tshs${services[index]['servicePrice'].toStringAsFixed(0)}'),
                        );
                      },
                    ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print('services: $services');
                  }
                },
                child: const Text('Generate Invoice'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
