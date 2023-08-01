Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADD2176AC8C
	for <lists+linux-leds@lfdr.de>; Tue,  1 Aug 2023 11:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232521AbjHAJL7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 1 Aug 2023 05:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232656AbjHAJLo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 1 Aug 2023 05:11:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A81685FD7
        for <linux-leds@vger.kernel.org>; Tue,  1 Aug 2023 02:08:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 905E6614DE
        for <linux-leds@vger.kernel.org>; Tue,  1 Aug 2023 09:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27E16C433C8;
        Tue,  1 Aug 2023 09:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690880869;
        bh=jACz+FTVono88HsU7LVeO3Ll2NTSilUWeghutH8q7Bg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=aQj/vXW1fKSBlD/GYPARYx4SnNBDTjR7a4EQDHo7Rlh2klB6O5cgv9WOQ5FD/zztW
         Z6V/46oodST/ZZ1D94XuhISDECESg6oYuGppQBPjkCWjJuBL47VI2+7aFIewv5Corn
         B64RFivAJKVZeEP0NKampgBkcuSJXC1zFP0XUjuiH9x+1As34byP7jj2PYMETTsbQ5
         YTsSYdjP7YZHyNtGlniCGbQevMaYOp8zaboLKF53RPnfX/xu6HKpXS29wylXptgVNc
         f/GpR2qsdBwPBlQgKbHjjh/6eoIvXpM+3X1mWe6eo+Nzm1I0/4xw9itMSB4uMJbWSb
         xchzyOzrY6+Pg==
Date:   Tue, 1 Aug 2023 11:07:45 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v2 1/3] leds: turris-omnia: change max brightness from
 255 to 1
Message-ID: <20230801110745.28f7b9c5@dellmb>
In-Reply-To: <ZMOUJIN1OY/NuehT@duo.ucw.cz>
References: <20230714085253.13544-1-kabel@kernel.org>
        <20230714085253.13544-2-kabel@kernel.org>
        <20230716091929.GA1182@bug>
        <20230716170112.1f90670a@thinkpad>
        <ZMOUJIN1OY/NuehT@duo.ucw.cz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 28 Jul 2023 12:10:44 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> Hi!
> 
> > The HW exposes color control for three channels (RGB), each channel with
> > range 0-255 (so 16M colors). The driver exposes this via the
> > multi_intensity sysfs file. This is communicated to the HW via
> > LED_SET_COLOR I2C command.
> > 
> > HW also exposes setting the LED ON and OFF, via the LED_SET_STATE
> > I2C command.
> > 
> > We currently have the following sysfs files via which we set LED state
> > and color:
> >   brightness
> >   multi_intensity
> > 
> > Because currently the driver sets max_brightness to 255, the actual
> > color that is sent to HW is recalculated via
> > led_mc_calc_color_components(). For example with
> > 
> >   $ echo 255 255 100 >multi_intensity
> >   $ echo 150 >brightness
> > 
> > the led_mc_calc_color_components() function recalculates the channel
> > intensities with formula
> >   brightness * channel_intensity / max_brightness
> > and so the (255, 255, 100) tuple is converted to (150, 150, 58) before
> > sending to HW.  
> 
> And this seems ok.
> 
> > What I think would make more sense is to make the two sysfs files
> >   brightness
> >   multi_intensity
> > correspond 1-to-1 with I2C commands LED_SET_STATE and LED_SET_COLOR.  
> 
> We want your driver to be have same API as other drivers, 1-to-1
> correspondence with I2c commands is not important.
> 
> NAK-ed-by: Pavel
> 
> Best regards,
> 								Pavel

Hmm, thinking more about it I guess you are right. And I thought of
what I think is better change anyway. I shall send patch for review,
let's see what you think about that one :)

Marek
