Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC86A23D3C5
	for <lists+linux-leds@lfdr.de>; Thu,  6 Aug 2020 00:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbgHEWFt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 5 Aug 2020 18:05:49 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:54262 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbgHEWFt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 5 Aug 2020 18:05:49 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 87C131C0BDE; Thu,  6 Aug 2020 00:05:47 +0200 (CEST)
Date:   Thu, 6 Aug 2020 00:05:47 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-leds@vger.kernel.org
Subject: Re: Multicolor leds-gpio
Message-ID: <20200805220547.mkjtuzcitwrb6whn@duo.ucw.cz>
References: <2530787.iFCFyWWcSu@g550jk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="logec6u6cothvgzu"
Content-Disposition: inline
In-Reply-To: <2530787.iFCFyWWcSu@g550jk>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--logec6u6cothvgzu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> would it be possible to make the leds-gpio driver compatible with the new=
=20
> multicolor framework for a light that's composed of 3 leds (red, green, b=
lue)=20
> and where each led is controlled via a gpio (so it can produce 8 differen=
t=20
> colors)? As far as I can tell leds-gpio is too generic to support that bu=
t=20
> please correct me if I'm wrong. What's the way forward here for this use =
case?=20
> The same probably also applies to leds-pwm.

For pwm it definitely makes sense.

For gpio... well, I'm not sure you'll get useful colors that way. You
can probably still do multicolor, yes.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--logec6u6cothvgzu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXystOwAKCRAw5/Bqldv6
8kh9AJ9qB0aueYxJPC/HQ5aFhS8KUN8udwCdEUG/2hJPAMqigxhS7Vh5jR+l28k=
=80zD
-----END PGP SIGNATURE-----

--logec6u6cothvgzu--
