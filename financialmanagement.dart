import 'package:flutter/material.dart';

void main() {
  runApp(FinancialManagement());
}

class FinancialManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;

  final List<Widget> _pages = [
    DigitalCashBook(),
    BillGeneration(),
    PaymentOptions(),
  ];

  final ButtonStyle navButtonStyle = ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(vertical: 16),
    fixedSize: Size(250, 50),
    textStyle: TextStyle(fontSize: 16),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text('Jal Jeevan Mission Dashboard'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 350,
          padding: EdgeInsets.all(16),
          decoration: _containerBoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Financial Management', style: _headingStyle()),
              SizedBox(height: 16),
              _buildNavigationButtons(),
              SizedBox(height: 24),
              Expanded(child: _pages[selectedIndex]),
              SizedBox(height: 16),
              _buildBackButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationButtons() {
    final List<String> buttonLabels = ['Digital Cash Book', 'Bill Generation', 'Payment Options'];
    return Column(
      children: List.generate(buttonLabels.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: ElevatedButton(
            onPressed: () => setState(() => selectedIndex = index),
            style: navButtonStyle.copyWith(
              backgroundColor: MaterialStateProperty.all(selectedIndex == index ? Colors.blueAccent : Colors.grey[300]),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            child: FittedBox(fit: BoxFit.scaleDown, child: Text(buttonLabels[index])),
          ),
        );
      }),
    );
  }

  Widget _buildBackButton() {
    return ElevatedButton(
      onPressed: () {
        // Handle back to dashboard logic here
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[600],  // Fix the error by using backgroundColor
        padding: EdgeInsets.symmetric(vertical: 16),
        fixedSize: Size(250, 50),
      ),
      child: Text('Back to Dashboard'),
    );
  }

  BoxDecoration _containerBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5)),
      ],
    );
  }

  TextStyle _headingStyle() {
    return TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  }
}

// Digital Cash Book Section
class DigitalCashBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Digital Cash Book', style: _sectionHeadingStyle()),
        SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columnSpacing: 20,
            columns: [
              DataColumn(label: Text('Date')),
              DataColumn(label: Text('Description')),
              DataColumn(label: Text('Income', overflow: TextOverflow.ellipsis)),
            ],
            rows: _generateCashBookRows(),
          ),
        ),
      ],
    );
  }

  List<DataRow> _generateCashBookRows() {
    return [
      DataRow(cells: [
        DataCell(Text('2024-03-01')),
        DataCell(Text('Water bill payment')),
        DataCell(Text('₹500')),
      ]),
      DataRow(cells: [
        DataCell(Text('2024-03-02')),
        DataCell(Text('Maintenance cost')),
        DataCell(Text('-')),
      ]),
    ];
  }

  TextStyle _sectionHeadingStyle() {
    return TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  }
}

// Bill Generation Section
class BillGeneration extends StatefulWidget {
  @override
  _BillGenerationState createState() => _BillGenerationState();
}

class _BillGenerationState extends State<BillGeneration> {
  final _formKey = GlobalKey<FormState>();
  String? consumerName, consumerID, waterUsage;
  double? totalBill;

  // Assume a rate of ₹2 per liter
  final double ratePerLiter = 2.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Bill Generation', style: _sectionHeadingStyle()),
          SizedBox(height: 16),
          Form(
            key: _formKey,
            child: Column(
              children: [
                _buildTextInput('Consumer Name', (value) => consumerName = value, false),
                _buildTextInput('Consumer ID', (value) => consumerID = value, false),
                _buildTextInput('Water Usage (Liters)', (value) => waterUsage = value, true),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _generateBill();
                    }
                  },
                  style: ElevatedButton.styleFrom(fixedSize: Size(250, 50)),
                  child: Text('Generate Bill'),
                ),
                if (totalBill != null) _buildBillSummary(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextInput(String labelText, Function(String?) onSave, bool isNumeric) {
    return TextFormField(
      decoration: InputDecoration(labelText: labelText),
      keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $labelText';
        }
        if (isNumeric && double.tryParse(value) == null) {
          return 'Please enter a valid number';
        }
        return null;
      },
      onSaved: onSave,
    );
  }

  void _generateBill() {
    double usage = double.parse(waterUsage!);
    setState(() {
      totalBill = usage * ratePerLiter;
    });
  }

  Widget _buildBillSummary() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.blueAccent),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Bill Summary', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Consumer Name: $consumerName'),
            Text('Consumer ID: $consumerID'),
            Text('Water Usage: $waterUsage liters'),
            SizedBox(height: 8),
            Text('Total Bill: ₹${totalBill!.toStringAsFixed(2)}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  TextStyle _sectionHeadingStyle() {
    return TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  }
}

// Payment Options Section
class PaymentOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Payment Options', style: _sectionHeadingStyle()),
          SizedBox(height: 16),
          _buildPaymentButton('UPI Payment', Colors.green, () {
            // Handle UPI Payment logic here
          }),
          SizedBox(height: 10),
          _buildPaymentButton('Net Banking', Colors.blue, () {
            // Handle Net Banking logic here
          }),
          SizedBox(height: 10),
          _buildPaymentButton('Credit Card', Colors.purple, () {
            // Handle Credit Card Payment logic here
          }),
        ],
      ),
    );
  }

  Widget _buildPaymentButton(String label, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,  // Fix the error by using backgroundColor
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 50),
        fixedSize: Size(250, 50),
      ),
      child: Text(label),
    );
  }

  TextStyle _sectionHeadingStyle() {
    return TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  }
}