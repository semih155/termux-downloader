# Termux Otomatik İndirici

Telefonda bir videoyu **Paylaş → Termux** diyerek otomatik indirir. TikTok, YouTube, X (Twitter), Facebook ve [yt-dlp](https://github.com/yt-dlp/yt-dlp)'nin desteklediği diğer siteler çalışır. İstersen müzik (mp3) olarak da indirir.

Geliştirici: **Samiullah Dilsuz**

---

## 📲 Kurulum

### 1. Gerekenler
- **Termux** uygulaması. [F-Droid](https://f-droid.org/packages/com.termux/) ya da [GitHub sürümünü](https://github.com/termux/termux-app/releases) kur. Play Store'daki sürüm eski ve çalışmaz.
- *(İsteğe bağlı)* Bildirim görmek için **Termux:API** uygulaması (Termux ile aynı yerden kur).

### 2. Tek komutla kurulum
Termux'u aç, aşağıdaki komutu yapıştır:

```bash
curl -sL https://raw.githubusercontent.com/semih155/termux-downloader/main/install.sh | bash
```

Kurulum sırasında depolama izni sorulursa **İzin ver**'e bas. Bu kadar.

Kurulum şunları yapar: Python, ffmpeg, curl ve yt-dlp'yi kurar, scripti `~/bin` içine koyar ve `indir` komutunu ekler.

---

## ▶️ Kullanım

### Otomatik mod (paylaş menüsü)
1. TikTok, YouTube, X vb. uygulamada videonun **Paylaş** düğmesine bas.
2. Listeden **Termux**'u seç.
3. İndirme başlar. Hiçbir şey sormaz.

> TikTok linkleri varsayılan olarak **video** iner. İstersen Ayarlar'dan müzik (mp3) yapabilirsin.
> Uzun videolarda (5 dk üstü) kalite sorar.

### Manuel mod
Termux'ta şunu yaz:

```bash
indir
```

Açılan menü:

| Seçenek | Ne işe yarar |
|---|---|
| Link yapıştır ve indir | Linki yapıştır, **video / mp3 / ikisi birden** seç |
| TikTok kayıtlı klasörlerim | TikTok'ta kaydettiğin klasörleri toplu indir |
| Başarısız indirmeleri tekrar dene | İnternet yüzünden inmeyenleri tekrar dener |
| TikTok hesabı (giriş) | Kendi hesabındaki klasörler için giriş |
| Site çerezleri | YouTube, X, Facebook ve diğer siteler için çerez |
| Ayarlar | Klasör, deneme sayısı, Wi-Fi, sanatçı adı, uyumlu mp4 vb. |
| Güncelle | Scripti ve yt-dlp'yi günceller |

---

## 🎵 TikTok kayıtlı klasörler (toplu indirme)

1. Menüden **TikTok hesabı → sessionid yapıştır** ile giriş yap.
   - tarayıcıdan tiktok.com'a gir, hesabına giriş yap
   - Chrome (bilgisayar): `F12 → Application → Cookies → https://www.tiktok.com` içinden **sessionid** değerini kopyala
   - **Şifre istenmez.** sessionid hesabına giriş anahtarıdır, kimseyle paylaşma.
2. **TikTok kayıtlı klasörlerim → Klasör ekle** de.
   TikTok'ta: Profil → Kaydedilenler → klasörü aç → Paylaş → Bağlantıyı kopyala → buraya yapıştır.
3. Klasör için **Video / Müzik (mp3) / Video + mp3** seç. Seçim **hatırlanır**, istediğin zaman değiştirebilirsin.
4. Klasörü seçip **İndir** de. Daha önce inenler atlanır.

---

## 📁 İndirilenler nereye gidiyor?

`Download/TermuxIndirilenler/` içinde:

```
TikTok/            videolar
Muzik/TikTok/      mp3'ler
YouTube/  Twitter/  Facebook/  <site adı>/
```

Dosyalar galeriye ve müzik uygulamasına otomatik eklenir. mp3 ve mp4 etiketlerinde sanatçı olarak **Samiullah Dilsuz** yazar (Ayarlar'dan değiştirilebilir).

---

## 📺 Videolar her telefonda oynasın (Uyumlu mp4)

YouTube gibi sitelerde en yüksek kalite bazen **VP9/AV1 + Opus** gelir. Bu bazı telefonlarda "desteklenmiyor" hatası verir. Script bunu otomatik çözer:

1. Önce **H.264 + AAC** (her telefonun oynattığı format) tercih eder. Çevirme gerekmez, hızlıdır.
2. İndirme bitince dosyayı kontrol eder. Uyumsuzsa ffmpeg ile **H.264 + AAC mp4**'e çevirir (Snaptube'un verdiği format).

Ayarlar → **Uyumlu mp4** ile açılır/kapanır (varsayılan: açık).
Not: Çevirme gerektiğinde telefon işlemcisine göre uzun sürebilir. YouTube'da H.264 en fazla 1080p'dir, 4K için çevirme gerekir.

---

## 🍪 Her siteden indirme, YouTube "bot değilsin" hatası

Script TikTok'la sınırlı değil: YouTube, X (Twitter), Facebook ve yt-dlp'nin desteklediği (1000+) siteden indirir.

YouTube bazen **"Sign in to confirm you're not a bot"** der. Sırayla dene:
1. **VPN'i kapat** ya da başka ülkeye geç. VPN IP'leri sık engellenir.
2. `pkg install nodejs` (kurulum scripti zaten kurar). Script bunu otomatik kullanır.
3. Olmadı: `indir` → **Site çerezleri → YouTube** ile çerez ekle. Ana hesabını değil, **yedek bir Google hesabını** kullan.

Çerez dosyası (cookies.txt) nasıl alınır: tarayıcıda *Get cookies.txt LOCALLY* eklentisini kur (telefonda Kiwi Browser), siteye giriş yap, **Export** de, dosyayı İndirilenler'e kaydet, menüden yolunu yaz. Aynı bölümden X, Facebook ve herhangi başka site için de çerez eklenebilir.

---

## 🎚 Varsayılan kalite

YouTube ve uzun videolarda kalite sorulunca **Enter = 360p**. Başka bir sayı yazarsan o kalite iner. Varsayılanı Ayarlar → **Varsayılan kalite**'den değiştirebilirsin (360 / 480 / 720 / 1080 / en yüksek).

---

## 🔁 İnternet kesilirse / yavaşsa

- İnternet koparsa **bekler**, bağlantı gelince **kaldığı yerden devam eder** (kısmi dosya korunur). 1 saate kadar bekler, Termux'u kapatma.
- Kopmalar deneme hakkından sayılmaz. Gerçek hatalarda **4 kez** (Ayarlar'dan değişir) bekleyerek yeniden dener.
- 2. denemede yt-dlp'yi kendi günceller (TikTok/YouTube sık değişir).
- İnmeyenler **başarısızlar listesine** düşer, menüden tekrar denenir. Kısmi dosya orada da korunur.
- **Hız:** Aynı anda **16 parça** iner (Ayarlar → *Paralel parça sayısı*). Ek olarak *aria2c çoklu bağlantı* açılabilir (`pkg install aria2`). Not: hız en çok internet hattına ve sunucuya bağlıdır; paralel bağlantı sunucu tek bağlantıyı yavaşlatıyorsa işe yarar.
- İstersen **sadece Wi-Fi'de indir** ayarını aç.

---

## 🛠 Sorun giderme

| Sorun | Çözüm |
|---|---|
| `indir` komutu bulunamıyor | `ln -sf ~/bin/termux-url-opener $PREFIX/bin/indir` çalıştır |
| Paylaş menüsünde Termux çıkmıyor | `ls ~/bin/termux-url-opener` ile dosyayı kontrol et, yoksa kurulum komutunu tekrar çalıştır |
| İndirme hata veriyor | Termux'ta `pip install -U yt-dlp` çalıştır |
| Depolama hatası | `termux-setup-storage` çalıştır, izin ver |
| TikTok klasörü inmiyor | Menüden giriş (sessionid) yenile, sonra tekrar dene |
| Hatanın ayrıntısı | `cat ~/.termux-downloader-last.log` |

Ayarlar `~/.termux-downloader.conf` dosyasında durur. Güncelleme ayarlarına dokunmaz.

---

## 🔄 Güncelleme
Script günde bir kez kendini kontrol eder ve otomatik günceller. Elle güncellemek için `indir` → **Güncelle**.

## 🗑 Kaldırma
```bash
rm -f ~/bin/termux-url-opener ~/bin/indir ~/.shortcuts/termux-url-opener ~/.termux-downloader*
```
