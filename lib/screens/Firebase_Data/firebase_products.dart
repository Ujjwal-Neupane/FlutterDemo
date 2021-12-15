import 'package:flutter/material.dart';
import 'package:flutter_learn_demo/services/product_service.dart';

class FirebaseProducts extends StatefulWidget {
  const FirebaseProducts({Key? key}) : super(key: key);

  @override
  _FirebaseProductsState createState() => _FirebaseProductsState();
}

class _FirebaseProductsState extends State<FirebaseProducts> {
  bool isLoaded = false;
  bool showProgressBar = false;
  List productList = [];

  addProduct(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Add Product'),
            content: productForm(),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => uploadProduct(),
                child: const Text('OK'),
              ),
            ],
          );
        });
    //open dialog box

    //form fill
    //upload to firebase
    //if success close dialog box and show snackbar
  }

  uploadProduct() {}

  getProduct() async {
    setState(() {
      showProgressBar = true;
    });

    productList = await ProductService().getProductList();
    print(productList);
    isLoaded = true;

    setState(() {
      showProgressBar = false;
    });
  }

  Widget productForm() {
    return SingleChildScrollView(
      child: Form(
          child: Column(
        children: [
          TextFormField(),
          TextFormField(),
          TextFormField(),
          TextFormField(),
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Center(
        child: Column(
          children: [
            //listview builder
            if (!isLoaded) ...[
              TextButton(onPressed: () => getProduct(), child: Text('Get Data'))
            ],

            if (showProgressBar) ...[CircularProgressIndicator()],

            if (isLoaded) ...[
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: productList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(productList[index]['name']),
                    trailing: Text(productList[index]['price']),
                  );
                },
              )
            ]

            //floating button
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addProduct(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
