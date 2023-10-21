import 'package:flutter/material.dart';

void main(){
  runApp(const liveclass1_m7App());
}
class liveclass1_m7App extends StatelessWidget{
  const liveclass1_m7App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }

}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home",style: TextStyle(
              fontSize: 25,
            ),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=>SettingsScreen(),
                    )
                );
              },
              child: Text("Go to Settings"),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=>OrdersScreen(),
                    )
                );
              },
              child: Text("Go to Orders"),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=>ProductListScreen(),
                    )
                );
              },
              child: Text("Go to ProductList"),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Settings",style: TextStyle(
              fontSize: 25,
            ),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context)=>HomeScreen()),
                      (route) => false, ///predicate
                );
              },
              child: Text("Home"),
            )
          ],
        ),
      ),
    );
  }
}

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Orders",style: TextStyle(
              fontSize: 25,
            ),
            ),
            TextButton(
              onPressed: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context)=>SettingsScreen()
                  ),
                );
              },
              child: Text("Go To Settings"),
            ),
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text("Go To Home"),
            )
          ],
        ),
      ),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
      ),
      body: ListView.builder(
        itemCount: 20,
          itemBuilder: (context,index){
            return ListTile(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> ProductDetailsScreen(productName: "${index+1}",productPrice: 1200,)
                    )
                ).then((value) {
                  print(value);
                });
              },
              title: Text("${index+1}"),
              subtitle: Text("This is subtitle of product ${index+1}"),
            );
          }
      ),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final String productName; ///Mandatory/optional
  final double? productPrice; ///o
  const ProductDetailsScreen({super.key, required this.productName, this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(productName,
              style: TextStyle(fontSize: 29,fontWeight: FontWeight.bold),
            ),
            ElevatedButton(onPressed: (){
              Navigator.pop(context,"Product back with value $productName");
            },
                child: Text("Back")
            )
          ],
        ),

      ),
    );
  }
}
