Return-Path: <linux-leds+bounces-5393-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A84B4427F
	for <lists+linux-leds@lfdr.de>; Thu,  4 Sep 2025 18:17:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53D7E1897EDB
	for <lists+linux-leds@lfdr.de>; Thu,  4 Sep 2025 16:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F73A222593;
	Thu,  4 Sep 2025 16:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHC2BBtu"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DF52F85B;
	Thu,  4 Sep 2025 16:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757002657; cv=none; b=rhcAktAJACFgoJSpLxIHAeccSE+jF5ctd4KroNZRinXZTJg7ab0vZhgCnjOCKUmUPandPr3oWYEQjvybdoknTAAAwDUUI4eYf5ju69+71tG4c+1kDXlRifOosUgjiMMgQR9stuux0BxuX4Yt5gbkBwaF73nhtRqMugueGMMUhYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757002657; c=relaxed/simple;
	bh=aS4m+j4x0Lbp5L5OTCA58QWhFR0XSf+Gnc/huuxfs5E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=avG9nvbyQmcjv0yhwBYnQpcX1+t19h0i3vI+W7Fdya6qILKuvPSTrprwPXtXXIlwrUzkz816dzlHqMnXCcRisYBDnzj8GSjO67VcFYBPAe+sICmWvFyKAkU4ivr+nOL5PLl6YbsiZwjJ/y6I60hftdCItB8lsCOGDkBzsi6X4v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHC2BBtu; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-32bab30eefbso500979a91.1;
        Thu, 04 Sep 2025 09:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757002654; x=1757607454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvIGNWKLCjQ2uahB1o048h1iG+G/TvRCcRw5Y64YDV4=;
        b=dHC2BBtualEASgblDx023jxNTxO87COXGTauZmWSO/saXi5JR074C/akuYTcFh30RU
         /IlwEYAwgmfwWIFQZCARZG/o7mUMdX5OuU4KqiG7ULw5qP56TNEDNWgkVyvms4A+RJDB
         enoVHG6XZz03mrpfAEJ8aHCqCI/MSq5823eOv9zXjRR0NMb2G3i0mo6fErUFnaGfZrmU
         WHAhS9/U8M30JC1+6SNzq5fQacF89IZbSgmkNdhAD5HOCK2XxdTUNda6g4UCL8ehIr4R
         9mMeJj6vM3998+ArktZLn6dQKY/2OCA/pTgvWZnwAcGuvj0Nq22c+hbLD9uIUXOAAwi9
         Upaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757002654; x=1757607454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yvIGNWKLCjQ2uahB1o048h1iG+G/TvRCcRw5Y64YDV4=;
        b=EUJqX7WpjozopVTANqO8w0kd0u453zoq2n/d33hSuU6sTIrKNglCDfCFWGZgjemcZf
         u4bmVh/YSoblvttkMK1mcelwh0WIWRStjl4xCvCTLjPeVZCFDXAU8Rk33Z6zg36xSSbS
         /5JbKj3GVS+ALB9nOXiMoyT1PU7OocWjrwo2/WJEJIn1UWmj86jlcn0s27Tk/Yqn/vb5
         cjnleQbFd+2s9xTbnlsrlR8VcgF4l0BrYa7GiS3SdkR86cnrhMRmlYp+sVSsKcyOHPhE
         0HQyR7MCIPjXduXlsG2pJJ8ADIeo+U1ESBELfO1Sr7Jv5ay+gYgUIl5/9ygRo6+p9toU
         rOkw==
