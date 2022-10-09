**Form Picker( Basic Layouting )**

Basic Layouting

**Row dan Column**

Deskripsi :

Row meletakkan widget children nya secara horizontal
Column meletakkan widget children nya secara vertikal

**MainAxisSize Properti**

Deksripsi :

Menentukan seberapa banyak space menempati main axis
Main axis dari Row adalah horizontal
Main axis dari Column adalah vertikal
Properti mainAxisSize memiliki dua values, MainAxisSize.Max dan MainAxisSize.Min
MainAxisSize.Max menempati semua space dari main axis
MainAxisSize.Min tidak memiliki extra space, hanya untuk children nya saja.


```
body : Row(
	mainAxisSize: MainAxisSize.Max,
	children: const [
		BlueBox(),
BlueBox(),
		BlueBox(),
],
),

```

```
body : Column(
	mainAxisSize: MainAxisSize.Max,
	children: const [
		BlueBox(),
BlueBox(),
		BlueBox(),
],
),

```

**MainAxisAlignment Properti**

Properti ini digunakan Row dan Column untuk memposisikan children mereka di extra space yang ada

Memiliki 6 Values:

MainAxisAlignment.start
MainAxisAlignment.end
MainAxisAlignment.center
MainAxisAlignment.spaceBetween
MainAxisAlignment.spaceEvenly
MainAxisAlignment.spaceAround

Contoh code :

```
body : Column(
	mainAxisSize: MainAxisSize.start,
	children: const [
		BlueBox(),
BlueBox(),
		BlueBox(),
],
),

```

**CrossAxisAlignment Properti**

Deskripsi :

Properti ini digunakan Row dan Column untuk memposisikan children mereka pada cross axis
Cross Axis dari Row adalah vertikal dan Cross Axis dari Column adalah horizontal

Memiliki 5 values:

CrossAxisAlignment.start
CrossAxisAlignment.end
CrossAxisAlignment.center
CrossAxisAlignment.stretch
CrossAxisAlignment.baseline

```
body : Row(
	mainAxisAlignment: MainAxisAlignment.spaceEvenly,
	crossAxisAlignment: CrossAxisAlignment.center,
	children: const [
]
)


```


**Flexible Widget**

Deskripsi :

* Membungkus widget ;ain sehingga child dari Flexible widget menjadi flexible atau re

* Sangat berguna untuk membuat aplikasi yang responsif

* Harus berada dalam turunan parent widget Row atau Column

* Perubahan ukuran ditentukan dengan properti fit dan flex

**Fit Properti**

* Menentukan apakah flexible widget memenuhi extra space yang tersedia di main axis nya

* Menerima nilai values berupa FlexFit.loose atau FlexFit.tight

* FlexFit.loose akan memiliki ukuran minimum

* FlexFit.tight akan memiliki ukuran maximum

**Flex Properti** 

* Menentukan perbandingan ukuran dari child widget nya

* Menerima nilai values berupa integer

* Membandingkan nilai nya dengan flex properti lain

**Expanded Widget**

Deskripsi :

* Membungkus widget lain sehingga ukuran dari child Expanded widget akan dipaksa untuk memenuhi ruang yang tersedia

* Sangat berguna untuk membuat aplikasi yang responsif

* Harus berada dalam turunan parent widget Row atau Column

* Memiliki default value FlexFit.tight

* Perubahan ukuran ditentukan dengan properti flex

**Advance Form Input**

**Interactive Widgets**

* Interaksi antara aplikasi dan user
* Mengumpulkan input dan feedback dari user

**Menambahkan layout**

* Layout untuk menyusun interactive widget

**Date Picker**

Deskripsi :

* Widget dimana user bisa memasukan tanggal

* Tanggal kelahiran, waktu pemesanan, waktu reservasu, dll

Cara membuat Date Picker

* Menggunakan fungsi bawaan flutter showDatePicker

* Fungsi showDatePicker memiliki tipe data future

* Menampilkan dialog material design date picker

```

final sleectDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1990),
        lastDate: DateTime(currentDate.year + 5),
);

```


* Menambahkan packages intl di pubspec.yaml

```
dependencies:
    flutter:
        sdk: flutter
    intl: ^0.13.0

```

* Mempersiapkan variabel

```
class _HomePageState extends State<HomePage>{
    DateTime _dueDate = DateTime.now();
    final currentDate = DateTime.now();
}

```


**Color Picker**

Deskripsi :

* Widget dimana user bisa memilih color
* Penggunaan color picker bisa digunakan untuk berbagai macam kondisi


**Cara membuat color picker**

* Menggunakan packages flutter_colorpicker

* Menambahkan packages flutter_colorpicker di pubspec.yaml

```
dependencies:
    flutter:
        sdk: flutter
    intl: ^0.13.0
    flutter_colorpicker ^1.0.3
```

* Mempersiapkan variabel

```
Color _currentColor = Colors.orange;
```

* Menambahkan fungsi showDialog di dalam onPressed dengan return widget AlertDialog

```

onPressed(){
    showDialog(
        context: context,
        builder: (context){
            return AlertDialog(
                title: const Text('Pick ur color'),
                actions: [
                    TextButton(
                        onPressed(){
                            Navigator.pop(context);
                        },
                        child: const Text('Save'),
                    ),
                ],
            ),
        },
    );
},

```