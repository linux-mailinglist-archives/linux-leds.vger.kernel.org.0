Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB11B0B19
	for <lists+linux-leds@lfdr.de>; Thu, 12 Sep 2019 11:18:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbfILJSS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 12 Sep 2019 05:18:18 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38892 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730458AbfILJSS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 12 Sep 2019 05:18:18 -0400
Received: by mail-wr1-f66.google.com with SMTP id l11so27575380wrx.5
        for <linux-leds@vger.kernel.org>; Thu, 12 Sep 2019 02:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Nabyzt7ZNfI2GC8vuMbUvyEMGGfNet5Q3cJhBhtdhB4=;
        b=Wq0rUCRG5tJLLgE6MWPhkRG8ybUxTrM0lLW+DTbMHhnduPs7tV/5JWHTc2x7XTGY21
         ItmLWpSnDhcJDB6VVGUmiJhMPH/c4B9xbd7VOYSrHe+N2TorZ3VdTvo+SvMitkqqCJSD
         9MO7We6vXQC74VJaFERbF4w/AkH55BatgfBlBZz6hs3zgBl6Lp9mtIFMC4ASVrZxVrV0
         cAx8XCw9PFir8uyHo5eF8xAEBHDffovVSF35r40o8Q7T26veq+aaExdSiJDngIESpW3O
         B2BMW70hlGwx4jxxO9tNVFhm21OTquM4bhXwGbqDvWmNCda5RR1OEUWQJJWB7n3qgMnU
         0FtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Nabyzt7ZNfI2GC8vuMbUvyEMGGfNet5Q3cJhBhtdhB4=;
        b=IsYR0MtDTkPsMFZmh727VxV0WDVIJnM9CeDFNl8w65PGI9MOj9vZU1ngxdK9v8sjUS
         mXy8p9jSBN/Qmtuwad+F2x2o/Obs8mFaMZaAtzaOOczDReHX2ThiT0Cak6fPNPTBGsNJ
         lBSvm+A8f/62lwtHmgkbERTF8JKVr+tFKR8/XNYgy6M5v7LFudR3W2QMKZHzDMCCnFu+
         VZupnUpIdaMlAxYg2AZdB8WZh3I2HqJDwGHcSq36hwgYjE7bMuKLTNeKjJUZLS34Jx6M
         HE022eCpFwFtA3wZ1oMbCzapAZymUFE51pBAHcCUMJIM9BA+8j/3OS7MsJY0lOqjk1fc
         0Zyw==
X-Gm-Message-State: APjAAAWyL9nV19oy4mTomF50g1ANiUDFtYGMixHKjY8PaJ8xPPgyT+6o
        mul06k8G2ky7pksUP+tcck82yypUMcyRtw==
X-Google-Smtp-Source: APXvYqxCGCU66UuCueEY0dHWk91IVAe9nVu64XZCj5O1ESR1clrbZ/EdxDXjvUOa4sFQtdLH0hqStQ==
X-Received: by 2002:a05:6000:1632:: with SMTP id v18mr15980991wrb.233.1568279894345;
        Thu, 12 Sep 2019 02:18:14 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id x17sm5359764wmj.19.2019.09.12.02.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 02:18:13 -0700 (PDT)
Date:   Thu, 12 Sep 2019 10:18:11 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Andreas Kemnade <andreas@kemnade.info>, lee.jones@linaro.org,
        jingoohan1@gmail.com, jacek.anaszewski@gmail.com, pavel@ucw.cz,
        robh+dt@kernel.org, mark.rutland@arm.com, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v2 2/2] backlight: lm3630a: add an enable gpio for the
 HWEN pin
Message-ID: <20190912091811.evlmeeuoai6phy3l@holly.lan>
References: <20190910212909.18095-1-andreas@kemnade.info>
 <20190910212909.18095-3-andreas@kemnade.info>
 <20190911102533.not4ta3xwgm6bhjo@holly.lan>
 <a3f10318-11f4-3b78-47e5-d9add8a46791@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3f10318-11f4-3b78-47e5-d9add8a46791@ti.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Sep 11, 2019 at 01:48:36PM -0500, Dan Murphy wrote:
> 
> On 9/11/19 5:25 AM, Daniel Thompson wrote:
> > On Tue, Sep 10, 2019 at 11:29:09PM +0200, Andreas Kemnade wrote:
> > > For now just enable it in the probe function to allow i2c
> > > access. Disabling also means resetting the register values
> > > to default and according to the datasheet does not give
> > > power savings
> > > 
> > > Tested on Kobo Clara HD.
> > > 
> > > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > > ---
> > > changes in v2:
> > > - simplification
> > > - correct gpio direction initialisation
> > > 
> > >   drivers/video/backlight/lm3630a_bl.c | 10 ++++++++++
> > >   1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
> > > index 8f84f3684f04..9d0639d4202d 100644
> > > --- a/drivers/video/backlight/lm3630a_bl.c
> > > +++ b/drivers/video/backlight/lm3630a_bl.c
> > > @@ -12,6 +12,8 @@
> > >   #include <linux/uaccess.h>
> > >   #include <linux/interrupt.h>
> > >   #include <linux/regmap.h>
> > > +#include <linux/gpio/consumer.h>
> > > +#include <linux/gpio.h>
> > Nitpicking... but I don't think linux/gpio.h is used anymore.
> > 
> > 
> > >   #include <linux/pwm.h>
> > >   #include <linux/platform_data/lm3630a_bl.h>
> > > @@ -48,6 +50,7 @@ struct lm3630a_chip {
> > >   	struct lm3630a_platform_data *pdata;
> > >   	struct backlight_device *bleda;
> > >   	struct backlight_device *bledb;
> > > +	struct gpio_desc *enable_gpio;
> > >   	struct regmap *regmap;
> > >   	struct pwm_device *pwmd;
> > >   };
> > > @@ -535,6 +538,13 @@ static int lm3630a_probe(struct i2c_client *client,
> > >   	}
> > >   	pchip->pdata = pdata;
> > > +	pchip->enable_gpio = devm_gpiod_get_optional(&client->dev, "enable",
> > > +						GPIOD_OUT_HIGH);
> > > +	if (IS_ERR(pchip->enable_gpio)) {
> > > +		rval = PTR_ERR(pchip->enable_gpio);
> > > +		return rval;
> 
> the enable gpio is optional so if it fails you log the error and move on

Isn't the effect of this to cope gracefully if enable-gpios is absent
but to fail with an error if enable-gpios exists and is broken. I
thought this code pattern is fairly common.


> Also on driver removal did you want to set the GPIO to low to disable the
> device to save power?

As it happens I offered to opposite feedback for v1:
https://lists.freedesktop.org/archives/dri-devel/2019-September/234918.html

Basically if the power matters then we should take care of things in the
PM code path (which for this driver means reacting properly to
suspended flag when updating the brightness). If the power doesn't matter
then, given unallocated GPIO pins are in an unknown state anyway, there
is no point in tidying up because we don't know what value to restore.


Daniel.
