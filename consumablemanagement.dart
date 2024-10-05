import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(Consumablemanagement());
}

class Consumablemanagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue.shade800,
        textTheme: TextTheme(
          headlineLarge: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade900),
          bodyLarge: TextStyle(fontSize: 18, color: Colors.black87),
          labelLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      home: JalJeevanMissionApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class JalJeevanMissionApp extends StatefulWidget {
  @override
  _JalJeevanMissionAppState createState() => _JalJeevanMissionAppState();
}

class _JalJeevanMissionAppState extends State<JalJeevanMissionApp> {
  String selectedSection = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Jal Jeevan Mission\nManagement System',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        backgroundColor: Colors.blue.shade800,
        centerTitle: true,
        elevation: 4.0,
        leading: Icon(Icons.menu, color: Colors.white),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.blue.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20.0),
              _buildTitle('Consumable Management (CM)'),
              SizedBox(height: 20.0),
              _buildStyledButton('Smart Inventory Overview'),
              SizedBox(height: 16.0),
              _buildStyledButton('Automated Procurement\nRecommendations'),
              SizedBox(height: 16.0),
              _buildStyledButton('Waste Tracking Logs'),
              SizedBox(height: 30.0),
              _buildSectionContent(),
              Spacer(),
              // Return to Dashboard Button
              // Shorter Return to Dashboard Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()), // Replace with your dashboard component
                        (Route<dynamic> route) => false,
                  );
                },
                child: Text(
                  'Return to Dashboard',
                  style: TextStyle(fontSize: 16), // Keep text size reasonable
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0), // Reduced padding
                  minimumSize: Size(120, 40), // Set minimum size to make it shorter in length and height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),

              SizedBox(height: 20.0),
              _buildFooter(),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStyledButton(String buttonText) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedSection = buttonText;
        });
      },
      child: Text(
        buttonText,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white), // Set text color to white
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedSection == buttonText
            ? Colors.blue.shade800
            : Colors.blue.shade400,
        padding: EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        shadowColor: Colors.blue.shade900,
        elevation: 8,
      ),
    );
  }

  Widget _buildSectionContent() {
    if (selectedSection == "Smart Inventory Overview") {
      return _buildSmartInventoryOverview();
    } else if (selectedSection == "Automated Procurement\nRecommendations") {
      return _buildProcurementRecommendations();
    } else if (selectedSection == "Waste Tracking Logs") {
      return _buildWasteTrackingLogs();
    }
    return Container();
  }

  Widget _buildSmartInventoryOverview() {
    return _buildContentSection(
      title: 'Smart Inventory Overview',
      content: Column(
        children: [
          _buildInventoryRow('Chemicals:', '80% in stock', Colors.green),
          SizedBox(height: 10.0),
          _buildInventoryRow('Filters:', '50% in stock', Colors.orange),
          SizedBox(height: 10.0),
          _buildInventoryRow('Spare Parts:', '30% in stock', Colors.red),
        ],
      ),
    );
  }

  Widget _buildProcurementRecommendations() {
    return _buildContentSection(
      title: 'Automated Procurement Recommendations',
      content: Column(
        children: [
          _buildRecommendationItem('Chlorine tablets:', 'Order 1000 units'),
          SizedBox(height: 10.0),
          _buildRecommendationItem('Carbon filters:', 'Order 500 units'),
          SizedBox(height: 10.0),
          _buildRecommendationItem('Pipe fittings:', 'Order 200 sets'),
        ],
      ),
    );
  }

  Widget _buildWasteTrackingLogs() {
    return _buildContentSection(
      title: 'Waste Tracking Logs',
      content: _buildWasteTable(),
    );
  }

  Widget _buildContentSection({required String title, required Widget content}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 20.0),
            content,
          ],
        ),
      ),
    );
  }

  Widget _buildInventoryRow(String itemName, String status, Color statusColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(itemName),
        Text(
          status,
          style: TextStyle(
            color: statusColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendationItem(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(value),
      ],
    );
  }

  Widget _buildWasteTable() {
    return Table(
      border: TableBorder.all(color: Colors.grey.shade300),
      children: [
        TableRow(
          children: [
            _buildTableCell('Consumable', true),
            _buildTableCell('Usage', true),
            _buildTableCell('Waste', true),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('Chemicals'),
            _buildTableCell('500 kg'),
            _buildTableCell('50 kg'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('Filters'),
            _buildTableCell('200 units'),
            _buildTableCell('10 units'),
          ],
        ),
      ],
    );
  }

  Widget _buildTableCell(String text, [bool isHeader = false]) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: isHeader ? 16.0 : 14.0,
          color: isHeader ? Colors.blue.shade800 : Colors.black87,
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Text(
      '© 2024 Jal Jeevan Mission. All rights reserved.',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.grey.shade600,
        fontSize: 14.0,
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
        shadows: [
          Shadow(
            offset: Offset(1.0, 1.0),
            blurRadius: 3.0,
            color: Colors.grey.shade400,
          ),
        ],
      ),
    );
  }
}
