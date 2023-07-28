Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F183766982
	for <lists+linux-leds@lfdr.de>; Fri, 28 Jul 2023 11:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235478AbjG1J4t (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 Jul 2023 05:56:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235070AbjG1J4p (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 Jul 2023 05:56:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FFEF3A89
        for <linux-leds@vger.kernel.org>; Fri, 28 Jul 2023 02:56:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ADE7C62005
        for <linux-leds@vger.kernel.org>; Fri, 28 Jul 2023 09:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33DB6C433C8;
        Fri, 28 Jul 2023 09:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690538194;
        bh=OfXvRAoAMXvQpFRD48ta0wlFdWWlBz9i2cFYjM5+OL0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oZTDJI3Y8SkloH/JvT7coVdyAzkkh0mxuEO1Cr89Du5ewoQHqd1KpQUKcLmsLQJka
         xd/OriR4hLKdqqu4CBTEMo+dgO4McWPwgQPxOGMj+/szxvP1Rjzi3853ei7HD2Cpk7
         DXeOrbd1X33xzmhwZrgaRsUG+oq2an//5wMEWbeu8ByosYgCh3nMSHxrAefoUd3K9b
         tb8EeIYLBSaQDfedIPq6rKj622yanYAtRNNuuIL4h1j9YgCXyHUWhn+emsAvxyOsuw
         eHpfucYz/KSqPvq2AIAAzp8ho2q6b+hIljcRoXxvv6WJNMUjoXuERX8Ael9FA2BQlu
         7AkUBd5YkbA7Q==
Date:   Fri, 28 Jul 2023 10:56:29 +0100
From:   Lee Jones <lee@kernel.org>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 1/3] leds: turris-omnia: change max brightness from
 255 to 1
Message-ID: <20230728095629.GF8175@google.com>
References: <20230714085253.13544-1-kabel@kernel.org>
 <20230714085253.13544-2-kabel@kernel.org>
 <20230716091929.GA1182@bug>
 <20230716170112.1f90670a@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230716170112.1f90670a@thinkpad>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, 16 Jul 2023, Marek Behún wrote:

> On Sun, 16 Jul 2023 11:19:30 +0200
> Pavel Machek <pavel@ucw.cz> wrote:
> 
> > Hi!
> > 
> > > Using binary brightness makes more sense for this controller, because
> > > internally in the MCU it works that way: the LED has a color, and a
> > > state whether it is ON or OFF.  
> > 
> > So, controller can do (1, 3, 5) but not (3, 3, 3)?
> > 
> > > The resulting brightness computation with led_mc_calc_color_components()
> > > will now always result in either (0, 0, 0) or the multi_intensity value.  
> > 
> > Won't that limit you to 8 colors total?
> > 
> > I guess I`m confused how this hw works...
> 
> Hi Pavel.
> 
> No no no. That's not how it is.
> 
> The HW exposes color control for three channels (RGB), each channel with
> range 0-255 (so 16M colors). The driver exposes this via the
> multi_intensity sysfs file. This is communicated to the HW via
> LED_SET_COLOR I2C command.
> 
> HW also exposes setting the LED ON and OFF, via the LED_SET_STATE
> I2C command.
> 
> We currently have the following sysfs files via which we set LED state
> and color:
>   brightness
>   multi_intensity
> 
> Because currently the driver sets max_brightness to 255, the actual
> color that is sent to HW is recalculated via
> led_mc_calc_color_components(). For example with
> 
>   $ echo 255 255 100 >multi_intensity
>   $ echo 150 >brightness
> 
> the led_mc_calc_color_components() function recalculates the channel
> intensities with formula
>   brightness * channel_intensity / max_brightness
> and so the (255, 255, 100) tuple is converted to (150, 150, 58) before
> sending to HW.
> 
> What I think would make more sense is to make the two sysfs files
>   brightness
>   multi_intensity
> correspond 1-to-1 with I2C commands LED_SET_STATE and LED_SET_COLOR.
> 
> This can be simply done by setting max_brightness to 1. The brightness
> sysfs file then can simply control whether the LED is ON or OFF. The
> multi_intensity file control the color.
> 
> I realize now that in the patch I should also make away with the call
> to led_mc_calc_color_components()...

FYI, due to the revelations above, I'm dropping this from my queue.

-- 
Lee Jones [李琼斯]
