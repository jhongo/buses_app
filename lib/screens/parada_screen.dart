import 'package:animate_do/animate_do.dart';
import 'package:buses_tesis/models/slider_models.dart';
import 'package:buses_tesis/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ParadaScreen extends StatefulWidget {
   
  const ParadaScreen({Key? key}) : super(key: key);

  @override
  State<ParadaScreen> createState() => _ParadaScreenState();
}

class _ParadaScreenState extends State<ParadaScreen> {

  bool isActive = false;

  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
  final indexDot = Provider.of<SliderModel>(context).currentPageGet;
    return Scaffold(
      body: Container(
        color: Color(0xFFecebd9),
        width: size.width,
        height: size.height,
        child: CustomPaint(
          painter: BackgroundParada(),
          child: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: [

                // Widget que desplegar el Panel Lateral
                Positioned(
                  top: 250,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                      isActive = true;
                      });
                      print('Active Modal');
                    },
                    child: (!isActive) 
                    ?FadeInRight(
                      child: Container(
                        width: 30,
                        height: 50,
                        decoration:const BoxDecoration(
                          color: Color(0xFF294171),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10) )
                        ),
                        child: Icon(Icons.arrow_left, size: 40,color: Colors.white,)
                        ),
                    )
                      : Container()
                  ),
                ),
                

                Positioned(
                  bottom: 200,
                  child: CustomCircle(
                    child: Container(), 
                    width: 250, 
                    height: 250,
                    color: Color(0xFFea5055),
                    navigator: (){}
                    ),
                ),
                Positioned(bottom: 300, left: 60, child: Image.asset('assets/imgs/nube-r2.png', scale: 7,)),
                Positioned(right: 90, child: Image.asset('assets/imgs/nube-r1.png', scale: 7,)),

                Column(
                  children: [
                    const _HeaderParada(),
                    const SizedBox(height: 60,),
                    if(indexDot == 0)
                    Text('Desliza para ver más lugares',style: TextStyle(color: Color(0xFF294171)), ),
                    _SliderImage(),
                    const _Dots()

                    
                  ],
                ),

                if(isActive)
                FadeOut(
                  child: Container(
                    width: size.width,
                    height: size.height,
                    color: Colors.black45,
                  ),
                ),

                 Positioned(
                  right: 0,
                  bottom: 0,
                  child: (isActive)? 
                  FadeInRight(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: 300,
                      height: 650,
                      color: Color(0xFFebe9d9),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Línea 16', style: TextStyle(color: Color(0xFFea5055), fontSize: 20, fontWeight: FontWeight.w700 ),), 
                                IconButton(
                                  icon: Icon(Icons.cancel_outlined, size: 40,color: Color(0xFFea5055), ),
                                  onPressed:(){
                                    setState(() {
                                    isActive = false;
                                      
                                    });
                                  } , 
                                  )
                              ],
                            ),
                      
                            _BubleParada(nameParada: 'Estación San José',index: 1,),
                            _LineParada(index: 2,),
                            _BubleParada(nameParada: 'Centro Esp Santa María',index: 3 ),
                            _LineParada(index: 4,),
                            _BubleParada(nameParada: 'Fábrica de Bloques', index: 5),
                            _LineParada(index: 6,),
                            _BubleParada(nameParada: 'Mutualista Azuay',index: 7 ),
                            _LineParada(index: 8,),
                            _BubleParada(nameParada: 'Coliseo',index: 9 ),
                            _LineParada(index: 10,),
                            _BubleParada(nameParada: 'Los Tótems',index: 11),
                            _LineParada(index: 12,),
                            _BubleParada(nameParada: 'INNFA', index: 13),
                            _LineParada(index: 14,),
                            _BubleParada(nameParada: 'Estadio', index: 15),
                            _LineParada(index: 16,),
                            _BubleParada(nameParada: 'Av. 10 de Agosto',index: 17),
                            _LineParada(index: 18,),
                            _BubleParada(nameParada: 'Universidad del Azuay',index: 19),
                      
                            
                          ],
                        ),
                      ),
                    ),
                  )
                  : Container()
                )
          
                 

              ],
            ),
          ),
        ),
      )
    );
  }
}

class _LineParada extends StatelessWidget {
  final int index;
  const _LineParada({
    Key? key, required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: Duration(milliseconds:  index * 100 ),
      child: Container(
        margin: EdgeInsets.only(left: 11),
        height: 40,
        width: 3,
        color: Color(0xFF294971),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:const [

          _Dot(index:0),
          _Dot(index:1),
          _Dot(index:2),
          _Dot(index:3),
        ],
      ),

    );
  }
}

class _Dot extends StatelessWidget {

  final int index;
  const _Dot({
    Key? key, required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final indexDot = Provider.of<SliderModel>(context).currentPageGet;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: (indexDot >=index - 0.5 && indexDot < index + 0.5 ) ? 13 : 10,
      height: (indexDot >=index - 0.5 && indexDot < index + 0.5 ) ? 13 : 10,
      decoration: BoxDecoration(
        color: (indexDot >= index - 0.5 && indexDot < index + 0.5 )
        ? Color(0xff294171)
        : Colors.grey,
        shape: BoxShape.circle
      ),
    );
  }
}

class _BubleParada extends StatelessWidget {
  final String nameParada;
  final int index;
  const _BubleParada({
    Key? key, required this.nameParada, required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: Duration(milliseconds:  index * 100 ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
            color: Color(0xFF294971),
              shape: BoxShape.circle
            ),
          ), 
          SizedBox(width: 30,),
          Text(nameParada, style: TextStyle(color: Color(0xFF294971), fontSize: 16), maxLines: 1,overflow: TextOverflow.ellipsis, )
        ],
      ),
    );
  }
}

