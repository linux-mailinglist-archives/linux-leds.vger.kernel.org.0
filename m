Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2412AE7EC
	for <lists+linux-leds@lfdr.de>; Tue, 10 Sep 2019 12:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731475AbfIJKWB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Sep 2019 06:22:01 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42527 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbfIJKWB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 Sep 2019 06:22:01 -0400
Received: by mail-wr1-f66.google.com with SMTP id q14so19004207wrm.9
        for <linux-leds@vger.kernel.org>; Tue, 10 Sep 2019 03:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Wpr2coDySs9Rh34jajBcihEANouoWM4tiMrDCeWl8sg=;
        b=OWD1IplSbH+Uj6fRnvAWQMTtgsLhiEt+qYbKjXaLSulXC/QfZK1S8iBbPUxjl80LQs
         Sxa/NOEYbyoMdACAwtywuw45EkqtZ4cwdzmxnQTw9JieI26ywI5teAX/795GB6Jtqmp9
         SK1E4X5R8xry3MoVaEDSWL3tNsjqoxoGYqC+m1t6M9u5PG5TtnU76MQiPPj/ch8FZCVh
         VNAkXR11i4Q+SFgNCBjUbiUoEY9M8+hM44rio0gVfl4Q1Eof5sap2IoUobfy8txXXqGa
         SdF6Z2HV1FVkF11y1n4OqbppwEtKiDW3lebmGQ+6jAoCKHsYYEQQTXBbwSvCj25uPmQ+
         BMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Wpr2coDySs9Rh34jajBcihEANouoWM4tiMrDCeWl8sg=;
        b=Ndo3yt1uleeq29cLwJDCVYh7+32y6hkR5ZeKYF0KIfddWrwpn2XMwjW39OUm6QfCQ9
         ar5y8+PeyNBT8XRvaLsMwmfRka78np/OU7F2tr1pvSZhFYHlMwfodt7auiQdD+3v90RF
         5G1eITVkJ6Rq53impI+Y0QSA7FcA3rkdXfwRjVccs+/y7SFqNjuMKv4uruTo6Zbemewb
         L927wvwAGFOTrrrAYK8AXSH/m9t7ngYe8+orvDaSeW8rcjPDSVNOQm7h13H44iBTr308
         2RO397kmCx/3KkeRVycBcWLXAHPovbO4Ni4HLhosa5IWjGy5zQ1agFAVJjwJMMYdXtgs
         dq2Q==
X-Gm-Message-State: APjAAAWSz2BaF3kwvi1rKfIdk5co39xbJiNFK5x8J+1J2+J931TOqzCU
        D2UK7AGQjLLOqmAP5cquEUdiMg==
X-Google-Smtp-Source: APXvYqzG45USjR48kMX2kVZsXNO4YuCGkE3qBxH6BwrxuV+lwOeTtCvs9XVNlmc/kSobyXOtgJDQdA==
X-Received: by 2002:adf:f04f:: with SMTP id t15mr13262934wro.250.1568110919018;
        Tue, 10 Sep 2019 03:21:59 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id o19sm23744301wro.50.2019.09.10.03.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2019 03:21:58 -0700 (PDT)
Date:   Tue, 10 Sep 2019 11:21:56 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     lee.jones@linaro.org, jingoohan1@gmail.com,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, mark.rutland@arm.com, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 1/2] backlight: lm3630a: add an enable gpio for the HWEN
 pin
Message-ID: <20190910102156.vmprsjebmlphkv34@holly.lan>
References: <20190908203704.30147-1-andreas@kemnade.info>
 <20190908203704.30147-2-andreas@kemnade.info>
 <20190909105729.w5552rtop7rhghy2@holly.lan>
 <20190909221349.46ca5a1f@aktux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190909221349.46ca5a1f@aktux>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Sep 09, 2019 at 10:13:49PM +0200, Andreas Kemnade wrote:
