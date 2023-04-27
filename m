Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADC9E6F0A57
	for <lists+linux-leds@lfdr.de>; Thu, 27 Apr 2023 18:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244163AbjD0Q5p (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 27 Apr 2023 12:57:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244313AbjD0Q5l (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 27 Apr 2023 12:57:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F3C30D5
        for <linux-leds@vger.kernel.org>; Thu, 27 Apr 2023 09:57:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 758D963A3D
        for <linux-leds@vger.kernel.org>; Thu, 27 Apr 2023 16:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DFB0C433EF;
        Thu, 27 Apr 2023 16:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682614650;
        bh=L3dPg5iNGe76UPv384aiPR4uTq1mWRLVkW1lWJ+AnZw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ew9A2kd7rd5j/UoYC5JkWo5DcA2Vi0IeG7gbz+e36gFxvmYhycPoeuvHTZL5HESC0
         tsZqDJkj3tpU7Ccizdx3Ajg0Z/ODqBahbXdsZ/VMO4O6ia+2vP+VR9LqT+Fx8+ugRG
         jWxHo4Q/IoDZB4oawjzGObEQ04F8Otr2DQ5riR4FKh+7pH6BeUuiTGuLQCfVn0vcBE
         aKhrYJCn5qy1EAI7oGwrC7beG1JrnCDYbS5Ypx+iAg8pBX41Qq1Vez5bLjQr3wzTN/
         3qiHHETsLW6uojlJ2KbSVP9Jr4cwFTmWwJ1NP7H9j+2LlQPKroNGnd7jwhgONJBHf+
         DZ73P8+85qH3w==
Date:   Thu, 27 Apr 2023 17:57:26 +0100
From:   Lee Jones <lee@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Yauhen Kharuzhy <jekhor@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 1/5] leds: Add Intel Cherry Trail Whiskey Cove PMIC
 LED driver
Message-ID: <20230427165726.GC620451@google.com>
References: <20230420123741.57160-1-hdegoede@redhat.com>
 <20230420123741.57160-2-hdegoede@redhat.com>
 <20230424141505.GL50521@google.com>
 <5f6452f3-4013-8dad-c220-3ad2f4922993@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f6452f3-4013-8dad-c220-3ad2f4922993@redhat.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 24 Apr 2023, Hans de Goede wrote:

> Hi Lee,
> 
> On 4/24/23 16:15, Lee Jones wrote:
> > On Thu, 20 Apr 2023, Hans de Goede wrote:
> > 
> >> From: Yauhen Kharuzhy <jekhor@gmail.com>
> >>
> >> Add support for LEDs connected to the Intel Cherry Trail Whiskey Cove
> >> PMIC. Charger and general-purpose LEDs are supported. Hardware blinking
> >> is implemented, breathing is not.
> >>
> >> This driver was tested with Lenovo Yoga Book notebook.
> >>
> >> Changes by Hans de Goede (in response to review of v2):
> >> - Since the PMIC is connected to the battery any changes we make to
> >>   the LED settings are permanent, even surviving reboot / poweroff.
> >>   Save LED1 register settings on probe() and if auto-/hw-control was
> >>   enabled on probe() restore the settings on remove() and shutdown().
> >> - Delay switching LED1 to software control mode to first brightness write.
> >> - Use dynamically allocated drvdata instead of a global drvdata variable.
> >> - Ensure the LED is on when activating blinking.
> >> - Fix CHT_WC_LED_EFF_BREATHING val ((3 << 1) rather then BIT(3)).
> >>
> >> Link: https://lore.kernel.org/r/20190212205901.13037-2-jekhor@gmail.com
> >> Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> >> Co-developed-by: Hans de Goede <hdegoede@redhat.com>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >> Changes in v2:
> >> - Update comment about YB1 kernel source usage for register info
> >> - Replace "cht-wc::" LED name prefix with "platform::"
> >> - Add leds-cht-wcove to list of drivers using "platform::charging" in
> >>   Documentation/leds/well-known-leds.txt
> >> - Bail from cht_wc_leds_brightness_set() on first error
> >> - Make default blink 1Hz, like sw-blink default blink
> >> ---
> >>  Documentation/leds/well-known-leds.txt |   2 +-
> >>  drivers/leds/Kconfig                   |  11 +
> >>  drivers/leds/Makefile                  |   1 +
> >>  drivers/leds/leds-cht-wcove.c          | 373 +++++++++++++++++++++++++
> >>  4 files changed, 386 insertions(+), 1 deletion(-)
> >>  create mode 100644 drivers/leds/leds-cht-wcove.c
> > 
> > Generally nice.  Couple of small nits.
> > 
> >> diff --git a/Documentation/leds/well-known-leds.txt b/Documentation/leds/well-known-leds.txt
> >> index 2160382c86be..7640debee6c0 100644
> >> --- a/Documentation/leds/well-known-leds.txt
> >> +++ b/Documentation/leds/well-known-leds.txt
> >> @@ -65,7 +65,7 @@ Phones usually have multi-color status LED.
> >>  
> >>  * Power management
> >>  
> >> -Good: "platform:*:charging" (allwinner sun50i)
> >> +Good: "platform:*:charging" (allwinner sun50i, leds-cht-wcove)
> >>  
> >>  * Screen
> >>  
> >> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> >> index 9dbce09eabac..90835716f14a 100644
> >> --- a/drivers/leds/Kconfig
> >> +++ b/drivers/leds/Kconfig
> >> @@ -122,6 +122,17 @@ config LEDS_BCM6358
> >>  	  This option enables support for LEDs connected to the BCM6358
> >>  	  LED HW controller accessed via MMIO registers.
> >>  
> >> +config LEDS_CHT_WCOVE
> >> +	tristate "LED support for Intel Cherry Trail Whiskey Cove PMIC"
> >> +	depends on LEDS_CLASS
> >> +	depends on INTEL_SOC_PMIC_CHTWC
> >> +	help
> >> +	  This option enables support for charger and general purpose LEDs
> >> +	  connected to the Intel Cherrytrail Whiskey Cove PMIC.
> >> +
> >> +	  To compile this driver as a module, choose M here: the module
> >> +	  will be called leds-cht-wcove.
> >> +
> >>  config LEDS_CPCAP
> >>  	tristate "LED Support for Motorola CPCAP"
> >>  	depends on LEDS_CLASS
> >> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> >> index d30395d11fd8..78b5b69f9c54 100644
> >> --- a/drivers/leds/Makefile
> >> +++ b/drivers/leds/Makefile
> >> @@ -19,6 +19,7 @@ obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
> >>  obj-$(CONFIG_LEDS_BCM6358)		+= leds-bcm6358.o
> >>  obj-$(CONFIG_LEDS_BD2802)		+= leds-bd2802.o
> >>  obj-$(CONFIG_LEDS_BLINKM)		+= leds-blinkm.o
> >> +obj-$(CONFIG_LEDS_CHT_WCOVE)		+= leds-cht-wcove.o
> >>  obj-$(CONFIG_LEDS_CLEVO_MAIL)		+= leds-clevo-mail.o
> >>  obj-$(CONFIG_LEDS_COBALT_QUBE)		+= leds-cobalt-qube.o
> >>  obj-$(CONFIG_LEDS_COBALT_RAQ)		+= leds-cobalt-raq.o
> >> diff --git a/drivers/leds/leds-cht-wcove.c b/drivers/leds/leds-cht-wcove.c
> >> new file mode 100644
> >> index 000000000000..908965e25552
> >> --- /dev/null
> >> +++ b/drivers/leds/leds-cht-wcove.c
> >> @@ -0,0 +1,373 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * Driver for LEDs connected to the Intel Cherry Trail Whiskey Cove PMIC
> >> + *
> >> + * Copyright 2019 Yauhen Kharuzhy <jekhor@gmail.com>
> >> + * Copyright 2023 Hans de Goede <hansg@kernel.org>
> >> + *
> >> + * Register info comes from the Lenovo Yoga Book Android kernel sources:
> >> + * YB1_source_code/kernel/cht/drivers/misc/charger_gp_led.c.
> > 
> > How does one browse to this?
> 
> There is a tarbal with kernel sources available for download from
> the support page for the Android version of the Yoga Book (yb1-x90f / yb1-x90l).
> 
> This is the file path within that tarbal. I add a deep-link
> to the tarbal here, but I'm afraid that will not be a stable link.
> 
> Or I guess I could omit the filename too? I added the filename because
> even if you have the tarbal the file is still sort of non trivial to find.

That's not the issue I have with it.

How about:

  <tarball>/YB1_source_code/kernel/cht/drivers/misc/charger_gp_led.c

Or:

  file:///YB1_source_code/kernel/cht/drivers/misc/charger_gp_led.c

[...]

> >> +enum led_brightness cht_wc_leds_brightness_get(struct led_classdev *cdev)
> >> +{
> >> +	struct cht_wc_led *led = container_of(cdev, struct cht_wc_led, cdev);
> >> +	unsigned int val;
> >> +	int ret;
> >> +
> >> +	mutex_lock(&led->mutex);
> >> +
> >> +	ret = regmap_read(led->regmap, led->regs->ctrl, &val);
> >> +	if (ret < 0) {
> >> +		dev_err(cdev->dev, "Failed to read LED CTRL reg: %d\n", ret);
> >> +		ret = LED_OFF;
> > 
> > 
> > include/linux/leds.h:
> > 
> > /* This is obsolete/useless. We now support variable maximum brightness. */
> > enum led_brightness {
> >    LED_OFF         = 0,
> >    LED_ON          = 1,
> >    LED_HALF        = 127,
> >    LED_FULL        = 255,
> > };
> 
> I know but LED_OFF is still somewhat useful, it makes it
> clear that wat is being returned is a brightness value
> where as "ret = 0" reads like returning success.
> 
> With that said if you prefer 0/1 over LED_OFF / LED_ON
> I'm happy to replace them all ?

This is probably for Pavel to answer.

Ideally it'll either be:

 "still useful and thus not deprecated"

Or:

 "deprecated and therefore must not be used"

I'm less happy with a deprecated but still okay to use limbo-land.

[...]

> >> +static void cht_wc_led_restore_regs(struct cht_wc_led *led,
> >> +				    const struct cht_wc_led_saved_regs *saved_regs)
> >> +{
> >> +	regmap_write(led->regmap, led->regs->ctrl, saved_regs->ctrl);
> >> +	regmap_write(led->regmap, led->regs->fsm, saved_regs->fsm);
> >> +	regmap_write(led->regmap, led->regs->pwm, saved_regs->pwm);
> >> +}
> >> +
> >> +static int cht_wc_leds_probe(struct platform_device *pdev)
> >> +{
> >> +	struct intel_soc_pmic *pmic = dev_get_drvdata(pdev->dev.parent);
> > 
> > platform_*()
> 
> This is getting the parent's driver data so platform_get_drvdata()
> can not be used here.

Fair point.

> >> +	struct cht_wc_leds *leds;
> >> +	int ret;
> >> +	int i;
> >> +
> >> +	leds = devm_kzalloc(&pdev->dev, sizeof(*leds), GFP_KERNEL);
> >> +	if (!leds)
> >> +		return -ENOMEM;
> >> +
> >> +	/*
> >> +	 * LED1 might be in hw-controlled mode when this driver gets loaded; and
> >> +	 * since the PMIC is always powered by the battery any changes made are
> >> +	 * permanent. Save LED1 regs to restore them on remove() or shutdown().
> >> +	 */
> >> +	leds->leds[0].regs = &cht_wc_led_regs[0];
> >> +	leds->leds[0].regmap = pmic->regmap;
> >> +	ret = cht_wc_led_save_regs(&leds->leds[0], &leds->led1_initial_regs);
> >> +	if (ret < 0)
> >> +		return ret;
> >> +
> >> +	for (i = 0; i < CHT_WC_LED_COUNT; i++) {
> >> +		struct cht_wc_led *led = &leds->leds[i];
> >> +
> >> +		led->regs = &cht_wc_led_regs[i];
> >> +		led->regmap = pmic->regmap;
> >> +		mutex_init(&led->mutex);
> >> +		led->cdev.name = cht_wc_leds_names[i];
> >> +		led->cdev.brightness_set_blocking = cht_wc_leds_brightness_set;
> >> +		led->cdev.brightness_get = cht_wc_leds_brightness_get;
> >> +		led->cdev.blink_set = cht_wc_leds_blink_set;
> >> +		led->cdev.max_brightness = 255;
> >> +
> >> +		ret = led_classdev_register(&pdev->dev, &led->cdev);
> >> +		if (ret < 0)
> >> +			return ret;
> >> +	}
> >> +
> >> +	platform_set_drvdata(pdev, leds);
> >> +	return 0;
> >> +}
> >> +
> >> +static void cht_wc_leds_remove(struct platform_device *pdev)
> >> +{
> >> +	struct cht_wc_leds *leds = platform_get_drvdata(pdev);
> >> +	int i;
> >> +
> >> +	for (i = 0; i < CHT_WC_LED_COUNT; i++)
> >> +		led_classdev_unregister(&leds->leds[i].cdev);
> >> +
> >> +	/* Restore LED1 regs if hw-control was active, else leave LED1 off. */
> > 
> > Either use full-stops, or don't.  Please be consistent.
> 
> I added the full-stop here because there is a ',' in the comment, I'll drop it.

Please apply this review comment widely, not just for this one line.

[...]

> >> +static struct platform_driver cht_wc_leds_driver = {
> >> +	.probe = cht_wc_leds_probe,
> >> +	.remove_new = cht_wc_leds_remove,
> > 
> > This is new to me.  What does remove_new do?
> > 
> > Just returns void?
> 
> Yes all the platform_device remove callbacks are being moved over to this which
> indeed returns void.

Thanks.

-- 
Lee Jones [李琼斯]
