import 'package:flutter/material.dart';
import 'main.dart';

void main() => runApp(Login());

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // List of roles
  final List<String> _roles = ['GP Staff', 'PHED Staff', 'Admin'];
  String? _selectedRole;

  // Selected language and list of languages
  String _selectedLanguage = 'English';
  final List<String> _languages = ['English', 'Marathi', 'Hindi', 'Gujarati', 'Punjabi'];

  // Map to store translations
  Map<String, Map<String, String>> translations = {
    'English': {
      'login': 'Login to Your Account',
      'email': 'Email',
      'password': 'Password',
      'selectRole': 'Select Role',
      'loginButton': 'Login',
      'signUp': 'Sign Up',
      'dontHaveAccount': 'Don\'t have an account?',
      'enterEmail': 'Please enter your email',
      'invalidEmail': 'Please enter a valid email',
      'enterPassword': 'Please enter your password',
      'passwordLength': 'Password must be at least 6 characters long',
      'selectRoleError': 'Please select a role',
    },
    'Marathi': {
      'login': 'तुमच्या खात्यात लॉगिन करा',
      'email': 'ई-मेल',
      'password': 'पासवर्ड',
      'selectRole': 'भूमिका निवडा',
      'loginButton': 'लॉगिन',
      'signUp': 'साइन अप करा',
      'dontHaveAccount': 'खाते नाही?',
      'enterEmail': 'कृपया तुमचा ई-मेल टाका',
      'invalidEmail': 'कृपया वैध ई-मेल टाका',
      'enterPassword': 'कृपया तुमचा पासवर्ड टाका',
      'passwordLength': 'पासवर्ड किमान ६ वर्णांचा असावा',
      'selectRoleError': 'कृपया भूमिका निवडा',
    },
    'Hindi': {
      'login': 'अपने खाते में लॉगिन करें',
      'email': 'ईमेल',
      'password': 'पासवर्ड',
      'selectRole': 'भूमिका चुनें',
      'loginButton': 'लॉगिन',
      'signUp': 'साइन अप करें',
      'dontHaveAccount': 'खाता नहीं है?',
      'enterEmail': 'कृपया अपना ईमेल दर्ज करें',
      'invalidEmail': 'कृपया एक वैध ईमेल दर्ज करें',
      'enterPassword': 'कृपया अपना पासवर्ड दर्ज करें',
      'passwordLength': 'पासवर्ड कम से कम 6 वर्ण का होना चाहिए',
      'selectRoleError': 'कृपया भूमिका चुनें',
    },
    'Gujarati': {
      'login': 'તમારા ખાતામાં લૉગિન કરો',
      'email': 'ઈમેલ',
      'password': 'પાસવર્ડ',
      'selectRole': 'ભૂમિકા પસંદ કરો',
      'loginButton': 'લૉગિન',
      'signUp': 'સાઇન અપ કરો',
      'dontHaveAccount': 'ખાતું નથી?',
      'enterEmail': 'કૃપા કરીને તમારું ઈમેલ દાખલ કરો',
      'invalidEmail': 'કૃપા કરીને માન્ય ઈમેલ દાખલ કરો',
      'enterPassword': 'કૃપા કરીને તમારો પાસવર્ડ દાખલ કરો',
      'passwordLength': 'પાસવર્ડ ઓછામાં ઓછો 6 અક્ષરોનો હોવો જોઈએ',
      'selectRoleError': 'કૃપા કરીને ભૂમિકા પસંદ કરો',
    },
    'Punjabi': {
      'login': 'ਆਪਣੇ ਖਾਤੇ ਵਿੱਚ ਲੌਗਿਨ ਕਰੋ',
      'email': 'ਈਮੇਲ',
      'password': 'ਪਾਸਵਰਡ',
      'selectRole': 'ਭੂਮਿਕਾ ਚੁਣੋ',
      'loginButton': 'ਲੌਗਿਨ',
      'signUp': 'ਸਾਈਨ ਅਪ ਕਰੋ',
      'dontHaveAccount': 'ਖਾਤਾ ਨਹੀਂ ਹੈ?',
      'enterEmail': 'ਕਿਰਪਾ ਕਰਕੇ ਆਪਣਾ ਈਮੇਲ ਦਰਜ ਕਰੋ',
      'invalidEmail': 'ਕਿਰਪਾ ਕਰਕੇ ਠੀਕ ਈਮੇਲ ਦਰਜ ਕਰੋ',
      'enterPassword': 'ਕਿਰਪਾ ਕਰਕੇ ਆਪਣਾ ਪਾਸਵਰਡ ਦਰਜ ਕਰੋ',
      'passwordLength': 'ਪਾਸਵਰਡ ਘੱਟੋ ਘੱਟ 6 ਅੱਖਰਾਂ ਦਾ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ',
      'selectRoleError': 'ਕਿਰਪਾ ਕਰਕੇ ਭੂਮਿਕਾ ਚੁਣੋ',
    }
  };

  // Function to get the translated text based on selected language
  String _getTranslation(String key) {
    return translations[_selectedLanguage]?[key] ?? key;
  }

  // Function to handle form submission
  void _submit() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();
      String? role = _selectedRole;

      if (role == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_getTranslation('selectRoleError'))),
        );
        return;
      }

      // Implement your login logic here
      print('Email: $email');
      print('Password: $password');
      print('Role: $role');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Dropdown for Language Selection
                  Align(
                    alignment: Alignment.topRight,
                    child: DropdownButton<String>(
                      value: _selectedLanguage,
                      items: _languages.map((String language) {
                        return DropdownMenuItem<String>(
                          value: language,
                          child: Text(language),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedLanguage = newValue!;
                        });
                      },
                    ),
                  ),

                  // Logo or App Title
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.account_circle,
                          size: 100,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(height: 10),
                        Text(
                          _getTranslation('login'),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Email Field
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: _getTranslation('email'),
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return _getTranslation('enterEmail');
                      }
                      // Basic email validation
                      if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
                          .hasMatch(value)) {
                        return _getTranslation('invalidEmail');
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),

                  // Password Field
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: _getTranslation('password'),
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return _getTranslation('enterPassword');
                      }
                      if (value.length < 6) {
                        return _getTranslation('passwordLength');
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),

                  // Dropdown for Role Selection
                  DropdownButtonFormField<String>(
                    value: _selectedRole,
                    decoration: InputDecoration(
                      labelText: _getTranslation('selectRole'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                    items: _roles.map((String role) {
                      return DropdownMenuItem<String>(
                        value: role,
                        child: Text(role),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedRole = newValue;
                      });
                    },
                    validator: (value) =>
                    value == null ? _getTranslation('selectRoleError') : null,
                  ),
                  SizedBox(height: 30),

                  // Login Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Text(_getTranslation('loginButton')),
                  ),
                  SizedBox(height: 20),

                  // Forgot Password / Sign Up (Optional)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(_getTranslation('dontHaveAccount')),
                      TextButton(
                        onPressed: () {
                          // Navigate to sign up
                        },
                        child: Text(_getTranslation('signUp')),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
