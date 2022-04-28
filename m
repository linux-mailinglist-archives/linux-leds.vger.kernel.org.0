Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92E77513964
	for <lists+linux-leds@lfdr.de>; Thu, 28 Apr 2022 18:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236164AbiD1QLh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 28 Apr 2022 12:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232927AbiD1QLh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 28 Apr 2022 12:11:37 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C96F65BE4E
        for <linux-leds@vger.kernel.org>; Thu, 28 Apr 2022 09:08:21 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nk6gk-0007e5-GV; Thu, 28 Apr 2022 18:08:18 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nk6gk-005mVK-Hb; Thu, 28 Apr 2022 18:08:17 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nk6gi-006EZD-BR; Thu, 28 Apr 2022 18:08:16 +0200
Date:   Thu, 28 Apr 2022 18:08:12 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Riku Voipio <riku.voipio@iki.fi>, kernel@pengutronix.de,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v3] leds: pca9532: Make pca9532_destroy_devices() return
 void
Message-ID: <20220428160812.vf22xvoahl5au52w@pengutronix.de>
References: <20211021121639.79179-1-u.kleine-koenig@pengutronix.de>
 <20211022101707.1194979-1-u.kleine-koenig@pengutronix.de>
 <20220110072317.sysdgvuzvlzzbcsb@pengutronix.de>
 <20220111211223.GA26173@duo.ucw.cz>
 <20220111213032.5hqlgptdqjxvnikj@pengutronix.de>
 <20220331131949.hboij2vkptpxdvme@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uliyqju6wcjb5ggs"
Content-Disposition: inline
In-Reply-To: <20220331131949.hboij2vkptpxdvme@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--uliyqju6wcjb5ggs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2022 at 03:19:49PM +0200, Uwe Kleine-K=F6nig wrote:
> On Tue, Jan 11, 2022 at 10:30:32PM +0100, Uwe Kleine-K=F6nig wrote:
> > On Tue, Jan 11, 2022 at 10:12:23PM +0100, Pavel Machek wrote:
> > > On Mon 2022-01-10 08:23:17, Uwe Kleine-K=F6nig wrote:
> > > > On Fri, Oct 22, 2021 at 12:17:07PM +0200, Uwe Kleine-K=F6nig wrote:
> > > > > Up to now pca9532_destroy_devices() returns always zero because i=
t's
> > > > > always called with data !=3D NULL. Remove the never-taken error p=
ath and
> > > > > make it return void which makes it easier to see in the callers t=
hat
> > > > > there is no error to handle.
> > > > >=20
> > > > > Also the return value of i2c remove callbacks is ignored anyway.
> > > > >=20
> > > > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > > >=20
> > > > Ping. This patch is part of an effort to make the i2c remove callba=
ck a
> > > > void function, too. Are there any concerns, or plans to pick up this
> > > > patch?
> > >=20
> > > It looks like a simple cleanup with no effect outside of the
> > > driver. Am I wrong?
> >=20
> > Yes, there is no intended effect on the compiled code.
>=20
> ah, oh, the answer should have been "No". :-)
>=20
> > The reason I want this patch is that I work on making the i2c remove
> > callback return void. As this has to touch all i2c drivers, the changes
> > to these should be as simple as possible, so ideally I just want to drop
> > the "return 0" there. Every return that might return a value !=3D 0 is
> > more complicated to handle there.
> >=20
> > So it's just to prepare this change an to make the code a tad easier to
> > read for a human.
>=20
> Is this convincing? Is this patch still on the "to-review" (or still
> better the "to-apply") list?

The patch was sent initially before the v5.15 release. So it didn't
receive a maintainer decision during three merge windows. Is this patch
still considered?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--uliyqju6wcjb5ggs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmJqu+kACgkQwfwUeK3K
7AkmWwf/SSQMpDPTDRxZ/aHLhS1BZkExcLN9dtQGu3zrGas5BBXW6NfoybuZBd/d
gXH+1kp1C5cgJB4WgDS0HIig5ddQBTp/u5/ywQ3/Pq889fgxbVOeUj8PAjH88ufk
Xuc7r2i0xGIj1cS33JW+QCZxzffcSG3P0JH83MW+7ip+a/d4DcoYTZwD7ylnDpWX
so3fysiEQeq0wvrYYrn3SVOK6qCqstTX3dfNgtRprJq1HeDLuuRu0RDuMl8KkePx
Ea8AHUj/So8dapQ9fJa/RwN3B/ZY7DcX0289Hj0dcZjQoTXGqRZPeCIc4Dz+iJg1
m6g4pnvgFsj1qwHQp0DiQEotBiwqxg==
=7pmc
-----END PGP SIGNATURE-----

--uliyqju6wcjb5ggs--
