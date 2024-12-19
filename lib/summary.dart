import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart'; 
import 'package:learning/widgets/common_widget.dart';

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Summary",
          style: TextStyle(
            color: Colors.brown,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.brown[50],
        elevation: 0,
        toolbarHeight: 100,
      ),
      body: content(context),
    );
  }

  Widget content(BuildContext context) {
    final cart = Provider.of<CartModel>(context); // Mengambil data keranjang dari Provider

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            child: Image.asset('assets/image.png'),
          ),
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Order :",
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              // Menampilkan item yang ada di dalam keranjang
              ...cart.items.map((item) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Row(
                  children: [
                    Text(
                      item.name,
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "x${item.quantity}",
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Size: ${item.size}",
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Sugar: ${item.sugar}%",
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              )),
              SizedBox(height: 50),
              Divider(color: Colors.brown),
              SizedBox(height: 20),
              // Total harga, pajak, dan diskon
              summaryDisplay("Total", "\$${cart.totalPrice.toStringAsFixed(2)}"),
              SizedBox(height: 20),
              summaryDisplay("Tax", "\$${(cart.totalPrice * 0.1).toStringAsFixed(2)}"), // Pajak 10%
              SizedBox(height: 20),
              summaryDisplay("Discount", "\$0.00"), // Sesuaikan nilai diskon jika ada
              SizedBox(height: 100),
              GestureDetector(
                onTap: () {
                  // Logika pembayaran di sini
                },
                child: submitButton("Pay"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget summaryDisplay(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.brown,
            fontSize: 20,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: Colors.brown,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
