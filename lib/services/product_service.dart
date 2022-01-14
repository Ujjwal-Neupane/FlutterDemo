import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_learn_demo/models/product_model.dart';

class ProductService {
//firebase firestore instance
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

//method to retrieve product list
  Future getProductList() async {
    QuerySnapshot querySnapshot;
    List<Map> productList = [];
    try {
      querySnapshot = await firebaseFirestore.collection('products').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map m = {
            'pid': doc.id,
            'name': doc['name'],
            'price': doc['price'],
            'color': doc['color']
          };

          productList.add(m);
          // productList.add(ProductModel(
          //     pid: doc.id,
          //     name: doc['name'],
          //     price: doc['price'],
          //     color: doc['color']));
          print(m);
        }
        return productList;
      }
    } on Exception catch (e) {
      print('Error: $e');
    }
  }

//add new product
  addProduct(ProductModel productModel) async {
    await firebaseFirestore
        .collection('products')
        .doc(productModel.pid)
        .set(productModel.toMap());
    //  await Future.delayed(Duration(seconds: 3));
  }
//remove product from the list

}
