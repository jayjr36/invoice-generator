import 'package:flutter/material.dart';
import 'package:victech_invoice/constants.dart';

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
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Service Name',
                   labelStyle: TextStyle(fontSize: 12)
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
                   labelStyle: TextStyle(fontSize: 12)
                ),
                controller: _servicePriceController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a service price';
                  }
                  return null;
                },
              ),
              SizedBox(height: h*0.05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: w*0.45,
                    child: ElevatedButton(
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
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppConstants.primaryColor),
                      child: const Text(
                        'Add Service',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: w*0.45,
                    child: ElevatedButton(            
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print('services: $services');
                        }
                      },
                       style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade700),
                      child: const Text(
                        'Generate Invoice',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
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
            ],
          ),
        ),
      ),
    );
  }
}
