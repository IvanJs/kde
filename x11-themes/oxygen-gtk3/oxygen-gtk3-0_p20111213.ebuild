# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit cmake-utils

DESCRIPTION="Official GTK+ 3 port of KDE's Oxygen widget style"
HOMEPAGE="https://projects.kde.org/projects/playground/artwork/oxygen-gtk"
SRC_URI="http://dev.gentoo.org/~johu/distfiles/${P}.tar.xz"

LICENSE="LGPL-2.1"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="debug doc"

RDEPEND="
	dev-libs/glib:2
	x11-libs/cairo
	x11-libs/gtk+:3
	x11-libs/libX11
	x11-libs/pango
"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	doc? ( app-doc/doxygen )
"

DOCS=(AUTHORS README)

src_install() {
	if use doc; then
		{ cd "${S}" && doxygen Doxyfile; } || die "Generating documentation failed"
		HTML_DOCS=( "${S}/doc/html/" )
	fi

	cmake-utils_src_install

	cat <<-EOF > 99oxygen-gtk3
CONFIG_PROTECT="/usr/share/themes/oxygen-gtk/gtk-3.0"
EOF
	doenvd 99oxygen-gtk3
}