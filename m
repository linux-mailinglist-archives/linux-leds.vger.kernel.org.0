Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4522C587E4E
	for <lists+linux-leds@lfdr.de>; Tue,  2 Aug 2022 16:44:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233153AbiHBOos (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 2 Aug 2022 10:44:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232582AbiHBOor (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 2 Aug 2022 10:44:47 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27EE9A467
        for <linux-leds@vger.kernel.org>; Tue,  2 Aug 2022 07:44:46 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 740EE1C0004; Tue,  2 Aug 2022 16:44:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1659451484;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bLCYHw5Jhme5hIBB69WiavC74+a5vam+rwq8Y5fCEak=;
        b=C9P2Gdk2XlL618N/GxUl4mGa5NCyR+/pgX6Q9zTe/uDzKXfsVqVDaQb5szElGXeyGFuDr4
        vD/O+8k0eUALKh/CcWiXXU6mBVGUq+7xe1txrD+5dVNLq9OeP8+76gf4lZ+KreVyWJKup4
        PjS3QFpLouK99Pg4Cr72jisLtcLH1K0=
Date:   Tue, 2 Aug 2022 16:44:44 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Vincent Knecht <vincent.knecht@mailoo.org>
Cc:     linux-leds@vger.kernel.org
Subject: Re: [PATCH v5 00/12] leds: Fix/Add is31fl319{0,1,3} support
Message-ID: <20220802144444.GA9070@duo.ucw.cz>
References: <20220712100841.1538395-1-vincent.knecht@mailoo.org>
 <9d50c9ec06d7cafa7871b59ecf3ef1584102239d.camel@mailoo.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline
In-Reply-To: <9d50c9ec06d7cafa7871b59ecf3ef1584102239d.camel@mailoo.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Any chance getting this series merged for next/5.20 ?

Thanks, I added these patches:

Applying: leds: is31fl319x: Add missing si-en compatibles
Applying: leds: is31fl319x: Use non-wildcard names for vars, structs and de=
fines
Applying: leds: is31fl319x: Move chipset-specific values in chipdef struct
Applying: leds: is31fl319x: Add support for is31fl319{0,1,3} chips
Applying: leds: is31fl319x: Cleanup formatting and dev_dbg calls
Applying: leds: is31fl319x: Make use of device properties
Applying: leds: is31fl319x: Make use of dev_err_probe()
Applying: leds: is31fl319x: Fix devm vs. non-devm ordering
Applying: leds: is31fl319x: use simple i2c probe function

Rob already taken dt stuff. I don't see need for include file sorting.

Best regards,
									Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYuk4XAAKCRAw5/Bqldv6
8tvKAJ0cAoRT23JF2WFlNOYo/6/RTeoFawCeMpiCjEI0u/vXcdpOTzm8EumWD0M=
=6WvP
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
