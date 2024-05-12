import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main_page.dart';
import 'market_page.dart';
import 'profile_page.dart';
import 'transaction_page.dart';

void main() {
  runApp(MyApp());
}
//this is where all routes happen (adjust when needed).
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(), 
        '/main_page': (context) => MainPage(), //main page customer
        '/market': (context) => MarketPage(), //market page customer
        '/profile': (context) => ProfilePage(), //profile page customer
        '/transactions': (context) => TransactionsPage(), //transactions page customer
        '/sign_up': (context) => SignUpPage(),
        '/forgot_password': (context) => ForgotPasswordPage(),
        '/verify_otp': (context) => VerifyOtpPage(),
        '/new_password': (context) => NewPasswordPage(),
      },
    );
  }
}

//UI done.
//add rin ng conditional statement if walang nahanap na username or password sa database.
class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/logo_agri2.png', 
                width: 200.0,
                height: 200.0,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
           Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Username',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Enter your username here',
                    prefixIcon: const Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Enter your password here',
                    prefixIcon: const Icon(Icons.lock),
                  ),
                  obscureText: true,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  //probably mag add ng logic here, specifically sa database (connecting database ng Customer to check the credential sa database).
                  //put logic here (validation for username and password before being prompt to main page)
                  Navigator.pushNamed(context, '/main_page');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(int.parse('0xFF1976D2')), 
                  foregroundColor: Colors.white, 
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
                child: const Text('Login')
                ),
                const SizedBox(width: 20), 
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign_up');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(int.parse('0xFF4CAF50')),
                  foregroundColor: Colors.white, 
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
                child: const Text('Sign up'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/forgot_password');
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blueAccent,
                  ),
                    child: const Text('Forgot Password?'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//for this part of code na comment na lahat ng need iadd. Gagawin nalang since database related mostly for validation.

//done on this part (database nalang need iadd)
class SignUpPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/logo_agri2.png', 
                width: 200.0,
                height: 200.0,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                      const Text(
                      'Username',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter your username here',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter your email here',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    const Text(
                      'Password',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                       hintText: 'Enter your password here',
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 15.0),
                    const Text(
                      'Phone Number',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter your phone number',
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          //Add logic for creating and updating database for accounts.
                          Navigator.pushNamed(context, '/');//This will route directly to the login page then to the main page after validation.
                        },
                        style: ElevatedButton.styleFrom(
                        backgroundColor: Color(int.parse('0xFF4CAF50')),
                        foregroundColor: Colors.white, 
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          )
                        ),
                        child: const Text('Sign Up'),
                        ),
                      ]
                    ),
                  ],
                ),
              ),
            ]
          )
        )
      )
    );
  }
}
//for this part goods na (database connection nalang for adding and updating database)

//create logic for sending code (OTP) to email.
//upon researching paid mostly ang APIs in terms of OTP for email and phone number.
class ForgotPasswordPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
       body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50.0),
              Image.asset(
                'lib/assets/logo_agri2.png', 
                width: 200.0,
                height: 200.0,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Enter email',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Send code to email',
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          //add code here related sa API para mag send ng code sa email. 
                          Navigator.pushNamed(context, '/verify_otp');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(int.parse('0xFF4CAF50')),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Verify'),
                      ),
                    )
                  ],
                ),
              ),
            ]
          )
        )
      )
    );
  }
}
//UI for this is done, applying logics nalang and (API?).

//UI done, Logics nalang for verification and API.
class VerifyOtpPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verification'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50.0),
              Image.asset(
                'lib/assets/logo_agri2.png', 
                width: 200.0,
                height: 200.0,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 10.0),
                    const Text(
                      'OTP verification',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Enter OTP code here',
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          //add logic here na mag mamatch dapat yung sinend na code sa email then saka mag verify.
                          Navigator.pushNamed(context, '/new_password');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(int.parse('0xFF4CAF50')),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Verify'),
                      ),
                    )
                  ],
                ),
              ),
            ]
          )
        )
      )
    );
  }
}

//UI done, logics for database and conditional statements nalang need.
class NewPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Password'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50.0),
              Image.asset(
                'lib/assets/logo_agri2.png', 
                width: 200.0,
                height: 200.0,
                fit: BoxFit.contain,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'New Password',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter New Password',
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      'Confirm New Password',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Confirm New Password',
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20.0),
                    Center(
                    child: ElevatedButton(
                      onPressed: () {
                        //Add logic to update password in database.
                        //add conditional statement if di match yung new password na nilagay.
                        Navigator.pushNamed(context, '/');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(int.parse('0xFF4CAF50')),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Submit'),
                      ),
                    )
                  ],
                ),
              ),
            ]
          )
        )
      )
    );
  }
}
