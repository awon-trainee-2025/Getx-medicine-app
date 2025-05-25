import 'package:get/get.dart';
import 'package:medicine_app/main.dart';

class UserController extends GetxController {
  List<Map<String, dynamic>> products = [];
  List<Map<String, dynamic>> categories = [];

  @override
  void onInit() {
    getProductsData();
    getCategoryData();
    super.onInit();
  }

  void getProductsData() async {
    final data = await supabase.from('products').select();
    products = data;

    update();
  }

  void getCategoryData() async {
    final data = await supabase.from('categories').select();
    categories = data;

    update();
  }
}
