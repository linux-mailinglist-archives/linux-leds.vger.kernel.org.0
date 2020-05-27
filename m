Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75DF81E44F3
	for <lists+linux-leds@lfdr.de>; Wed, 27 May 2020 15:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388986AbgE0N6u (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 27 May 2020 09:58:50 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:49730 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388989AbgE0N6u (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 27 May 2020 09:58:50 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id ACF451C0300; Wed, 27 May 2020 15:58:48 +0200 (CEST)
Date:   Wed, 27 May 2020 15:58:48 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, robh@kernel.org,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v25 03/16] dt: bindings: lp50xx: Introduce the lp50xx
 family of RGB drivers
Message-ID: <20200527135848.GB5011@amd>
References: <20200526164652.2331-1-dmurphy@ti.com>
 <20200526164652.2331-4-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="bCsyhTFzCvuiizWE"
Content-Disposition: inline
In-Reply-To: <20200526164652.2331-4-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--bCsyhTFzCvuiizWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!


> +          There can only be one instance of the ti,led-bank
> +          property for each device node.  This is a required node is the=
 LED
> +          modules are to be backed.

I don't understand the second sentence. Pretty sure it is not valid
english.

Best regards,
								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--bCsyhTFzCvuiizWE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl7OchgACgkQMOfwapXb+vJN4wCgqTGudnsYl/ewRIsVi9XZkP6I
jM8AoLKtiC+mvdIBJtq12SDgoq9//j4V
=y5Pw
-----END PGP SIGNATURE-----

--bCsyhTFzCvuiizWE--
