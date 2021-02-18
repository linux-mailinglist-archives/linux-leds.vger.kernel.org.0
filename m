Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 620CB31EC9F
	for <lists+linux-leds@lfdr.de>; Thu, 18 Feb 2021 18:05:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233160AbhBRQ4W (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 18 Feb 2021 11:56:22 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:59414 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233521AbhBRNYp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 18 Feb 2021 08:24:45 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id C7F9B1C0B81; Thu, 18 Feb 2021 14:23:43 +0100 (CET)
Date:   Thu, 18 Feb 2021 14:23:43 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Dylan Van Assche <me@dylanvanassche.be>
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] leds: gpio: Set max brightness to 1
Message-ID: <20210218132343.GA12948@duo.ucw.cz>
References: <20210125200856.1976-1-me@dylanvanassche.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline
In-Reply-To: <20210125200856.1976-1-me@dylanvanassche.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2021-01-25 21:08:57, Dylan Van Assche wrote:
> GPIO LEDs only know 2 states: ON or OFF and do not have PWM capabilities.
> However, the max brightness is reported as 255.
>=20
> This patch sets the max brightness value of a GPIO controlled LED to 1.
>=20
> Tested on my PinePhone 1.2.
>=20
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>

I believe I have applied this already.

Thanks for patches,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYC5qXwAKCRAw5/Bqldv6
8shcAJ0WSYgsDpUd45ncFen2XkjjQblLygCdG2nipAiDUAY39Sna/seZ0w6pH4k=
=uT2O
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