class _SliderImage extends StatefulWidget {


  @override
  State<_SliderImage> createState() => _SliderImageState();
}

class _SliderImageState extends State<_SliderImage> {

  final pageViewController = new PageController();
  
  @override
  void initState() {
    pageViewController.addListener(() {
      print('Pagina Actual ${pageViewController.page} ');
      Provider.of<SliderModel>(context, listen: false).currentPageSet = pageViewController.page!;

    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomCenter,
        width: double.infinity,
        height: double.infinity,
        child: PageView(
          controller: pageViewController,
          physics: BouncingScrollPhysics(),
          children: [

           Stack(
             alignment: Alignment.center,
             children: [
               Positioned(top: 20, child: _TextPlace(namePlace: 'Coliseo')),
               Positioned(bottom: 148, child: _PartImg(child: Image.asset('assets/imgs/co-3.png', scale: 8,), index: 5)),
               Positioned(bottom: 3, child: _PartImg(child: Image.asset('assets/imgs/co-2.png', scale: 6,), index: 2)),
               Positioned(bottom: 0, child: _PartImg(child: Image.asset('assets/imgs/co-1.png', scale: 6,), index: 1)),
             ],
           ),

           Stack(
             alignment: Alignment.center,
             children: [
                Positioned(top: 20, child: _TextPlace(namePlace: 'Centenario')),
               Positioned( bottom: 0, child: _PartImg(child: Image.asset('assets/imgs/ce-1.png', scale: 6,) , index: 1)),
               Positioned( top: 150,right: 107, child: _PartImg( child: Image.asset('assets/imgs/ce-2.png', scale: 6,) , index: 2)),
               Positioned( top: 122,right: 140, child: _PartImg(child: Image.asset('assets/imgs/ce-3.png', scale: 6,) , index: 3))

             ],
           ),

            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(top: 20, child: _TextPlace(namePlace: 'Redondel')),
                Positioned(top: 110, child: _PartImg(child: Image.asset('assets/imgs/mon4.png',scale: 5,),index: 4, )),
                Positioned(top:190 , child: _PartImg(child: Image.asset('assets/imgs/mon3.png',scale: 5, ),index: 3, )),
                Positioned(bottom: 29, child: _PartImg(child: Image.asset('assets/imgs/mon2.png',scale: 5, ),index: 2, )),
                Positioned(bottom: 5, child: _PartImg(child: Image.asset('assets/imgs/mon1.png',scale: 5, ),index: 1, )),
              ],
            ),

            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(top: 20, child: _TextPlace(namePlace: 'Los Totems')),
                Positioned(bottom: 0,left: 70, child: _PartImg(child: Image.asset('assets/imgs/to-1.png', scale: 6,), index: 1)),
                Positioned(bottom: 0,left: 140, child: _PartImg(child: Image.asset('assets/imgs/to-2.png', scale: 6), index: 2)),
                Positioned(bottom: 0, right: 140, child: _PartImg(child: Image.asset('assets/imgs/to-3.png', scale: 6), index: 3)),
                Positioned(bottom: 0,right: 70, child: _PartImg(child: Image.asset('assets/imgs/to-4.png', scale: 6), index: 4)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _TextPlace extends StatelessWidget {
  final String namePlace;
  const _TextPlace({Key? key, required this.namePlace}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      child: Text(namePlace, 
      style: TextStyle(
        color: Color(0xff294171), 
        fontSize: 20, 
        fontWeight: FontWeight.w800),
        ),
    );
  }
}



class _PartImg extends StatelessWidget {

  final Widget child;
  final int index;
  const _PartImg({
    Key? key, required this.child, required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: Duration(milliseconds: index * 100),
      duration: Duration(milliseconds: 300),
      child: Container(
        child: child
      ),
    );
  }
}

class _HeaderParada extends StatelessWidget {
  const _HeaderParada({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CircleHeader(),
        Text('Hospital del Rio', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),),
        _ContainerDrop(
          child: DropdownButtonFormField<String>(
            value: 'hospital',
            alignment: Alignment.centerRight,
            elevation: 0,
            isDense: false,
            dropdownColor: Colors.indigo,
            decoration: InputDecoration(
              border: InputBorder.none
            ),
            items:const [
              DropdownMenuItem(child: Text('Hospital del Río', style: TextStyle(color: Colors.white),), value: 'hospital',),
              DropdownMenuItem(child: Text('Mutualista Azuay', style: TextStyle(color: Colors.white), ), value: 'mutualista',),
            ], 
            onChanged: (value){}),
        )
      ],
    );
  }
}

class _ContainerDrop extends StatelessWidget {
  
  final Widget child;
  const _ContainerDrop({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: child,
    );
  }
}

class _CircleHeader extends StatelessWidget {
  const _CircleHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
             Navigator.pushReplacementNamed(context, 'navbar'); 
            },
            child: Icon(Icons.arrow_back_ios,size: 30,color: Colors.white,)
            ),
          SizedBox(width: 95,),
          Hero(
            tag: 'custom-circle-1',
            child:  CustomCircle( 
              width: 100,
              height: 100,
              child: Image.asset('assets/imgs/R16.png', scale: 7,),
              navigator: (){},
              ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}


class BackgroundParada extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    
    final pincel = Paint();
    pincel.color = Color(0xFF294171);
    pincel.style = PaintingStyle.fill;
    pincel.strokeWidth = 20;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.43, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, pincel);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
  return true;
  }
  
}