import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 60,
      alignment: Alignment.bottomLeft,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey,
            offset: Offset(2, 2),
            blurRadius: 5,
            spreadRadius: 2)
      ]),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: TextField(
                onTap: () {
                  showSearch(context: context, delegate: MySearchDelegate());
                },
                readOnly: true,
                decoration:const InputDecoration(
                    border: InputBorder.none),
              ),
            ),
          ),
          Container(
            width: 50,
            height: double.infinity,
            color: Color(0xff294171),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  List<String> paradas = [
    ' Los Totems',
    'U de Cuenca',
    'Ricaurte',
    'Terminal Terrestre',
    'Mall del Rio',
    'Vergel',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
      icon: Icon(Icons.clear),
      onPressed: () {
        query = '';
      },
    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      icon: Icon(Icons.chevron_left),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];

    for (var destino in paradas) {
      if (destino.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(destino);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, int index) {
          var results = matchQuery[index];
          return ListTile(
            title: Text(results),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];

    for (var destino in paradas) {
      if (destino.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(destino);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, int index) {
          var results = matchQuery[index];
          return ListTile(
            title: Text(results),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'destino');
            },
          );
        });
  }
}
