Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 774226C6766
	for <lists+linux-leds@lfdr.de>; Thu, 23 Mar 2023 12:59:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231638AbjCWL7H (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Mar 2023 07:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbjCWL6h (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Mar 2023 07:58:37 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 553F037F2E;
        Thu, 23 Mar 2023 04:57:45 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id ED74A1C0E55; Thu, 23 Mar 2023 12:57:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1679572663;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=oW7BzlOkjmTySUL4htaqOmaV1zJ15igX+DM7Suggfw0=;
        b=BBW/tvVurfqh9h3593vwLLZFPhMVzMtZFWL92MO5WM+jQIiomE1J5FsbUa+DwtMQP59IxE
        CCluo3N0q4QeKB7Yx31LkRiOFk2CnjT4/FXhpIFo6vZQXeQ7U6dfHIqi8WWzQQw6vqWkfC
        IlNAzRGwzo/M3+m50T3Z5oDTsLWRL20=
Date:   Thu, 23 Mar 2023 12:57:43 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, John Crispin <john@phrozen.org>,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [net-next PATCH v5 09/15] net: phy: marvell: Implement
 led_blink_set()
Message-ID: <ZBw+tz1oe3+ANXVa@duo.ucw.cz>
References: <20230319191814.22067-1-ansuelsmth@gmail.com>
 <20230319191814.22067-10-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Ih/4mLk07nBE9k47"
Content-Disposition: inline
In-Reply-To: <20230319191814.22067-10-ansuelsmth@gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Ih/4mLk07nBE9k47
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2023-03-19 20:18:08, Christian Marangi wrote:
> From: Andrew Lunn <andrew@lunn.ch>
>=20
> The Marvell PHY can blink the LEDs, simple on/off. All LEDs blink at
> the same rate, and the reset default is 84ms per blink, which is
> around 12Hz.
>=20
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Pavel Machek <pavel@ucw.cz>

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--Ih/4mLk07nBE9k47
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZBw+twAKCRAw5/Bqldv6
8txiAJ0bCvMuoISe6KnK9tLLTt13SM0FnwCdFfSgHbcm0z077DDiv8tNXEO2or0=
=ftGQ
-----END PGP SIGNATURE-----

--Ih/4mLk07nBE9k47--
