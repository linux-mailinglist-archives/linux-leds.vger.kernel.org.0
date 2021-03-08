Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00C7133119E
	for <lists+linux-leds@lfdr.de>; Mon,  8 Mar 2021 16:06:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230511AbhCHPFd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 8 Mar 2021 10:05:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbhCHPFM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 8 Mar 2021 10:05:12 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A4AFC06174A
        for <linux-leds@vger.kernel.org>; Mon,  8 Mar 2021 07:05:12 -0800 (PST)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mkl@pengutronix.de>)
        id 1lJHRT-0005r4-AZ; Mon, 08 Mar 2021 16:05:07 +0100
Received: from pengutronix.de (unknown [IPv6:2a03:f580:87bc:d400:743f:a98a:1069:4286])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        (Authenticated sender: mkl-all@blackshift.org)
        by smtp.blackshift.org (Postfix) with ESMTPSA id D9DDC5F0CDB;
        Mon,  8 Mar 2021 15:05:05 +0000 (UTC)
Date:   Mon, 8 Mar 2021 16:05:04 +0100
From:   Marc Kleine-Budde <mkl@pengutronix.de>
To:     Boqun Feng <boqun.feng@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org,
        Andrea Righi <andrea.righi@canonical.com>,
        schuchmann@schleissheimer.de, Dan Murphy <dmurphy@ti.com>,
        kernel@pengutronix.de, linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: fix potential deadlock with libata
Message-ID: <20210308150504.dwhgqb5tyy2a3r2p@pengutronix.de>
References: <20201102104152.GG9930@xps-13-7390>
 <20210306203954.ya5oqgkdalcw45c4@pengutronix.de>
 <YEQ0ONQCwVUd0wmc@boqun-archlinux>
 <20210308145653.mechsganlrvpzyym@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7ryudos4mz2elpwz"
Content-Disposition: inline
In-Reply-To: <20210308145653.mechsganlrvpzyym@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--7ryudos4mz2elpwz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 08.03.2021 15:56:53, Marc Kleine-Budde wrote:
> > > meanwhile this patch hit v5.10.x stable and caused a performance
> > > degradation on our use case:
> > >=20
> > > It's an embedded ARM system, 4x Cortex A53, with an SPI attached CAN
> > > controller. CAN stands for Controller Area Network and here used to
> > > connect to some automotive equipment. Over CAN an ISOTP (a CAN-specif=
ic
> > > Transport Protocol) transfer is running. With this patch, we see CAN
> > > frames delayed for ~6ms, the usual gap between CAN frames is 240=C2=
=B5s.
> > >=20
> > > Reverting this patch, restores the old performance.
> > >=20
> > > What is the best way to solve this dilemma? Identify the critical path
> > > in our use case? Is there a way we can get around the irqsave in
> > > led_trigger_event()?
> > >=20
> >=20
> > Probably, we can change from rwlock to rcu here, POC code as follow,
> > only compile tested. Marc, could you see whether this help the
> > performance on your platform? Please note that I haven't test it in a
> > running kernel and I'm not that familir with led subsystem, so use it
> > with caution ;-)
> >=20
> > (While at it, I think maybe we miss the leddev_list_lock in net/mac80211
> > in the patch)
>=20
> I can confirm, this patch basically restores the old performance.

Hmmm - it first looked OK, now it doesn't - let me do some better testing.

Sorry for the noise,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--7ryudos4mz2elpwz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEK3kIWJt9yTYMP3ehqclaivrt76kFAmBGPR4ACgkQqclaivrt
76lKkwf9FO+DA3+uWtrcDKg9efp/7Mv4mlUeSpxbao5ClgeraJNsLTyM6CG+mNE6
uLbyz3mj7ikKX8NknLIPOHdnmtKRfSUFTrYmGSRqnqn7obIFrMb64CV5LMLE+ghN
qr+aoOUdAfC6sV6GVj6dOQnlmVp0Y64QQ0KuwFkyzhVujdAPr2ERVKLb4jySG7ML
8wo0A9J1ArWeXGwfoPS2do8giajTM23xhIQFCWefwK9aDGM69qMrVrRzgwt8v1hx
TszYt8jJh2Dku73BMoj4K+VPmONWCWUZ1nWlV4m4o3Q/KT6zkwIwwyzpCiAgG0rh
wjM/RBt+p27/2qExon1PiB+qRoHZtA==
=ca2G
-----END PGP SIGNATURE-----

--7ryudos4mz2elpwz--
