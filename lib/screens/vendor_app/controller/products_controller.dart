import 'package:get/get.dart';
import 'package:pets_ecommerce/models/product.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/enums.dart';
class VendorProductsController extends GetxController{

  List<Product> products=[

  ];
  ProductsScreenState _state=ProductsScreenState.showProducts;


  addNewProduct(Product product)
  {
    products.add(product);
   update();

  }

deleteProduct(Product product)
{
  products.remove(product);
  update();
}


///state_management
get state=>_state;

changeToViewProducts(){
    _state=ProductsScreenState.showProducts;
    update();
}

changeToAddProduct(){
    _state=ProductsScreenState.addProduct;
    update();
}

changeToEditProduct(){
    _state=ProductsScreenState.editProduct;
    update();
}



}

