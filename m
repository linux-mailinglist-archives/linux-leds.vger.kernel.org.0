Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8BF19ED66
	for <lists+linux-leds@lfdr.de>; Sun,  5 Apr 2020 20:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbgDESpa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 5 Apr 2020 14:45:30 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:53418 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726771AbgDESpa (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 5 Apr 2020 14:45:30 -0400
Received: by mail.z3ntu.xyz (Postfix, from userid 182)
        id 66D30C4A48; Sun,  5 Apr 2020 18:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1586112327; bh=gcwe3ElP/7v212/hOuOpcAarEMfzryBhN3eyrrQNMAs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=QQTY4ckBmuk02vYdyVquWzcGkBYIMht5m93iBxL+mnlWWIIVOoV1JKJSHs36jlVr3
         CMmiBY7zPdKxSDzdihpa9F2LjaxienpmcK2nsNNL2+7cjdXi0jXNNDtwRX+ztCo8Ya
         ncJaqP7yE8m7swDvuAqLVNU/ngpNNDu3TN1hrPzw=
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on arch-vps
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.4
Received: from g550jk.localnet (80-110-124-168.cgn.dynamic.surfer.at [80.110.124.168])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 02A56C4A0D;
        Sun,  5 Apr 2020 18:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1586112315; bh=gcwe3ElP/7v212/hOuOpcAarEMfzryBhN3eyrrQNMAs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=thro8YDa0mNSr/5s68+qG0xZMKN7QlPuGqecmo2yOyzEFKtxlKOJtuMMbCcgwwna2
         3NtganpJu5fSJ5DShL2C7Xl+ZW81M3ooLq8UNc+DlOkRgz5W6n0RW+D+L/Q24NRFir
         M+yqPtaTmhcqn1tsJbEFCyT2rfrdPhMG6GKRjRrc=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>, Heiko Stuebner <heiko@sntech.de>,
        Icenowy Zheng <icenowy@aosc.io>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 2/2] leds: add sgm3140 driver
Date:   Sun, 05 Apr 2020 20:45:14 +0200
Message-ID: <4437676.LvFx2qVVIh@g550jk>
In-Reply-To: <CAHp75Vf6ZS1UGUv-okzzcDNnMtjjBjGbjsXb8w6TmGcgKdhhfA@mail.gmail.com>
References: <20200330194757.2645388-1-luca@z3ntu.xyz> <20200330194757.2645388-3-luca@z3ntu.xyz> <CAHp75Vf6ZS1UGUv-okzzcDNnMtjjBjGbjsXb8w6TmGcgKdhhfA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Andy,

On Samstag, 4. April 2020 11:58:31 CEST Andy Shevchenko wrote:
> On Mon, Mar 30, 2020 at 10:49 PM Luca Weiss <luca@z3ntu.xyz> wrote:
> > Add a driver for the SGMICRO SGM3140 Buck/Boost Charge Pump LED driver.
> > 
> > This device is controlled by two GPIO pins, one for enabling and the
> > second one for switching between torch and flash mode.
> 
> ...
> 
> > +config LEDS_SGM3140
> > +       tristate "LED support for the SGM3140"
> > +       depends on LEDS_CLASS_FLASH
> > +       depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> > 
> > +       depends on OF
> 
> depends on OF || COMPILE_TEST ?
> But hold on...
> 
> ...
> 
> > +#include <linux/of.h>
> 
> Perhaps switch this to property.h and replace OF with more generic
> device property / fwnode API?
> 

I didn't find clear documentation on this, the functions in drivers/base/
property.c can be used instead of the of_* (device tree) functions?

As far as I can tell, the device_property_* functions are supposed to be used 
for simple "give me a property for this 'struct device*'" while the fwnode_* 
functions are used as generic equivalent of the of_* functions?

So in this case I can replace 

struct device_node *child_node;
child_node = of_get_next_available_child(pdev->dev.of_node, NULL);

with

struct fwnode_handle *child_node;
child_node = fwnode_get_next_available_child_node(pdev->dev.fwnode, NULL);

and then instead of

ret = of_property_read_u32(child_node, "flash-max-timeout-us",
		   &priv->max_timeout);

use

ret = fwnode_property_read_u32(child_node, "flash-max-timeout-us",
		            &priv->max_timeout);

and finally instead of

init_data.fwnode = of_fwnode_handle(child_node);

I can probably directly do

init_data.fwnode = child_node;

Does that sound correct?

> ...
> 
> > +struct sgm3140 {
> > +       bool enabled;
> > +       struct gpio_desc *flash_gpio;
> > +       struct gpio_desc *enable_gpio;
> > +       struct regulator *vin_regulator;
> > +
> > +       /* current timeout in us */
> > +       u32 timeout;
> > +       /* maximum timeout in us */
> > +       u32 max_timeout;
> > +
> > 
> > +       struct led_classdev_flash fled_cdev;
> 
> I guess it might be slightly better to make it first member of the
> struct (I didn't check but the rationale is to put more often used
> members at the beginning to utilize cachelines).
> 
> > +       struct v4l2_flash *v4l2_flash;
> > +
> > +       struct timer_list powerdown_timer;
> > +};
> 
> ...
> 
> > +static struct sgm3140 *flcdev_to_sgm3140(struct led_classdev_flash
> > *flcdev) +{
> > +       return container_of(flcdev, struct sgm3140, fled_cdev);
> > +}
> 
> ...and this becomes a no-op AFAICS (doesn't mean you need to remove it).
> 
> ...
> 
> > +       struct device_node *child_node;
> > 
> > +       child_node = of_get_next_available_child(pdev->dev.of_node, NULL);
> > 
> > +       ret = of_property_read_u32(child_node, "flash-max-timeout-us",
> > +                                  &priv->max_timeout);
> > 
> > +       init_data.fwnode = of_fwnode_handle(child_node);
> > 
> > +       of_node_put(child_node);
> 
> Device property / fwnode API?
> 
> --
> With Best Regards,
> Andy Shevchenko

Regards
Luca



