import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart'; // Pastikan lokasi file sesuai dengan struktur proyek Anda

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int _quantity = 1;
  String _selectedSize = 'Medium'; // Ukuran default
  int _selectedSugar = 0; // Gula default (0%)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Latte",
          style: TextStyle(color: Colors.brown, fontSize: 30),
        ),
        backgroundColor: Colors.brown[50],
        toolbarHeight: 100,
        elevation: 0,
      ),
      body: content(context),
    );
  }

  Widget content(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            // Gambar utama produk
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.brown[50],
              child: Image.asset('assets/coffee_cup.png'),
            ),
            SizedBox(height: 20),
            // Detail Produk
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Latte",
                        style: TextStyle(fontSize: 20, color: Colors.brown),
                      ),
                      Spacer(),
                      // Kontrol jumlah produk
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove, color: Colors.brown),
                            onPressed: () {
                              setState(() {
                                if (_quantity > 1) _quantity--;
                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text(
                              "$_quantity",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.brown,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.add, color: Colors.brown),
                            onPressed: () {
                              setState(() {
                                _quantity++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  // Opsi Ukuran
                  Text(
                    "Size",
                    style: TextStyle(fontSize: 20, color: Colors.brown),
                  ),
                  Row(
                    children: [
                      _buildSizeOption("Small", context),
                      _buildSizeOption("Medium", context),
                      _buildSizeOption("Large", context),
                    ],
                  ),
                  SizedBox(height: 40),
                  // Opsi Gula
                  Text(
                    "Sugar",
                    style: TextStyle(color: Colors.brown, fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: _buildSugarOptions(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 80),
            // Tombol "Add to cart"
            GestureDetector(
              onTap: () {
                final cart = Provider.of<CartModel>(context, listen: false);
                cart.addItem(CartItem(
                  name: "Latte",
                  quantity: _quantity,
                  price: 5.0,
                  size: _selectedSize,
                  sugar: _selectedSugar, // Harga produk
                ));
                Navigator.of(context).pushNamed("/summary");
              },
              child: submitButton("Add to cart"),
            ),
          ],
        ),
      ),
    );
  }
  

  // Widget untuk memilih ukuran
  Widget _buildSizeOption(String size, BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSize = size;
        });
      },
      child: Container(
        height: 80,
        width: 80,
        color: _selectedSize == size ? Colors.brown[200] : Colors.transparent,
        child: Center(
          child: Text(
            size,
            style: TextStyle(
              color: _selectedSize == size ? Colors.white : Colors.brown,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  // List widget untuk pilihan gula
  List<Widget> _buildSugarOptions() {
    const sugarOptions = [0, 25, 50, 100];
    return sugarOptions.map((sugar) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _selectedSugar = sugar;
          });
        },
        child: Container(
          color: _selectedSugar == sugar ? Colors.brown[200] : Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "$sugar%",
            style: TextStyle(
              color: _selectedSugar == sugar ? Colors.white : Colors.brown,
              fontSize: 20,
            ),
          ),
        ),
      );
    }).toList();
  }

  // Widget untuk submit button
  Widget submitButton(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.brown,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
