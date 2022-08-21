Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B787D59B5E2
	for <lists+linux-leds@lfdr.de>; Sun, 21 Aug 2022 20:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231652AbiHUSSq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 21 Aug 2022 14:18:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231631AbiHUSSp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 21 Aug 2022 14:18:45 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B62415FF5
        for <linux-leds@vger.kernel.org>; Sun, 21 Aug 2022 11:18:42 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id C693B1C0005; Sun, 21 Aug 2022 20:18:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1661105920;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5wcTNVffofuWj+bAe1yLcENMfVZbc12q4CcwXswKT2I=;
        b=D5biLc4IjjbE8UdbtRQDfroehoqI5FZZ3haSfKljnlFWK2Hh9Z//F7hRRUD7RxCFcHl0PT
        BZgS8L+gD4TX1HCcb/T+5ZgOFt4Nor+/jxfE5ddSAts876dokzaVZGMP+R3Z6sERYJkZaa
        beBQM2+EScVnkw1h0oLA7TPlV/nA2XA=
Date:   Sun, 21 Aug 2022 20:18:40 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Werner Sembach <wse@tuxedocomputers.com>
Cc:     linux-leds@vger.kernel.org
Subject: Re: Clarification questions regarding multicolor leds
Message-ID: <20220821181840.GA19796@duo.ucw.cz>
References: <30cbbf20-08cf-a69b-4f58-359a9802e86f@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline
In-Reply-To: <30cbbf20-08cf-a69b-4f58-359a9802e86f@tuxedocomputers.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!
>=20
> I'm currently implementing the multicolors sysfs leds interface for sever=
al
> Clevo and Tongfang barebones, but I'm unsure how to actually map the leds=
 to
> the multicolor interface:
>=20
> The keyboards come in 5 variants:
>=20
> Single zone RGB + Brightness
>=20
> Single Zone RGB
>=20
> 3 Zone RGB + Shared Brightness
>=20
> Per Key RGB
>=20
> Per Key RGB + Shared Brightness
>=20
> First question: How do I map multiple zones or per-key leds?
>=20
> Should I register a seperate ::kbd_backlight for zone/key? resulting in
> ::kbd_backlight, ::kbd_backlight_1, ::kbd_backlight_2, ::kbd_backlight_3,
> etc?

For a zone, yes.

> Should I give them more desciptive names like ::kbd_backlight_left,
> ::kbd_backlight_center, ::kbd_backlight_right, ::kbd_backlight_a,
> ::kbd_backlight_b, ::kbd_backlight_enter?
>=20
> Or Should I only create a single ::kbd_backlight instance and map the
> different zones to subleds? So there are number of zones * 3 subleds, with
> each tripplet controlling the rgb values of one zone/key? This would help
> performance, as for the per-key backlight, the firmware in the backend wa=
nts
> an array for all keys at once. So setting each key seperatly would mean
> sending the whole array for each key individually. And I think what most
> people want to do is to set the whole keyboard at once anyway and nit key=
 by
> key.

Not sure what to do there. And not sure if LED subsystem is suitable
for this, actually. This starts to look like a display...

> Second question: For the keyboards with shared brightness, is it ok to ha=
ve
> the brightness values of ::kbd_backlight, ::kbd_backlight_1 etc. just in
> sync? I did not see a way to have a ::kbd_backlight without the brightness
> sysfs entry (then I would have just given the brightness switch to
> ::kbd_backlight and not to ::kbd_backlight_1 and ::kbd_backlight_2)

Can we simply ignore shared brightness to get reasonable API?

> Third question: The 3 zone RGB and the per-key keyboards have firmware
> accelerated modes, like breathing and rainbow. How do I make them accessi=
ble
> via the multicolor leds interface? the blinking pattern interface does not
> really match the usecase as these modes are a simple single value toggle
> (0=3Dstatic color, 1=3Dbreathing, 2=3Dignore color settings and play pred=
efined
> moving rainbow pattern, etc).

Take a look at drivers/leds/trigger/ledtrig-pattern.c . That's
interface we'd like.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYwJ3AAAKCRAw5/Bqldv6
8mQdAJ4uokCHdl8lZsHLM6zGCcro3wsnZwCePrhiaBmyaM8cCCYCvJylvtWZgt8=
=w/iL
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
