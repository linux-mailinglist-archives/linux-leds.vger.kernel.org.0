Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3590A6A6125
	for <lists+linux-leds@lfdr.de>; Tue, 28 Feb 2023 22:22:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbjB1VWR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 28 Feb 2023 16:22:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbjB1VVS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 28 Feb 2023 16:21:18 -0500
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 280B21A651;
        Tue, 28 Feb 2023 13:21:16 -0800 (PST)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 4E7251C0AAC; Tue, 28 Feb 2023 22:21:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1677619274;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=g9TSHdOHUWHeUGstJHnByy0ZY9kqMhYS8yx/Ln5ZsH0=;
        b=XtvqFzZ2dGfNxbFtLfw43My75zGgQMg8N1X+23gsGxNmMxMBcdxRSzhJv987ed/63rGm66
        8DXWwc9gXnH17gFMWt6JXZxpktPodQZdlnecCDAHLSfUb8bCkLH3oQSM21IlASodCbHcg3
        unpe0XiOvpqD1giJTC2DR9ECUNpUMM0=
Date:   Tue, 28 Feb 2023 22:21:13 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] dt-bindings: leds: add "usbport" trigger
Message-ID: <Y/5wSUijcyv7YBg8@duo.ucw.cz>
References: <20230228144933.22614-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="nON4aT4ZMmzWEc2O"
Content-Disposition: inline
In-Reply-To: <20230228144933.22614-1-zajec5@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--nON4aT4ZMmzWEc2O
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2023-02-28 15:49:33, Rafa=C5=82 Mi=C5=82ecki wrote:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> It's a trigger used on many home routers that have LEDs to indicate
> specific USB port state.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Acked-by: Pavel Machek <pavel@ucw.cz>

BR,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--nON4aT4ZMmzWEc2O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCY/5wSQAKCRAw5/Bqldv6
8vCBAKCQ7tAeRJYqGIUBxNhubEsxNfhZhgCdHkT1/bqziyueq0eIDcNhCZKfMb4=
=PN/N
-----END PGP SIGNATURE-----

--nON4aT4ZMmzWEc2O--
