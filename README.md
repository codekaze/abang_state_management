## Getx Baik
[ Terinspirasi dari Getx ]<br/>
Project ini hanya untuk edukasi dan riset saja<br/>
Adapun untuk mode produksi, saya tidak menjamin kestabilannya.<br/>
Tapi, secara mendasar state management ini hanya menggunakan setState bawaan dari Flutter.

Untuk navigasi juga tidak ada library tambahan,
Navigasi yang digunakan sudah contextless.

<hr/>

Getx cukup populer saat ini,<br/>
Namun karena terlalu banyak fitur yang disediakan,<br/>
Ada developer yang memilih untuk menggunakan state management lain yang lebih sederhana.<br/>

Dan juga ada hal lain, yang sedikit membuat ricuh di dunia per-foruman<br/>
Tapi, menurut opini saya pribadi itu tidak masalah karena sering terjadi di project open source<br/>
Dan terlepas dari siapa yang salah atau siapa yang benar,<br/>
Saya sangat mengakui kalau tujuan dari pembuatan Getx itu sudah tercapai,<br/>
Yaitu untuk memudahkan developer XD.<br/><br/>

Apalagi untuk programmer yang cukup malas seperti saya XD XD <br/>
So, inilah Getx Baik, project yang terinspirasi dari Getx.<br/>
Contextless dan mudah digunakan!

<hr/>

### Key
Get.width<br>
Get.height<br>
GetWidget<br>
GetxController<br>
Get.to<br>
Get.offAll<br>
Get.back<br><br/>



## Catatan
- Membungkus dengan GetBuilder itu berarti menggunakan StatefulWidget di belakang


## Belum tersedia
- .obs<br/>
- ...<br/>
- ...<br/>
<br><br>
<hr/>

## Getting Started
```
main.dart
```

```
import 'package:getx_baik/shared/get/get.dart';
import 'package:getx_baik/shared/get/get_builder.dart';
import 'package:getx_baik/shared/get/get_material_app.dart';
import 'package:getx_baik/shared/get/getx_controller.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GetMaterialApp(
    title: 'Flutter Demo',
    navigatorKey: Get.navigatorKey,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: HomeView(),
  ));
}

class HomeController extends GetxController {
  bool loading = false;
}


class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Home View"),
          ),
          body: Container(
            width: Get.width,
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (controller.loading == true)
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                if (controller.loading == false)
                  InkWell(
                    onTap: () async {
                      controller.loading = true;
                      controller.update();

                      await Future.delayed(Duration(seconds: 1));

                      controller.loading = false;
                      controller.update();
                    },
                    child: Card(
                      color: Colors.orange[400],
                      child: Container(
                        padding: EdgeInsets.all(20.0),
                        child: Text("Test Loading"),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}


```