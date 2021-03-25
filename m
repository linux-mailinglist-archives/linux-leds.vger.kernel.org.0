Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF047348E3C
	for <lists+linux-leds@lfdr.de>; Thu, 25 Mar 2021 11:42:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbhCYKla (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 25 Mar 2021 06:41:30 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:55298 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbhCYKk6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 25 Mar 2021 06:40:58 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id C2D271C0B92; Thu, 25 Mar 2021 11:40:55 +0100 (CET)
Date:   Thu, 25 Mar 2021 11:40:55 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Rahul Tanwar <rtanwar@maxlinear.com>
Cc:     arnd@kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, kilobyte@angband.pl,
        rafael.j.wysocki@intel.com, john@phrozen.org,
        hmehrtens@maxlinear.com, ckim@maxlinear.com, qwu@maxlinear.com
Subject: Re: [PATCH v2 1/1] leds: lgm: Improve Kconfig help
Message-ID: <20210325104055.GA7247@amd>
References: <cover.1616655898.git.rtanwar@maxlinear.com>
 <468455e66ce27bc731fab08be8aeccedba2ed342.1616655898.git.rtanwar@maxlinear.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Content-Disposition: inline
In-Reply-To: <468455e66ce27bc731fab08be8aeccedba2ed342.1616655898.git.rtanwar@maxlinear.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Remove unnecessary Kconfig symbol LEDS_BLINK
> Improve Kconfig help text to make it more useful.
>=20
> Signed-off-by: Rahul Tanwar <rtanwar@maxlinear.com>

Thanks for the patch, I applied it by hand.

> +++ b/drivers/leds/blink/leds-lgm-sso.c
> @@ -1,8 +1,8 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Intel Lightning Mountain SoC LED Serial Shift Output Controller driver
> + * Lightning Mountain SoC LED Serial Shift Output Controller driver
>   *
> - * Copyright (c) 2020 Intel Corporation.
> + * Copyright (c) 2021 Intel Corporation.
>   */
>=20

Not taking this. Talk to your lawyers why.

> This electronic mail (including any attachments) may contain
  information that is privileged, confidential, and/or otherwise
  protected from disclosure to anyone other than its intended
  recipient(s). Any dissemination or use of this electronic mail or
  its contents (including any attachments) by persons other than the
  intended recipient(s) is strictly prohibited. If you have received
  this message in error, please notify us immediately by reply e-mail
  so that we may correct our internal records. Please then delete the
  original message (including any attachments) in its entirety.

And talk to them about this, too.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmBcaLcACgkQMOfwapXb+vKLOwCcDSvcP03erg96B092dsoRYiiS
bwAAnRv52cQJLQDG97vJ1hBCmvkBN3F1
=i/9B
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--