> On Mon, 9 Sep 2019 11:57:29 +0100
> Daniel Thompson <daniel.thompson@linaro.org> wrote:
> 
> > On Sun, Sep 08, 2019 at 10:37:03PM +0200, Andreas Kemnade wrote:
> > > For now just enable it in the probe function to allow i2c
> > > access and disable it on remove. Disabling also means resetting
> > > the register values to default.
> > > 
> > > Tested on Kobo Clara HD.
> > > 
> > > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > > ---
> > >  drivers/video/backlight/lm3630a_bl.c | 18 ++++++++++++++++++
> > >  1 file changed, 18 insertions(+)
> > > 
> > > diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
> > > index b04b35d007a2..3b45a1733198 100644
> > > --- a/drivers/video/backlight/lm3630a_bl.c
> > > +++ b/drivers/video/backlight/lm3630a_bl.c
> > > @@ -12,6 +12,8 @@
> > >  #include <linux/uaccess.h>
> > >  #include <linux/interrupt.h>
> > >  #include <linux/regmap.h>
> > > +#include <linux/gpio/consumer.h>
> > > +#include <linux/gpio.h>
> > >  #include <linux/pwm.h>
> > >  #include <linux/platform_data/lm3630a_bl.h>
> > >  
> > > @@ -48,6 +50,7 @@ struct lm3630a_chip {
> > >  	struct lm3630a_platform_data *pdata;
> > >  	struct backlight_device *bleda;
> > >  	struct backlight_device *bledb;
> > > +	struct gpio_desc *enable_gpio;
> > >  	struct regmap *regmap;
> > >  	struct pwm_device *pwmd;
> > >  };
> > > @@ -506,6 +509,14 @@ static int lm3630a_probe(struct i2c_client *client,
> > >  		return -ENOMEM;
> > >  	pchip->dev = &client->dev;
> > >  
> > > +	pchip->enable_gpio = devm_gpiod_get_optional(&client->dev, "enable",
> > > +						GPIOD_ASIS);  
> > 
> > Initializing GPIOD_ASIS doesn't look right to me.
> > 
> > If you initialize ASIS then the driver must configure the pin as an
> > output... far easier just to set GPIOD_OUT_HIGH during the get.
> > 
> > Note also that the call to this function should also be moved *below*
> > the calls parse the DT.
> > 
> oops, must have forgotten that, and had good luck here.
> > 
> > > +	if (IS_ERR(pchip->enable_gpio)) {
> > > +		rval = PTR_ERR(pchip->enable_gpio);
> > > +		return rval;
> > > +	}
> > > +
> > > +
> > >  	pchip->regmap = devm_regmap_init_i2c(client, &lm3630a_regmap);
> > >  	if (IS_ERR(pchip->regmap)) {
> > >  		rval = PTR_ERR(pchip->regmap);
> > > @@ -535,6 +546,10 @@ static int lm3630a_probe(struct i2c_client *client,
> > >  	}
> > >  	pchip->pdata = pdata;
> > >  
> > > +	if (pchip->enable_gpio) {
> > > +		gpiod_set_value_cansleep(pchip->enable_gpio, 1);  
> > 
> > Not needed, use GPIOD_OUT_HIGH instead.
> > 
> > 
> > > +		usleep_range(1000, 2000);  
> > 
> > Not needed, this sleep is already part of lm3630a_chip_init().
> > 
> you are right.
> > 
> > > +	}
> > >  	/* chip initialize */
> > >  	rval = lm3630a_chip_init(pchip);
> > >  	if (rval < 0) {
> > > @@ -586,6 +601,9 @@ static int lm3630a_remove(struct i2c_client *client)
> > >  	if (rval < 0)
> > >  		dev_err(pchip->dev, "i2c failed to access register\n");
> > >  
> > > +	if (pchip->enable_gpio)
> > > +		gpiod_set_value_cansleep(pchip->enable_gpio, 0);
> > > +  
> > 
> > Is this needed?
> > 
> > This is a remove path, not a power management path, and we have no idea
> > what the original status of the pin was anyway?
> > 
> 
> Looking at Ishdn on page 5 of the datasheet, switching it off everytime
> possible seems not needed. We would need to call chip_init() everytime
> we enable the gpio or live with default values.
> Therefore I did decide to not put it into any power management path.
> But switching it on and not switching it off feels so unbalanced. 

Either the power consumed by the controller when strings aren't lit up
matters, in which case the driver should implement proper power
management or it doesn't matter and changing the pin state isn't needed.

I'm happy with either of the above but this looks like a third way,
where eager users could hack in a bit of extra power management by
forcing drivers to unbind. 


Daniel.
