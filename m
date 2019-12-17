Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCED122D89
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2019 14:54:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728602AbfLQNye (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Dec 2019 08:54:34 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34775 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728584AbfLQNyd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 Dec 2019 08:54:33 -0500
Received: by mail-wr1-f66.google.com with SMTP id t2so11419822wrr.1
        for <linux-leds@vger.kernel.org>; Tue, 17 Dec 2019 05:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=oA8lLtw5+Ki0rvk2E5DHDZT8Xzrj3ly5MFjUCZJfvp4=;
        b=lTG+PpfFsBwem7LWNxasDI84APR3q/FRpiSMZtA97AEzPrTw2ZyGUJQg/2FxOcmzPj
         mR8fMTv8VyALWzwIWUVsBn08FAh1PZukJmgC3lBgktyX0rejOrHDGoS+brxtqiakPnkw
         +Lp5ryB6ZwG4GA7LfhEGedR1eicJaEWe+LMu4udE1xyaJyW9uUIpiZsMoP6UMmVWXSTX
         pa5+4HCL7T03BoJ5cUrNB0Dol/uKTrsHHawoIZQSQ9Tgj1fhu8JpdmCFKDMsIeTjeWop
         bSBopk1rH/KXWuS/YL9zR1B30nDVAx0UFUfY375pnL/CKYQhEI+hIlOXnU5xyuBlv5uz
         bVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=oA8lLtw5+Ki0rvk2E5DHDZT8Xzrj3ly5MFjUCZJfvp4=;
        b=LxQWsjbk3RSorwfYjOk1fWFP/FSQah5maEdJDCvW7q02m0mT1n1Mmn8dBDug1q0k8M
         ICGgqW6usymZlF/7vY0ZaP4BnpetS4xMTsIhvRAeb4b/Sb7F1/kpKaF5Yo1mJqqHnpyg
         ptHsL62xThNMAyFg0ulJXmnkOvPihpGJ8kbWbAFbs8vj9eTu3YUgQrbP36moYgdJqu1f
         fmEOZmZ0zcBGIEg648ARpiLvqjkzmADQTUMFikVIV/wPIx8WAQVJU0akYtV0ZHi3Mcvr
         BF75fT35D9k7P7XjnslYHBkmmijJUzyfstGd8t0n3wTQ7fRYtWUYIetJ11wf0GQ73Aah
         amEA==
X-Gm-Message-State: APjAAAX9+kD15PLxJJf+v91eO+sTLVaby2HrT/1KNtfgF7doDX278ZsG
        fX+AI+29PDCN5b0HgkWt846+Bg==
X-Google-Smtp-Source: APXvYqwHiX7Jsxay7dET6g2LF2XE9E9hwjKYARcptPGb5BljEooR+jLCasy9A33y/rTtfMlkvAcXww==
X-Received: by 2002:adf:f80c:: with SMTP id s12mr36904115wrp.1.1576590871292;
        Tue, 17 Dec 2019 05:54:31 -0800 (PST)
Received: from dell ([2.27.35.132])
        by smtp.gmail.com with ESMTPSA id x10sm25415862wrp.58.2019.12.17.05.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 05:54:30 -0800 (PST)
Date:   Tue, 17 Dec 2019 13:54:30 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "corbet@lwn.net" <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "noralf@tronnes.org" <noralf@tronnes.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v6 05/15] mfd: bd71828: Support ROHM BD71828 PMIC - core
Message-ID: <20191217135430.GM18955@dell>
References: <cover.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
 <252de5646fedfec7c575269843a47091fe199c79.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
 <20191216164641.GC18955@dell>
 <5593db6b3328c0a1a7069d839f5c777b4b3822b6.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5593db6b3328c0a1a7069d839f5c777b4b3822b6.camel@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 17 Dec 2019, Vaittinen, Matti wrote:

