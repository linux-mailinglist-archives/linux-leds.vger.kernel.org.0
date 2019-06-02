Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDAB5324E0
	for <lists+linux-leds@lfdr.de>; Sun,  2 Jun 2019 23:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbfFBVFM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 2 Jun 2019 17:05:12 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:41543 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbfFBVFM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 2 Jun 2019 17:05:12 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 780C58032A; Sun,  2 Jun 2019 23:04:58 +0200 (CEST)
Date:   Sun, 2 Jun 2019 23:05:08 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Subject: Re: [PATCH] leds: core: Support blocking HW blink operations
Message-ID: <20190602210507.GA14071@amd>
References: <20181127150106.20213-1-linus.walleij@linaro.org>
 <20190601203747.GA13060@amd>
 <CACRpkdYUJURZB1+yTL0psc1qMhdV=UHmjtOY7UrGg7x-2tvJXQ@mail.gmail.com>
 <abb42645-87e3-619d-c8d7-2d67814409cf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline
In-Reply-To: <abb42645-87e3-619d-c8d7-2d67814409cf@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2019-06-02 13:20:20, Jacek Anaszewski wrote:
> On 6/1/19 11:47 PM, Linus Walleij wrote:
> >On Sat, Jun 1, 2019 at 10:37 PM Pavel Machek <pavel@ucw.cz> wrote:
> >>On Tue 2018-11-27 16:01:06, Linus Walleij wrote:
> >
> >>>I ran into this when working on a keyboard driver for
> >>>the Razer family: the .blink_set() callback for setting
> >>>hardware blinking on a LED only exist in a non-blocking
> >>>(fastpath) variant, such as when blinking can be enabled
> >>>by simply writing a memory-mapped register and protected
> >>>by spinlocks.
> >>>
> >>>On USB keyboards with blinkable LEDs controlled with USB
> >>>out-of-band commands this will of course not work: these
> >>>calls need to come from process context.
> >>>
> >>>To support this: add a new .blink_set_blocking() callback
> >>>in the same vein as .brightness_set_blocking() and add
> >>>a flag and some code to the delayed work so that this
> >>>will be able to fire the .blink_set_blocking() call.
> >>>
> >>>ALl of this will be handled transparently from the
> >>>led_blink_set() call so all current users can keep
> >>>using that.
> >>>
> >>>Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> >>
> >>Fun. I just realized thinkpad x60 needs something similar...
> >
> >Hm yeah. The discussion with Jacek came to the conclusion that he
> >thinks (if I understand correctly!) that the LED core is too helpful and
> >client drivers should create process contexts instead (like workers
> >I suppose) and use the opaque interfaces from there, whether they
> >are blocking or not, and that it was a mistake from the beginning
> >to create a helper thread inside the LED core.
> >
> >I like APIs that are narrow and deep so I would prefer to do it my
> >way (i.e. this patch) but arguably it is a matter of taste.
> >
> >I hope to get back to this patch set at some point.
>=20
> Well, yes, I missed the fact that we already had the use case
> in mainline where blink_set is called from atomic context,
> which is led_trigger_blink{_oneshot}().

Yep.

> So, Pavel, you seem to have good setup for testing this Linus'
> patch.

OTOH that is _not_ passed down to drivers, as they can blink, but not
do oneshot, and blinking on X60 is limited to single frequency so
likely not useful for triggers.

But we probably want to annotate can/can not sleep and use lockdep to
catch the bugs.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlz0OgMACgkQMOfwapXb+vK2wgCgsfAqkMZwVUJ8pARjNlnsShDC
A+oAoIjHX3GvTQni+37UJQzt2emZlZM3
=BCmC
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
