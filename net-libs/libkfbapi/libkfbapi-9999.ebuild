# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

KDE_LINGUAS="ar be bs cs da de el en_GB eo es et fi fr ga gl hi hu it ja kk km
lt mai mr nb nds nl nn oc pa pl pt pt_BR ro ru sk sl sv tr ug uk zh_TW"
inherit kde4-base

DESCRIPTION="Library for accessing Facebook services based on KDE technology"
HOMEPAGE="https://projects.kde.org/projects/extragear/libs/libkfbapi"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS=""
IUSE="debug"

DEPEND="
	$(add_kdebase_dep kdepimlibs)
	dev-libs/libxslt
	dev-libs/qjson
"
RDEPEND="${DEPEND}"
