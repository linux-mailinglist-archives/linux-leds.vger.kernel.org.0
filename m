Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A93613EFCBA
	for <lists+linux-leds@lfdr.de>; Wed, 18 Aug 2021 08:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238277AbhHRG2j (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Aug 2021 02:28:39 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:44264 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238043AbhHRG2i (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Aug 2021 02:28:38 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 9D50C1C0B77; Wed, 18 Aug 2021 08:28:02 +0200 (CEST)
Date:   Wed, 18 Aug 2021 08:28:02 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Denis Osterland-Heim <denis.osterland.heim@gmail.com>
Cc:     denis.osterland@diehl.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/2] leds: pwm: add support for default-state device
Message-ID: <20210818062801.GA22282@amd>
References: <20210608063554.6590-1-denis.osterland.heim@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline
In-Reply-To: <20210608063554.6590-1-denis.osterland.heim@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2021-06-08 08:35:52, Denis Osterland-Heim wrote:
> v7 -> v8:
>  - apply and test on newest kernel
>  - drop docu patch, because it is already documented
>=20
> Denis Osterland-Heim (2):
>       leds: move default_state read from fwnode to core
>       leds: pwm: add support for default-state device property

Thanks, applied, sorry for the delay.

Best regards,
							Pavel
--=20
http://www.livejournal.com/~pavelmachek

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmEcqHEACgkQMOfwapXb+vKWeQCgwtxldO61fuEW1/rfcVbloFb9
WtAAoMI5B+hZMFgK1yjriHWkcoNF7jx/
=H+Js
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
