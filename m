Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8A03F28C2
	for <lists+linux-leds@lfdr.de>; Fri, 20 Aug 2021 11:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231142AbhHTJBR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 20 Aug 2021 05:01:17 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:45454 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231949AbhHTJBR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 20 Aug 2021 05:01:17 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id B07A31C0B80; Fri, 20 Aug 2021 11:00:38 +0200 (CEST)
Date:   Fri, 20 Aug 2021 11:00:38 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH v2 0/7] leds: Support retaining state for the PCA955x
Message-ID: <20210820090038.GC22757@amd>
References: <20210716220331.49303-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Pk6IbRAofICFmK5e"
Content-Disposition: inline
In-Reply-To: <20210716220331.49303-1-eajames@linux.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Pk6IbRAofICFmK5e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This series implements the ability to retain the state of the LEDs
> controlled by the PCA955x across system reboots. This includes a
> change to the LED core driver to respect the retain-state-shutdown
> device tree property. It also cleans up the PCA955x driver, adds the
> ability to query the hardware LED brightness, switches the I2C probe
> function to probe_new, and uses more core functionality for parsing
> the fwnode.

Thanks, applied.
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--Pk6IbRAofICFmK5e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmEfbzYACgkQMOfwapXb+vL6eACgsrBocmNSv9pM/Pm+d9v5Rj0m
GFYAoLR3bANbMnXxMcYhyz1L2luAgRWu
=8DtY
-----END PGP SIGNATURE-----

--Pk6IbRAofICFmK5e--
