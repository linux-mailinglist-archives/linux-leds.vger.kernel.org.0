Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16E907806D0
	for <lists+linux-leds@lfdr.de>; Fri, 18 Aug 2023 10:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358229AbjHRIBk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Aug 2023 04:01:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358423AbjHRIBH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Aug 2023 04:01:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFE173A84
        for <linux-leds@vger.kernel.org>; Fri, 18 Aug 2023 01:01:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5DCF362D69
        for <linux-leds@vger.kernel.org>; Fri, 18 Aug 2023 08:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F46C433C7;
        Fri, 18 Aug 2023 08:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692345662;
        bh=D7NJ6uQRItSZ9n43TxPaXMnBj5/DSgJMhZOjCNi9aqI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gkY+Fyk0wTEUVmMQyGkxuBjNilbvNIjRNFu/lX/97+c4qmKoBU71YnJJAbbVOF+dc
         q8ZqOaHwzKSNlFyHtmcmSdwtlQDrSvYRhyXWjQpmd6c+JRI4KjY8dEvV8j/qDypE1r
         /wCodEcxYmBH/vpXLGxg8/ggZ9z/pDmi3Cm09cOuzK7NhHd6YCBsDWstlLVPBIiWDi
         8Rzbs84pNeJ7y2RN16f6qOXP4XOXkirlRbMwsdVVduJ4MnQRxIEQs8SyaFj3+eAX/F
         Ywn+auW6CynS8F8MXvXYZZrnJ9OVYIR36w+wdnsAkR7yUSWEUJCOMQTrejkMBbnrZN
         qcEBETiRO5NUw==
Date:   Fri, 18 Aug 2023 09:00:54 +0100
From:   Lee Jones <lee@kernel.org>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        jacek.anaszewski@gmail.com
Subject: Re: [PATCH v3 5/6] leds: turris-omnia: support HW controlled mode
 via private trigger
Message-ID: <20230818080054.GN986605@google.com>
References: <20230802160748.11208-1-kabel@kernel.org>
 <20230802160748.11208-6-kabel@kernel.org>
 <20230802181345.59d0b0bb@dellmb>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230802181345.59d0b0bb@dellmb>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 02 Aug 2023, Marek Behún wrote:

> On Wed,  2 Aug 2023 18:07:47 +0200
> Marek Behún <kabel@kernel.org> wrote:
> 
> > +static int omnia_hwtrig_activate(struct led_classdev *cdev)
> > +{
> > +	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
> > +	struct omnia_leds *leds = dev_get_drvdata(cdev->dev->parent);
> > +	struct omnia_led *led = to_omnia_led(mc_cdev);
> > +	int err = 0;
> > +
> > +	mutex_lock(&leds->lock);
> > +
> > +	if (!led->on) {
> > +		/*
> > +		 * If the LED is off (brightness was set to 0), the last
> > +		 * configured color was not necessarily sent to the MCU.
> > +		 * Recompute with max_brightness and send if needed.
> > +		 */
> > +		led_mc_calc_color_components(mc_cdev, cdev->max_brightness);
> > +
> > +		if (omnia_led_channels_changed(led))
> > +			err = omnia_led_send_color_cmd(leds->client, led);
> > +	}
> > +
> > +	if (!err) {
> > +		/* put the LED into MCU controlled mode */
> > +		err = omnia_cmd_write(leds->client, CMD_LED_MODE,
> > +				      CMD_LED_MODE_LED(led->reg));
> > +		if (!err)
> > +			led->hwtrig = true;
> > +	}
> > +
> > +	mutex_unlock(&leds->lock);
> > +
> > +	return err;
> > +}
> 
> Pavel, Lee, here I wanted to ask: can the .activate() method of a LED
> trigger sleep? The .brightness_set() method of a LED cannot sleep, and
> therefore we have .brightness_set_blocking() method, which schedules
> the potentially sleeping call into a work. But there is no such
> mechanism for the LED trigger .activate() method.
> 
> I looked at the LED core code, and it does not seem to me that
> .activate() sleeping would cause issues, besides keeping trigger list
> lock locked...
> 
> Note that previously none of the LED triggers in drivers/leds/trigger
> sleeped in .activate(), but recently the ethernet PHY subsystem was
> wired into the netdev trigger, which may cause the .activate() method
> to do a PHY transfer, which AFAIK may sleep...

I suspect you know more than I do at this point.  I could take a
deep-dive into the code however a) I'm presently swamped with incoming
reviews and b) I do not have any additional resources at my disposable
than you do - it would consist of reading through and brain-grepping the
code.

Pavel or Jacek may have more knowledge at-hand though.

-- 
Lee Jones [李琼斯]
