Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40ECB30E0F9
	for <lists+linux-leds@lfdr.de>; Wed,  3 Feb 2021 18:27:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232447AbhBCR0m (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 3 Feb 2021 12:26:42 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:56682 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232415AbhBCR0F (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 3 Feb 2021 12:26:05 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 7D6E11C0B9C; Wed,  3 Feb 2021 18:25:08 +0100 (CET)
Date:   Wed, 3 Feb 2021 18:25:08 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Sven Schuchmann <schuchmann@schleissheimer.de>
Cc:     Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] leds: lp50xx: add setting of default intensity from DT
Message-ID: <20210203172508.GC23019@duo.ucw.cz>
References: <20210119105312.2636-1-schuchmann@schleissheimer.de>
 <20210203142940.GB12369@duo.ucw.cz>
 <DB8P190MB06348FC85033135BFC3EF5C4D9B49@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
 <20210203163555.GA23019@duo.ucw.cz>
 <DB8P190MB0634880713B530F51F95CEE0D9B49@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="nmemrqcdn5VTmUEE"
Content-Disposition: inline
In-Reply-To: <DB8P190MB0634880713B530F51F95CEE0D9B49@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--nmemrqcdn5VTmUEE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Yes, sounds reasonable. Could we get default intensity of 100% on all
> > channels if nothing else is specified?
> >=20
> > Or maybe simply "if intensity is not specified, start with 100%, and
> > use explicit =3D0 if other color is expected".
> >=20
> Mh, if someone is already using the led driver and updates to a newer ker=
nel=20
> we would then turn on all leds per default to the maximum intensity durin=
g boot=20
> until they are set the way they should be from userspace. I don't know if=
 this
> is what we want? If yes, sure, we could set them to maximum per
> default.

Not really. If they don't have trigger configured, nothing will happen.

> Also if we want to use Percentage Values (%) for setting the intensity
> I think this should also be done for the userspace interfaces and
> not only from DT.

We don't want to use percentages in the API (but let me still use
percentages in discussion).

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--nmemrqcdn5VTmUEE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYBrcdAAKCRAw5/Bqldv6
8jkUAJwNJ0tMFMEhlguq/D6XwEq0NqqDEgCgv9kRAIWGuBErh1lbV1J4F3uWhqI=
=3Fgp
-----END PGP SIGNATURE-----

--nmemrqcdn5VTmUEE--
