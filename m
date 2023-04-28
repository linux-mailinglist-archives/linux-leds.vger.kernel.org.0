Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB3E6F1871
	for <lists+linux-leds@lfdr.de>; Fri, 28 Apr 2023 14:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbjD1Muv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 Apr 2023 08:50:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjD1Muu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 Apr 2023 08:50:50 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E8641BF0
        for <linux-leds@vger.kernel.org>; Fri, 28 Apr 2023 05:50:43 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id EA2331C0CAF; Fri, 28 Apr 2023 14:50:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1682686240;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kYwn4hhpxEXP9DUViyPpxJtmLsk8sBrBe6XIaa286/w=;
        b=NRALV8hL7TiO3Tz98qhPXZF/Lzr37OYj2U0DuUis9LLe42Y30Gd0S9vftaC2xdHMJupuSs
        fdcdpLuTktB2jk/n3jw7fsEigPcLYD4VHQUWYnRwkdYh9Le9VA7j3ZLSuu+gavIJ/Jd6Xz
        stEr37Q0bmCGbTlQf1Py7GucOTO6i3A=
Date:   Fri, 28 Apr 2023 14:50:40 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Cc:     lee.jones@linaro.org, andy.shevchenko@gmail.com,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v8 0/6] Add a multicolor LED driver for groups of
 monochromatic LEDs
Message-ID: <ZEvBIKJKDHL2X2pu@duo.ucw.cz>
References: <20230328161541.599463-1-jjhiblot@traphandler.com>
 <4c3bdb25-47b9-3442-860d-2c77f8e9f861@traphandler.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="cK/0P1/oaAarjxlI"
Content-Disposition: inline
In-Reply-To: <4c3bdb25-47b9-3442-860d-2c77f8e9f861@traphandler.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--cK/0P1/oaAarjxlI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2023-04-28 14:39:20, Jean-Jacques Hiblot wrote:
> On 28/03/2023 18:15, Jean-Jacques Hiblot wrote:
> > Some HW design implement multicolor LEDs with several monochromatic LED=
s.
> > Grouping the monochromatic LEDs allows to configure them in sync and use
> > the triggers.
> > The PWM multicolor LED driver implements such grouping but only for
> > PWM-based LEDs. As this feature is also desirable for the other types of
> > LEDs, this series implements it for any kind of LED device.
> >=20
> > changes v7->v8:
> >   - consistently use "LEDs group multicolor" throughout the code.
> >   - rename some variables with more explicit names.
> >   - improve comments.
> >   - use the 100-characters per line limit.
> >=20
> Hi Lee,
>=20
> Are there any pending items regarding this series ?
> If not, can you consider merging it ?

We should not be merging it in the middle of merge window... right?

BR,
								Pavel

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--cK/0P1/oaAarjxlI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZEvBIAAKCRAw5/Bqldv6
8iKRAKCqEZ5UYhfFlhZkuJIMM/xYnaLP5wCfXg5jLM4E8YG+Y3P6luSY4pVct5E=
=A61z
-----END PGP SIGNATURE-----

--cK/0P1/oaAarjxlI--
