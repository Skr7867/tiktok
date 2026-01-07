import 'package:flutter/material.dart';

class HighCreditScoreCustomersCard extends StatelessWidget {
  const HighCreditScoreCustomersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// HEADER
          Row(
            children: const [
              Icon(Icons.security, color: Colors.blue),
              SizedBox(width: 8),
              Text(
                'High Credit Score Customers',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// SHOW LESS BUTTON
          const SizedBox(height: 16),

          /// TABLE HEADER
          _tableHeader(),

          const Divider(height: 24),

          /// CUSTOMER LIST
          _customerRow(
            name: 'Rajesh Kumar',
            mobile: '+91 98765 43210',
            occupation: 'Business Owner',
          ),
          _customerRow(
            name: 'Priya Sharma',
            mobile: '+91 98765 43211',
            occupation: 'Software Engineer',
          ),
          _customerRow(
            name: 'Amit Patel',
            mobile: '+91 98765 43212',
            occupation: 'Doctor',
          ),
          _customerRow(
            name: 'Sneha Reddy',
            mobile: '+91 98765 43213',
            occupation: 'CA Professional',
          ),
          _customerRow(
            name: 'Vikram Singh',
            mobile: '+91 98765 43214',
            occupation: 'Government Employee',
          ),
          _customerRow(
            name: 'Anjali Mehta',
            mobile: '+91 98765 43215',
            occupation: 'Teacher',
          ),
          _customerRow(
            name: 'Rahul Verma',
            mobile: '+91 98765 43216',
            occupation: 'Bank Manager',
          ),
          _customerRow(
            name: 'Neha Gupta',
            mobile: '+91 98765 43217',
            occupation: 'Architect',
          ),

          const SizedBox(height: 12),

          /// FOOTER
          const Text(
            'Showing 8 of 8 customers',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  /// TABLE HEADER WIDGET
  Widget _tableHeader() {
    return const Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            'Name',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            'Mobile',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            'Occupation',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  /// CUSTOMER ROW WIDGET
  Widget _customerRow({
    required String name,
    required String mobile,
    required String occupation,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(name, style: const TextStyle(fontSize: 10)),
          ),
          Expanded(
            flex: 3,
            child: Text(mobile, style: const TextStyle(fontSize: 10)),
          ),
          Expanded(
            flex: 3,
            child: Text(occupation, style: const TextStyle(fontSize: 10)),
          ),
        ],
      ),
    );
  }
}
