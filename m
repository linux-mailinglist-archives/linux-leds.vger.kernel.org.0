Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 197D84C41BC
	for <lists+linux-leds@lfdr.de>; Fri, 25 Feb 2022 10:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239226AbiBYJrX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 25 Feb 2022 04:47:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239223AbiBYJrX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Feb 2022 04:47:23 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A4D14B414
        for <linux-leds@vger.kernel.org>; Fri, 25 Feb 2022 01:46:50 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nNXBY-0001Ng-4T; Fri, 25 Feb 2022 10:46:48 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nNXBY-001BEn-0W; Fri, 25 Feb 2022 10:46:47 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nNXBW-005PcA-Es; Fri, 25 Feb 2022 10:46:46 +0100
Date:   Fri, 25 Feb 2022 10:46:36 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-leds@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] leds: trigger/tty: Add knob to blink only for tx or only
 for rx
Message-ID: <20220225094636.ypiaaen4bivk27hg@pengutronix.de>
References: <20220224155655.702255-1-u.kleine-koenig@pengutronix.de>
 <YhiiKJmqCTHXdZbL@ada.ifak-system.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jtuentsmecm7ghlg"
Content-Disposition: inline
In-Reply-To: <YhiiKJmqCTHXdZbL@ada.ifak-system.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--jtuentsmecm7ghlg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Feb 25, 2022 at 10:32:24AM +0100, Alexander Dahl wrote:
> Am Thu, Feb 24, 2022 at 04:56:55PM +0100 schrieb Uwe Kleine-K=F6nig:
> > The newly introduced "triggerevent" attribute allows to restrict
> > blinking to TX or RX only.
>=20
> Sounds like you could hook up the trigger for the same UART to one LED
> with RX only and to another LED with TX only.  Right?

Yes, that's the general idea ...

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--jtuentsmecm7ghlg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmIYpXgACgkQwfwUeK3K
7AkTawf/UJl532sEu/yIafBRVrZhQXHgm2TanhNtPxeNUrnNGlZyqHkKdxgoZ5dq
hnmFjB9sYmxK8nyn+Dbuod00HOw3+aArYSAPHzgryqEwTONolvXLZKkZOiryKLHK
uO0juzRpxeDqPwUQAvs7WziTDbPH1l+q2/BzwKLTx7jSyL6HW/iNQyCXibPwlhrF
7laXsMUbc0Uv3b87BId6EWCLoXxp9PcJEuMjimZVi/1A01r0PddKGx3qzuiV7aRm
atRDTZNXuYjdzxRazDBab7r7aKVt9wHFy7B0KMnn6hjVT5EL2b/376gMav+ymtoi
GT5mhyxIuMOfn+GSTcfTAaOeH/AILg==
=mAzT
-----END PGP SIGNATURE-----

--jtuentsmecm7ghlg--