X-Forwarded-Encrypted: i=1; AJvYcCVjDbLnyinfg1gR6gKNR/ccsna7BaPSFGDnSXSVwtdyL6MS8KfFRF/9ZYxIlPCjGqy9HxcehCJ0/0mjVw==@vger.kernel.org, AJvYcCWGlVPf70QCNz+qGmGJ0a/+tmQfEUW3Xv4S7cQHWytOoKVpZcEv/EdkxWHzXxYVIeRdGchPpAUm6UU/@vger.kernel.org, AJvYcCWW6gw1HzIXidu63Xqp0he4LZvu8UOKwRqag8y78GSLhS93Y3r2wiw3Wj8IGqYom9B7SAQZjXCc9cAmCrh0@vger.kernel.org, AJvYcCWrl1x/tq8R1GZrKsjZHaSUoBjocCmZoKbclq98HatoIDZDjJO4ZxYx9KHmqJZnHtOl+4EhpLba9xm3@vger.kernel.org
X-Gm-Message-State: AOJu0YwmVUqIiMRd9nEWE/HcsiWFwJCVU7xGRDRdpeKvZ8XEPIw2ZUC9
	90osOmy80QsKwx5yZ0A2dDptVujGkZljGGEr0gO7YrnA+wpfyFvmmGiYjmBdYQ==
X-Gm-Gg: ASbGncupyjoAOAUx7yiSZEixHW+TE2QXEhRQsepjMti+GHA2vrK2H8sZn/7kkiLAKZ5
	k0w7YcF1bly4FZaZBhmVZvhMhjmUPB8kirl6fvxkDCAf7j0TKFQ90RcGk06xR+EUAMY2f/qoYyP
	wQI4hF1/Y1ysHiLgasp8jMFuO/k3BigmLfHepunr2Z13q3jvHH7zbRiK1+0qhMjNDtUWpYfA1o4
	Eb9dixb6OJ4Z4fowo2VzKrOdMapefnOE2TU13Xw4WNH3EJhMQgg5CJjBE/tyiNBn+beaXfkB3XC
	rGUSFPasejC5NbYh/g8Oar27R5sXdsstQ+TBBwal0BuA4SzjB71YqkknMDvXe4S0TdE6NoFnoPk
	3PELvgFnQstipWGsK5vpQrgQUy//31Fj3bwrFxTI4/HtNuhpw8HeYtg==
