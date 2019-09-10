Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50148AF1A8
	for <lists+linux-leds@lfdr.de>; Tue, 10 Sep 2019 21:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727492AbfIJTHZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Sep 2019 15:07:25 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:48152 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725797AbfIJTHZ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 10 Sep 2019 15:07:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Type:MIME-Version:References:
        In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=AEDjfrYYUhQdX6HMeGMCyoTKE7nAS03kl1QMQ2bdVZE=; b=mEBIfoi68woBxE9Faku/eplgd
        yOUOAxJqNJN1rFDopEdy7+rMcT4NKo9TvRp0UmRFxgvBNCepCYwBeT1NJzCJ2a/Tlu9JkowFA4dJ3
        fyppG3GcpF4QxkNpHXt/P1ezPOI5ZDiw8Q//YQWapU0YdIvOKcIeDdlVHCfZseQ3AbZpA=;
Received: from p200300ccff17ef007ee9d3fffe1fa246.dip0.t-ipconnect.de ([2003:cc:ff17:ef00:7ee9:d3ff:fe1f:a246] helo=eeepc)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1i7lTt-0006RZ-5m; Tue, 10 Sep 2019 21:07:13 +0200
Received: from [::1] (helo=localhost)
        by eeepc with esmtp (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1i7lTs-0001Px-6x; Tue, 10 Sep 2019 21:07:12 +0200
Date:   Tue, 10 Sep 2019 21:06:48 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     lee.jones@linaro.org, jingoohan1@gmail.com,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, mark.rutland@arm.com, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 1/2] backlight: lm3630a: add an enable gpio for the HWEN
 pin
Message-ID: <20190910210648.3594912d@kemnade.info>
In-Reply-To: <20190910102156.vmprsjebmlphkv34@holly.lan>
References: <20190908203704.30147-1-andreas@kemnade.info>
        <20190908203704.30147-2-andreas@kemnade.info>
        <20190909105729.w5552rtop7rhghy2@holly.lan>
        <20190909221349.46ca5a1f@aktux>
        <20190910102156.vmprsjebmlphkv34@holly.lan>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/d51yUFk84RybqHzz4cluJyL"; protocol="application/pgp-signature"
X-Spam-Score: -1.0 (-)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

--Sig_/d51yUFk84RybqHzz4cluJyL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Sep 2019 11:21:56 +0100
Daniel Thompson <daniel.thompson@linaro.org> wrote:

[...]
> > > Is this needed?
> > >=20
> > > This is a remove path, not a power management path, and we have no id=
ea
> > > what the original status of the pin was anyway?
> > >  =20
> >=20
> > Looking at Ishdn on page 5 of the datasheet, switching it off everytime
> > possible seems not needed. We would need to call chip_init() everytime
> > we enable the gpio or live with default values.
> > Therefore I did decide to not put it into any power management path.
> > But switching it on and not switching it off feels so unbalanced.  =20
>=20
> Either the power consumed by the controller when strings aren't lit up
> matters, in which case the driver should implement proper power
> management or it doesn't matter and changing the pin state isn't needed.
>=20
> I'm happy with either of the above but this looks like a third way,
> where eager users could hack in a bit of extra power management by
> forcing drivers to unbind.=20
>=20
I think I will take the simple way. I am quite sure that the power
consumption with HWEN on and leds off does not matter. If someone
later comes up and finds out that I misread the datasheet, things
are prepared to be improved.
At least the hardware can be properly described in the devicetree.

Regards,
Andreas

--Sig_/d51yUFk84RybqHzz4cluJyL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAl139EoACgkQl4jFM1s/
ye+ZZA//WKkB+xioM4V6ShKpqapJ3LzkVD0RhoEhoiY/5NgLwkF1m/w/6Z0LmHB/
8nvWJXJpxmTtIUzFqn265zYZWJwsYCV5EmlEHKy/Bv/XKENCeqGubixw4POqkbgw
APKbSabSXoGtlhuhQjFXOc6FbBBB5ynt6f7nliuY9xYbN+rUTBWEgRrdJ4ktdQn8
4sGtQv7jy41ogrZho1aUgpe7HAfuixlEUJlW9v2/i3a2n25uWCKMAt49nTns0xXv
r4psgXQZs9pommPsaR799afcnFnWoHP7qW7kKsm9rSI5tq4hvJjEwbYCagpA9Rf8
fXOn2PIGMAg0L2Grxmggp6HC5qaKMnntUBiIj26yljvce0F8bH4xyb5rRTrOEasP
PSR1Y/FxzC6AyD8ZbeEIZEjqRcpz7Y5+c5cnrgROBpfxHv3rjOXYR9bZkkKQ7unV
HnHdPFHESb/p0jvj2cOFyoUFQkeTtbpIfeCoX11T2rPBmIq1RJUD6UsLTe2DRlC6
ex4vqW3RvQqTv5XIcUezPHUMVvmlUMyrx0XQyAVUGcnGYwxVBSLm1hMElaivuAM8
gzbfNAwuTgl1xNseaGH7nu/UoUAKk4vEYEncT4YHWLoFJ9HjlyKmZNuM/4j1z+sd
R2t/co/S1lpJCYvEOChmcwtxSa8pVn14iysG+32Pk++AX7CoqCM=
=SLZS
-----END PGP SIGNATURE-----

--Sig_/d51yUFk84RybqHzz4cluJyL--
