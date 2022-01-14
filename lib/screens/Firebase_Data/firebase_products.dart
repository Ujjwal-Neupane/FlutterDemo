import 'package:flutter/material.dart';
import 'package:flutter_learn_demo/models/product_model.dart';
import 'package:flutter_learn_demo/services/product_service.dart';

class FirebaseProducts extends StatefulWidget {
  const FirebaseProducts({Key? key}) : super(key: key);

  @override
  _FirebaseProductsState createState() => _FirebaseProductsState();
}

class _FirebaseProductsState extends State<FirebaseProducts> {
  bool isLoaded = false;
  bool showProgressBar = false;
  bool dialogProgressBar = false;
  List productList = [];
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController colorController = TextEditingController();

  addProduct(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (BuildContext context, setState) {
            return AlertDialog(
              title: Text('Add Product'),
              content: productForm(),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                dialogProgressBar
                    ? CircularProgressIndicator()
                    : TextButton(
                        onPressed: () => uploadProduct(setState, context),
                        child: const Text('OK'),
                      ),
              ],
            );
          });
        });
    //open dialog box

    //form fill
    //upload to firebase
    //if success close dialog box and show snackbar
  }

  uploadProduct(StateSetter setState, context) async {
    setState(() {
      dialogProgressBar = true;
    });

    ProductModel productModel = ProductModel(
      pid: idController.text,
      name: nameController.text,
      price: priceController.text,
      color: colorController.text,
    );

    await ProductService().addProduct(productModel);
    setState(() {
      dialogProgressBar = false;
    });
    Navigator.pop(context, 'Cancel');
    getProduct();
  }

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
          TextFormField(
            controller: idController,
            decoration: InputDecoration(
              hintText: 'Enter Product ID',
              labelText: 'PID',
              icon: Icon(Icons.face),
            ),
          ),
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
                hintText: 'Enter Product Name',
                labelText: 'Name',
                icon: Icon(Icons.shopping_cart)),
          ),
          TextFormField(
            controller: priceController,
            decoration: InputDecoration(
              hintText: 'Enter Product price',
              labelText: 'price',
              icon: Icon(Icons.price_check),
            ),
          ),
          TextFormField(
            controller: colorController,
            decoration: InputDecoration(
              hintText: 'Enter Product Color',
              labelText: 'Color',
              icon: Icon(Icons.pin_drop),
            ),
          ),
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
              RefreshIndicator(
                onRefresh: () => getProduct(),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: productList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(productList[index]['name']),
                      trailing: Text(productList[index]['price']),
                    );
                  },
                ),
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
