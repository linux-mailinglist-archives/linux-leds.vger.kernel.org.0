Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E3A159BDA5
	for <lists+linux-leds@lfdr.de>; Mon, 22 Aug 2022 12:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232806AbiHVKfr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 22 Aug 2022 06:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230414AbiHVKfo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 22 Aug 2022 06:35:44 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A4012FFC0
        for <linux-leds@vger.kernel.org>; Mon, 22 Aug 2022 03:35:43 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 1FC081C0001; Mon, 22 Aug 2022 12:35:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1661164541;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=N+ig0yZA0NsQPRM4ZR3c2/qvyZDrk1N0EFnRWLFuxQI=;
        b=N5kpi5pk3nlLuCUB/Lh9CI9cosjvbhyPzrL2oy7J1crjIchWMb7F81Hku8QlcHNbBoZr+l
        ccVUMpCT2X+8lvRqVF750/GAZluJboamSGlKnm6tp03/l64L2Rl4QqtoZT3J9MzTDZ/sTI
        rxQd/3yvIGRlc2v1TXquhKrDx2LKDas=
Date:   Mon, 22 Aug 2022 12:35:40 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Joseph Strauss <jstrauss16@proton.me>
Cc:     linux-leds@vger.kernel.org
Subject: Re: Implementing missing BlinkM LED features
Message-ID: <20220822103540.GA26317@duo.ucw.cz>
References: <20220820230337.wp7gaxzzz4qi56eb@libretux>
 <20220821115628.GA7663@duo.ucw.cz>
 <20220821224442.dyip3dig3g2isqmi@libretux>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline
In-Reply-To: <20220821224442.dyip3dig3g2isqmi@libretux>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Please cc lists on communications.

> Thank you. This would be my first time contributing to the kernel, so the=
re are just a few things I wanted to clarify :)
>

Hmm, good luck.=20

> I looked into the pattern trigger you mentioned, and from what I found in=
 the sources and mailing list, it seems like an alternative to manually sen=
ding a stream of BlinkM script bytes. That is, the user instead sets a brig=
htness and delay and then turns the LED on and off at whatever interval the=
y choose. So it is preferable for the user to send their lighting sequence =
to the pattern trigger file, rather than with some other file/interface I c=
reate?
>

Yes, please. Use existing interface.

> You also mentioned an RGB-aware pattern trigger, which would be necessary=
 for implementing this driver feature. Did you mean I should first patch th=
e existing ledtrig-pattern.c to support changing RGB values, or is that som=
ething I would implement within the BlinkM driver?
>

You should patch ledtrig-pattern.c first.

Best regards,
										Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYwNb/AAKCRAw5/Bqldv6
8rZIAKDAwo2zmDiWujzvq4jbxMEYdYDrXwCgj01z528twqWGCjCvjvt6nkFoolg=
=5l+p
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
