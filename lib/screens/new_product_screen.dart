import 'package:ecommerce_backend/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NewProductScreen extends StatelessWidget {
  NewProductScreen({super.key});

  final ProductController productController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'Add a Product',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              child: Card(
                margin: EdgeInsets.zero,
                color: Colors.black,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        ImagePicker _picker = ImagePicker();
                        final XFile? _image = await _picker.pickImage(
                            source: ImageSource.gallery);
                        if (_image == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('No Image was selected.'),
                            ),
                          );
                        }
                        if (_image != null) {}
                      },
                      icon: const Icon(
                        Icons.add_circle,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "Add an Image",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Product Information",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            _buildTextFormField("Product ID"),
            _buildTextFormField("Product Name"),
            _buildTextFormField("Product Description"),
            _buildTextFormField("Product Category"),
            const SizedBox(
              height: 20,
            ),
            _buildSlider(
              'Price',
              'price',
              productController,
              productController.price,
            ),
            _buildSlider(
              'Quantity',
              'quantity',
              productController,
              productController.quantity,
            ),
            const SizedBox(
              height: 20,
            ),
            _buildCheckbox('Recommended'),
            _buildCheckbox('Popular'),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: const Text(
                'Save',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row _buildCheckbox(String title) {
    return Row(
      children: [
        SizedBox(
          width: 125,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Checkbox(
          value: true,
          checkColor: Colors.black,
          activeColor: Colors.black12,
          onChanged: (value) {},
        ),
      ],
    );
  }

  Row _buildSlider(
    String title,
    String name,
    ProductController productController,
    double? controllerValue,
  ) {
    return Row(
      children: [
        SizedBox(
          width: 75,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Slider(
            min: 0,
            max: 25,
            divisions: 10,
            activeColor: Colors.black,
            inactiveColor: Colors.black12,
            value: (controllerValue == null) ? 0 : controllerValue,
            onChanged: (value) {
              productController.newProduct.update(
                name,
                (_) => value,
                ifAbsent: () => value,
              );
            },
          ),
        ),
      ],
    );
  }

  TextFormField _buildTextFormField(String hintText) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
