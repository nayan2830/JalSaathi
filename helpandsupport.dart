import 'package:flutter/material.dart';

void main() {
  runApp(HelpAndSupport());
}

class HelpAndSupport extends StatefulWidget {
  @override
  _HelpAndSupportState createState() => _HelpAndSupportState();
}

class _HelpAndSupportState extends State<HelpAndSupport> {
  String activeTab = 'faqs';

  final List<Map<String, String>> faqs = [
    {
      'question': 'How do I reset my password?',
      'answer':
      "You can reset your password by clicking on the 'Forgot Password' link on the login page and following the instructions sent to your email.",
    },
    {
      'question': 'How can I update my profile information?',
      'answer':
      "To update your profile, go to the 'Settings' page from your dashboard and click on 'Edit Profile'.",
    },
    {
      'question': 'What payment methods do you accept?',
      'answer': "We accept all major credit cards, PayPal, and bank transfers.",
    },
  ];

  final List<Map<String, String>> tutorials = [
    {
      'title': 'Getting Started Guide',
      'description':
      "Learn the basics of using our platform in this comprehensive tutorial.",
    },
    {
      'title': 'Advanced Features Walkthrough',
      'description':
      "Discover how to use our advanced features to maximize your productivity.",
    },
    {
      'title': 'Troubleshooting Common Issues',
      'description':
      "Find solutions to common problems you might encounter while using our service.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50], // Faint shade of the AppBar color
      appBar: AppBar(
        title: Text('Help and Support'),
        backgroundColor: Colors.blue[500],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                tabButton('FAQs', 'faqs'),
                tabButton('Tutorials', 'tutorials'),
                tabButton('Customer Support', 'support'),
              ],
            ),
            SizedBox(height: 16),
            // Content based on active tab
            if (activeTab == 'faqs') faqsSection(),
            if (activeTab == 'tutorials') tutorialsSection(),
            if (activeTab == 'support') supportSection(),
            SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate back to dashboard
                  Navigator.of(context).pop();
                },
                child: Text('Back to Dashboard'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabButton(String title, String tabKey) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          activeTab = tabKey;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: activeTab == tabKey ? Colors.blue[500] : Colors.grey[300],
      ),
      child: Text(
        title,
        style: TextStyle(
          color: activeTab == tabKey ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  Widget faqsSection() {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: faqs.map((faq) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    faq['question']!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[500],
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(faq['answer']!),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget tutorialsSection() {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: tutorials.map((tutorial) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tutorial['title']!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[500],
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(tutorial['description']!),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget supportSection() {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Customer Support',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue[500],
              ),
            ),
            SizedBox(height: 8),
            Text(
              "If you need further assistance, please don't hesitate to contact our support team:",
            ),
            SizedBox(height: 8),
            Text("• Email: support@example.com"),
            Text("• Phone: +1 (555) 123-4567"),
            Text("• Live Chat: Available 24/7 on our website"),
          ],
        ),
      ),
    );
  }
}