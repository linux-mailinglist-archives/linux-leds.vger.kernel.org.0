Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42D0223E8A8
	for <lists+linux-leds@lfdr.de>; Fri,  7 Aug 2020 10:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbgHGIPQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 7 Aug 2020 04:15:16 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:55990 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbgHGIPP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 7 Aug 2020 04:15:15 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 100661C0BE5; Fri,  7 Aug 2020 10:15:12 +0200 (CEST)
Date:   Fri, 7 Aug 2020 10:15:11 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, dmurphy@ti.com,
        jacek.anaszewski@gmail.com, vishwa@linux.ibm.com,
        andy.shevchenko@gmail.com
Subject: Re: [PATCH v2 2/2] leds: pca955x: Add an IBM software implementation
 of the PCA9552 chip
Message-ID: <20200807081511.oqwqxhltvy552ltn@duo.ucw.cz>
References: <20200803145055.5203-1-eajames@linux.ibm.com>
 <20200803145055.5203-3-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="k677muyop72qw6uc"
Content-Disposition: inline
In-Reply-To: <20200803145055.5203-3-eajames@linux.ibm.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--k677muyop72qw6uc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2020-08-03 09:50:55, Eddie James wrote:
> IBM created an implementation of the PCA9552 on a PIC16F
> microcontroller. The I2C device addresses are different from the
> hardware PCA9552, so add a new compatible string and associated
> platform data to be able to probe this device.
>=20
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Reviewed-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

This can be applied when Rob ack's the device tree change.

I'll ask you to do new patch version when that happens.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--k677muyop72qw6uc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXy0NjwAKCRAw5/Bqldv6
8jNyAKCMxMj/qGc8bzYFljNed7jfDdIh7wCeIPgGR7JyB/2buecYvZ2EvDKH7co=
=gRF+
-----END PGP SIGNATURE-----

--k677muyop72qw6uc--
