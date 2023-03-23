Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD6D6C666E
	for <lists+linux-leds@lfdr.de>; Thu, 23 Mar 2023 12:22:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbjCWLWX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Mar 2023 07:22:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbjCWLWW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Mar 2023 07:22:22 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D1041207E;
        Thu, 23 Mar 2023 04:22:20 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 311051C0E45; Thu, 23 Mar 2023 12:22:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1679570539;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=24guaXwOseUIOp2TfMIpqsL+3tjCoF4e3ZH7j0wQ4lI=;
        b=BozCWZhiTJkp6cGeGjwzvVrxxyy4RN540iJsgzrdGl8JpDFK4W+hTp/1NlpSbGdHh18pb3
        GG47UDhc0W3y1jyNakWwEc3Rr7/TbQFbcvvvXqJlghHs2oHr/IcEvateBjhNGodcDCYURJ
        61QbNc+HCxwBjsZBsG03Frsa8bkmfJE=
Date:   Thu, 23 Mar 2023 12:22:18 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        lee@kernel.org, hdegoede@redhat.com, markgross@kernel.org,
        sboyd@kernel.org, hpa@redhat.com
Subject: Re: [PATCH 6/8] leds: tps68470: Support the WLED driver
Message-ID: <ZBw2ai0G0XCa1vky@duo.ucw.cz>
References: <20230322160926.948687-1-dan.scally@ideasonboard.com>
 <20230322160926.948687-7-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="IQkQI1rSxWA4nUqp"
Content-Disposition: inline
In-Reply-To: <20230322160926.948687-7-dan.scally@ideasonboard.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--IQkQI1rSxWA4nUqp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2023-03-22 16:09:24, Daniel Scally wrote:
> The TPS68470 PMIC provides a third LED driver in addition to the two
> indicator LEDs. Add support for the WLED. To ensure the LED is active
> for as long as the kernel instructs it to be we need to re-trigger it
> periodically to avoid the IC's internal timeouts.

Wow. No!

If hardware does not wart you to burn the LED, it is not okay to just
work around that. These are not designed for continuous operation.

> diff --git a/drivers/leds/leds-tps68470.c b/drivers/leds/leds-tps68470.c
> index 44df175d25de..abcd3494b1a8 100644

Fun sha1 hash ;-).

> @@ -52,11 +61,33 @@ enum ctrlb_current {
>  	CTRLB_16MA	=3D 3,
>  };
> =20
> +/*
> + * The WLED can operate in different modes, including a Flash and Torch =
mode. In
> + * each mode there's a timeout which ranges from a matter of millisecond=
s to up
> + * to 13 seconds. We don't want that timeout to apply though because the=
 LED
> + * should be lit until we say that it should no longer be lit, re-trigge=
r the
> + * LED periodically to keep it alive.
> + */

We don't want the LED to overheat. That takes precedence.

Find out what are the maximum limits for on time at various current
levels. LED framework should be used for torch mode, with current set
such that unlimited operation is safe. V4L2 should be used for flash
mode.

BR,
										Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--IQkQI1rSxWA4nUqp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZBw2agAKCRAw5/Bqldv6
8oqtAJ9Vv3QufHUGYlzF8IGMkcrIxnOphgCfRSWwz3BkHoJ/1EL6SCFh2el3PIE=
=6Rui
-----END PGP SIGNATURE-----

--IQkQI1rSxWA4nUqp--
