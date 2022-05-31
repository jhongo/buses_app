import 'package:animate_do/animate_do.dart';
import 'package:buses_tesis/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Color(0xFFecebd9),
        width: size.width,
        height: size.height,
        child: CustomPaint(
          painter: BackgroundPainter(),
          child: Column(
            children:const [
              SizedBox(height: 65,),
              HeaderHome(),
              SizedBox(height: 85,),
              _ContentSearch(),
              SizedBox(height: 150,),
              _ContainerImage()

            ],
          ),
        ),
      )
    );
  }
}

class _ContainerImage extends StatelessWidget {
  const _ContainerImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned( top: 15, child: _CircleBackground()),
            FadeInUp(child: Image.asset('assets/imgs/catedral.png'))
          ],
        ),
      ),
    );
  }
}

class _CircleBackground extends StatelessWidget {
  const _CircleBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BounceInDown(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: Color(0xffea5055),
          shape: BoxShape.circle
        ),
      ),
    );
  }
}

class _ContentSearch extends StatelessWidget {
  const _ContentSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: FadeInLeft(
        child: Container(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('¿A dónde quieres ir?', style: TextStyle(color: Color(0xFF294171),fontSize: 16, fontWeight: FontWeight.w800 ),),
              SizedBox(height: 15,),
              Container(
                alignment: Alignment.centerLeft,
                height: 50,
                child: CustomSearch()
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderHome extends StatelessWidget {
  const HeaderHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: FadeInLeft(
        child: Container(
          width: size.width,
          height: size.height * 0.15,
          child: Row(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Kevin,', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 40),),
                    Text('Encontremos tu bus..', style: TextStyle(color: Colors.white, fontSize: 18), ),
                  ],
                ),
              ),
              Spacer(),
              CircleAvatar(
                minRadius: 50,
                backgroundColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Image.asset('assets/imgs/bus-r4.png',height: 70),
                ),
              )
      
            ],
          ),
        ),
      ),
    );
  }
}


