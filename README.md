# abang_state_management

Project ini hanya untuk edukasi dan riset saja<br/>
Adapun untuk mode produksi, saya tidak menjamin kestabilannya.<br/>
Tapi, secara mendasar state management ini hanya menggunakan setState bawaan dari Flutter.

Untuk navigasi juga tidak ada library tambahan,
Navigasi yang digunakan sudah contextless.

<hr/>
<b>Key:</b>
<hr/>
GetWidget<br>
GetxController<br>
Get.to<br>
Get.offAll<br>
Get.back<br>

<hr/>

<b>Notes:</b>
- Membungkus dengan GetBuilder itu berarti menggunakan StatefulWidget di belakang

## Getting Started
```
main.dart
```

```
import 'package:abang_state_management/shared/get/get.dart';
import 'package:abang_state_management/shared/get/get_builder.dart';
import 'package:abang_state_management/shared/get/get_material_app.dart';
import 'package:abang_state_management/shared/get/getx_controller.dart';
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