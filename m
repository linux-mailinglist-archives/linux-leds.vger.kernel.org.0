Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 408BB12A093
	for <lists+linux-leds@lfdr.de>; Tue, 24 Dec 2019 12:30:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfLXLaM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 24 Dec 2019 06:30:12 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:42114 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726201AbfLXLaL (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 24 Dec 2019 06:30:11 -0500
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id 8FC0DFB03;
        Tue, 24 Dec 2019 12:30:09 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Lwf3d9cYzpal; Tue, 24 Dec 2019 12:30:07 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id 7D7EF40BD8; Tue, 24 Dec 2019 12:30:07 +0100 (CET)
Date:   Tue, 24 Dec 2019 12:30:07 +0100
From:   Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: lm3692x: Allow to set ovp and brigthness mode
Message-ID: <20191224113007.GB23468@bogon.m.sigxcpu.org>
References: <cover.1576499103.git.agx@sigxcpu.org>
 <9c87a17aefbf758d58f199f7046114ee7505a1fa.1576499103.git.agx@sigxcpu.org>
 <3d66b07d-b4c5-43e6-4378-d63cc84b8d43@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d66b07d-b4c5-43e6-4378-d63cc84b8d43@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dan,
I'm a bit confused about the regmap_write -> regmap_update_bits switch
(see below), maybe you can shed some light on it?

On Tue, Dec 17, 2019 at 06:53:45AM -0600, Dan Murphy wrote:
> Guido
> 
> On 12/16/19 6:28 AM, Guido Günther wrote:
> > Overvoltage protection and brightness mode are currently hardcoded
> > as disabled in the driver. Make these configurable via DT.
> 
> Can we split these up to two separate patch series?
> 
> We are adding 2 separate features and if something is incorrect with one of
> the changes it is a bit hard to debug.
> 
> > 
> > Signed-off-by: Guido Günther <agx@sigxcpu.org>
> > ---
> >   drivers/leds/leds-lm3692x.c | 43 +++++++++++++++++++++++++++++++------
> >   1 file changed, 37 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
> > index 8b408102e138..2c084b333628 100644
> > --- a/drivers/leds/leds-lm3692x.c
> > +++ b/drivers/leds/leds-lm3692x.c
> > @@ -114,6 +114,7 @@ struct lm3692x_led {
> >   	struct regulator *regulator;
> >   	int led_enable;
> >   	int model_id;
> > +	u8 boost_ctrl, brightness_ctrl;
> >   };
> >   static const struct reg_default lm3692x_reg_defs[] = {
> > @@ -249,10 +250,7 @@ static int lm3692x_init(struct lm3692x_led *led)
> >   	if (ret)
> >   		goto out;
> > -	ret = regmap_write(led->regmap, LM3692X_BOOST_CTRL,
> > -			LM3692X_BOOST_SW_1MHZ |
> > -			LM3692X_BOOST_SW_NO_SHIFT |
> > -			LM3692X_OCP_PROT_1_5A);
> > +	ret = regmap_write(led->regmap, LM3692X_BOOST_CTRL, led->boost_ctrl);
> >   	if (ret)
> >   		goto out;
> 
> regmap_update_bits

The driver is writing full register values (regmap_write) here as
before, do you want that to change? Likely i'm overlooking something.

> > @@ -268,8 +266,7 @@ static int lm3692x_init(struct lm3692x_led *led)
> >   	if (ret)
> >   		goto out;
> > -	ret = regmap_write(led->regmap, LM3692X_BRT_CTRL,
> > -			LM3692X_BL_ADJ_POL | LM3692X_RAMP_EN);
> > +	ret = regmap_write(led->regmap, LM3692X_BRT_CTRL, led->brightness_ctrl);
> >   	if (ret)
> >   		goto out;
> regmap_update_bits

Same here.

> > @@ -326,6 +323,8 @@ static int lm3692x_probe_dt(struct lm3692x_led *led)
> >   {
> >   	struct fwnode_handle *child = NULL;
> >   	struct led_init_data init_data = {};
> > +	u32 ovp = 0;
> > +	bool exp_mode;
> >   	int ret;
> >   	led->enable_gpio = devm_gpiod_get_optional(&led->client->dev,
> > @@ -350,6 +349,38 @@ static int lm3692x_probe_dt(struct lm3692x_led *led)
> >   		led->regulator = NULL;
> >   	}
> > +	led->boost_ctrl = LM3692X_BOOST_SW_1MHZ |
> > +		LM3692X_BOOST_SW_NO_SHIFT |
> > +		LM3692X_OCP_PROT_1_5A;
> Make this a #define and then it can be reused as a mask for
> regmap_update_bits
> > +	ret = device_property_read_u32(&led->client->dev,
> > +				       "ti,overvoltage-volts", &ovp);
> > +	if (!ret) {
> 
> if (ret)
> 
>     set boost_ctrl to default value since the default is not 0
>
> led->boost_ctrl |= LM3692X_OVP_29V;
> 
> else
> 
>      do case
>

Fixed.

> > +		switch (ovp) {
> > +		case 0:
> > +			break;
> > +		case 22:
> If the value is 21v why is this case 22?  DT binding says 21 is the first
> value

Fixed, also added the 17V for the case where both bits a are 0.

> > +			led->boost_ctrl |= LM3692X_OVP_21V;
> > +			break;
> > +		case 25:
> > +			led->boost_ctrl |= LM3692X_OVP_25V;
> > +			break;
> > +		case 29:
> > +			led->boost_ctrl |= LM3692X_OVP_29V;
> > +			break;
> > +		default:
> > +			dev_err(&led->client->dev, "Invalid OVP %d\n", ovp);
> > +			return -EINVAL;
> > +		}
> > +	}
> > +	dev_dbg(&led->client->dev, "OVP: %dV", ovp);
> > +
> extra debug statement

dropped.

> > +	led->brightness_ctrl = LM3692X_BL_ADJ_POL | LM3692X_RAMP_EN;
> Same comment as before on the #define
> > +	exp_mode = device_property_read_bool(&led->client->dev,
> > +				     "ti,brightness-mapping-exponential");
> > +	dev_dbg(&led->client->dev, "Exponential brightness: %d", exp_mode);
> 
> extra debug statement

dropped.

Cheers and thanks for the comments,
 -- Guido

> 
> Dan
> 
> 
