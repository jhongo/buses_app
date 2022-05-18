import 'package:buses_tesis/models/paradas_models.dart';
import 'package:flutter/material.dart';

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
          Positioned(top: 150, child: _ParadaItem())
        ],
      ),
    ));
  }
}

class _ParadaItem extends StatelessWidget {
  List parada = paradas;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 150,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: const Color(0xffEBE9D9),
          border: Border.all(color: Colors.indigo, width: 3),
          shape: BoxShape.circle),
      child: Text(destino['destino']),
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
        children: const [
          SizedBox(
            width: 15,
          ),
          Icon(
            Icons.chevron_left,
            size: 40,
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
    return Container(
      width: size.width,
      height: size.height * 0.75,
      color: Color.fromRGBO(202, 99, 94, 1),
      child: Image.asset('assets/imgs/iglesia.png'),
    );
  }
}
