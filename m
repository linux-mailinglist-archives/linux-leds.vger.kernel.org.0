Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6622A273576
	for <lists+linux-leds@lfdr.de>; Tue, 22 Sep 2020 00:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbgIUWKP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 21 Sep 2020 18:10:15 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:53796 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgIUWKP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 21 Sep 2020 18:10:15 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id ED41C1C0B8C; Tue, 22 Sep 2020 00:10:13 +0200 (CEST)
Date:   Tue, 22 Sep 2020 00:10:13 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Adrian Schmutzler <freifunk@adrianschmutzler.de>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: add LED_FUNCTION for
 wlan2g/wlan5g
Message-ID: <20200921221012.GB11006@amd>
References: <20200919192427.57033-1-freifunk@adrianschmutzler.de>
 <20200919223134.2371459c@nic.cz>
 <946e7a49-db74-8d2d-0ac8-5075d20f41f3@gmail.com>
 <20200920153707.70164720@nic.cz>
 <5ae6b9f4-3c9b-3a47-5738-585b28d841c5@gmail.com>
 <20200920172848.3e49d613@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Yylu36WmvOXNoKYn"
Content-Disposition: inline
In-Reply-To: <20200920172848.3e49d613@nic.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Yylu36WmvOXNoKYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > >>> In fact the function should not be "wlan" (nor "wlan2g" or "wlan5g"=
, but
> > >>> "activity". =20
> >=20
> > I disagree. Activity should be reserved for the activity trigger.
> > I've had a patch [0] documenting standard LED functions, but it
> > eventually didn't make to the mainline, I'll try to send an update.
>=20
> Hmm. The thing is that activity is sometimes interpreted as the union
> of rx and tx, or read and write. I think the pair (device,function)
> could be used better to infer the actual trigger and its settings, than
> just (function,). For example:
> 	device	function		trigger
> 	system	activity		cpu activity
> 	(empty)	activity		cpu activity
> 	eth0	activity		netdev rx/tx
> 	sda	activity		disk read/write on sda
> 	wlan0	activity		phy rx/tx

I believe that makes sense.

> (This is another thing that is wrong: there should be only phy, or
> wireless-phy trigger, and the mode (rx/tx/assoc/radio) and device
> (phy0, phy1, ...) should be set via device_name file, as in netdev
> trigger. Can we reimplement it and leave this ABI under configuration
> option _LEAGACY?).
>=20
> > IMO if LED is not physically integrated with any device, then it should
> > not be named after the device that is to be initially associated with
> > via trigger. This association can be later changed in userspace, which
> > will render the name invalid. And current associated device can be read
> > by reading triggers sysfs file, provided that the trigger conveys
> > that information like in case of presented above phy* triggers.
>=20
> There are devices which have LEDs connected via a LED controller for
> example via I2C bus, but the individual LEDs are dedicated (in the way
> that there is an icon or text written on the device's case next to each
> LED). In this case the trigger-source should be defined in device tree
> in such a way that it aligns with the manufacturer's intended function
> of the LED. And in this case I think the devicename part of the LED
> should be derived from this trigger source.

I agree here.

In ideal world, we would have same interface for

1) capslock LED is integrated on USB keyboard

2) casplock LED on i2c and keyboard on GPIO lines

We are not there, yet, but I believe it makes sense as a goal.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Yylu36WmvOXNoKYn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl9pJMQACgkQMOfwapXb+vLMmACfQDvWDDrQiWfYx1vb5atgahBx
svkAoLtoY5RyvmwLyl9tVrJlOFdlAvYo
=M49B
-----END PGP SIGNATURE-----

--Yylu36WmvOXNoKYn--
