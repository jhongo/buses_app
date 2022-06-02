import 'package:flutter/material.dart';
import 'package:buses_tesis/service/select_parada_service.dart';
import 'package:provider/provider.dart';

class MapaScreen extends StatefulWidget {
   
  const MapaScreen({Key? key}) : super(key: key);

  @override
  State<MapaScreen> createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> traslacion;
  late Animation<double> inclinada;

  late Animation<double> traslacionP;
  late Animation<double> inclinadaP;
  
  late Animation<double> derecha;
  late Animation<double> arriba;
  late Animation<double> abajo;
  late Animation<double> izquierda;
  late Animation<double> destinoO;
  
  late Animation<double> abajoUno;
  late Animation<double> izquierdaUno;
  late Animation<double> opacidadUno;
   final pageScroll =PageController();



  @override
  void initState() {

    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 4000) );
    traslacion = Tween(begin: 0.0, end: -200.0 ).animate(controller);
    inclinada = Tween(begin: 0.0, end: -50.0, ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut  ));

    traslacionP = Tween(begin: 0.0, end: -200.0 ).animate(controller);
    inclinadaP = Tween(begin: 0.0, end: -50.0, ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut  ));


    
    derecha = Tween(begin: 0.0, end: 180.0 ).animate(CurvedAnimation(
      parent: controller, curve: Curves.easeIn  ));
    arriba = Tween(begin: 0.0, end: 150.0, ).animate(
      CurvedAnimation(parent: controller, curve: Interval(0, 0, curve: Curves.bounceOut )  ));
    izquierda = Tween(begin:0.0, end: -80.0 ).animate(
      CurvedAnimation(parent: controller,curve: Interval(0.50, 0.75, curve: Curves.easeOut ) ));
    abajo = Tween(begin:0.0, end: 80.0 ).animate( 
      CurvedAnimation(parent: controller,  curve: Curves.easeOut ));
    destinoO = Tween(begin:1.0 , end:0.12 ).animate(controller);
    

    abajoUno = Tween(begin: 0.0, end: 220.0 ).animate(CurvedAnimation(
      parent: controller, curve: Curves.easeIn  ));

    izquierdaUno = Tween(begin: 0.0, end: -50.0 ).animate(CurvedAnimation(
      parent: controller, curve: Curves.easeIn  ));
    opacidadUno = Tween(begin: 0.2, end: 1.0).animate(CurvedAnimation(
      parent: controller, 
      curve: Curves.easeIn ));
    
    
    
    controller.addListener(() { });
    pageScroll.addListener(() {
     });


    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    pageScroll.dispose();
    super.dispose();
  }


  
  
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final pageControllerService = Provider.of<SelectParadaService>(context);
    controller.repeat();
    return Scaffold(
      body: Stack(
        children: [
          


          Container(
            width: w,
            height: h,
            color: Colors.white,
            child: PageView(
              controller: pageControllerService.pageControllerGet,
              physics: NeverScrollableScrollPhysics(),
              
              children: [


                // Primera Ruta
                Stack(
                  children: [
                    Image.asset('assets/imgs/totems2.png'),
                    Positioned.directional(
                      textDirection: TextDirection.ltr, 
                      top: 320,
                      end:0, 
                      child: AnimatedBuilder(
                        
                        animation: controller,
                        child: _Point(color: Color(0xff5f0a87),), 
                        builder: (BuildContext context, Widget? marcador){
                          return Transform.translate(
                            offset: Offset(0, inclinada.value),
                            child: Transform.translate(
                              
                              offset: Offset( traslacion.value, 0),
                              child:marcador,
                              
                              ),
                          );
                        }
                        
                        )
                    
                    ),
                  ],
                ),


                // Segunda Ruta
                Stack(
                  children: [
                    Image.asset('assets/imgs/totems2.png'),
                    Positioned.directional(
                      textDirection: TextDirection.ltr, 
                      top: 320,
                      end: 0, 
                      child: AnimatedBuilder(
                        
                        animation: controller,
                        child: _Point(color: Color(0xff011627)), 
                        builder: (BuildContext context, Widget? marcador){
                          return Transform.translate(
                            offset: Offset(0 , inclinadaP.value),
                            child: Transform.translate(
                              offset: Offset( traslacionP.value,0),
                              child:marcador,
                              
                              ),
                          );
                        }
                        
                        )
                    
                    ),
                  ],
                ),

                // TerceraRuta
                Stack(
                  children: [
                    Image.asset('assets/imgs/totems1.png',),

                    Positioned.directional(
                      textDirection: TextDirection.ltr, 
                      top: 35,
                      start: 5, 
                      child: _Point(color: Color(0xff22333b))
                    
                    ),

                    Positioned.directional(
                      textDirection: TextDirection.ltr, 
                      top: 135,
                      start: 145, 
                      child:AnimatedBuilder(
                        child: _Point(color: Color(0xffd00000)),
                        animation: controller, 
                        builder: (BuildContext context, Widget? puntoUno ){
                          return Opacity(
                            opacity: destinoO.value,
                            child: Transform.translate(
                              offset: Offset(derecha.value , abajo.value),
                              child: puntoUno,
                            ),
                          );
                        }
                        )
                    ),

                    Positioned.directional(
                      textDirection: TextDirection.ltr, 
                      top: 220,
                      end: 70,
                       
                      child:AnimatedBuilder(
                        child: _Point(color: Color(0xff284b63)),
                        animation: controller, 
                        builder: (BuildContext context, Widget? puntoUno ){
                          return Opacity(
                            opacity: opacidadUno.value,
                            child: Transform.translate(
                              offset: Offset(izquierdaUno.value , abajoUno.value),
                              child: puntoUno,
                            ),
                          );
                        }
                        )
                    ),

                  ],
                ),



                
              ],
            ),
          ),
          Positioned(bottom: 40, right: 0, child: _ItemsParada()),
        ],
      ),
    );
  }
}

class _ItemsParada extends StatelessWidget {
  const _ItemsParada({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 90,
      decoration:const BoxDecoration(
        color: Color(0xff294171),
        borderRadius: BorderRadius.only( bottomLeft: Radius.circular(50),topLeft: Radius.circular(50),  )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:const [
          _ButtonParada(img: 'assets/imgs/R16.png',index: 0,),
          _ButtonParada(img: 'assets/imgs/R22.png',index: 1,),
          _ButtonParada(img: 'assets/imgs/R25.png',index: 2,),
        ],
      )
    );
  }
}

class _ButtonParada extends StatelessWidget {
  final String img;
  final int index;
  const _ButtonParada({
    Key? key, required this.img, required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    final nowPage = Provider.of<SelectParadaService>(context);
    return GestureDetector(
      onTap: () {
        print('Tap => ${index}');
        nowPage.currentPageSet = index;
      },
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
        color: (nowPage.currentPageGet == index) ? Color(0xffea5055) : Colors.white,
        shape: BoxShape.circle
        ),
        child: Image.asset(img, scale: 13,),
      ),
    );
  }
}



class _Point extends StatelessWidget {
  final Color color;
  const _Point({
    Key? key, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
    );
  }
}

