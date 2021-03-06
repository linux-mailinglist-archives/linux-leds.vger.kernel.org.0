Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F36232FC17
	for <lists+linux-leds@lfdr.de>; Sat,  6 Mar 2021 17:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbhCFQwI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 6 Mar 2021 11:52:08 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:53183 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230525AbhCFQvm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 6 Mar 2021 11:51:42 -0500
Received: from methusalix.internal.home.lespocky.de ([92.117.59.83]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MKKd7-1l3XKv0ndP-00LjIf; Sat, 06 Mar 2021 17:51:14 +0100
Received: from falbala.internal.home.lespocky.de ([192.168.243.94])
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <post@lespocky.de>)
        id 1lIa8t-0001ow-5X; Sat, 06 Mar 2021 17:51:07 +0100
Date:   Sat, 6 Mar 2021 17:51:01 +0100
From:   Alexander Dahl <post@lespocky.de>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Andreas Eberlein <foodeas@aeberlein.de>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] leds: apu: extend support for PC Engines APU1 with
 newer firmware
Message-ID: <20210306165101.fnv6ytqofbolpf6s@falbala.internal.home.lespocky.de>
Mail-Followup-To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Andreas Eberlein <foodeas@aeberlein.de>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210216133028.4025-1-foodeas@aeberlein.de>
 <c7eebbb6-df0c-51df-7701-ecb8f6543466@metux.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6lhq75cjctaqvjxe"
Content-Disposition: inline
In-Reply-To: <c7eebbb6-df0c-51df-7701-ecb8f6543466@metux.net>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Scan-Signature: 7aa91fdd43207b5d0c40576660a3e49e
X-Spam-Score: -2.8 (--)
X-Provags-ID: V03:K1:OrDeIhMLw1J0mLjQyvUhTerVIpVEHx/tuHmhnFLFvcUp4FyQNZ4
 7jL+CN565DY2GhaEPvRXqI9d8helZmP7QaPld0gBCrlOf8t0yh7zeD1pIa7vHCDAOZNqvin
 t9wxGz2j6vbff7qebGCyCR4FR9INoG5FJ4ukqASnC7eFTaOiuuYgjteTOr3Tl2E9ysFqhW1
 SNYV8ulzJGXobWDjAwMYA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tTqnd0Cf+Vk=:+fIFzaVUoltY2ftONGZhZe
 mFx6E1yUXviZz127rxJhqge4EFaBvkj+M+yS0d7LOyViWvgCb2f2wqQoKDhKdjat9IpsMDpDp
 GkYbDdAw+Al6rl/QCMQaaHAdJpg57dKoaueL53vAcPpP3k8Vb86l3q48PEF/b6PLFBld398Sk
 IaUdRkvSxJStS6BN6MphjIRxunw39MnUC7zZBBUB9Po1ntZYD3qDCXQEW7DG0JDVyaND1QABh
 ytgGTEZu13HoSXK4fnAUAmmVd5E54AnMhgwQSMT6YJeibp6VcE9Cqa6+56FCxx3NcJuKj4CS2
 ozt5QHW8DVknUOcHFY/y/QyrNhEv2u4v0oMnmXJ9h5GKZ7G2YDtaVrrPRhpo+2CPTOAZ/aApr
 gMrzoSe+rlQBHBh8kj1S0FU61D3/xHEY5Dw2BBQNqzi9mP+yx2+A8b4j5Lf8z
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--6lhq75cjctaqvjxe
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Feb 17, 2021 at 12:02:47PM +0100, Enrico Weigelt, metux IT consult =
wrote:
> On 16.02.21 14:30, Andreas Eberlein wrote:
> > The DMI_PRODUCT_NAME entry on current firmware of PC Engines APU1 chang=
ed
> > from "APU" to "apu1"
> >=20
> > This modification adds the missing DMI data and thereby the LED support=
 for
> > the PC Engines APU1 with firmware versions >=3D 4.6.8.
>=20
> Do you have a device for more intensive testing ?

I have an apu1d4 on my desk, which is supposed to be used soon, but
available for testing at the moment.  I put the latest coreboot bios
version 4.13.0.3 on it yesterday.

> In that case I'd like to suggest splitting the driver into gpio and
> gpio-based LED (using leds-gpio) - just like already I did for apu2/3/4.
> Maybe this even could also be moveed into the apu2 driver. This probably
> just makes sense if there're more gpio-connected devices than just LED)
>=20
> Personally, I don't have access to the old apu1 board (IIRC not even
> produced anymore for several years), so I didn't dare to touch anything
> here.

If you give me a hint, which tree or patchset should be tested, and
some hints what should be tested, I can try.

> Note that apu1 vs. apu2/3/4 have completely different SOC with different
> gpio logic - that was one of the reasons for writing a completely new
> driver for apu2+ from scrath, rather than extending the old one.

Thanks for that work.  I have to admit someone from the fli4l linux
router distribution team also wrote LED and button drivers for the APU
boards, but never managed to upstream those. :-/

If someone is interested, those are spread in our Subversion
repository, but the apu drivers are here:

https://repo.nettworks.org/svn/fli4l/branches/4.0/trunk/src/packages/src/sr=
c/fli4l/hwsupp/pcengines-apu/

Personally, I'd rather have mainline drivers for all that boards.
Don't know if it still makes sense for the older wrap or alix boards,
though.  I also have those lying around. ;-)

Greets
Alex

--=20
/"\ ASCII RIBBON | =BBWith the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.=AB
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)

--6lhq75cjctaqvjxe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEwo7muQJjlc+Prwj6NK3NAHIhXMYFAmBDsvEACgkQNK3NAHIh
XMYigRAAvnANs8wbwf6kXyeaRxuKJkFdy81lLySnWxRtlJ9tokBUcrPwEKbwkOLV
z43WI1lMSz2T/6xPc+pjbMJjdnV43WrN96xLs4DyFRt2FiH0kJM5qR78cVngnX4p
bZ9fgOGPNEtohei9eXXCivmM+DpsgGb03Cu2m1nwNX1R2UM70E5BI3Oo/aVuL2dU
FkkI2125kQbub+2I0gCExRPIuGblEZp8OTbvwPbumo+07KyN6Gy6OhqQnmbsWkXI
j9FCRCe8aG2U1+WVjTAef9fSRgDIE10+vGzWGXUcHsaka8onbnDsfa+QgGFC7ojE
rXkqk9xeT1GTqpzaXBZFXqSTIVmMI8mT4XBFpd403gb+IRT6I6PQwGq74WVVRnu2
rLBXGolcE8GqyuXAAncEW/OUP6O1YWyOhIwDb6HJzJ0CyV6PdLENA/A25+iSfOr5
0SP5JenpfArNG0FPveWAm8ixzrrnORh7VzV3UqC9LoKrGdY/pIXD8awHZTZOvDRQ
bmEr/8xTZEJUVo3kOPzdvmoQN0e6UoqUexgP4zicanSw08tQSq4oKGDLIn/n8hdB
K/IvBU4FeXw4veuvYP2btTY5U2IWUcaON2d1xkzBjOhln9jGJXABP068wmAg5R2I
7GrIRIZwhJAL7UNU1G9OEOT5H7LN0dsQqYyEv2Tnh+3he0MtkBs=
=NAJp
-----END PGP SIGNATURE-----

--6lhq75cjctaqvjxe--
