Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B54924387AA
	for <lists+linux-leds@lfdr.de>; Sun, 24 Oct 2021 10:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbhJXImc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 24 Oct 2021 04:42:32 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:54140 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbhJXImc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 24 Oct 2021 04:42:32 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id BC6CB1C0B76; Sun, 24 Oct 2021 10:40:10 +0200 (CEST)
Date:   Sun, 24 Oct 2021 10:40:10 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: leds: Document mmc trigger
Message-ID: <20211024084010.GA32488@duo.ucw.cz>
References: <20211024002358.225750-1-marex@denx.de>
 <20211024002358.225750-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline
In-Reply-To: <20211024002358.225750-2-marex@denx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The mmc subsystem supports triggering leds on card activity, document
> the trigger value here. The value is a pattern in this case.

I don't believe this is suitable as devicetree does not know about mmc
numbers.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYXUb6gAKCRAw5/Bqldv6
8oRVAKCrMkAvEDPZy1AEPHde79S1OoZMZwCff8Kgc7desFOCej41YKrMPU/JunA=
=6UBq
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
