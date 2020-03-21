Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 710B618E29B
	for <lists+linux-leds@lfdr.de>; Sat, 21 Mar 2020 16:35:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbgCUPd2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Mar 2020 11:33:28 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:54604 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726607AbgCUPd1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 21 Mar 2020 11:33:27 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2EA9E1C0337; Sat, 21 Mar 2020 16:33:26 +0100 (CET)
Date:   Sat, 21 Mar 2020 16:33:25 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH RFC leds-next] leds: initial support for Turris Omnia LEDs
Message-ID: <20200321153325.GD8386@duo.ucw.cz>
References: <20200319181604.2425-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="UoPmpPX/dBe4BELn"
Content-Disposition: inline
In-Reply-To: <20200319181604.2425-1-marek.behun@nic.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--UoPmpPX/dBe4BELn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This adds basic support for LEDs on the front side of CZ.NIC's Turris
> Omnia router.

Looks good, I had to apply it by hand, by I took it. I realize that
dts interface may not be final, but I do not want to solve Makefile
rejects in future.

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--UoPmpPX/dBe4BELn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXnYzxQAKCRAw5/Bqldv6
8qHLAJ0RaovShegrU14MBzSJHmhZpE/qqgCbBFqePpza40eBZWqjEhyP5B2T59E=
=fm7B
-----END PGP SIGNATURE-----

--UoPmpPX/dBe4BELn--
