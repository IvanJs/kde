# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

KDE_LINGUAS="ca cs da de el es et fr ga gl hu it ja km lt nb nds nl pl pt pt_BR
sk sr sr@ijekavian sr@ijekavianlatin sr@latin sv ug uk zh_CN zh_TW"
KDE_SCM="git"
inherit kde4-base

DESCRIPTION="KDE Telepathy text chat window"
HOMEPAGE="http://community.kde.org/Real-Time_Communication_and_Collaboration"
if [[ ${PV} != *9999* ]]; then
	SRC_URI="mirror://kde/unstable/kde-telepathy/${PV}/src/${P}.tar.bz2"
	KEYWORDS="~amd64 ~x86"
else
	KEYWORDS=""
fi

LICENSE="GPL-2"
SLOT="4"
IUSE="debug +history"

DEPEND="
	>=net-libs/telepathy-qt-0.9.1
	history? ( net-libs/telepathy-logger-qt )
"
RDEPEND="${DEPEND}
	>=net-im/ktp-contact-list-${PV}
"

src_configure() {
	mycmakeargs=(
		$(cmake-utils_use_with history TelepathyLoggerQt4)
	)

	cmake-utils_src_configure
}