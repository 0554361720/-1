import 'package:flutter/material.dart';
import 'user.dart';

void main() {  //دايم ثابته
  runApp(const MyApp()); //من خلالهااقدر استدعي الكلاسات الي تحت
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, //عشان اشيل علامه افتراضيه موجوده
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage());

  }
}

bool isSecured = true;

Map<String, User> users = {
  "retaj@gmail.com":User(email: 'retaj@gmail.com', Password: '1234'),
 "retaaaj@gmail.com": User(email: 'retaaaj@gmail.com', Password: '123'),
};

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //الجزء العلوي من الصفحة 
        backgroundColor: const Color.fromARGB(255, 48, 19, 135),
        centerTitle: true,
        title: const Text(
          "Login Screen",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        // (leading) هو للجزء اليسار
        leading: const Icon(Icons.menu, color: Colors.white, size: 28),
        // (actions) هو للجزء اليمين
        actions: const [
          Icon(
            Icons.search,
            color: Colors.white,
            size: 29,
          ),
          SizedBox(
            width: 10,
          ), //يعطيني مسافه بين كل ايقونه وايقونه
          Icon(
            Icons.message,
            color: Colors.white,
            size: 26,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "images/software-academia-website.png",
              height: 250,
              width: 300,
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      label: Text("Enter Email"),
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderSide: BorderSide()), //البوكس الي حول الجملة
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: isSecured, //عشان نخلي الباس مخفي
                    decoration: InputDecoration(
                      label: Text("Enter Password"),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          print(isSecured);
                          setState(() {
                            isSecured = !isSecured;
                          });
                          print(isSecured);
                        },
                        icon: Icon(Icons.remove_red_eye),
                      ),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                        User user = users[emailController.text]!;
                        

                        if (user.email == emailController.text &&
                            user.Password == passwordController.text) {
                          print('logged');
                        } else {
                          print('email or password is wrong');
                        }
                      
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 48, 19, 135),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.login,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "log in",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
