Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 208F43EFD3C
	for <lists+linux-leds@lfdr.de>; Wed, 18 Aug 2021 08:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238081AbhHRG7p (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Aug 2021 02:59:45 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:46920 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238080AbhHRG7p (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Aug 2021 02:59:45 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 880BF1C0B77; Wed, 18 Aug 2021 08:59:10 +0200 (CEST)
Date:   Wed, 18 Aug 2021 08:59:10 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jan =?iso-8859-1?Q?Kundr=E1t?= <jan.kundrat@cesnet.cz>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Subject: Re: [PATCH 1/3] leds: lp50xx: Fix chip name in KConfig
Message-ID: <20210818065909.GC22282@amd>
References: <10256dd4010034d6335139d587ebfe933343ee85.1627717572.git.jan.kundrat@cesnet.cz>
 <YQfVwopPpxtRSjJE@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ABTtc+pdwF7KHXCz"
Content-Disposition: inline
In-Reply-To: <YQfVwopPpxtRSjJE@smile.fi.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ABTtc+pdwF7KHXCz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2021-08-02 14:23:46, Andy Shevchenko wrote:
> On Fri, Jul 30, 2021 at 11:59:11PM +0200, Jan Kundr=E1t wrote:
> > The 9-channel one is called LP5009, not LP509.
>=20
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied, thanks.
							Pavel
						=09
--=20
http://www.livejournal.com/~pavelmachek

--ABTtc+pdwF7KHXCz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmEcr70ACgkQMOfwapXb+vJD/wCdERMSAr7KEEVcijlhcnPp1fI2
6E0An1kZI7CbrNdRAaprAlOj53KoboSA
=oSam
-----END PGP SIGNATURE-----

--ABTtc+pdwF7KHXCz--
