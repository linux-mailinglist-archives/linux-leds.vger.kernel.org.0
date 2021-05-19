Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7A453896DD
	for <lists+linux-leds@lfdr.de>; Wed, 19 May 2021 21:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232097AbhESTmj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 May 2021 15:42:39 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:53592 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbhESTmi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 19 May 2021 15:42:38 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 45FD91C0B7F; Wed, 19 May 2021 21:41:16 +0200 (CEST)
Date:   Wed, 19 May 2021 21:41:15 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        gregkh@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 00/17] Adding support for controlling the leds found
 on Intel NUC
Message-ID: <20210519194115.GA31672@duo.ucw.cz>
References: <cover.1621349813.git.mchehab+huawei@kernel.org>
 <20210519111107.GC24621@duo.ucw.cz>
 <20210519141508.6e7a4d56@coco.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline
In-Reply-To: <20210519141508.6e7a4d56@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Marek and I are saying the same thing -- this needs to use close to
> > existing APIs.
>=20
> Ok, but I'm not seeing an existing API that provides what those
> LEDs need.

Well, there "close to" part comes into play.

> > If you want to get something merged quickly, please submit basic
> > functionality only (toggling the LED on/off) that completely fits
> > existing APIs. We can review that.
>=20
> If you prefer working this way, I can send an initial patch with
> just the very basic. Actually, if you apply just patch 2 of this
> series, it will provide support for for just setting the brightness
> on NUC8.

I don't care much. We can discuss minimal interface additions
neccessary to support your usecases.

But what you proposed was nowhere near close.

Note that we don't want to support every crazy feature, just because
hardware can do it.

> However, the main reason why someone (including myself) want this
> driver is to allow to dynamically change what hardware event will
> be triggering the LED and how, and if suspend will blink or not[1].

> Being able to also change the LED color is a plus.

This one is hard if the LED does not support full color.

> [1] Disabling blink at suspend/hibernate is one of the things that
> I use here: as the machine is at my bedroom, I don't want it to be
> blinking all night long when the machine is sleeping :-)

Ok, so lets start with the blink at suspend thing?

Having power LED on when machine is on, and slowly "breathing" when
machine is suspended is something I have seen before. Is that what
your hardware is doing?

Best regards,
							Pavel
--=20
http://www.livejournal.com/~pavelmachek

--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYKVp2wAKCRAw5/Bqldv6
8lPiAJwOYgBn8ilKQYGqIfZ7v6ac0HT9dwCeJ24DUqksGzkO6d25IA75DI6Hn+Q=
=U1fL
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
