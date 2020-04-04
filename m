Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B35619E41F
	for <lists+linux-leds@lfdr.de>; Sat,  4 Apr 2020 11:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbgDDJgs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 Apr 2020 05:36:48 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:34304 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725730AbgDDJgs (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 4 Apr 2020 05:36:48 -0400
Received: by mail.z3ntu.xyz (Postfix, from userid 182)
        id 90A65C4A09; Sat,  4 Apr 2020 09:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1585993005; bh=EbaCrmWyLjBFYMdhNhBgdOu1U3GBqLscUbGFR0smI2M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=GhXPFNnhLZ14JegMbfF9yWCQBOxPs7YlTJCfVmI2CQgEyGzkRi/ICSgLMLH3ITYOh
         3Bq1XEl+j8ATG/8s2XrPol9KWbgJ702axVy6WluBRNqfrGeelqUORmoacWdjeMNkOV
         uTcag5xxVNUSEEbY76uc7OeqtKkWsDcJa7g5YgMY=
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on arch-vps
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.4
Received: from g550jk.localnet (80-110-124-168.cgn.dynamic.surfer.at [80.110.124.168])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id B36CFC49F2;
        Sat,  4 Apr 2020 09:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1585993000; bh=EbaCrmWyLjBFYMdhNhBgdOu1U3GBqLscUbGFR0smI2M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=i4yNZBfriarZSErgGn1Adz1e0aSODFiAHNT09to/a2kVyT9Qb+v+qh48PRXiMFm5j
         rz/3tgy7RInFRmerjsjR78JZCEYGQ9/fi2KF+kGgqDpssG0H3sLbLNIVzVsf3x1JPK
         SJBmMVbWZb7vJ6XP2mZLK8X3kToObZaJCumMa0wk=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Cc:     Heiko Stuebner <heiko@sntech.de>, Icenowy Zheng <icenowy@aosc.io>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 2/2] leds: add sgm3140 driver
Date:   Sat, 04 Apr 2020 11:36:39 +0200
Message-ID: <5847770.lOV4Wx5bFT@g550jk>
In-Reply-To: <e29c3fee-068d-c3d7-a0e6-6877a616b3fa@ti.com>
References: <20200330194757.2645388-1-luca@z3ntu.xyz> <20200330194757.2645388-3-luca@z3ntu.xyz> <e29c3fee-068d-c3d7-a0e6-6877a616b3fa@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dan,

On Freitag, 3. April 2020 19:31:52 CEST Dan Murphy wrote:
> Luca
> 
> On 3/30/20 2:47 PM, Luca Weiss wrote:
> > Add a driver for the SGMICRO SGM3140 Buck/Boost Charge Pump LED driver.
> > 
> > This device is controlled by two GPIO pins, one for enabling and the
> > second one for switching between torch and flash mode.
> > 
> > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> > ---
> > Changes since v1:
> > - Add vin-supply (keep track of 'enabled' state for that)
> > - Wrap lines
> > - static const -ify some structs and methods
> > - use strscpy instead of strlcpy
> > - remove u32 cast by adding 'U' suffix to constants
> > - rebase on linux-next
> > 
> >   drivers/leds/Kconfig        |   9 +
> >   drivers/leds/Makefile       |   1 +
> >   drivers/leds/leds-sgm3140.c | 317 ++++++++++++++++++++++++++++++++++++
> >   3 files changed, 327 insertions(+)
> >   create mode 100644 drivers/leds/leds-sgm3140.c
> > 
-snip-
> > +
> > +	priv->vin_regulator = devm_regulator_get(&pdev->dev, "vin");
> > +	ret = PTR_ERR_OR_ZERO(priv->vin_regulator);
> > +	if (ret) {
> > +		if (ret != -EPROBE_DEFER)
> > +			dev_err(&pdev->dev,
> > +				"Failed to request regulator: 
%d\n", ret);
> > +		return ret;
> 
> This regulator is optional so why would you return here?  You should
> only return if -EPROBE_DEFER.

If the regulator is not specified in the dts, then a dummy regulator will be 
used:

[    1.027114] sgm3140 sgm3140: sgm3140 supply vin not found, using dummy 
regulator

So this code will only be called if something really failed (or was defered)

> 
> > +	}
> > +
> > +	child_node = of_get_next_available_child(pdev->dev.of_node, NULL);
> 
> Maybe this should be the first check before doing all the processing to
> make sure that the DT is not
> 
> malformed.

If e.g. the devm_gpiod_get calls fail (because the gpios weren't declared in 
the dts) then the dt is also "malformed" which isn't as different as the 
subnode being missing imo. I don't think it matters much here. And this way I 
don't have to care about calling of_node_put in case of an error for the 
statements above.

> 
> > +	if (!child_node) {
> > +		dev_err(&pdev->dev,
> > +			"No DT child node found for connected LED.
\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	ret = of_property_read_u32(child_node, "flash-max-timeout-us",
> > +				   &priv->max_timeout);
> > +	if (ret) {
> > +		priv->max_timeout = FLASH_MAX_TIMEOUT_DEFAULT;
> > +		dev_warn(&pdev->dev,
> > +			 "flash-max-timeout-us DT property 
missing\n");
> > +	}
> > +
> > +	/*
> > +	 * Set default timeout to FLASH_DEFAULT_TIMEOUT except if 
max_timeout
> > +	 * from DT is lower.
> > +	 */
> > +	priv->timeout = min(priv->max_timeout, FLASH_TIMEOUT_DEFAULT);
> > +
> > +	timer_setup(&priv->powerdown_timer, sgm3140_powerdown_timer, 0);
> > +
> > +	fled_cdev = &priv->fled_cdev;
> > +	led_cdev = &fled_cdev->led_cdev;
> > +
> > +	fled_cdev->ops = &sgm3140_flash_ops;
> > +
> > +	led_cdev->brightness_set_blocking = sgm3140_brightness_set;
> > +	led_cdev->max_brightness = LED_ON;
> > +	led_cdev->flags |= LED_DEV_CAP_FLASH;
> > +
> > +	sgm3140_init_flash_timeout(priv);
> > +
> > +	init_data.fwnode = of_fwnode_handle(child_node);
> > +
> > +	platform_set_drvdata(pdev, priv);
> > +
> > +	/* Register in the LED subsystem */
> > +	ret = devm_led_classdev_flash_register_ext(&pdev->dev,
> > +						   
fled_cdev, &init_data);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Failed to register flash device: 
%d\n",
> > +			ret);
> > +		goto err;
> > +	}
> > +
> > +	sgm3140_init_v4l2_flash_config(priv, &v4l2_sd_cfg);
> > +
> > +	/* Create V4L2 Flash subdev */
> > +	priv->v4l2_flash = v4l2_flash_init(&pdev->dev,
> > +					   
of_fwnode_handle(child_node),
> > +					   fled_cdev, NULL,
> > +					   &v4l2_sd_cfg);
> > +	if (IS_ERR(priv->v4l2_flash)) {
> > +		ret = PTR_ERR(priv->v4l2_flash);
> > +		goto err;
> 
> Not sure why this is here you are not in a for loop and this will fall
> through anyway to the err label.
> 

I kept the goto in, in case more code is added below that statement so the 
author doesn't forget that this error needs to be handled.
If wanted I can remove it of course.

> > +	}
> > +
> > +err:
> > +	of_node_put(child_node);
> > +	return ret;
> > +}
> > +
> 
> Dan

Regards
Luca


