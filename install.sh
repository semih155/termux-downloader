#!/data/data/com.termux/files/usr/bin/bash
REPO_USER="semih155"
REPO_NAME="termux-downloader"
BRANCH="main"
set -e
RAW="https://raw.githubusercontent.com/$REPO_USER/$REPO_NAME/$BRANCH"
echo "══════════════════════════════════════"
echo "   TERMUX OTOMATİK İNDİRİCİ - KURULUM"
echo "   Geliştirici: Samiullah Dilsuz"
echo "══════════════════════════════════════"
echo "[1/4] Paketler güncelleniyor..."
pkg update -y -o Dpkg::Options::="--force-confold" >/dev/null
echo "[2/4] Gerekli programlar kuruluyor..."
pkg install -y python ffmpeg termux-api curl nodejs aria2 >/dev/null
pip install -U yt-dlp yt-dlp-ejs -q
echo "[3/4] Script indiriliyor..."
mkdir -p "$HOME/bin" "$HOME/.shortcuts"
# Paylaş menüsü ~/bin/termux-url-opener dosyasını çalıştırır; widget için ~/.shortcuts'a da konur
curl -sL "$RAW/termux-url-opener" -o "$HOME/bin/termux-url-opener"
chmod +x "$HOME/bin/termux-url-opener"
cp "$HOME/bin/termux-url-opener" "$HOME/.shortcuts/termux-url-opener"
chmod +x "$HOME/.shortcuts/termux-url-opener"
# Manuel mod için kısa komut: `indir`
ln -sf "$HOME/bin/termux-url-opener" "$HOME/bin/indir"
ln -sf "$HOME/bin/termux-url-opener" "$PREFIX/bin/indir"   # PATH'te her zaman bulunur
curl -sL --max-time 4 "$RAW/VERSION" -o "$HOME/.termux-downloader-version" 2>/dev/null || echo "3.0.0" > "$HOME/.termux-downloader-version"
echo "[4/4] Depolama izni isteniyor..."
termux-setup-storage || true
echo "✅ Kurulum tamamlandı!"
echo "   • Link paylaşıp Termux'u seçince otomatik indirir."
echo "   • Manuel menü için Termux'ta:  indir"
