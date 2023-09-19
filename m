Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 691C07A5D2F
	for <lists+linux-leds@lfdr.de>; Tue, 19 Sep 2023 10:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbjISI7U (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 19 Sep 2023 04:59:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230477AbjISI7R (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 19 Sep 2023 04:59:17 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDC5DE6
        for <linux-leds@vger.kernel.org>; Tue, 19 Sep 2023 01:59:11 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id AB73F1C0006; Tue, 19 Sep 2023 10:59:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1695113949;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TM9gJjAB5DW6+MJyRCHBkQEHaWmRLIpjaOl4OMUtjQ4=;
        b=ob97sJPSEPJ0rcs17+0WtZzbAaktYISEwYyWUo74BFQtkc0UEfytOAPI+9b28xKwB4foI7
        CkkV8o18m/T0hxVFrNGsv1rwPiY5MMa796u6IqKPWbkBtfO63r51eJmcC8cNK9OWelaWLJ
        7iolhfOndAVfP6zcL73MxdMua1COCV0=
Date:   Tue, 19 Sep 2023 10:59:09 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: Drop BUG_ON check for LED_COLOR_ID_MULTI
Message-ID: <ZQli3TQ1rnlnexLV@duo.ucw.cz>
References: <20230918140724.18634-1-kabel@kernel.org>
 <20230919104207.7bf1b237@dellmb>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="XZlCC02f5x7Y+kni"
Content-Disposition: inline
In-Reply-To: <20230919104207.7bf1b237@dellmb>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--XZlCC02f5x7Y+kni
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Greg tells me to pester LED maintainers to get this into Linus' tree
> soon, so that we can avoid stable incosistencies (see
> https://lore.kernel.org/stable/2023091901-vessel-giggling-55ee@gregkh/).
>=20
> Sorry about the inconvenience, this would not happen if this was not
> sent into stable in the first place, which is my fault, since I added
> the Fixes tag.

Actually, no, it is not your fault. It was pretty clear your patch is
not "fixing serious bug" so it should not have gone into stable in the
first place.

For mainline, should we perhaps keep the BUG_ON and fix the affected
driver, instead?

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--XZlCC02f5x7Y+kni
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZQli3QAKCRAw5/Bqldv6
8mBwAJ9kYi7QRxOhYukHutvwZhKXkJsv1wCePZdpX2HHRjjgqmDthJ/dRQch5rM=
=CkC5
-----END PGP SIGNATURE-----

--XZlCC02f5x7Y+kni--
