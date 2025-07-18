Return-Path: <linux-leds+bounces-5096-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE4EB0A511
	for <lists+linux-leds@lfdr.de>; Fri, 18 Jul 2025 15:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D820F7BD934
	for <lists+linux-leds@lfdr.de>; Fri, 18 Jul 2025 13:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 733122DC32F;
	Fri, 18 Jul 2025 13:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDLP4QJe"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CEB2D97B4;
	Fri, 18 Jul 2025 13:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752845043; cv=none; b=W3MMxTnN9QQdrA8IugLpdSEJSXx0uWlh0aYJhHJi5WFGBk0MIOJpwU/XIFAKzMonNKjBreqicumt4Jg61HCKVr0kjEFgyZlEdPiZvR2obyn8aTuMCIrv5o3glOsINBedxxc/qVindGyT6yfA3Vts4AOpjYEBvXB2jr6lE00LJgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752845043; c=relaxed/simple;
	bh=L6YBXu9x6pSAB4gABlg8mIrc72K2kdHir/4TsQxtUY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6cqmU0lmVFsuE5v6PGATXMtN8mcmyLVt8+WW6IFU34A6H2Z8iz5LU+JUvN18BRrkkHSJdZhYQzHEAKyxENPrjx/Gmd+M9okYBjRGOGY6pmruKpOw1gCaFuyO/SbhgNHrLtvQt3OqMwuJVVth/9mJt6I/Aub+SGHyKJyccLEjWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDLP4QJe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C56CC4CEEB;
	Fri, 18 Jul 2025 13:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752845042;
	bh=L6YBXu9x6pSAB4gABlg8mIrc72K2kdHir/4TsQxtUY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aDLP4QJe6l6vXRZG1COSN6q9o8Eanm3I3DZDrVbn6NYwBx5dpyJRK+pT/v2Wxslk8
	 ctY96+0uTG23swxTmV4pZZbEaCWiCG36J3j04VZGUrdcd+h51w1iGAw5yO7Zp6lLi/
	 W32OSJzgL8f3v/pdwyT/HZt+/bqvci4e37SjdmWAmfdR7tJAM5IxSEZ0HN9YtTZjK7
	 y2/0Hvbc1fKXRV2CPiCbYwudkKRoWegArEua7sXKUpIrQdAmzkQI7NrKlqjTEKGf4u
	 2X5YnvnBtHsfXOi1Y5PurSsTWaMwyd9fCKWGAFNB7TXvbiiyAuz7/nPLU8iPr2HTBt
	 jQiy4mdHAV1rg==
Date: Fri, 18 Jul 2025 14:23:58 +0100
From: Lee Jones <lee@kernel.org>
To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Cc: "pavel@kernel.org" <pavel@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>
Subject: Re: [PATCH V3 2/2] leds: pwm: Add optional GPIO enable pin support
Message-ID: <20250718132358.GD11056@google.com>
References: <20250703035256.225289-1-Qing-wu.Li@leica-geosystems.com.cn>
 <20250703035256.225289-2-Qing-wu.Li@leica-geosystems.com.cn>
 <20250710093726.GD1431498@google.com>
 <AM9PR06MB7955567B37C06BA7FCB05E22D754A@AM9PR06MB7955.eurprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM9PR06MB7955567B37C06BA7FCB05E22D754A@AM9PR06MB7955.eurprd06.prod.outlook.com>

On Mon, 14 Jul 2025, LI Qingwu wrote:

