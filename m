Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEFC2398407
	for <lists+linux-leds@lfdr.de>; Wed,  2 Jun 2021 10:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231506AbhFBI0Z (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Jun 2021 04:26:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbhFBI0Y (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Jun 2021 04:26:24 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA569C06174A
        for <linux-leds@vger.kernel.org>; Wed,  2 Jun 2021 01:24:40 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1loMB3-00044K-O8; Wed, 02 Jun 2021 10:24:37 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1loMB3-0006xc-1T; Wed, 02 Jun 2021 10:24:37 +0200
Date:   Wed, 2 Jun 2021 10:24:36 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Lee Jones <lee.jones@linaro.org>, Pavel Machek <pavel@ucw.cz>
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH 02/15] leds: leds-gpio-register: Supply description for
 param 'id'
Message-ID: <20210602082436.hdi4olxekvvbtzef@pengutronix.de>
References: <20210528090629.1800173-1-lee.jones@linaro.org>
 <20210528090629.1800173-3-lee.jones@linaro.org>
 <20210528094118.xw53q46i676wx6gb@pengutronix.de>
 <20210528095531.GO543307@dell>
 <20210528103532.5n6zzr26hqglvz2p@pengutronix.de>
 <20210601090503.GY543307@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yly3m2bwxq5ptw5f"
Content-Disposition: inline
In-Reply-To: <20210601090503.GY543307@dell>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--yly3m2bwxq5ptw5f
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Lee,

On Tue, Jun 01, 2021 at 10:05:03AM +0100, Lee Jones wrote:
> On Fri, 28 May 2021, Uwe Kleine-K=F6nig wrote:
> > On Fri, May 28, 2021 at 10:55:31AM +0100, Lee Jones wrote:
> > > On Fri, 28 May 2021, Uwe Kleine-K=F6nig wrote:
> > > > On Fri, May 28, 2021 at 10:06:16AM +0100, Lee Jones wrote:
> > > > > diff --git a/drivers/leds/leds-gpio-register.c b/drivers/leds/led=
s-gpio-register.c
> > > > > index b9187e71e0cf2..de3f12c2b80d7 100644
> > > > > --- a/drivers/leds/leds-gpio-register.c
> > > > > +++ b/drivers/leds/leds-gpio-register.c
> > > > > @@ -11,6 +11,7 @@
> > > > >  /**
> > > > >   * gpio_led_register_device - register a gpio-led device
> > > > >   * @pdata: the platform data used for the new device
> > > > > + * @id: platform ID
> > > > >   *
> > > >=20
> > > > Given that id is the first parameter and pdata the second I suggest=
 to
> > > > swap the order here and describe id first.
> > >=20
> > > That's super picky.
> > >=20
> > > I can do it as a follow-up patch if you *really* care about it.
> >=20
> > I'd say introducing the one-line description for id now in the "wrong"
> > location and then reordering as a followup is ridiculus. But having said
> > that: I don't care at all.
>=20
> It's only "wrong" according to you.
>=20
> I see these presented in a different order to their counterparts all
> the time.

This is a poor justification. In software bugs happen all the time, this
doesn't mean you shouldn't make it better when you touch some code.

> I do however appreciate that it does make more sense and
> is easier on the eye, which is why I am more than happy to rectify.

=2E.. still more if you agree that the feedback makes sense.

> With regards to the follow-up scenario, it makes far less sense for an
> already merged patch in a history tree to be reverted, or for history
> to be unnecessarily re-written for something as trivial as this.

Ah, that the patch is already merged is news to me. Indeed, then fixing
this is not sensible. My initial feedback was less than an hour after
you sent the patch and it appeared just yesterday in next, so this
wasn't easily noticeable for me.

Usually I'm annoyed about maintainers who don't react to patch series
and don't apply it. Here I'm more annoyed that I was Cc:d---which I
interpret as a request for feedback---and an hour later was already too
late for my review reply and there was (up to today) no maintainer mail
that the patch set was applied.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--yly3m2bwxq5ptw5f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmC3QEEACgkQwfwUeK3K
7Akymgf+KkzImf56cp5Wnyk4i6OMmpzmFd0uYNlQmBjwYJi1hOjoR2YSACH2DF7E
EaPBdT/Co8iquPeJEBR6QC8AJvs/AUGk5fcz6vxSOqt/9d/h5/f2QL7RFaWf8dVg
GhdRgO4vTk2EratBzMpKR+igOe8iFn0O5Js2imNlGnfg5zT2WJJAU0e9NBwMBWCi
cw5QRWN5f7KCEQWz8ytym26pioK1Ltcc2Lo5pAAOBAJuT3GVr24hdHYH7VGikblo
8gpLXUwBxl3wM0c9EPCiOCt11tvln+/6gYzGqi5MA2Mt97fAVX/Pwa80RnINkpph
I8sWmBqrd2rGxkSpMt+Vwseh2DPT5Q==
=TGOZ
-----END PGP SIGNATURE-----

--yly3m2bwxq5ptw5f--
