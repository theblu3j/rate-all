# Maintainer: Miles Gordon theblu3j@proton.me

pkgname=rate-all.sh
pkgver=0.1
pkgrel=1
pkgdesc='Bash script to rate mirrors.'
arch=('x86_64')
url='https://github.com/theblu3j/rate-all.sh'
license=('GPL3')
depends=(bash)
makedepends=()
source=("rate-all.sh::https://raw.githubusercontent.com/theblu3j/rate-all.sh/refs/heads/main/rate-all.sh")
sha512sums=('91d838302f26b6aa628e6cebba1c292d3856805977082917c81e562aef78f4f055e4fd23b06049bbd01811baf631b74bd570de8bec71d62a0fbd0af84d3555b6')
options=()

package() {
    mkdir -p "$pkgdir/usr/bin/"
    install -Dm644 "$srcdir/rate-all.sh" "$pkgdir/usr/bin/rate-all.sh"
    chmod +x "$pkgdir/usr/bin/rate-all.sh"
}
