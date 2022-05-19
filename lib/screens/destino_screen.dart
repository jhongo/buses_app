import 'package:buses_tesis/models/paradas_models.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class DestinoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      width: size.width,
      height: size.height,
      color: const Color(0xffEBE9D9),
      child: Stack(
        children: [
          Positioned(bottom: 0, child: BackgroundDestino()),
          _HeaderDestino(),
          Positioned(top: 130, child: _ParadaItem())
          ],
        ),
       )

    );

    
  }
}

class _ParadaItem extends StatelessWidget {
  List parada = paradaTotems;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 150,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Row(
          children: List.generate(
              parada.length,
              (index) => CircleParada(
                    destino: parada[index],
                  )),
        ),
      ),
    );
  }
}

class CircleParada extends StatelessWidget {
  final destino;
  const CircleParada({Key? key, this.destino}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElasticIn(
      duration: Duration(milliseconds:1500 ),
      delay: Duration(milliseconds: 700 ),
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 30),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: const Color(0xffEBE9D9),
            border: Border.all(color: Colors.indigo, width:5),
            shape: BoxShape.circle),
        child: Text('${destino['nro']}', style: TextStyle(color: Color(0xff294171), fontSize: 35, fontWeight: FontWeight.w600,),),
      ),
    );
  }
}

class _HeaderDestino extends StatelessWidget {
  const _HeaderDestino({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: size.width,
      height: size.height * 0.15,
      child: Row(
        children:  [
          SizedBox(
            width: 15,
          ),
          GestureDetector(
            child: Icon(
              Icons.chevron_left,
              size: 40,
            ),
            onTap:(){
              Navigator.pop(context);
            },
          ),
          Spacer(),
          Text(
            'Los Totems',
            style: TextStyle(fontSize: 25, fontFamily: 'RobotoMono'),
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
    );
  }
}

class BackgroundDestino extends StatelessWidget {
  const BackgroundDestino({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FadeInUp(
      child: Container(
        width: size.width,
        height: size.height * 0.75,
        color: Color.fromRGBO(202, 99, 94, 1),
        child: Image.asset('assets/imgs/iglesia.png'),
      ),
    );
  }
}
