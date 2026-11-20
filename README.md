# ShopLite — Мобайл апп хөгжүүлэлт (Flutter)

**Нэр:** …  
**Оюутны код:** 23b1num0369

Энэ репозиторид 6 долоо хоногийн турш бүх лабораторийн кодоо хадгална.

```
├── README.md          ← энэ файл (доорх хэсгүүдийг бөглөнө)
├── screenshots/       ← дэлгэцийн зураг
├── lab1_dart/         ← Лаборатори 1: Dart дасгал
└── shoplite/          ← Лаборатори 1-д `flutter create`-оор үүсгэнэ
```

## Код хадгалах (лаборатори бүрийн төгсгөлд)

```bash
git add .
git commit -m "Lab 1: Dart модель, shoplite апп"
git push
git tag v0.1            # Лаб 1 → v0.1, Лаб 2 → v0.2, ...
git push origin v0.1
```

Push хийсний дараа GitHub дээрх **Actions** табаас автомат тестийн үр дүнг (ногоон ✓ / улаан ✗) харна.
`lab1_dart/test/` болон `.github/` хавтасны файлуудыг **өөрчлөхгүй**.

---

## Лаборатори 1

![flutter doctor](screenshots/flutter_doctor.png)
![shoplite](screenshots/shoplite.png)

### lab1_dart

- `dart test test/lab1_test.dart`: 25 / 25
- Бонус B1 (`dart test test/bonus_test.dart`): хийсэн

### D2. Төслийн бүтэц

1. `lib/main.dart`-д ямар классууд байна? Аль нь StatelessWidget, аль нь StatefulWidget вэ?
   > `ShopLiteApp` — StatelessWidget (MaterialApp, theme тохируулна). `MyHomePage` — StatefulWidget, түүний төлөвийг `_MyHomePageState` (State) хадгална (`_count`).
2. `pubspec.yaml`-д ямар сангууд байна?
   > dependencies: `flutter` (SDK), `cupertino_icons`. dev_dependencies: `flutter_test` (SDK), `flutter_lints`.
3. `android/` хавтас юунд хэрэгтэй вэ? Та ихэвчлэн аль хавтсанд код бичих вэ?
   > `android/` — Android-д зориулсан native төсөл (Gradle тохиргоо, AndroidManifest, app id, icon). Build хийхэд хэрэглэгдэнэ. Код ихэвчлэн `lib/` хавтсанд бичнэ.

### D4. Hot reload ба hot restart

| Өөрчлөлт | Hot reload (r) | Hot restart (R) |
|---|---|---|
| AppBar-ийн гарчгийг өөрчлөх | Гарчиг шууд солигдсон, тоолуур 3 хэвээр | Гарчиг солигдсон, тоолуур 0 болсон |
| seed өнгийг солих | Өнгө шууд солигдсон, тоолуур 3 хэвээр | Өнгө солигдсон, тоолуур 0 болсон |
| `int _count = 0;` → `= 5` | Өөрчлөгдөөгүй — тоолуур 3 хэвээр (state хадгалагдсан, initializer дахин ажиллахгүй) | Тоолуур 5 болсон |
| `main()` дотор `print('start');` нэмэх | Юу ч хэвлэгдээгүй (main дахин ажиллахгүй) | Терминалд `start` хэвлэгдсэн |

**Дүгнэлт:** аль тохиолдолд тоолуурын утга (state) хадгалагдсан бэ? Яагаад?
> Hot reload үед state хадгалагдсан. Hot reload нь өөрчлөгдсөн кодыг ажиллаж буй Dart VM-д оруулаад зөвхөн `build()`-ийг дахин дууддаг; State объект устахгүй тул `_count` хэвээр, `main()` болон field initializer дахин ажиллахгүй. Hot restart нь аппыг `main()`-ээс эхлүүлж, бүх state-ийг устгадаг тул тоолуур анхны утгаа авна.
