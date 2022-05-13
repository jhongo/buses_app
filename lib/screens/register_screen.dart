import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xffEA5055),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 90,
            ),
            const CircleAvatar(
              radius: 130,
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/736x/21/20/b0/2120b058cb9946e36306778243eadae5.jpg'),
              backgroundColor: Colors.grey,
            ),
            const SizedBox(
              height: 90,
            ),
            const Text(
              '¿Cómo quieres continuar?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'select'),
              child: Container(
                width: 320,
                height: 50,
                color: Colors.red[700],
                child: Row(
                  children: [
                    Container(
                      width: 70,
                      height: 50,
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.facebook_outlined,
                        size: 40,
                        color: Colors.blue[600],
                      ),
                    ),
                    Container(
                      width: 250,
                      color: Colors.white,
                      alignment: Alignment.center,
                      height: 50,
                      child: const Text(
                        'Continuar con Facebook',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'navbar'),
              child: Container(
                width: 320,
                height: 50,
                color: Colors.red[700],
                child: Row(
                  children: [
                    Container(
                      width: 70,
                      height: 50,
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.mark_email_unread_outlined,
                        size: 40,
                        color: Colors.blue[600],
                      ),
                    ),
                    Container(
                      width: 250,
                      color: Colors.white,
                      alignment: Alignment.center,
                      height: 50,
                      child: const Text(
                        'Continuar con Google',
                        style: TextStyle(fontSize: 17),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Registrarse',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
