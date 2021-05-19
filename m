Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB113388C58
	for <lists+linux-leds@lfdr.de>; Wed, 19 May 2021 13:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241242AbhESLIu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 May 2021 07:08:50 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:41368 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240482AbhESLIq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 19 May 2021 07:08:46 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 4B7ED1C0B7F; Wed, 19 May 2021 13:07:26 +0200 (CEST)
Date:   Wed, 19 May 2021 13:07:25 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        gregkh@linuxfoundation.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 06/17] leds: leds-nuc: allow changing the LED colors
Message-ID: <20210519110725.GB24621@duo.ucw.cz>
References: <cover.1621349813.git.mchehab+huawei@kernel.org>
 <f1fb0d3b7404bab46ba22a670ab58eb0e8b2389e.1621349814.git.mchehab+huawei@kernel.org>
 <20210519095713.07be987d@thinkpad>
 <20210519120507.3ab8c6a4@coco.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="5/uDoXvLw7AC5HRs"
Content-Disposition: inline
In-Reply-To: <20210519120507.3ab8c6a4@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--5/uDoXvLw7AC5HRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > We have multicolor LED framerwork in Linux. This should be implemented
> > via that framework. Please do not implement your own way for RGB leds.
> >=20
> > Marek
>=20
> I saw the multicolor LED framework, but IMO it won't fit here.
>=20
> See, Linux doesn't have direct access to the LED. The access is
> provided via ACPI WMI.

So?

> The way BIOS reports the type of the led is via a bitmap flag.
> So, the same LED can be represented with either single-color
> or multi-color one. See:
> 	https://www.intel.com/content/dam/support/us/en/documents/intel-nuc/WMI-=
Spec-Intel-NUC-NUC10ixFNx.pdf
>=20
> 	Table 2.2 LED Color Type
> 	Bit Number	Type
> 	0		Dual-color Blue / Amber
> 	1		Dual-color Blue / White
> 	2		RGB-color
> 	3		Single-color LED
>=20
> Also as each NUC can support up to 7, and they may have a mix of
> single color, dual color and RGB LEDs, if we would use the
> multicolor class for the colored ones, that would mean that the
> code will need to be duplicated, as, depending on what the BIOS
> reports, the LED would need to be exposed either as via
> led-multicolor-class or as leds-class.

So?

> Worse than that, there's even a WMI command that would allow
> to "switch LED type" (see page 8). On other words, the BIOS can
> expose a "virtual" single-color LED, but actually implemented
> in hardware using a RGB one, and this can be changed in real time.

So you simply always use it as RGB one?

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--5/uDoXvLw7AC5HRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYKTxbQAKCRAw5/Bqldv6
8p8oAKCciNQ/kTZzHkulbHkJx6P4kXjrzQCfUogG99XAWzM+bEBPumHRP4R5h80=
=d7GY
-----END PGP SIGNATURE-----

--5/uDoXvLw7AC5HRs--
