# Hesap Makinesi (Seviye: Kolay)
Tek ekranlı basit bir hesap makinesi yap.
0'dan 9'a kadar numaralar, 4 basit matematik işlemi (toplama, çıkarma, çarpma, bölme) olsun.
Bir de hesaplamanın sonucunu gösteren bir label olsun.

## Hedef
- Düzenli bir **folder structure** kurabilmek
- **Controller** ve **View** arasındaki ilişkiyi anlamak
- UI component'lerini sorunsuz bir şekilde hizalayabilmek
- Controller'da mantıksal işlemler yapabilmek

## Mimari
En basit şekilde **MVC**'yi kullan. Herhangi bir **View Model** kullanmana gerek yok.

## Dil / Framework
Swift ve UIKit

## Responsive Design
- Sadece **Storyboard** kullan. Tüm UI işlemlerini tek Storyboard'da yap. Herhangi bir ekstra View dosyası oluşturmana gerek yok.
- Rakamların olduğu butonları ekrana yerleştirirken **Vertical** ve **Horizontal** **Stack View** kullan.
- Stack View'ların boyutlarını dinamik yapabilmek için constraint'leri kullan

## Akış
Storyboard'da butonların outlet ve action'larını controller'da tanımla. Hesaplama işlemini operatöre (toplama, çıkarma, çarpma, bölme) göre yap. Her bir matematik işlemi için ayrı ayrı kod yazmak yerine bir fonksiyon yaz.

## Anahtar Kelimeler
- MVC
- Storyboard
- Auto Layout
- Stack View
