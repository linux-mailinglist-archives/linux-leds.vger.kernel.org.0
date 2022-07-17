Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E346B577641
	for <lists+linux-leds@lfdr.de>; Sun, 17 Jul 2022 14:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230357AbiGQM5R (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 17 Jul 2022 08:57:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiGQM5R (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 17 Jul 2022 08:57:17 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3577913CF0;
        Sun, 17 Jul 2022 05:57:16 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id DDC3E1C000A; Sun, 17 Jul 2022 14:57:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1658062634;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5muUD2+bXQeMSjTVZvHxbX9XfBUdv+1sAO6MXo8hzyg=;
        b=V9tQbUP2A8jVIVpQ88zVQ1+HhWFRp6LZSL7BAQu/6rX3MUf3ul6Fui0+onP8twdNduBa2U
        gAVpXYIfOXiSCjXyx6pfCxJtzesyPtFvYzQX2HIVfy6vRNZkyp4u2VM0+yKaNuMfcUz1P7
        lXNvO9ncI+f7Y4IBVr8XP9iCfyvwmhU=
Date:   Sun, 17 Jul 2022 14:57:14 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        William Zhang <william.zhang@broadcom.com>,
        Anand Gore <anand.gore@broadcom.com>,
        Kursad Oney <kursad.oney@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-leds@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 0/3] leds-bcm63138: post apply/review fixes
Message-ID: <20220717125714.GN14285@duo.ucw.cz>
References: <20220717124248.13562-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2+jOUFLb7N+7fooZ"
Content-Disposition: inline
In-Reply-To: <20220717124248.13562-1-zajec5@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--2+jOUFLb7N+7fooZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Hi Pavel,
>=20
> Thanks a lot for accepting my patches. I'm sending those small fixups to
> address your comments.

Thank you, applied.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--2+jOUFLb7N+7fooZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYtQHKgAKCRAw5/Bqldv6
8sEBAJsG7iNBjnvV7ml/lQciMZUDX6WKQACffuTR19nDq07w/i6BzNpuiEN1oBk=
=Zw56
-----END PGP SIGNATURE-----

--2+jOUFLb7N+7fooZ--