> 
> > -----Original Message-----
> > From: Lee Jones <lee@kernel.org>
> > Sent: Thursday, July 10, 2025 5:37 PM
> > To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
> > Cc: pavel@kernel.org; robh@kernel.org; krzk+dt@kernel.org;
> > conor+dt@kernel.org; linux-leds@vger.kernel.org; devicetree@vger.kernel.org;
> > linux-kernel@vger.kernel.org; GEO-CHHER-bsp-development
> > <bsp-development.geo@leica-geosystems.com>
> > Subject: Re: [PATCH V3 2/2] leds: pwm: Add optional GPIO enable pin support
> > 
> > This email is not from Hexagon’s Office 365 instance. Please be careful while
> > clicking links, opening attachments, or replying to this email.
> > 
> > 
> > On Thu, 03 Jul 2025, LI Qingwu wrote:
> > 
> > > add support for optional GPIO-based enable pin control to PWM LED driver.
> > > some PWM LED chips have a dedicated enable GPIO. This commit adds the
> > > support to specify such GPIO, activating the pin when LED brightness
> > > is non-zero and deactivating it when off.
> > >
> > > Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
> > > ---
> > >  drivers/leds/leds-pwm.c | 22 ++++++++++++++++++++++
> > >  1 file changed, 22 insertions(+)
> > 
> > Couple of nits.
> > 
> > > diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c index
> > > c73134e7b9514..1397149464b35 100644
> > > --- a/drivers/leds/leds-pwm.c
> > > +++ b/drivers/leds/leds-pwm.c
> > > @@ -17,6 +17,7 @@
> > >  #include <linux/err.h>
> > >  #include <linux/pwm.h>
> > >  #include <linux/slab.h>
> > > +#include <linux/gpio/consumer.h>
> > >
> > >  struct led_pwm {
> > >       const char      *name;
> > > @@ -29,6 +30,7 @@ struct led_pwm_data {
> > >       struct led_classdev     cdev;
> > >       struct pwm_device       *pwm;
> > >       struct pwm_state        pwmstate;
> > > +     struct gpio_desc        *enable_gpio;
> > >       unsigned int            active_low;
> > >  };
> > >
> > > @@ -51,6 +53,9 @@ static int led_pwm_set(struct led_classdev *led_cdev,
> > >       if (led_dat->active_low)
> > >               duty = led_dat->pwmstate.period - duty;
> > >
> > > +     gpiod_set_value_cansleep(led_dat->enable_gpio,
> > > +                              brightness == LED_OFF ? 0 : 1);
> > 
> > Put this on one line.
> > 
> 
> putting it on one line would result in 87 columns as you noted. 
> I was following the 80-column guideline from
> Documentation/process/coding-style.rst, which states "The preferred 
> limit on the length of a single line is 80 columns."
> Additionally, I used clang-format to format the code, which automatically 
> split this line to stay within the 80-column limit. The current formatting 
> follows the kernel's .clang-format configuration.

The 80-char limit was penned by the ancient Egyptians.  We have 4k
monitors now.  Feel free to use up to 100-chars in order to prevent
these silly line-wraps in this subsystem.

> > > +
> > >       led_dat->pwmstate.duty_cycle = duty;
> > >       /*
> > >        * Disabling a PWM doesn't guarantee that it emits the inactive level.
> > > @@ -132,6 +137,23 @@ static int led_pwm_add(struct device *dev, struct
> > led_pwm_priv *priv,
> > >               break;
> > >       }
> > >
> > > +     /* Claim the GPIO as ASIS and set the value
> > 
> > Explain what ASIS is please.
> > 
> > > +      * later on to honor the different default states
> > > +      */
> > 
> > Use proper multi-line comments please.
> > 
> You're absolutely right about the multi-line comment format, I'll fix that.
> 
> > > +     led_data->enable_gpio =
> > > +             devm_fwnode_gpiod_get(dev, fwnode, "enable",
> > GPIOD_ASIS,
> > > + NULL);
> > 
> > One line please.
> > 
> 
> result in 96 columns, do you really want that?
> > > +
> > 
> > Drop this line.
> > 
> > > +     /* enable_gpio is optional */
> > 
> > Comments start with a capital letter.
> > 
> > Place this comment inside the second if () statement.
> > 
> > > +     if (IS_ERR(led_data->enable_gpio)) {
> > > +             if (PTR_ERR(led_data->enable_gpio) == -ENOENT)
> > > +                     led_data->enable_gpio = NULL;
> > > +             else
> > > +                     return PTR_ERR(led_data->enable_gpio);
> > > +     }
> > > +
> > > +     gpiod_direction_output(led_data->enable_gpio,
> > > +                            !!led_data->cdev.brightness);
> > 
> > One line.
> 
> result in 84 columns.

Great!  16 left to go!

[...]

-- 
Lee Jones [李琼斯]

