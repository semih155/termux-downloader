cat > install.sh << 'EOF'
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
pkg install -y python ffmpeg termux-api curl >/dev/null
pip install -U yt-dlp -q
echo "[3/4] Script indiriliyor..."
mkdir -p "$HOME/.shortcuts"
curl -sL "$RAW/termux-url-opener" -o "$HOME/.shortcuts/termux-url-opener"
chmod +x "$HOME/.shortcuts/termux-url-opener"
curl -sL --max-time 4 "$RAW/VERSION" -o "$HOME/.termux-downloader-version" 2>/dev/null || echo "1.0.0" > "$HOME/.termux-downloader-version"
echo "[4/4] Depolama izni isteniyor..."
termux-setup-storage || true
echo "✅ Kurulum tamamlandı!"
EOF
