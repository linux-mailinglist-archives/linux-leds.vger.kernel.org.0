Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C247B4387AC
	for <lists+linux-leds@lfdr.de>; Sun, 24 Oct 2021 10:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbhJXIn5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 24 Oct 2021 04:43:57 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:54646 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbhJXIn4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 24 Oct 2021 04:43:56 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id BFCE61C0B76; Sun, 24 Oct 2021 10:41:35 +0200 (CEST)
Date:   Sun, 24 Oct 2021 10:41:35 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: Document none trigger
Message-ID: <20211024084135.GB32488@duo.ucw.cz>
References: <20211024002358.225750-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="7iMSBzlTiPOCCT2k"
Content-Disposition: inline
In-Reply-To: <20211024002358.225750-1-marex@denx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--7iMSBzlTiPOCCT2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> There is a trigger called "none" which triggers never, add it to the
> list of valid trigger values.

We can do this, but is it useful? If you avoid putting trigger
property, it will do the same thing.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--7iMSBzlTiPOCCT2k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYXUcPwAKCRAw5/Bqldv6
8gmGAJ0R+LRrN9FlKd1d3oT7lDFxXNL15wCfas0Mm1O0eEwde0hu9MNm2Wa6B8s=
=o7G0
-----END PGP SIGNATURE-----

--7iMSBzlTiPOCCT2k--
