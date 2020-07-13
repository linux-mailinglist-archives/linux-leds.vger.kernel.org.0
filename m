Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3725121CFF1
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2020 08:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgGMGoz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Jul 2020 02:44:55 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:50910 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726077AbgGMGoz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 13 Jul 2020 02:44:55 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id F0C251C0BD5; Mon, 13 Jul 2020 08:44:52 +0200 (CEST)
Date:   Mon, 13 Jul 2020 08:44:52 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     kernel test robot <lkp@intel.com>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        kbuild-all@lists.01.org, linux-leds@vger.kernel.org
Subject: Re: [pavel-linux-leds:for-next 17/17] WARNING: modpost:
 vmlinux.o(.text+0x2492): Section mismatch in reference from the function
 ret_from_kernel_thread() to the variable .init.text:.L904
Message-ID: <20200713064452.GA30654@amd>
References: <202007131331.ta5KKp3K%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline
In-Reply-To: <202007131331.ta5KKp3K%lkp@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.gi=
t for-next
> head:   cf1a1a6a7d81d73bcb5568b23572d6fd593add87
> commit: cf1a1a6a7d81d73bcb5568b23572d6fd593add87 [17/17] leds: gpio: Use =
struct_size() in devm_kzalloc()
> config: riscv-randconfig-r012-20200712 (attached as .config)
> compiler: riscv32-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout cf1a1a6a7d81d73bcb5568b23572d6fd593add87
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Driscv=20
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>=20
> All warnings (new ones prefixed by >>):

These look weird.

> >> WARNING: modpost: vmlinux.o(.text+0xd475de): Section mismatch in refer=
ence from the function radeon_audio_init() to the variable .init.text:.LBE1=
2095
>    The function radeon_audio_init() references
>    the variable __init .LBE12095.
>    This is often because radeon_audio_init lacks a __init
>    annotation or the annotation of .LBE12095 is wrong.
> --

And in the code we are not touching.

Is the report about just 17/17, or could it be other patch in the
series?

Is it possible that something simply went wrong with testing?
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8MAuQACgkQMOfwapXb+vLSdwCghEh+j9b9Jbwnr0sk9PTDhgCS
98AAn0+lr+4hMATA1N2cYrTrGTzG7Gub
=hyV+
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