X-Google-Smtp-Source: AGHT+IGWLWlrRe5uglr/JGHLmTi9vnmsy+GoA2XmVyOvmMoBaVi+ynMunWIN2yeQbyLvv2l7GNE2Bg==
X-Received: by 2002:a17:90b:1fc3:b0:329:8520:cee7 with SMTP id 98e67ed59e1d1-32bbdfed9ecmr216517a91.14.1757002654255;
        Thu, 04 Sep 2025 09:17:34 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([58.187.51.224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32b617b104csm5149107a91.21.2025.09.04.09.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:17:33 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org
Cc: pavel@kernel.org,
	rdunlap@infradead.org,
	christophe.jaillet@wanadoo.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v13 RESEND 2/4] leds: add basic support for TI/National Semiconductor LP5812 LED Driver
Date: Thu,  4 Sep 2025 23:17:28 +0700
Message-Id: <20250904161728.24020-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250902121130.GK2163762@google.com>
References: <20250902121130.GK2163762@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 2 Sep 2025, Lee Jones wrote:

> On Mon, 18 Aug 2025, Nam Tran wrote:
> 
> > The LP5812 is a 4x3 matrix RGB LED driver with an autonomous animation
> > engine and time-cross-multiplexing (TCM) support for up to 12 LEDs or
> > 4 RGB LEDs. Each LED can be configured through the related registers
> > to realize vivid and fancy lighting effects.
> > 
> > This patch adds minimal driver support for the LP5812, implementing
> > only the essential functionality: I2C communication with the device,
> > LED registration, brightness control in manual mode, and basic sysfs
> > interfaces for LED configuration and fault monitoring.
> > 
> > Signed-off-by: Nam Tran <trannamatk@gmail.com>
> > ---
> >  MAINTAINERS                    |    4 +
> >  drivers/leds/rgb/Kconfig       |   13 +
> >  drivers/leds/rgb/Makefile      |    1 +
> >  drivers/leds/rgb/leds-lp5812.c | 1086 ++++++++++++++++++++++++++++++++
> >  drivers/leds/rgb/leds-lp5812.h |  164 +++++
> >  5 files changed, 1268 insertions(+)
> >  create mode 100644 drivers/leds/rgb/leds-lp5812.c
> >  create mode 100644 drivers/leds/rgb/leds-lp5812.h
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 99512777b890..c2e1c02e206d 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -24828,6 +24828,10 @@ M:	Nam Tran <trannamatk@gmail.com>
> >  L:	linux-leds@vger.kernel.org
> >  S:	Maintained
> >  F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
> > +F:	drivers/leds/rgb/Kconfig
> > +F:	drivers/leds/rgb/Makefile
> > +F:	drivers/leds/rgb/leds-lp5812.c
> > +F:	drivers/leds/rgb/leds-lp5812.h
> >  
> >  TEXAS INSTRUMENTS' LB8864 LED BACKLIGHT DRIVER
> >  M:	Alexander Sverdlin <alexander.sverdlin@siemens.com>
> > diff --git a/drivers/leds/rgb/Kconfig b/drivers/leds/rgb/Kconfig
> > index 222d943d826a..28ef4c487367 100644
> > --- a/drivers/leds/rgb/Kconfig
> > +++ b/drivers/leds/rgb/Kconfig
> > @@ -26,6 +26,19 @@ config LEDS_KTD202X
> >  	  To compile this driver as a module, choose M here: the module
> >  	  will be called leds-ktd202x.
> >  
> > +config LEDS_LP5812
> > +	tristate "LED support for Texas Instruments LP5812"
> > +	depends on I2C
> > +	help
> > +	  If you say Y here you get support for TI LP5812 LED driver.
> > +	  The LP5812 is a 4x3 matrix RGB LED driver with autonomous
> > +	  animation engine control.
> > +
> > +	  To compile this driver as a module, choose M here: the
> > +	  module will be called leds-lp5812.
> > +
> > +	  If unsure, say N.
> > +
> >  config LEDS_NCP5623
> >  	tristate "LED support for NCP5623"
> >  	depends on I2C
> > diff --git a/drivers/leds/rgb/Makefile b/drivers/leds/rgb/Makefile
> > index a501fd27f179..be45991f63f5 100644
> > --- a/drivers/leds/rgb/Makefile
> > +++ b/drivers/leds/rgb/Makefile
> > @@ -2,6 +2,7 @@
> >  
> >  obj-$(CONFIG_LEDS_GROUP_MULTICOLOR)	+= leds-group-multicolor.o
> >  obj-$(CONFIG_LEDS_KTD202X)		+= leds-ktd202x.o
> > +obj-$(CONFIG_LEDS_LP5812)		+= leds-lp5812.o
> >  obj-$(CONFIG_LEDS_NCP5623)		+= leds-ncp5623.o
> >  obj-$(CONFIG_LEDS_PWM_MULTICOLOR)	+= leds-pwm-multicolor.o
> >  obj-$(CONFIG_LEDS_QCOM_LPG)		+= leds-qcom-lpg.o
> > diff --git a/drivers/leds/rgb/leds-lp5812.c b/drivers/leds/rgb/leds-lp5812.c
> > new file mode 100644
> > index 000000000000..fb5ea449761a
> > --- /dev/null
> > +++ b/drivers/leds/rgb/leds-lp5812.c
> > @@ -0,0 +1,1086 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * LP5812 LED driver
> > + *
> > + * Copyright (C) 2025 Texas Instruments
> > + *
> > + * Author: Jared Zhou <jared-zhou@ti.com>
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/i2c.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/led-class-multicolor.h>
> > +#include <linux/leds.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/sysfs.h>
> > +#include <linux/types.h>
> > +
> > +#include "leds-lp5812.h"
> > +
> > +static int lp5812_write(struct lp5812_chip *chip, u16 reg, u8 val)
> > +{
> > +	struct device *dev = &chip->client->dev;
> > +	struct i2c_msg msg;
> > +	u8 buf[2];
> > +	u8 extracted_bits;
> 
> What bits are being extracted?
> 
> addr_low?
> 

According to the LP5812 datasheet (page 24, I2C Data Format section),
the first byte includes 5 bits for the chip address, the next 2 bits
are register address bits [9:8], and the last bit is the R/W flag.
Therefore, I need to extract bits [9:8] from the register address and
place them into bits [2:1] of the first byte. I'll also update the
variable name to make this clearer.

> > +	int ret;
> > +
> > +	/* Extract register address bits 9 and 8 for Address Byte 1 */
> > +	extracted_bits = (reg >> 8) & 0x03;
> 
> Define all magic numbers throughout.  This includes MASKs and SHIFTs.
> 

I'll replace the inline constants with proper macros.

> > +	/* Prepare payload: Address Byte 2 (bits [7:0]) and value to write */
> > +	buf[0] = (u8)(reg & 0xFF);
> > +	buf[1] = val;
> > +
> > +	/* Construct I2C message for a write operation */
> > +	msg.addr = (chip->client->addr << 2) | extracted_bits;
> > +	msg.flags = 0;
> > +	msg.len = sizeof(buf);
> > +	msg.buf = buf;
> > +
> > +	ret = i2c_transfer(chip->client->adapter, &msg, 1);
> 
> 	if (ret == 1)
> 		return 0;
> 
> 	dev_err(dev, "I2C write error, ret=%d\n", ret);
> 	return ret < 0 ? ret : -EIO;
> 
>

This logic is cleaner. I will update it.

> > +	if (ret != 1) {
> > +		dev_err(dev, "I2C write error, ret=%d\n", ret);
> > +		ret = ret < 0 ? ret : -EIO;
> > +	} else {
> > +		ret = 0;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static int lp5812_read(struct lp5812_chip *chip, u16 reg, u8 *val)
> > +{
> > +	struct device *dev = &chip->client->dev;
> > +	struct i2c_msg msgs[2];
> > +	u8 ret_val;
> > +	u8 extracted_bits;
> > +	u8 converted_reg;
> > +	int ret;
> > +
> > +	/* Extract register address bits 9 and 8 for Address Byte 1 */
> > +	extracted_bits = (reg >> 8) & 0x03;
> > +
> > +	/* Lower 8 bits go in Address Byte 2 */
> > +	converted_reg = (u8)(reg & 0xFF);
> > +
> > +	/* Prepare I2C write message to set register address */
> > +	msgs[0].addr = (chip->client->addr << 2) | extracted_bits;
> > +	msgs[0].flags = 0;
> > +	msgs[0].len = 1;
> > +	msgs[0].buf = &converted_reg;
> > +
> > +	/* Prepare I2C read message to retrieve register value */
> > +	msgs[1].addr = (chip->client->addr << 2) | extracted_bits;
> > +	msgs[1].flags = I2C_M_RD;
> > +	msgs[1].len = 1;
> > +	msgs[1].buf = &ret_val;
> > +
> > +	ret = i2c_transfer(chip->client->adapter, msgs, 2);
> 
> As above.
>

I will update this as well.

> > +	if (ret != 2) {
> > +		dev_err(dev, "I2C read error, ret=%d\n", ret);
> > +		*val = 0;
> > +		ret = ret < 0 ? ret : -EIO;
> > +	} else {
> > +		/* Store the value retrieved from the hardware */
> > +		*val = ret_val;
> > +		ret = 0;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static int lp5812_read_tsd_config_status(struct lp5812_chip *chip, u8 *reg_val)
> > +{
> > +	return lp5812_read(chip, chip->cfg->reg_tsd_config_status.addr, reg_val);
> > +}
> > +
> > +static int lp5812_update_regs_config(struct lp5812_chip *chip)
> > +{
> > +	u8 reg_val;
> > +	int ret;
> > +
> > +	ret = lp5812_write(chip, chip->cfg->reg_cmd_update.addr, LP5812_UPDATE_CMD_VAL);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = lp5812_read_tsd_config_status(chip, &reg_val); /* Save register value */
> 
> Save register value where?
>

This function just reads the TSD config status register into reg_val for verification.
This comment is redundant. I will remove it.

> > +	if (ret)
> > +		return ret;
> > +
> > +	return reg_val & 0x01;
> 
> What bit is this?  Please define it properly.
>

This is config_err_status. I will replace it with a properly defined macro.

> > +}
> > +
> > +static int lp5812_fault_clear(struct lp5812_chip *chip, u8 value)
> > +{
> > +
> > +	if (value == 0)
> 
> What do these values mean?  Define?
> 
> A switch() would be better.
>

I agree, I'll switch to 'switch()' and replace raw numbers with enums/macros for clarity.

> > +		reg_val = LOD_CLEAR_VAL;
> > +	else if (value == 1)
> > +		reg_val = LSD_CLEAR_VAL;
> > +	else if (value == 2)
> > +		reg_val = TSD_CLEAR_VAL;
> > +	else if (value == 3)
> > +		reg_val = FAULT_CLEAR_ALL;
> > +	else
> > +		return -EINVAL;
> > +
> > +	return lp5812_write(chip, chip->cfg->reg_reset.addr, reg_val);
> > +}
> > +
> > +static void set_mix_sel_led(struct lp5812_chip *chip, int mix_sel_led)
> 
> What is a "mix_sel_led"?
> 
> If forthcoming nomenclature can't be incorporated use comments.
>

I will change the name of this function.

> > +{
> > +	if (mix_sel_led == 0)
> > +		chip->u_drive_mode.s_drive_mode.mix_sel_led_0 = 1;
> 
> What are you doing here?
> 
> Why not something like:
> 
>   chip->u_drive_mode.s_drive_mode.mix_sel_led[mix_sel_led] = true;
> 
> Or if there is only one:
> 
>   chip->u_drive_mode.s_drive_mode.mix_sel_led = mix_sel_led;
>

You're right. I'll rework it.

> > +	if (mix_sel_led == 1)
> > +		chip->u_drive_mode.s_drive_mode.mix_sel_led_1 = 1;
> > +
> > +	if (mix_sel_led == 2)
> > +		chip->u_drive_mode.s_drive_mode.mix_sel_led_2 = 1;
> > +
> > +	if (mix_sel_led == 3)
> > +		chip->u_drive_mode.s_drive_mode.mix_sel_led_3 = 1;
> > +}
> > +
> > +static ssize_t parse_drive_mode(struct lp5812_chip *chip, char *str)
> > +{
> > +	char *sub_str;
> > +	int tcm_scan_num, mix_scan_num, mix_sel_led, scan_oder[4], i, ret;
> > +
> > +	chip->u_drive_mode.s_drive_mode.mix_sel_led_0 = 0;
> > +	chip->u_drive_mode.s_drive_mode.mix_sel_led_1 = 0;
> > +	chip->u_drive_mode.s_drive_mode.mix_sel_led_2 = 0;
> > +	chip->u_drive_mode.s_drive_mode.mix_sel_led_3 = 0;
> > +
> > +	sub_str = strsep(&str, ":");
> 
> This is totally unacceptable, sorry.
> 
> One value per sysfs file.
> 
> No parsing of weird and wonderful concats of data is allowed.
> 
> I'll end the review here.

I will change solution to get value from sysfs file. No parsing or concats.
Is it acceptable to consider a string format like "tcmscan:1:0:..." as a single value?

Thank you for the detailed review.

Best regards,
Nam Tran

