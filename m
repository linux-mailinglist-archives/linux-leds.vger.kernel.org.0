Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFD22577601
	for <lists+linux-leds@lfdr.de>; Sun, 17 Jul 2022 13:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbiGQLmp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 17 Jul 2022 07:42:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiGQLmo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 17 Jul 2022 07:42:44 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2808813CC8;
        Sun, 17 Jul 2022 04:42:43 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id CB91B1C000A; Sun, 17 Jul 2022 13:42:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1658058161;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=H6xkax6Ea+n4AB3Hjr5hWFu4kot7C9xfEX36H2C0lC8=;
        b=ok0SZda8kjoz6GPrGBoTyudej1cGXwmZfpjIOh0EQwDCyXTF6jTUiU4dr5C+2jSUEFWuEi
        myi1kR1DiDNnfIYoZ4DWvcxAUJVx8HjoTeh8x5BhUFhaJuhQsHQ1RW3joUB5t0d+/ivgs5
        yinYLNwHN14fZM3iG8H0lgj4oWp2hd0=
Date:   Sun, 17 Jul 2022 13:42:41 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 1/2] dt-bindings: leds: add Broadcom's BCM63138
 controller
Message-ID: <20220717114241.GI14285@duo.ucw.cz>
References: <20211227145905.2905-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="YhFoJY/gx7awiIuK"
Content-Disposition: inline
In-Reply-To: <20211227145905.2905-1-zajec5@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--YhFoJY/gx7awiIuK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> Broadcom used 2 LEDs hardware blocks for their BCM63xx SoCs:
> 1. Older one (BCM6318, BCM6328, BCM6362, BCM63268, BCM6838)
> 2. Newer one (BCM6848, BCM6858, BCM63138, BCM63148, BCM63381, BCM68360)
>=20
> The newer one was also later also used on BCM4908 SoC.
>=20
> Old block is already documented in the leds-bcm6328.yaml. This binding
> documents the new one which uses different registers & programming. It's
> first used in BCM63138 thus the binding name.

Thanks, applied, sorry for the delay. I would not mind additional
fixes as mentioned.
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--YhFoJY/gx7awiIuK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYtP1sQAKCRAw5/Bqldv6
8gUnAJ0VA8XVIFz6tTbMRYutj/jFVLVvbQCfXWLJVc+QTaOrmTHRCz9chJMRtdY=
=tVi5
-----END PGP SIGNATURE-----

--YhFoJY/gx7awiIuK--
