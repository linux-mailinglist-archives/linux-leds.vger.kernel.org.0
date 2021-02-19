Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6DB731F6BC
	for <lists+linux-leds@lfdr.de>; Fri, 19 Feb 2021 10:48:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbhBSJre (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Feb 2021 04:47:34 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:42032 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbhBSJra (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 19 Feb 2021 04:47:30 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 723271C0B8A; Fri, 19 Feb 2021 10:46:32 +0100 (CET)
Date:   Fri, 19 Feb 2021 10:46:32 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-leds@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 2/2] leds: trigger/tty: Use led_set_brightness_sync()
 from workqueue
Message-ID: <20210219094632.GB5641@duo.ucw.cz>
References: <20210219082955.5007-1-u.kleine-koenig@pengutronix.de>
 <20210219082955.5007-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ZfOjI3PrQbgiZnxM"
Content-Disposition: inline
In-Reply-To: <20210219082955.5007-2-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ZfOjI3PrQbgiZnxM
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2021-02-19 09:29:55, Uwe Kleine-K=F6nig wrote:
> led_set_brightness() involves scheduling a workqueue. As here the led's
> brightness setting is done in context of the trigger's workqueue this is
> unjustified overhead and it's more sensible to use
> led_set_brightness_sync().

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
http://www.livejournal.com/~pavelmachek

--ZfOjI3PrQbgiZnxM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYC+I+AAKCRAw5/Bqldv6
8pLDAJ99/+WbqfWCAVE1+q6TnlrQZ14ZHQCgrlcz7VpIMOv52jgeasBECvbNK0M=
=4FNW
-----END PGP SIGNATURE-----

--ZfOjI3PrQbgiZnxM--
