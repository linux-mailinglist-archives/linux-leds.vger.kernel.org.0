Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01C2938205E
	for <lists+linux-leds@lfdr.de>; Sun, 16 May 2021 20:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbhEPScw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 16 May 2021 14:32:52 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:45032 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhEPScv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 16 May 2021 14:32:51 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id E65E81C0B76; Sun, 16 May 2021 20:31:35 +0200 (CEST)
Date:   Sun, 16 May 2021 20:31:35 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Doug Zobel <dougdev334@gmail.com>
Cc:     Rob Herring <robh@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt: bindings: lp55xx: Add predefined LED pattern
Message-ID: <20210516183135.GA26985@duo.ucw.cz>
References: <20210511204834.2675271-1-dougdev334@gmail.com>
 <20210511204834.2675271-3-dougdev334@gmail.com>
 <20210513022036.GA890569@robh.at.kernel.org>
 <CABa6EMYdY9WBN0+edgcEFc0uiBmWUDert7nXCN+FWeRMG=0S6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline
In-Reply-To: <CABa6EMYdY9WBN0+edgcEFc0uiBmWUDert7nXCN+FWeRMG=0S6A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > I don't know that this belongs in DT though. Won't a user want to create
> > their own patterns? That means there should be a sysfs interface (which
> > we either already have or has been attempted IIRC).
>=20
> Yes, there is a sysfs interface for running patterns via the firmware
> loading interface.  The firmware loading interface doesn't seem well
> suited for constantly changing the pattern that the LED driver runs.
> I found it to be slow and unreliable when quickly changing the LED
> pattern.  The existing predef pattern functionality works much better.
> Unfortunately the only way to define the patterns for it is via the
> platform data structure.  Adding the predef patterns to the device
> tree seemed like a good way to make use of the existing functionality
> in the driver.

Take a look at the pattern trigger. That's the way to change patterns
at runtime, no need for firmware loading.

I may even have compiler from that interface to the bytecode lp55xx
uses. Some assembly will be required. Doing so with the RGB LED will
be even more fun.=20

We'll want to deprecate the firmware loading interface at some point.

Forget the device tree, that will not help you.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYKFlBwAKCRAw5/Bqldv6
8tFDAKC3YhzAdQ9LYeg4X9Jiyl0bNQ25JACfU6OnhTTZpWfegLboUmGSg30vnMc=
=nF5x
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
