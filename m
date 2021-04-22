Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5316368291
	for <lists+linux-leds@lfdr.de>; Thu, 22 Apr 2021 16:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237379AbhDVOk0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 22 Apr 2021 10:40:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236501AbhDVOk0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 22 Apr 2021 10:40:26 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E85AC06174A
        for <linux-leds@vger.kernel.org>; Thu, 22 Apr 2021 07:39:51 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lZaUc-00028T-D1; Thu, 22 Apr 2021 16:39:46 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lZaUc-0003xQ-2x; Thu, 22 Apr 2021 16:39:46 +0200
Date:   Thu, 22 Apr 2021 16:39:45 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Juergen Borleis <jbe@pengutronix.de>, kernel@pengutronix.de,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: trigger/tty: feature data direction
Message-ID: <20210422143945.n5gqkeh2y2jm6ece@pengutronix.de>
References: <20210422074702.8831-1-jbe@pengutronix.de>
 <YIEuSPS11fkSwQ7N@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pt2plmppneqtli76"
Content-Disposition: inline
In-Reply-To: <YIEuSPS11fkSwQ7N@kroah.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--pt2plmppneqtli76
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Greg,

On Thu, Apr 22, 2021 at 10:05:28AM +0200, Greg Kroah-Hartman wrote:
> On Thu, Apr 22, 2021 at 09:47:02AM +0200, Juergen Borleis wrote:
> > +static ssize_t dirfilter_show(struct device *dev,
> > +			      struct device_attribute *attr, char *buf)
> > +{
> > +	struct ledtrig_tty_data *trigger_data =3D led_trigger_get_drvdata(dev=
);
> > +
> > +	if (trigger_data->indirection)
> > +		return (ssize_t)sprintf(buf, "in\n");
> > +	if (trigger_data->outdirection)
> > +		return (ssize_t)sprintf(buf, "out\n");
> > +	return (ssize_t)sprintf(buf, "inout\n");
>=20
> sysfs_emit() please.
>=20
> And you are adding new sysfs files, that requires an update to
> Documentation/ABI/ please do so.

I agree to these two suggestions.

> But why are you adding random new sysfs values to a class device?  That
> feels really wrong.

This is quite usual for triggers and there is IMHO no way around this.
And it is also save as led_trigger_set() emits an uevent after a trigger
was activated.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--pt2plmppneqtli76
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmCBiq4ACgkQwfwUeK3K
7An9WQf9HqPjIWCpV8lEEjlTUBeaJc2Pwfy9NYtrg6MaIZR/VB14IXJR8o2DfA0v
ivVDNJTaSwZ6wgcxahH2CJ52PuZv8z240HwCQ8caOFYiGlwXoMaq3l+xE1pPOEfw
UXY7BaNINxsvRwxpAWeoE33TQosTZlBq0mMga2ytAN6quHsmqK+TDAXdX1G5sTFs
++rQiUHZJUi0s75yzDxo2qnWpAvXsq2hPWgvOQDvmPdwcz0A2jem15t7PndFd0HP
J1qiuuZgq+azo5YHYOoYul+HuU3bKza5Qh+auHxF57WorQ2k7KEtr04D4bA/8dMr
bTUpJgvaHy3BAKpkjQXmd5fLt1GgMw==
=CpzT
-----END PGP SIGNATURE-----

--pt2plmppneqtli76--
