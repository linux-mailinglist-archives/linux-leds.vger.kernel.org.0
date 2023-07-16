Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 191B6754F27
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jul 2023 17:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbjGPPBX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 16 Jul 2023 11:01:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbjGPPBW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 16 Jul 2023 11:01:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 488CE1BC
        for <linux-leds@vger.kernel.org>; Sun, 16 Jul 2023 08:01:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D91F960D27
        for <linux-leds@vger.kernel.org>; Sun, 16 Jul 2023 15:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6741BC433C7;
        Sun, 16 Jul 2023 15:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689519678;
        bh=DfOYa1pYYgQg6X1NrG9Ps8H1Ag2SxPgMcAH/aqJ8erg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cP9pEFuDVsydkU1qIrRu8ogi27aqI1HseHqZjjWUbO4Imwblln1MArlVbA9LjTGtx
         ANmCKPYUEW4wfel7944DfvRURwfHHQbPok4HAHx1HhSVX+OUtn8SZv/qZFBs91ZyQo
         o6S0UgDb2mLw++B88fsCpeWZGMq2q5MPK0nfWKYva4uyUU/t07Y14VWwFyraHOKXUM
         2zBrQtAPDzjSLHiFSXIeu9YitU03gPXfBRwKjcmftnvF/rnKsooPBqnzH3YS/dBPQw
         IE9ukEoTLq2P5DzsUF1KaxzyK2UjmY+fO2bG2DHZOQiJsLLDPii4B9OcSZvecgvX6q
         9qPbQfBJc1zHA==
Date:   Sun, 16 Jul 2023 17:01:12 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v2 1/3] leds: turris-omnia: change max brightness from
 255 to 1
Message-ID: <20230716170112.1f90670a@thinkpad>
In-Reply-To: <20230716091929.GA1182@bug>
References: <20230714085253.13544-1-kabel@kernel.org>
        <20230714085253.13544-2-kabel@kernel.org>
        <20230716091929.GA1182@bug>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, 16 Jul 2023 11:19:30 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> Hi!
> 
> > Using binary brightness makes more sense for this controller, because
> > internally in the MCU it works that way: the LED has a color, and a
> > state whether it is ON or OFF.  
> 
> So, controller can do (1, 3, 5) but not (3, 3, 3)?
> 
> > The resulting brightness computation with led_mc_calc_color_components()
> > will now always result in either (0, 0, 0) or the multi_intensity value.  
> 
> Won't that limit you to 8 colors total?
> 
> I guess I`m confused how this hw works...

Hi Pavel.

No no no. That's not how it is.

The HW exposes color control for three channels (RGB), each channel with
range 0-255 (so 16M colors). The driver exposes this via the
multi_intensity sysfs file. This is communicated to the HW via
LED_SET_COLOR I2C command.

HW also exposes setting the LED ON and OFF, via the LED_SET_STATE
I2C command.

We currently have the following sysfs files via which we set LED state
and color:
  brightness
  multi_intensity

Because currently the driver sets max_brightness to 255, the actual
color that is sent to HW is recalculated via
led_mc_calc_color_components(). For example with

  $ echo 255 255 100 >multi_intensity
  $ echo 150 >brightness

the led_mc_calc_color_components() function recalculates the channel
intensities with formula
  brightness * channel_intensity / max_brightness
and so the (255, 255, 100) tuple is converted to (150, 150, 58) before
sending to HW.

What I think would make more sense is to make the two sysfs files
  brightness
  multi_intensity
correspond 1-to-1 with I2C commands LED_SET_STATE and LED_SET_COLOR.

This can be simply done by setting max_brightness to 1. The brightness
sysfs file then can simply control whether the LED is ON or OFF. The
multi_intensity file control the color.

I realize now that in the patch I should also make away with the call
to led_mc_calc_color_components()...

Marek
