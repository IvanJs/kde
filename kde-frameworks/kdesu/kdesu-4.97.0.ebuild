# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

FRAMEWORKS_TEST="false"
inherit kde-frameworks

DESCRIPTION="Framework to handle super user actions"
LICENSE="LGPL-2"
KEYWORDS="~amd64"
IUSE="X"

RDEPEND="
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kpty)
	$(add_frameworks_dep kservice)
"
DEPEND="${RDEPEND}
	X? (
		x11-libs/libX11
		x11-proto/xproto
	)
"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package X X11)
	)

	kde-frameworks_src_configure
}
