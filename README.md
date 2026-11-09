# Spor Ürünleri Mini Katalog (Flutter Mini Catalog)

Bu proje, Flutter ile geliştirilmiş, yerel varlıkların (assets) kullanıldığı, ürün detay ve sepet yönetim özelliklerine sahip dinamik bir e-ticaret / katalog mobil uygulamasıdır.

## 📱 Ekran Görüntüleri & Özellikler
* **Katalog Ekranı:** Futbol topu, tenis raketleri, protein tozu, dumbell seti ve basketbol topu gibi spor ekipmanlarının şık bir Grid yapısında listelenmesi.
* **Detay Sayfası:** Ürünlerin görselleri, açıklamaları ve fiyat bilgileri ile sepete ekleme fonksiyonu.
* **Sepet Yönetimi:** Seçilen ürünlerin sepette anlık olarak listelenmesi ve takip edilmesi.
* **Yerel Varlık (Asset) Desteği:** Görsellerin tamamen yerel `assets/images/` dizininden çağrılarak performansın artırılması.

---

## 🛠️ Kullanılan Teknolojiler ve Sürüm
* **Flutter Sürümü:** SDK `>=3.0.0 <4.0.0` (Dart ile uyumlu)
* **Durum Yönetimi (State Management):** `StatefulWidget` (Yerel State Yapısı)
* **Tasarım:** Material Design & Responsive Grid Yapısı

---

## 🚀 Projeyi Çalıştırma Adımları

Projeyi kendi bilgisayarınızda (yerel ortamınızda) çalıştırmak için aşağıdaki adımları sırasıyla takip edin:

### 1. Depoyu Klonlayın veya Projeyi Açın
Proje klasörünü terminal veya Visual Studio Code üzerinden açın.

### 2. Bağımlılıkları Yükleyin
Proje bağımlılıklarını ve paketlerini indirmek için terminale şu komutu yazın:
```bash
flutter pub get