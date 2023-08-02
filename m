Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A833876C86D
	for <lists+linux-leds@lfdr.de>; Wed,  2 Aug 2023 10:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232664AbjHBIhY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Aug 2023 04:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232346AbjHBIhX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Aug 2023 04:37:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFD81171B
        for <linux-leds@vger.kernel.org>; Wed,  2 Aug 2023 01:37:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 533BA6185F
        for <linux-leds@vger.kernel.org>; Wed,  2 Aug 2023 08:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7981C433C8;
        Wed,  2 Aug 2023 08:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690965441;
        bh=+/U7g4YdcO4zxl8QHTmjFr89ZSxQ2OdpJ9wz7H4I1Sk=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=SHN1CSPIKn68XVL1T0VrQ/Sae3Tny2gqasn2YqfjzT9sBjeQDbEoGAxdI5t8H8auN
         ROAir2c7D7LA3G6GIdv9yv626Hzrr0zMS+kp1V8qWDZUY8wAtu65pzymAf4xiMqm44
         HIboTzVTsq5wC7fxv53GTK/ElQFJojSkDEt61jwDWIArdgk+GdqBzESAydF4CBtWNi
         SkiQhZ87mOdp3UY2pCQ9mPOPXg57i1pw0D8TZnrS9+4A9zkfb3t6QlSN1pqzMN/8JW
         bxP8EZ7Wiaj6qz4JtEx2Fj8oi1ORnGlhKSsvcXq73I7LzTsihQKtsF0/DkxL5HfSot
         e0+8B2fwJvdPg==
Date:   Wed, 2 Aug 2023 10:37:17 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: tty: Fix tty trigger when LED's
 max_brightness is greater than 1
Message-ID: <20230802103717.03ed40f6@dellmb>
In-Reply-To: <20230801142642.21335-1-kabel@kernel.org>
References: <20230801142642.21335-1-kabel@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue,  1 Aug 2023 16:26:42 +0200
Marek Beh=C3=BAn <kabel@kernel.org> wrote:

> The tty LED trigger uses the obsolete LED_ON & LED_OFF constants when
> setting LED brightness. This is bad because the LED_ON constant is equal
> to 1, and so when activating the tty LED trigger on a LED class device
> with max_brightness greater than 1, the LED is dimmer than it can be
> (when max_brightness is 255, the LED is very dimm indeed; some devices
> translate 1/255 to 0, so the LED is OFF all the time).
>=20
> Use a mechanism similar to the netdev trigger, wherein on activation
> time, the current LED brightness is taken as blinking brightness, and if
> it is zero, the max_brightness is taken instead.
>=20
> Fixes: fd4a641ac88f ("leds: trigger: implement a tty trigger")
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
> ---
> PS: We need to get rid of the LED_ON, LED_OFF, LED_FULL and LED_HALF or
>     we're bound to repeat this kind of issues.

Ignore this, even better fix coming utilizing led_blink_set_oneshot()
