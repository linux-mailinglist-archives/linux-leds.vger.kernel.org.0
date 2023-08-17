Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C63C77F49C
	for <lists+linux-leds@lfdr.de>; Thu, 17 Aug 2023 12:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244446AbjHQK7U (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Aug 2023 06:59:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350058AbjHQK6t (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Aug 2023 06:58:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE3D72D4A
        for <linux-leds@vger.kernel.org>; Thu, 17 Aug 2023 03:58:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4C6D3617EB
        for <linux-leds@vger.kernel.org>; Thu, 17 Aug 2023 10:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6FDFC433C8;
        Thu, 17 Aug 2023 10:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692269927;
        bh=xPZG3HTZv1wucVcqUqXx5lwi8sd2c+6gU9u1Cp6vU20=;
        h=From:To:In-Reply-To:References:Subject:Date:From;
        b=rh3C96OLwXB3l9vwutsGrtvKn4Qsdcv+SVBl0WWSXgpF8mFT4Wj2cqsTblSVIQZMN
         TnPudqxlQO/z9SOsGWGmNKK9VPZEBYXEWcZVoNaoDjubwbGFuks2XFfClo+EzLrY1X
         LoPlI5Dp4eJTPtHxkOWTOkV/FJvg4HugQyxgTHtmyPoBZkNjtV1Npme9wROKDaULGo
         KdyfIK7Stm/cadcbe2vKCt+JTCM1glfYor/ETsBboausG7ix0my2elL9xEer16FYTZ
         ukzvgza/faJv/K5ihj9PcA/PWB+WrGqu0i61X60OJbgYfcMhF0FulY+mnsLsi/J8z0
         SeMdQ0PzCxZNA==
From:   Lee Jones <lee@kernel.org>
To:     =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org,
        =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
In-Reply-To: <20230802090753.13611-1-kabel@kernel.org>
References: <20230802090753.13611-1-kabel@kernel.org>
Subject: Re: (subset) [PATCH v2] leds: trigger: tty: Do not use LED_ON/OFF
 constants, use led_blink_set_oneshot instead
Message-Id: <169226992647.980052.16310484890492443129.b4-ty@kernel.org>
Date:   Thu, 17 Aug 2023 11:58:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 02 Aug 2023 11:07:53 +0200, Marek Behún wrote:
> The tty LED trigger uses the obsolete LED_ON & LED_OFF constants when
> setting LED brightness. This is bad because the LED_ON constant is equal
> to 1, and so when activating the tty LED trigger on a LED class device
> with max_brightness greater than 1, the LED is dimmer than it can be
> (when max_brightness is 255, the LED is very dimm indeed; some devices
> translate 1/255 to 0, so the LED is OFF all the time).
> 
> [...]

Applied, thanks!

[1/1] leds: trigger: tty: Do not use LED_ON/OFF constants, use led_blink_set_oneshot instead
      commit: 730094577e0c37e1bc40be37cbd41f71b0a8a2a4

--
Lee Jones [李琼斯]

