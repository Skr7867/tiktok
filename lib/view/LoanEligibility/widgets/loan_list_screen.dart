import 'package:flutter/material.dart';

class LoanListScreen extends StatefulWidget {
  const LoanListScreen({super.key});

  @override
  State<LoanListScreen> createState() => _LoanListScreenState();
}

class _LoanListScreenState extends State<LoanListScreen> {
  String selectedFilter = 'All Applications';

  final List<String> filterOptions = [
    'All Applications',
    'Stage1_BasicDetails',
    'Stage2_AdditionalDetails',
    'Submitted',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            _topBar(),
            const Divider(height: 1),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: 1100,
                child: Column(
                  children: [
                    _tableHeader(),
                    const Divider(height: 1),
                    _tableRow(
                      srNo: '#1',
                      amount: '₹40,00,000',
                      tenure: '60 Months',
                      vehicle: 'No info',
                      eligible: '₹17,74,411',
                      status: 'Stage1_BasicDetails',
                    ),
                    _tableRow(
                      srNo: '#2',
                      amount: '₹10,00,000',
                      tenure: '24 Months',
                      vehicle: 'Hyundai (Verna)',
                      eligible: '₹5,78,633',
                      status: 'Submitted',
                    ),
                    _tableRow(
                      srNo: '#3',
                      amount: '₹50,00,000',
                      tenure: '12 Months',
                      vehicle: 'No info',
                      eligible: '₹97,263',
                      status: 'Stage1_BasicDetails',
                    ),
                    _tableRow(
                      srNo: '#4',
                      amount: '₹9,50,000',
                      tenure: '36 Months',
                      vehicle: 'Hyundai (Verna)',
                      eligible: '₹15,94,530',
                      status: 'Submitted',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- TOP BAR ----------------
  Widget _topBar() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search by ID or Brand...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                isDense: true,
              ),
            ),
          ),
          const SizedBox(width: 12),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedFilter,
              items: filterOptions
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedFilter = value!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- HEADER ----------------
  Widget _tableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      color: const Color(0xffF1F3F8),
      child: const Row(
        children: [
          _HeaderCell('SR.NO', 80),
          _HeaderCell('LOAN AMOUNT', 140),
          _HeaderCell('TENURE', 120),
          _HeaderCell('VEHICLE DETAILS', 200),
          _HeaderCell('MAX ELIGIBLE', 150),
          _HeaderCell('STATUS', 180),
          _HeaderCell('ACTION', 130),
        ],
      ),
    );
  }

  // ---------------- ROW ----------------
  Widget _tableRow({
    required String srNo,
    required String amount,
    required String tenure,
    required String vehicle,
    required String eligible,
    required String status,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          _DataCell(srNo, 80),
          _DataCell(amount, 140, bold: true),
          _DataCell(tenure, 120),
          _DataCell(vehicle, 200),
          _DataCell(eligible, 150, color: Colors.green, bold: true),
          _statusChip(status),
          _actionButton(),
        ],
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  final String text;
  final double width;

  const _HeaderCell(this.text, this.width);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
      ),
    );
  }
}

class _DataCell extends StatelessWidget {
  final String text;
  final double width;
  final bool bold;
  final Color? color;

  const _DataCell(this.text, this.width, {this.bold = false, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: bold ? FontWeight.w600 : FontWeight.normal,
          color: color ?? Colors.black,
        ),
      ),
    );
  }
}

Widget _statusChip(String status) {
  final bool isStage = status.contains('Stage');

  return SizedBox(
    width: 180,
    child: Chip(
      label: Text(status, style: const TextStyle(fontSize: 12)),
      backgroundColor: isStage ? Colors.blue.shade50 : Colors.grey.shade200,
    ),
  );
}

Widget _actionButton() {
  return SizedBox(
    width: 130,
    child: OutlinedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.visibility, size: 18),
      label: const Text('View'),
    ),
  );
}
