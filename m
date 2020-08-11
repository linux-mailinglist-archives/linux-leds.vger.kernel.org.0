Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2479E2419CE
	for <lists+linux-leds@lfdr.de>; Tue, 11 Aug 2020 12:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728544AbgHKKcD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Aug 2020 06:32:03 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:54372 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728280AbgHKKcD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Aug 2020 06:32:03 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id AF1A41C0BD8; Tue, 11 Aug 2020 12:32:00 +0200 (CEST)
Date:   Tue, 11 Aug 2020 12:32:00 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, robh@kernel.org, marek.behun@nic.cz,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v32 1/6] dt: bindings: lp50xx: Introduce the lp50xx
 family of RGB drivers
Message-ID: <20200811103200.z5vrdyxv4btgfysu@duo.ucw.cz>
References: <20200722153146.8767-1-dmurphy@ti.com>
 <20200722153146.8767-2-dmurphy@ti.com>
 <285e2038-6a90-e59a-d414-19cc0f8789e6@ti.com>
 <4c595ccd-f4bc-3ac2-6f3f-9778c1170af5@ti.com>
 <67c903e9-4ffe-ed86-fd95-b343321c02a3@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="pcsruuejzalfmbc3"
Content-Disposition: inline
In-Reply-To: <67c903e9-4ffe-ed86-fd95-b343321c02a3@ti.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--pcsruuejzalfmbc3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2020-08-07 08:42:32, Dan Murphy wrote:
> Pavel
>=20
> On 8/4/20 2:55 PM, Dan Murphy wrote:
> > Pavel
> >=20
> > On 7/28/20 8:39 AM, Dan Murphy wrote:
> > > Pavel
> > >=20
> > > On 7/22/20 10:31 AM, Dan Murphy wrote:
> > > > Introduce the bindings for the Texas Instruments LP5036, LP5030,
> > > > LP5024,
> > > > LP5018, LP5012 and LP5009 RGB LED device driver.=A0 The
> > > > LP5036/30/24/18/12/9
> > > > can control RGB LEDs individually or as part of a control bank grou=
p.
> > > > These devices have the ability to adjust the mixing control for the=
 RGB
> > > > LEDs to obtain different colors independent of the overall
> > > > brightness of
> > > > the LED grouping.
> > >=20
> > > Were you going to pull this in as a user of the Multicolor framework?
> > >=20
> > Gentle ping.=A0 I saw you were going to push the Omnia these should be
> > ready too
> >=20
> Did you need me to rebase these patches and add the Ack from Linus on the
> defconfig patch?

The patches look quite close, yes. If you could fix review
comments/adds acks...

I'm not sure about the defconfig patch, I may not be right person to
take it.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--pcsruuejzalfmbc3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXzJzoAAKCRAw5/Bqldv6
8oRcAKC4kB65/NrnfJUQc2HvfhWjOvO+XgCgllYG/2bSYt+uWVS4YmySiKO8HHc=
=Wdmi
-----END PGP SIGNATURE-----

--pcsruuejzalfmbc3--
