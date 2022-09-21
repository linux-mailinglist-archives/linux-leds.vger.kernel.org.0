Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E89A5BFC96
	for <lists+linux-leds@lfdr.de>; Wed, 21 Sep 2022 12:51:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbiIUKvS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 21 Sep 2022 06:51:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbiIUKvR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 21 Sep 2022 06:51:17 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACE4F7CAA0
        for <linux-leds@vger.kernel.org>; Wed, 21 Sep 2022 03:51:16 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 0B7F11C0001; Wed, 21 Sep 2022 12:51:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1663757475;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ckmY+wSmOCkgZtEO3m9A5zsdnC4gBviyR/HchXz5TRY=;
        b=oo3CfuTMD2Cvr5nf/H86N7vLfTyYDNLoGwSQRzGdt1MrEeLs/ZtaRkMhgK1PsrB+pR7c1V
        pxeDtS2zEQaz0WLsDqoxNoqtNwgpIiDjOieA/eSeZylaJ8vbTZttpZDztrIRe1IlRfSmbh
        CLAHzIhk8SdUSKSQCkSjA7z36SXmkac=
Date:   Wed, 21 Sep 2022 12:51:14 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     bernardocrodrigues@live.com
Cc:     linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: pca963x: fix blink with hw acceleration
Message-ID: <20220921105114.GA22654@duo.ucw.cz>
References: <BY5PR04MB6327FCAC33A75918EA3B65B9A56C9@BY5PR04MB6327.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline
In-Reply-To: <BY5PR04MB6327FCAC33A75918EA3B65B9A56C9@BY5PR04MB6327.namprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2021-12-05 18:00:49, bernardocrodrigues@live.com wrote:
> From: Bernardo Rodrigues <bernardocrodrigues@live.com>
>=20
> LEDs would behave differently depending on the blink hardware
> acceleration configuration. This commit will make LEDs respond exactly
> the same independently of the hardware acceleration status.
>=20
> In other words, if you had two pca963x, side by side, one with blink
> hardware acceleration "ON" and the other "OFF; and performed some
> arbitrary sequence of API calls (e.g. turn on/off, change brightness,
> change blink mode, etc.) you probably would end with not matching LED
> states.
>=20
> 'pca963x software blink' and 'leds-gpio' behavior were used as
> reference.
>=20
> Actual chip used to validate this change: pca9634

Thanks, applied.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYyrsogAKCRAw5/Bqldv6
8iVrAKCJ+TFWIH7XEv5h+4xqqvULOCOwEQCgkPgKIkh4Ki75V3L2obtaB+90ta8=
=CF6u
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