> Hello Lee,
> 
> On Mon, 2019-12-16 at 16:46 +0000, Lee Jones wrote:
> > On Wed, 11 Dec 2019, Matti Vaittinen wrote:
> > 
> > > BD71828GW is a single-chip power management IC for battery-powered
> > > portable
> > > devices. The IC integrates 7 buck converters, 7 LDOs, and a 1500 mA
> > > single-cell linear charger. Also included is a Coulomb counter, a
> > > real-time
> > > clock (RTC), 3 GPO/regulator control pins, HALL input and a 32.768
> > > kHz
> > > clock gate.
> > > 
> > > Add MFD core driver providing interrupt controller facilities and
> > > i2c
> > > access to sub device drivers.
> > > 
> > > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > > ---
> > > 
> > > Changes since v5:
> > > - No changes
> > > 
> > >  drivers/mfd/Kconfig              |  15 ++
> > >  drivers/mfd/Makefile             |   2 +-
> > >  drivers/mfd/rohm-bd71828.c       | 319 +++++++++++++++++++++++
> > >  include/linux/mfd/rohm-bd71828.h | 425
> > > +++++++++++++++++++++++++++++++
> > >  include/linux/mfd/rohm-generic.h |   1 +
> > >  5 files changed, 761 insertions(+), 1 deletion(-)
> > >  create mode 100644 drivers/mfd/rohm-bd71828.c
> > >  create mode 100644 include/linux/mfd/rohm-bd71828.h
> > 
> > Couple of small nits.  Once fixed, please apply my:
> > 
> > For my own reference:
> >   Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> > 
> > > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > > index 420900852166..c3c9432ef51c 100644
> > > --- a/drivers/mfd/Kconfig
> > > +++ b/drivers/mfd/Kconfig
> > > @@ -1906,6 +1906,21 @@ config MFD_ROHM_BD70528
> > >  	  10 bits SAR ADC for battery temperature monitor and 1S
> > > battery
> > >  	  charger.
> > >  
> > > +config MFD_ROHM_BD71828
> > > +	tristate "ROHM BD71828 Power Management IC"
> > > +	depends on I2C=y
> > > +	depends on OF
> > > +	select REGMAP_I2C
> > > +	select REGMAP_IRQ
> > > +	select MFD_CORE
> > > +	help
> > > +	  Select this option to get support for the ROHM BD71828 Power
> > > +	  Management IC. BD71828GW is a single-chip power management IC
> > > for
> > > +	  battery-powered portable devices. The IC integrates 7 buck
> > > +	  converters, 7 LDOs, and a 1500 mA single-cell linear charger.
> > > +	  Also included is a Coulomb counter, a real-time clock (RTC),
> > > and
> > > +	  a 32.768 kHz clock gate.
> > > +
> > >  config MFD_STM32_LPTIMER
> > >  	tristate "Support for STM32 Low-Power Timer"
> > >  	depends on (ARCH_STM32 && OF) || COMPILE_TEST
> > > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > > index aed99f08739f..ca2d55c679c5 100644
> > > --- a/drivers/mfd/Makefile
> > > +++ b/drivers/mfd/Makefile
> > > @@ -252,6 +252,6 @@ obj-$(CONFIG_MFD_MXS_LRADC)     += mxs-lradc.o
> > >  obj-$(CONFIG_MFD_SC27XX_PMIC)	+= sprd-sc27xx-spi.o
> > >  obj-$(CONFIG_RAVE_SP_CORE)	+= rave-sp.o
> > >  obj-$(CONFIG_MFD_ROHM_BD70528)	+= rohm-bd70528.o
> > > +obj-$(CONFIG_MFD_ROHM_BD71828)	+= rohm-bd71828.o
> > >  obj-$(CONFIG_MFD_ROHM_BD718XX)	+= rohm-bd718x7.o
> > >  obj-$(CONFIG_MFD_STMFX) 	+= stmfx.o
> > > -
> > 
> > Nit: This is an unrelated change and should not really be in this
> > patch.
> 
> Ok. Will get rid of it.
> 
> > 
> > > diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-
> > > bd71828.c
> > > new file mode 100644
> > > index 000000000000..7f445d699fd9
> > > --- /dev/null
> > > +++ b/drivers/mfd/rohm-bd71828.c
> > > @@ -0,0 +1,319 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +//
> > > +// Copyright (C) 2019 ROHM Semiconductors
> > > +//
> > > +// ROHM BD71828 PMIC driver
> > > +
> 
> //snip
> 
> > > +
> > > +static struct i2c_driver bd71828_drv = {
> > > +	.driver = {
> > > +		.name = "rohm-bd71828",
> > > +		.of_match_table = bd71828_of_match,
> > > +	},
> > > +	.probe_new = &bd71828_i2c_probe,
> > > +};
> > > +
> > 
> > Nit: You can remove this line.
> 
> Will do.
> 
> > 
> > > +module_i2c_driver(bd71828_drv);
> > > +
> > > +MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > > ");
> > > +MODULE_DESCRIPTION("ROHM BD71828 Power Management IC driver");
> > > +MODULE_LICENSE("GPL");
> > 
> > This does not match the header.
> 
> How is that? This is what is stated in module.h for the 
> MODULE_LICENSE:
> 
> /*
>  * The following license idents are currently accepted as indicating
> free
>  * software modules
>  *
>  *	"GPL"				[GNU Public License v2]
>  *	"GPL v2"			[GNU Public License v2]
>  *	"GPL and additional rights"	[GNU Public License v2 rights
> and more]
>  *	"Dual BSD/GPL"			[GNU Public License v2
>  *					 or BSD license choice]
>  *	"Dual MIT/GPL"			[GNU Public License v2
>  *					 or MIT license choice]
>  *	"Dual MPL/GPL"			[GNU Public License v2
>  *					 or Mozilla license choice]
>  *
>  * The following other idents are available
>  *
>  *	"Proprietary"			[Non free products]
>  *
>  * Both "GPL v2" and "GPL" (the latter also in dual licensed strings)
> are
>  * merely stating that the module is licensed under the GPL v2, but are
> not
>  * telling whether "GPL v2 only" or "GPL v2 or later". The reason why
> there
>  * are two variants is a historic and failed attempt to convey more
>  * information in the MODULE_LICENSE string. For module loading the
>  * "only/or later" distinction is completely irrelevant and does
> neither
>  * replace the proper license identifiers in the corresponding source
> file
>  * nor amends them in any way. The sole purpose is to make the
>  * 'Proprietary' flagging work and to refuse to bind symbols which are
>  * exported with EXPORT_SYMBOL_GPL when a non free module is loaded.
>  *
>  * In the same way "BSD" is not a clear license information. It merely
>  * states, that the module is licensed under one of the compatible BSD
>  * license variants. The detailed and correct license information is
> again
>  * to be found in the corresponding source files.
>  *
>  * There are dual licensed components, but when running with Linux it
> is the
>  * GPL that is relevant so this is a non issue. Similarly LGPL linked
> with GPL
>  * is a GPL combined work.
>  *
>  * This exists for several reasons
>  * 1.	So modinfo can show license info for users wanting to vet their
> setup
>  *	is free
>  * 2.	So the community can ignore bug reports including proprietary
> modules
>  * 3.	So vendors can do likewise based on their own policies
>  */
> #define MODULE_LICENSE(_license) MODULE_INFO(license, _license)
> 
> I have no objections on changing the license if needed but can you
> please tell me what is Ok combos then - I am having hard time when
> trying to select licenses which are acceptable for all.

If you have this in your header:

  GPL-2.0-only

Your MODULE tags should read:

MODULE_LICENSE("GPL v2");

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
