**Flutter Layout**

1. *Apa itu Layout ?*

Layout pada flutter yaitu :

* Untuk mengatur tata letak UI
* Layout berbentuk widget yang mengatur widget yang ada di dalamnya

2. *Single-child Layout*

Container

* Membuat sebuah box
* Membungkus widget lain
* Box memiliki margin, padding, dan border

```
Container(
    child: Text('teks'),
);
```

Penggunaan Container :

```
Container(
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        border: Border.all(),
    ),
    child: const Text('Halo'),
  ),
);
```

Center

* Membuat sebuah box
* Membungkus widget lain
* Memenuhi lebar dan tinggi ruang diluarnya
* Meletakkan widget berada di bagian tengah

```
Center(
    child: Text(teks),
);
```

SizedBox

* Membuat sebuah box
* Membungkus widget lain
* Box dapat diatur lebar dan tingginya
* Lebih sederhana dari container

```
SizedBox(
    width: 100,
    height: 150,
    child: Text(teks),
);
```

3. *Multi-child Layout*

* Mengatur widgets secara vertikal

```
Column(
    children: const [
        Text(teks),
        Text(teks),
        Text(teks),
        Text(teks),
    ],
);
```

Row 

* Mengatur widgets secara horizontal

```
Row(
    children: const [
        Text(teks),
        Text(teks),
        Text(teks),
        Text(teks),
    ],
);
```


ListView 

* Mengatur widgets dalam bentuk list 
* Memiliki kemampuan scroll

```
ListView(
    children: [
        Container(
            margin: const EdgeInstes.all(10),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('H'),
        ),
    ],
);
```

GridView

* Mengatur widgets dalam bentuk galeri

```
GridView.count(
    crossAxisCount: angka,
    children: [],
);
```
