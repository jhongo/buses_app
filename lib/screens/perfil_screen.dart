import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              
              height: 50,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'home'),
                    child: Container(
                      width: 60,
                      color: Colors.white,
                      height: 48,
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 22,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 120,
                    height: 47,
                   
                    alignment: Alignment.center,
                    child: const Text(
                      'Mi perfil',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.only(left: 30),
              // color: Colors.black,

              alignment: Alignment.centerLeft,
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://i.pinimg.com/736x/21/20/b0/2120b058cb9946e36306778243eadae5.jpg'),
              ),
            ),
            const SizedBox(height: 30),
            Container(
                // color: Colors.amber,
                width: double.infinity,
                height: 60,
                padding: const EdgeInsets.only(left: 30),
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Kevin Gonzales',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('keygon10@gmail.com', style: TextStyle(fontSize: 16))
                  ],
                )),
            const SizedBox(height: 20),
            Container(
                // color: Colors.amber,
                width: double.infinity,
                height: 60,
                padding: const EdgeInsets.only(left: 30),
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('idioma',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('Español', style: TextStyle(fontSize: 16))
                  ],
                )),
            const SizedBox(height: 20),
            Container(
                // color: Colors.amber,
                width: double.infinity,
                height: 60,
                padding: const EdgeInsets.only(left: 30),
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Consultar saldo',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('Ingresa tu # de tarjeta',
                        style: TextStyle(fontSize: 16))
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              // color: Colors.black,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 30),
              child: Column(
              children: [
                Container(
                  width: 170,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                    
                  ),
                  child: const Text('Cerrar Sesión', style: TextStyle(fontSize: 17),),
                ),
               
                
              ],
            )),
             const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 213,
                  
                  //  color: Colors.amber,

                  child: FadeInImage(
                    placeholder: AssetImage('https://via.placeholder.com/100x100'), 
                    image: NetworkImage('https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832__340.jpg'),
                    fit: BoxFit.cover,
                    ),
                   )
          ],
        ),
      ),
    );
  }
}
