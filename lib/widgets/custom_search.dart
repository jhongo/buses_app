import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 60,
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: Color(0xffEBE9D9), boxShadow: [
          BoxShadow(
              color: Colors.grey,
              offset: Offset(2, 2),
              blurRadius: 5,
              spreadRadius: 2)
        ]),
        child: TextField(
          onTap: () {
            showSearch(context: context, delegate: MySearchDelegate());
          },
          readOnly: true,
          decoration: const InputDecoration(
              prefix: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Icon(
                    Icons.search,
                    size: 30,
                  )),
              border: InputBorder.none),
        ));
  }
}

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(onPressed: () {}, icon: Icon(Icons.clear));
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(onPressed: () {}, icon: Icon(Icons.chevron_left));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> paradas = [
      'Totems',
      'U de Cuenca',
      'Ricaurte',
    ];
    return ListView.builder(
        itemCount: paradas.length,
        itemBuilder: (context, index) {
          final parada = paradas[index];

          return ListTile(
            title: Text(parada),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'destino');
            },
          );
        });
  }
}
