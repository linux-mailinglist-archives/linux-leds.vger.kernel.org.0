Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F745298837
	for <lists+linux-leds@lfdr.de>; Mon, 26 Oct 2020 09:22:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1769487AbgJZIWA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 26 Oct 2020 04:22:00 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:37390 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1769468AbgJZIWA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 26 Oct 2020 04:22:00 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id AC88B1C0BA2; Mon, 26 Oct 2020 09:21:58 +0100 (CET)
Date:   Mon, 26 Oct 2020 09:21:58 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     linux-leds@vger.kernel.org
Subject: Re: [PATCH leds] Documentation: leds: remove invalidated information
Message-ID: <20201026082158.GA8884@duo.ucw.cz>
References: <20201019110808.10689-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline
In-Reply-To: <20201019110808.10689-1-kabel@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2020-10-19 13:08:08, Marek Beh=FAn wrote:
> The contents of the Future Development section of leds-class
> Documentation was invalidated when support for LED-private triggers
> was merged. Remove this section.

Thanks, applied.

Explanation in the same place how per-LED triggers are supposed to
work would be welcome :-).

Best regards,
								Pavel

> Signed-off-by: Marek Beh=FAn <kabel@kernel.org>
> Fixes: 93690cdf3060 ("leds: trigger: add support for LED-private device..=
=2E")

--=20
http://www.livejournal.com/~pavelmachek

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX5aHJgAKCRAw5/Bqldv6
8ijHAJ9g5VIzLYhVuLSrvUNm2FMoQdL0dQCdF4AOjTz6pYs/F0YwfXRuas9Qzao=
=KzE9
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
