Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F50D5775FA
	for <lists+linux-leds@lfdr.de>; Sun, 17 Jul 2022 13:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230058AbiGQLh4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 17 Jul 2022 07:37:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230041AbiGQLhz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 17 Jul 2022 07:37:55 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76AD615FF0;
        Sun, 17 Jul 2022 04:37:54 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id ADF371C000C; Sun, 17 Jul 2022 13:37:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1658057872;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=eex3RQwQRXYMWawAjMeFif5YkL1wNxqwM0yYqF3CaBk=;
        b=MrTM0wLMLVfimNYjU/TBvVr7HdgVxpkTIRoc5X52zzt6rA/fLiTbd/MdqLU7qsOZpXBN1y
        D2ZgGiGDEWtbK01f4h0iAf/uIjXBMBSAGdLhavSeXpEVmkRgTJoK9Qogg53VHabpWLP9wZ
        Qnscq/KF6Qq0oq1GfgG8KqwYXdN52G4=
Date:   Sun, 17 Jul 2022 13:37:52 +0200
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
Message-ID: <20220717113752.GG14285@duo.ucw.cz>
References: <20211227145905.2905-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="sLx0z+5FKKtIVDwd"
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


--sLx0z+5FKKtIVDwd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Old block is already documented in the leds-bcm6328.yaml. This binding
> documents the new one which uses different registers & programming. It's
> first used in BCM63138 thus the binding name.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

> +    properties:
> +      reg:
> +        maxItems: 1
> +        description: LED pin number
> +
> +      active-low:
> +        type: boolean
> +        description: Makes LED active low.

I'd expect both descriptions to end with ".", or none of them.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--sLx0z+5FKKtIVDwd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYtP0kAAKCRAw5/Bqldv6
8qR9AKCYHQRFi0gKY0TQ9zFWWlEW705OxQCfbYV1JlMQCyoLJtkVhrNu5VL0t90=
=z96c
-----END PGP SIGNATURE-----

--sLx0z+5FKKtIVDwd--
