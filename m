Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E61B34EDD9D
	for <lists+linux-leds@lfdr.de>; Thu, 31 Mar 2022 17:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238322AbiCaPoY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 31 Mar 2022 11:44:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240127AbiCaPng (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 31 Mar 2022 11:43:36 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 963981D59DB;
        Thu, 31 Mar 2022 08:39:10 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 75C9732020A4;
        Thu, 31 Mar 2022 11:39:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 31 Mar 2022 11:39:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; bh=KyI/j72y7JMpL9/xQjQ4csJ00FkyYP4CjB3zQa
        JiteE=; b=mARUd3dNVIoDY0WW0hYsVKA7Lf7fwcTN1tIxFE0N5OsckZ9r1XG0u3
        rh+EwDIuYSc04rnvx+EpdmoNEh1BMgVhXtQs//tm3pfwOXjkKr3x3QqkXyPsPjG7
        r7xOj6X4G4U5YL3FGJcPT+zvCJtcfFyf/z05yw2/vQitVf9RUu6h+SKEL7hTFwrz
        /aS4Lh4sHQUH52VifqB/1c3R+e2/PAXA5yjrjy8RNjBAxXD9BRssZkDI6BD1pXvV
        4lOTe19Ojm/lQWRUbij7EyaloFTqagm6LTduNrHagnBzIsAtWJ5JtxgeyWOiPmBY
        QhM++cH5Y59JCtRatWzPhvJgZLRQXIKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=KyI/j72y7JMpL9/xQ
        jQ4csJ00FkyYP4CjB3zQaJiteE=; b=g7TRrmzHPVgg6DgXsHjsO2eLrgorP9PeA
        65z6ZvPimmANl/Em/yRPNDLtQAJ3wHMzU8TALdLnHvIP5DLyN/W5s7QKjSSutXr3
        wj3+lFIfZX3g7hqBxOlAqGnaJ5Tiq4KkCuuk8yEZKIIh0uvnCGP0Zw/NLRxuXVGD
        B61ydk1puY1cHyJuz0hrflXXWuqT4m+UT9fRMbE0G6/dMa6OP61iog1cAvtRQPXQ
        7MbdjAs6a3DxKkpKjFcxB284MnwmNJx/WYsoEB+BzXcrh73NQqJP5Mw/Rdi4GOtU
        tMavjh9FeLonmfVEwamGlj0nzg5WYyV7lAFLPWC7yXx2rRKlDzjHg==
X-ME-Sender: <xms:HMtFYutS58m5Ij6Wi8vsGO72pwiJWmfS1WBYWAgDFLBU-clNqfI2MA>
    <xme:HMtFYjeMl07xJgh2l68Sm1qEeTWcesplu6SRXIeOsmy5UmNdZEvNlMNb9rK5rIWAk
    5p80QghJQzIQ7aRcQQ>
X-ME-Received: <xmr:HMtFYpx1lIr-nr7Mnu10rZKvqllsndpYpYsNU44kSKTS3g0eryj14uaXNjT9mXCVcrWK9xPrTwlx6O8gwmmQQZB5eOFFMUqW1ec>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigedgledvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
    vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
    geefgfdthefhkedtleffveekgfeuffehtdeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:HMtFYpOnk1vt45w1o4EXRYp03Ka6a6wGOW5tPa63xfniHzdSpg-kUg>
    <xmx:HMtFYu8vNNgduVDpKYLfeU0J3h8rMbQFObgEr539NyGjFb7pfzb7Yw>
    <xmx:HMtFYhW_g-T88mSS5127T0sbJSclHOzBmXDf99C883YoL-MgWATmBw>
    <xmx:HctFYiayG9iwCsGHWT7GAIMkc02fOSWggrYoYRG9ARGt6MmeF7F2Sg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 31 Mar 2022 11:39:08 -0400 (EDT)
Date:   Thu, 31 Mar 2022 10:39:07 -0500
From:   Patrick Williams <patrick@stwcx.xyz>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-leds@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, pavel@ucw.cz, joel@jms.id.au
Subject: Re: [PATCH] leds: pca955x: Add HW blink support
Message-ID: <YkXLG++LWdQWCxQF@heinlein>
References: <20220330203318.19225-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1Owk7bxpetCwLmTk"
Content-Disposition: inline
In-Reply-To: <20220330203318.19225-1-eajames@linux.ibm.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--1Owk7bxpetCwLmTk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2022 at 03:33:18PM -0500, Eddie James wrote:
> Support blinking using the PCA955x chip. Use PWM0 for blinking
> instead of LED_HALF brightness. Since there is only one frequency
> and brightness register for any blinking LED, all blinked LEDs on
> the chip will have the same frequency and brightness.

The current implementation uses the PWM to control the "brightness"
with PWM0 being assigned 50% and PWM1 being configured as a single value
that isn't ON, OFF, or 50%.  I suspect that most users of these 955x
chips care either about brightness or blinking but not both, but it is
possible I am wrong.  It would be nice if we could use PWM1 as another
hardware blink control when it hasn't been used for brightness, but that
would require some additional state tracking I think.

I like that we can now use the hardware to control blink rate, rather
than doing it in software, and, I really like that in theory if N LEDs on
the device are all blinking at the same rate they will actually turn on and
off at the same exact moment because it is done in hardware.  I am really
concerned about this proposed change and the way it will change current
behavior though.

It is not uncommon in a BMC design to use one of these 955x chips to control
8 or 16 different LEDs reflecting the state of the system and at
different blink rates.  An example LED policy might be that you have 1 LED
for "power status" and another LED for "system identify + health status".
When the system is powered off the "power status" LED flashes at a slow rate
and when the system is powered on it goes on solid.  When the system is hea=
lthy
the "health status" is on, when it is unhealthy it blinks slowly, and when =
the
system is "identified" it blinks fast.

My point of the above is that there are certainly system policies where
you'd want to flash two different LEDs at two different rates.  In
today's implementation of this driver those both turn into
software-emulated blinking by the kernel.  With your proposal we lose
this ability and instead whichever LED is configured second will affect
all other blinking LEDs.

It looks like in led-core.c led_blink_setup that if the device
`blink_set` returns an error then software blinking is the fallback.  Is
it possible for us to have this driver keep track of how many LEDs are
in blink state (and which speeds are allocated) and get led-core to
fallback to software blinking if we are unable to satisfy the new blink
rate without affecting an existing LED blink rate?

Looking at the tree it seems bcm6328 does what I am suggesting already
but I don't see any other drivers that obviously do.  The PCA955x is
pretty widely used in BMC implementations:

    $ git grep -l pca955 arch/arm/boot/dts/aspeed* | wc -l
    13

--=20
Patrick Williams

--1Owk7bxpetCwLmTk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmJFyxkACgkQqwNHzC0A
wRkAaBAAjBfOY0GBJZfL3KuD59+0bFzyNMbkCbK0EmE4VU3YlONWgxXTLwTDir9/
Ctb2a86QdZglRQzoof7/jyEmAJ1/tFFA+Kps5Z1FGPczZbGxJ9Obel7J8SNo3aiy
sP3gBz2pbZtprpOo2w0Yc1ReZFiJe/kH7z3a1H/2Xl/lq9TPEDg22wVQnzkccNJp
4X+1p0rwAqOqxGjBeOjaGAj1y7PvqXUICZVw0rkkXaI80Gjg+IikrUB8/FDSaCDT
WHV3i4QfocIEUD62v5bSnzKijyaixo2e16fOUNqCTv1hWA5U2ZvoH+LhRm+91I0+
otF6Hf9TUhcLFQkAKcoBOTXcmOJ2IZ06bUZ/sklWhdLWHmc0jL0t0LmcJk8s4eJb
PJz+bP81sjTaB18sFkQu1KCXOaRkDf4/32csLZd2Tqq1HEXc24uFzhGdhirNgKpw
55Bxs8H4Bp0OyqvIW+TYWutWDbP96vULv6xkaGNtJM4Nc0gJECh82yp/QQEBd9bS
JjjwLbjl1W58SOfhtrzrwLd52RqKuBYUSzWSBoTP1RFOhHeTcCisE8XgL2hT/JZB
DKl4ER8AQJDuqmjK6PilTPEM0c4gSupmJFqLnMC61StQ75pmpoxDqlE3bvqJ2GSd
p1Xpy3S5LhJqY+TEo65UIst6nWhAF4XRsBjy+hf0uqzib9ykpxw=
=/hef
-----END PGP SIGNATURE-----

--1Owk7bxpetCwLmTk--
