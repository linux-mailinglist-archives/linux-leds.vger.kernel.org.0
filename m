Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D97B5426257
	for <lists+linux-leds@lfdr.de>; Fri,  8 Oct 2021 04:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235120AbhJHCOv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 7 Oct 2021 22:14:51 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41774 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbhJHCOu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 7 Oct 2021 22:14:50 -0400
Received: from notapiano (unknown [IPv6:2806:105e:7:9ede::6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: nfraprado)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 027D21F45416;
        Fri,  8 Oct 2021 03:12:49 +0100 (BST)
Date:   Thu, 7 Oct 2021 21:12:45 -0500
From:   =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado 
        <nfraprado@collabora.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Russell King <linux@armlinux.org.uk>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, ~lkcamp/patches@lists.sr.ht,
        =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@collabora.com>,
        kernel@collabora.com
Subject: Re: [PATCH v3 2/5] leds: Add driver for QCOM SPMI Flash LEDs
Message-ID: <20211008021245.barkpi4fd4lakt36@notapiano>
References: <20210803162641.1525980-1-nfraprado@collabora.com>
 <20210803162641.1525980-3-nfraprado@collabora.com>
 <b1060e9a-f78e-fbe9-bde3-2b4d89cbc73e@gmail.com>
 <20210824214515.ekjpvaymkgxltlzp@notapiano>
 <278ea1e8-8b21-457d-78d7-fbb32544fe0a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <278ea1e8-8b21-457d-78d7-fbb32544fe0a@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Jacek,

> > > > +static int qcom_flash_flcdev_strobe_set(struct led_classdev_flash *fled_cdev,
> > > > +					bool state)
> > > > +{
> > > > +	struct qcom_flash_led *led = flcdev_to_led(fled_cdev);
> > > > +	struct qcom_flash_device *leds_dev = led_to_leds_dev(led);
> > > > +	unsigned int bright;
> > > > +	unsigned int i;
> > > > +	int rc;
> > > > +
> > > > +	/* Can't operate on flash if torch is on */
> > > > +	if (leds_dev->torch_enabled)
> > > > +		return -EBUSY;
> > > > +
> > > > +	mutex_lock(&leds_dev->lock);
> > > > +	if (!state) {
> > > > +		rc = qcom_flash_fled_off(led);
> > > > +	} else {
> > > > +		/*
> > > > +		 * Turn off flash LEDs from previous strobe
> > > > +		 */
> > > > +		rc = qcom_flash_check_timedout(leds_dev);
> > > > +		if (rc > 0) {
> > > > +			for (i = 0; i < leds_dev->num_leds; i++) {
> > > > +				rc = qcom_flash_fled_off(&leds_dev->leds[i]);
> > > > +				if (rc)
> > > > +					goto unlock;
> > > > +			}
> > > > +		} else if (rc < 0) {
> > > > +			goto unlock;
> > > > +		}
> > > 
> > > What if flash gets timed out after this check here? Why do you need to
> > > call qcom_flash_fled_off() if it has already timed out?
> > 
> > The issue is that after the flash times out, the hardware is not ready for
> > another strobe.
> > 
> > When I strobe LED0 for example, the STATUS register, 0x10, gets set to 0x08
> > indicating the LED0 is on. After the timeout, it changes to 0x04. At that point
> > if I try to strobe LED0 again, it doesn't work. When I turn the LED0 off (write
> > 0x00 to either the ENABLE or STROBE register), the STATUS is reset to 0x00. Now
> > I'm able to strobe the LED0 again.
> > 
> > I'm not sure if this is the normal behavior on other flash LED controllers, and
> > maybe there's even some configuration of this PMIC that resets the LED status
> > automatically after the strobe timeout, but I have not been able to do that. So
> > that's why I reset the status manually everytime it's needed.
> 
> My point was that the flash may time out after reading STATUS register
> and before writing QCOM_FLASH_ADDR_LED_STROBE_CTRL.
> You can't be 100% sure that you know the exact STATUS state just
> a moment before strobing.

That's true, but that scenario only happens if there's an ongoing flash strobe
happening and userspace triggers another strobe. Is that a scenario that really
needs to be taken care of, and if so, what would be the correct behavior? Does
the timeout need to be reset for this new strobe, possibly using updated
brightness and timeout values? (Currently none of this happens)

The purpose of this check is not to know if an ongoing flash strobe has
timed out, but rather to differentiate if the previous time the LED was strobed
was as a flash (with timeout) or torch (no timeout), because the flash
case needs an extra reset step that can be ommited in the torch case. For this
purpose there's no race condition.

> 
> To alleviate that I propose to avoid checking the status and always
> calling qcom_flash_fled_off() before initiating a new strobe.

Thanks,
Nicolas
