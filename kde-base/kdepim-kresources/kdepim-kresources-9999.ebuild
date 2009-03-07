# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

KMNAME="kdepim"
KMMODULE="kresources"
inherit kde4-meta

DESCRIPTION="KDE PIM groupware plugin collection"
IUSE="debug"
KEYWORDS=""

# Those deps (not in RDEPEND) seem strange but may be valid (or unnecessary)
DEPEND="
	kde-base/akonadi:${SLOT}[kdeprefix=]
	kde-base/libkdepim:${SLOT}[kdeprefix=]
	kde-base/kaddressbook:${SLOT}[kdeprefix=]
"

KMEXTRACTONLY="
	akonadi/kcal/
	kaddressbook/common/
	kmail/
	knotes/
	korganizer/version.h
"

KMLOADLIBS="libkdepim"

src_prepare() {
	local kconfig_compiler="${KDEDIR}/bin/kconfig_compiler"

	pushd kaddressbook/common
	# create the kabprefs_base.h file
	${kconfig_compiler} kaddressbook.kcfg kabprefs_base.kcfgc
	popd

	# if kdepim_export.h exists it tries to use kxml_compiler from the sources. this isn't desired
	# as we don't compile kresources together with kode (kxml_compiler). we still need the header though.
	sed -i -e 's/kdepim_export.h/&_DONOTFIND/' cmake/modules/FindKode.cmake || die "sed failed"

	kde4-meta_src_prepare
}

src_install() {
	kde4-meta_src_install

	# Install headers needed by kdepim-wizards
	insinto "${PREFIX}"/include/${PN}
	doins "${WORKDIR}"/${PN}_build/${KMMODULE}/{groupwise,egroupware,slox}/*.h || \
			die "Failed to install extra header files"
}
