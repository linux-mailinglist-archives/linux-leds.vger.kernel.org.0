Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA5702E7BF2
	for <lists+linux-leds@lfdr.de>; Wed, 30 Dec 2020 19:43:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbgL3Sn0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 30 Dec 2020 13:43:26 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:53660 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgL3SnZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Dec 2020 13:43:25 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2D0DA1C0B79; Wed, 30 Dec 2020 19:42:43 +0100 (CET)
Date:   Wed, 30 Dec 2020 19:42:42 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Andrea Righi <andrea.righi@canonical.com>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] leds: trigger: fix potential deadlock with libata
Message-ID: <20201230184242.GA25903@duo.ucw.cz>
References: <20201125151822.GB73489@xps-13-7390>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline
In-Reply-To: <20201125151822.GB73489@xps-13-7390>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Apply the same change to led_trigger_blink_setup() as well, since the
> same deadlock scenario can also happen in power_supply_update_bat_leds()
> -> led_trigger_blink() -> led_trigger_blink_setup() (workqueue context),
> and potentially prevent other similar usages.

Thanks, applied.
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX+zKIgAKCRAw5/Bqldv6
8jTaAKCrKQ7L8oRfkIzzYXZAJO19FZ5m8gCgpVytYIxoeWApCsBdJx5z2G6nqmU=
=c1r0
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--
