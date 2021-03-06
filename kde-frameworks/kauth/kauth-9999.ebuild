# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

VIRTUALX_REQUIRED="test"
inherit kde-frameworks

DESCRIPTION="Framework to let applications perform actions as a privileged user"
LICENSE="LGPL-2.1+"
KEYWORDS=""
IUSE="+policykit"

DEPEND="
	$(add_frameworks_dep kcoreaddons)
	dev-qt/qtdbus:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	policykit? ( sys-auth/polkit-qt )
"
RDEPEND="${DEPEND}"
PDEPEND="policykit? ( sys-auth/polkit-kde-agent )"

src_configure() {
	local mycmakeargs=(
		-DSYSCONF_INSTALL_DIR="${EPREFIX}"/etc
		$(cmake-utils_use_find_package policykit PolkitQt-1)
	)

	kde-frameworks_src_configure
}
