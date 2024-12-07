import 'package:flutter/material.dart';

class Profile1 extends StatelessWidget {
  const Profile1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('image/img_2.png'),
                      radius: 40.0,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '098765432',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'user@gmail.com',
                  ),
                  ElevatedButton(
                    onPressed: () { },
                    child: Text('Оплатить'),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
    showModalBottomSheet(
    context: context,
    builder: (context) {
    return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) {
    return ListTile(
    title: Text('Продукт $index'),
    subtitle: Text('Цена: $index руб.'),
    trailing: IconButton(
    icon: Icon(Icons.add),
    onPressed: () {
    },
    ),
    );
    },
    );
    },
    );
    },
        child: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}