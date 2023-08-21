Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 783F678252E
	for <lists+linux-leds@lfdr.de>; Mon, 21 Aug 2023 10:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233559AbjHUIPm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 21 Aug 2023 04:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232273AbjHUIPm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 21 Aug 2023 04:15:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 803A8BC
        for <linux-leds@vger.kernel.org>; Mon, 21 Aug 2023 01:15:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 12B9062CF0
        for <linux-leds@vger.kernel.org>; Mon, 21 Aug 2023 08:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA3DC433C8;
        Mon, 21 Aug 2023 08:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692605739;
        bh=AyvK1tdMSE53kYCfFoOlmYPNWBYwroAvqbpM3lMkBpk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ha8Jj6T5FC7sq13yoYYiYHnO8RZydtREVGfflD86Nq3aWegiVWWRdT8wjvkZM73Di
         yhte6H+VDBOz5mnrJPmSgzYayae/HWDd1+gd7rY9YKVCmukWKJGi0O4x2W7G/YKKx8
         JndqeVw1w/QbfBkDVDNTCm+AqBNK9zJdJ5duI88t+HuOjPfgOAXN49g1f7/v7GaXDO
         z52BcIDYlWiD3u5aDK2AYDY2tpbu7zH7ztJVWbLD5/OCFs3HhuIVSpj9jTRSII04Qu
         7sTWEkHEa4fQ4ZNMHDw3zxrX65SxQOSNg4zQfoIVDYKiDMSgKa7zPwdL/LtkLLUJ/z
         bWZVMm+Y6ZscQ==
Date:   Mon, 21 Aug 2023 09:15:34 +0100
From:   Lee Jones <lee@kernel.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 5/6] leds: turris-omnia: support HW controlled mode
 via private trigger
Message-ID: <20230821081534.GE1380343@google.com>
References: <20230802160748.11208-1-kabel@kernel.org>
 <20230802160748.11208-6-kabel@kernel.org>
 <20230802181345.59d0b0bb@dellmb>
 <e019c436-0edd-4345-8857-ff2a12d28c37@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e019c436-0edd-4345-8857-ff2a12d28c37@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 18 Aug 2023, Jacek Anaszewski wrote:

> Hi Marek,
> 
> On 8/2/23 18:13, Marek Behún wrote:
> > On Wed,  2 Aug 2023 18:07:47 +0200
> > Marek Behún <kabel@kernel.org> wrote:
> > 
> > > +static int omnia_hwtrig_activate(struct led_classdev *cdev)
> > > +{
> > > +	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
> > > +	struct omnia_leds *leds = dev_get_drvdata(cdev->dev->parent);
> > > +	struct omnia_led *led = to_omnia_led(mc_cdev);
> > > +	int err = 0;
> > > +
> > > +	mutex_lock(&leds->lock);
> > > +
> > > +	if (!led->on) {
> > > +		/*
> > > +		 * If the LED is off (brightness was set to 0), the last
> > > +		 * configured color was not necessarily sent to the MCU.
> > > +		 * Recompute with max_brightness and send if needed.
> > > +		 */
> > > +		led_mc_calc_color_components(mc_cdev, cdev->max_brightness);
> > > +
> > > +		if (omnia_led_channels_changed(led))
> > > +			err = omnia_led_send_color_cmd(leds->client, led);
> > > +	}
> > > +
> > > +	if (!err) {
> > > +		/* put the LED into MCU controlled mode */
> > > +		err = omnia_cmd_write(leds->client, CMD_LED_MODE,
> > > +				      CMD_LED_MODE_LED(led->reg));
> > > +		if (!err)
> > > +			led->hwtrig = true;
> > > +	}
> > > +
> > > +	mutex_unlock(&leds->lock);
> > > +
> > > +	return err;
> > > +}
> > 
> > Pavel, Lee, here I wanted to ask: can the .activate() method of a LED
> > trigger sleep? The .brightness_set() method of a LED cannot sleep, and
> > therefore we have .brightness_set_blocking() method, which schedules
> > the potentially sleeping call into a work. But there is no such
> > mechanism for the LED trigger .activate() method.
> > 
> > I looked at the LED core code, and it does not seem to me that
> > .activate() sleeping would cause issues, besides keeping trigger list
> > lock locked...
> > 
> > Note that previously none of the LED triggers in drivers/leds/trigger
> > sleeped in .activate(), but recently the ethernet PHY subsystem was
> > wired into the netdev trigger, which may cause the .activate() method
> > to do a PHY transfer, which AFAIK may sleep...
> 
> In general led_set_brightness() can't sleep because it is called from
> triggers in atomic contexts, which shouldn't be the case for activate().
> 
> .activate() is called from led_trigger_{set|remove}() which is called from
> led_classdev_{register|unregister}) and from sysfs trigger attr's
> led_trigger_write() handler, so no risk here.
> 
> Triggers already call e.g. kzalloc() in .activate() which may sleep.

Thanks for stepping in Jacek.  I really appreciate your help.

-- 
Lee Jones [李琼斯]
