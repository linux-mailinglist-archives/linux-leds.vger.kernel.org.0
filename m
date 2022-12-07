Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D34A76461D4
	for <lists+linux-leds@lfdr.de>; Wed,  7 Dec 2022 20:44:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbiLGTo2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 7 Dec 2022 14:44:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiLGTo1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 7 Dec 2022 14:44:27 -0500
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA382716D3
        for <linux-leds@vger.kernel.org>; Wed,  7 Dec 2022 11:44:25 -0800 (PST)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id BB01D1C09FA; Wed,  7 Dec 2022 20:44:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1670442263;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=AlOCNHa9dGayHnXn8g3spEzhzZmWNxjhtnanqmJwCJ0=;
        b=HAxDXj9kpPHvKb0BMderjMSShkpgwZJsDQluMVQJxNLLc2r0OILudtNDWMnvJaSgAZxVGP
        829oIFlX8dn3c4I/nxwNje4Qz/g5+XM0hhLqakUuvdpKdL76sAKhMEKqo856FPcy7kYn7/
        d1UUVbURv3EzwH5HdmZMWi7fRaDG1jY=
Date:   Wed, 7 Dec 2022 20:44:23 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Lee Jones <lee@kernel.org>
Cc:     andriy.shevchenko@linux.intel.com, krzysztof.kozlowski@linaro.org,
        gregkh@linuxfoundation.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH 1/1] MAINTAINERS: Add additional co-maintainer to LEDs
Message-ID: <Y5DtF3XlZhL2V31A@duo.ucw.cz>
References: <20221206104510.123817-1-lee@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="PrKDH5+shEBQmfiE"
Content-Disposition: inline
In-Reply-To: <20221206104510.123817-1-lee@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--PrKDH5+shEBQmfiE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Add myself as co-maintainer for the LED subsystem,
> in support of Pavel during busy times.
>=20
> Suggested-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Lee Jones <lee@kernel.org>

Thank you, applied.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--PrKDH5+shEBQmfiE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCY5DtFwAKCRAw5/Bqldv6
8hwpAKCCDCtGKzQIZns/2O8ZdVkWUZNTkwCfdIClLKFUpjggXWwUpJFC4QfuCno=
=MZZq
-----END PGP SIGNATURE-----

--PrKDH5+shEBQmfiE--
