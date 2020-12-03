Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 948E92CD4C2
	for <lists+linux-leds@lfdr.de>; Thu,  3 Dec 2020 12:41:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388724AbgLCLl3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 3 Dec 2020 06:41:29 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:34472 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388687AbgLCLl2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 3 Dec 2020 06:41:28 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 65C661C0B9E; Thu,  3 Dec 2020 12:40:44 +0100 (CET)
Date:   Thu, 3 Dec 2020 12:40:44 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Gene Chen <gene.chen.richtek@gmail.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: Re: [PATCH v11 3/5] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT
 definitions
Message-ID: <20201203114044.GA9061@duo.ucw.cz>
References: <1606906011-25633-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606906011-25633-4-git-send-email-gene.chen.richtek@gmail.com>
 <20201202122329.GA30929@duo.ucw.cz>
 <CAE+NS34D8a6Udt7ZZ0=U7oqm5POtihKvD3WjD_sAADamqQ=1AQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline
In-Reply-To: <CAE+NS34D8a6Udt7ZZ0=U7oqm5POtihKvD3WjD_sAADamqQ=1AQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > +++ b/include/dt-bindings/leds/common.h
> > > @@ -78,6 +78,7 @@
> > >  #define LED_FUNCTION_INDICATOR "indicator"
> > >  #define LED_FUNCTION_LAN "lan"
> > >  #define LED_FUNCTION_MAIL "mail"
> > > +#define LED_FUNCTION_MOONLIGHT "moonlight"
> >
> > There's "torch" function that should be used for this. I guess comment
> > should be added with explanation what exactly that is and how should
> > the LED be named.
> >
>=20
> According to mail, 11/25 "Re: [PATCH v7 2/5] dt-bindings: leds: Add
> LED_COLOR_ID_MOONLIGHT definitions",
> The Moonlight LED is LED which maximum current more than torch, but
> less than flash. Such as front camera fill light.
> I think our channel is moonlight, not torch.
> I will add this description to comment.
> We can't exactly define moonlight current level, because every vendor
> has their own specification.

So... what is the timelimit on moonlight?

But if it is used for camera illumination, I believe it should be
simply called flash.

Best regards,

								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX8jOvAAKCRAw5/Bqldv6
8pj3AJ9cRVAbTOCXxcUiV3mbTJXFFTKK3QCgpfgXoggeGNEUdtl5msUvdmWnkSA=
=gXOZ
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--
