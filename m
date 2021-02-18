Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAC7631F19A
	for <lists+linux-leds@lfdr.de>; Thu, 18 Feb 2021 22:20:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbhBRVUj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 18 Feb 2021 16:20:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbhBRVUi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 18 Feb 2021 16:20:38 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04B1BC0613D6
        for <linux-leds@vger.kernel.org>; Thu, 18 Feb 2021 13:19:58 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lCqiF-00064A-3x; Thu, 18 Feb 2021 22:19:51 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lCqiC-0000LA-C7; Thu, 18 Feb 2021 22:19:48 +0100
Date:   Thu, 18 Feb 2021 22:19:48 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@pengutronix.de, Johan Hovold <johan@kernel.org>,
        linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v11] leds: trigger: implement a tty trigger
Message-ID: <20210218211948.4jwhtkhg72kaxx5n@pengutronix.de>
References: <20201218104246.591315-1-u.kleine-koenig@pengutronix.de>
 <20201218104246.591315-4-u.kleine-koenig@pengutronix.de>
 <X/8cwD51DYhzRdDO@kroah.com>
 <20210113173018.bq2fkea2o3yp6rf6@pengutronix.de>
 <X/89NHn4oJFC7GjM@kroah.com>
 <20210218133352.GA13628@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pezhfulq2xqxpwpg"
Content-Disposition: inline
In-Reply-To: <20210218133352.GA13628@duo.ucw.cz>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--pezhfulq2xqxpwpg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Pavel,

On Thu, Feb 18, 2021 at 02:33:52PM +0100, Pavel Machek wrote:
> > > > so that I can queue it up?
> > >=20
> > > Oh, so you are LED maintainer now? My congratulations.
> > > (Honestly, do you plan to apply this without their ack? Not that I'm
> > > against you doing that, I'm happy if I can archive this patch series =
as
> > > done, but I'm a bit surprised.)
> >=20
> > It's drug on for so long now, the infrastructure that this driver needs
> > has now bee merged, so I see no reason why this driver can't be taken
> > now.  I offered up a "any objections?" in the past, and have gotten
> > none, so I will take that for quiet acceptance :)
>=20
> Thanks for taking the infrastructure patches, but please drop this
> one.

Given it is already part of Greg's pull request I wonder if we need an
incremental patch instead?

> Its buggy, as were previous versions. I'll handle it.

*sigh*, you're right. I will prepare a fixed version tomorrow.
Maybe I know until then if I have to prepare a v12 or an incremental
patch.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--pezhfulq2xqxpwpg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmAu2fAACgkQwfwUeK3K
7AlVNQf9Fntr6+rWEXyxclcvC+5IAhyGh08RdpmV1oOlCfj6mVv4DiBq0zByDZsG
2bI/ijYNUxbHAwnXmFxFIF7x0ueT34zR8Q0N5I09MpCc6mGdPGjEkdl41iOwAG7D
A3uLJLpnQE1XABOGI9tPQ7iUFvqp62OYgteOMcZcbitaraMbqHKa90zQchO3uqXv
17ud+JbuUuI35GHjh3U8pAlulU6l+odBXVnCFcpakNy8FcdOHSE6ISf7grWNCzoc
/QacO/DS2OiQZ16S6IR77KH2QfZokeH2HtXR9cInVjLOWQ1yyxDrcOFHKOgXar1U
NHgA0C7gMReuRRVzZqE3KfNUtTvFTg==
=ca1N
-----END PGP SIGNATURE-----

--pezhfulq2xqxpwpg--
