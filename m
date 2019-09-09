Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08E95ADFD7
	for <lists+linux-leds@lfdr.de>; Mon,  9 Sep 2019 22:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733249AbfIIUOG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Sep 2019 16:14:06 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:57140 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732733AbfIIUOG (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 9 Sep 2019 16:14:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=7S0iKdrC5W7P3u4rFYo6R5dKDWVHbSKL0UCfO8ayAEY=; b=Ca1HsyzD/Rzmy3F/wPAzVKV0jH
        1JibeJWfqCLlaa8vb+7Jrrt7+HIBdqRX4faZ8Lkt+wJBgrSOWjW6uYFJuoF9EnR8uTQR68+4ijb5c
        Nlt25Zh1DQU+BJTX2e7j+hslmzL8KrclN5IqlwazEZ9G0V9ZEH8F0PPTcFMJQ6MBEQDc=;
Received: from p200300ccff0a27001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0a:2700:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1i7Q2o-0005Fh-OY; Mon, 09 Sep 2019 22:13:51 +0200
Date:   Mon, 9 Sep 2019 22:13:49 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     lee.jones@linaro.org, jingoohan1@gmail.com,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, mark.rutland@arm.com, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 1/2] backlight: lm3630a: add an enable gpio for the HWEN
 pin
Message-ID: <20190909221349.46ca5a1f@aktux>
In-Reply-To: <20190909105729.w5552rtop7rhghy2@holly.lan>
References: <20190908203704.30147-1-andreas@kemnade.info>
        <20190908203704.30147-2-andreas@kemnade.info>
        <20190909105729.w5552rtop7rhghy2@holly.lan>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 9 Sep 2019 11:57:29 +0100
Daniel Thompson <daniel.thompson@linaro.org> wrote:

> On Sun, Sep 08, 2019 at 10:37:03PM +0200, Andreas Kemnade wrote:
> > For now just enable it in the probe function to allow i2c
> > access and disable it on remove. Disabling also means resetting
> > the register values to default.
> > 
> > Tested on Kobo Clara HD.
> > 
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > ---
> >  drivers/video/backlight/lm3630a_bl.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> > 
> > diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
> > index b04b35d007a2..3b45a1733198 100644
> > --- a/drivers/video/backlight/lm3630a_bl.c
> > +++ b/drivers/video/backlight/lm3630a_bl.c
> > @@ -12,6 +12,8 @@
> >  #include <linux/uaccess.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/regmap.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/gpio.h>
> >  #include <linux/pwm.h>
> >  #include <linux/platform_data/lm3630a_bl.h>
> >  
> > @@ -48,6 +50,7 @@ struct lm3630a_chip {
> >  	struct lm3630a_platform_data *pdata;
> >  	struct backlight_device *bleda;
> >  	struct backlight_device *bledb;
> > +	struct gpio_desc *enable_gpio;
> >  	struct regmap *regmap;
> >  	struct pwm_device *pwmd;
> >  };
> > @@ -506,6 +509,14 @@ static int lm3630a_probe(struct i2c_client *client,
> >  		return -ENOMEM;
> >  	pchip->dev = &client->dev;
> >  
> > +	pchip->enable_gpio = devm_gpiod_get_optional(&client->dev, "enable",
> > +						GPIOD_ASIS);  
> 
> Initializing GPIOD_ASIS doesn't look right to me.
> 
> If you initialize ASIS then the driver must configure the pin as an
> output... far easier just to set GPIOD_OUT_HIGH during the get.
> 
> Note also that the call to this function should also be moved *below*
> the calls parse the DT.
> 
oops, must have forgotten that, and had good luck here.
> 
> > +	if (IS_ERR(pchip->enable_gpio)) {
> > +		rval = PTR_ERR(pchip->enable_gpio);
> > +		return rval;
> > +	}
> > +
> > +
> >  	pchip->regmap = devm_regmap_init_i2c(client, &lm3630a_regmap);
> >  	if (IS_ERR(pchip->regmap)) {
> >  		rval = PTR_ERR(pchip->regmap);
> > @@ -535,6 +546,10 @@ static int lm3630a_probe(struct i2c_client *client,
> >  	}
> >  	pchip->pdata = pdata;
> >  
> > +	if (pchip->enable_gpio) {
> > +		gpiod_set_value_cansleep(pchip->enable_gpio, 1);  
> 
> Not needed, use GPIOD_OUT_HIGH instead.
> 
> 
> > +		usleep_range(1000, 2000);  
> 
> Not needed, this sleep is already part of lm3630a_chip_init().
> 
you are right.
> 
> > +	}
> >  	/* chip initialize */
> >  	rval = lm3630a_chip_init(pchip);
> >  	if (rval < 0) {
> > @@ -586,6 +601,9 @@ static int lm3630a_remove(struct i2c_client *client)
> >  	if (rval < 0)
> >  		dev_err(pchip->dev, "i2c failed to access register\n");
> >  
> > +	if (pchip->enable_gpio)
> > +		gpiod_set_value_cansleep(pchip->enable_gpio, 0);
> > +  
> 
> Is this needed?
> 
> This is a remove path, not a power management path, and we have no idea
> what the original status of the pin was anyway?
> 

Looking at Ishdn on page 5 of the datasheet, switching it off everytime
possible seems not needed. We would need to call chip_init() everytime
we enable the gpio or live with default values.
Therefore I did decide to not put it into any power management path. But
switching it on and not switching it off feels so unbalanced. 

Regards,
Andreas
