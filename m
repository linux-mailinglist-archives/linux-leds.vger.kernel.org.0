Return-Path: <linux-leds+bounces-5000-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B862DAFA47B
	for <lists+linux-leds@lfdr.de>; Sun,  6 Jul 2025 12:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C1217A209F
	for <lists+linux-leds@lfdr.de>; Sun,  6 Jul 2025 10:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 536A31FFC77;
	Sun,  6 Jul 2025 10:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3ufdFEA"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F231FBE9E;
	Sun,  6 Jul 2025 10:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751797733; cv=none; b=LlIjooFGq8EjJaoZ8nc7tnonyb7KFURjaVEuZWv4pcadLf5kmc6jNn0MbqIeRWqksgR91KvyuVWjbDk8YfzIgzNxCEG4z7liloIw3/hqDwQUVSsoWdZoRaHwsW9UCmTPBGuFaDCC1qO9+nxDJpk+JSR57MDZuoDXKPADD6rYbxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751797733; c=relaxed/simple;
	bh=sQd+SsmbxY5WpcBVMP9U0wpXVP6wgQstouuWjden6kY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PcJUe9jWX9mqs8MLdRhK6gb5PE5025UqtN1IYQEytw3+wvp45b0C9MsckBPTfz8q6LvBAvaT+WAJ/GGjHx64JSEYLxt8H1LPFGB/OVwPwCk7d9N8ZPv1lkyZUI0AyjveRNu4iJMQ7JZNe45jq/7V8r5A5xlph4IzlztldOb5D/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3ufdFEA; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-234f17910d8so17740975ad.3;
        Sun, 06 Jul 2025 03:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751797731; x=1752402531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RL9jPyNJ/YbadzRHWJgl31JTrXxwG6sCSDqnz7r9edQ=;
        b=X3ufdFEAS37f1sZFcomRszNrzOW//6+/FzzGmg/NZ3yRc7fR2K2Gynp/jdTMg+0eb7
         JXepY7sboJft720RkcFFicjY3Uu5ojZ0tZ+EuGzlrNK/YiwA+01mZK6BTnYInAK6fF7J
         32LwRasYuSIoejYX2fVWkxVsEXABry0bkwKhBp+EEvxIFBfItCfO2L8SVZE4/dopcivZ
         Sk7Hljnl/Vwv6QEBcJ//A1zSwbY4od7tOgmyJaOYvYCVwFjL+PJEn/BDXzTaGFzhHJWV
         8AO2XMA89rMfY4z76jVU/1fwl2/GF0IUDQOlzzG7Krql05Mnqup50mdWW1BC4Em4UJhJ
         KCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751797731; x=1752402531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RL9jPyNJ/YbadzRHWJgl31JTrXxwG6sCSDqnz7r9edQ=;
        b=nNBc/gBRR1qrQTptq2brCHmtDLX7H4T9Eph6Ho+DYb0XbOK6OQBbmTgQUiPfD1+t/S
         aOATf+lCua/k8PRhEPurNK4ZYWAjhDI1M3Lp49OifsB/SwvNOgdecbeGWjz/hdMOEaAd
         b2yUoxhhYVLkVas3uW3luq7uNGXO22K2P8k4Q8B3Cu7kz25WNajWBQjLX4FL51wtXo7n
         wARi2ttYW6hGBkO9lXSXRXPkRj+XeZBDJL6FmVxchFeVxxrPNK8uLHvLi4+btcijJMRH
         1+Mrmv4hXituWqmjI59pNQha2yrATxNyWzNrcn9AK4Ow/v3H8yiHIL8NM+jgCeU1oL/H
         1GSA==
X-Forwarded-Encrypted: i=1; AJvYcCUMw9bCGc6qxzIqZZs45cd2lhwzxPLTv9TCKmG3Ct1oTwPThQgE80xVgZyPMtOYmIuzNpwGJnfURpf1J5/C@vger.kernel.org, AJvYcCVEhitROEX9lRCWJSR/sihBfN1Gef89bXSIGw13XBVd/w9LLAQETHMJ/OWZgtXgRSJ9mBjE4RmRoTU/mA==@vger.kernel.org, AJvYcCWR03/IgHbV6CXSHxPa8pxwzgJ7XJRvtgQJbkJmUSLOe6WEVpZhFEt93YpUepYnXTfAEaoCdqsM4+3P@vger.kernel.org, AJvYcCXZHxdmkySHg8jpnZZRu/t3D7SO8IEryqH/8F98KM5wu379WJTyH9YLAGsnL+FE7rZPBqDEHNoZTEBM@vger.kernel.org
X-Gm-Message-State: AOJu0YzEVvcRYDY3TEFfrm4/T93VdcucBn/QRpH8aVKXSIZGsnuP9cGC
	pGL728e/P8ZlGIYANnLUpNkxSl4ddzn6gNYNnz3w/NIdAJYOElHOdwKi
X-Gm-Gg: ASbGncuXnUQzFgVIZEa2JB94aXLYYOSWjAdX+0gljWYQojbB5CW8L5usbucvmHyv5Xh
	PPGk3Iyhfen7Qe1SWKCEFMyoLmAV4hT9YDbn+c8THO+h49IeX4ydfGbf77mf/B6c+O3JF1dh1U7
	K0k6Y313KfREWDawyCgSP9k/v/urNWreeoX3nrR9xJOELjABXRCJmuet9ZCB1q9pcJcnVsGSi7A
	S/GMyzsxzsA1JJ/h8uRjh+pQpxdEDzTKxhziRV4LcPt7ZRTaWq5lmS2e05QOo2uxOM6zie2DCzd
	Z+8LtUC3ocOsvUur6NIJGjOX3+3vwk8qKFaTE4wfqfTinUyOk3u6kT7SslR0CTs6pEHeM6V+XDD
	xAO59U+s=
X-Google-Smtp-Source: AGHT+IFFjdZR3CESPUT7/QNruxm2GLqtrXmrTAMQbTNxGqlMhpxLbJ8o7PgRmP7RFpqcG9fXG5ylaA==
X-Received: by 2002:a17:902:d48f:b0:235:91a:31 with SMTP id d9443c01a7336-23c90f36f9cmr63522075ad.8.1751797730418;
        Sun, 06 Jul 2025 03:28:50 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.114.212.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431a3d8sm60717685ad.45.2025.07.06.03.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 03:28:49 -0700 (PDT)
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
Subject: Re: [PATCH v10 2/4] leds: add TI/National Semiconductor LP5812 LED Driver
Date: Sun,  6 Jul 2025 17:28:44 +0700
Message-Id: <20250706102844.35856-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250626130253.GB10134@google.com>
References: <20250626130253.GB10134@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 26 Jun 2025, Lee Jones wrote:

> On Thu, 19 Jun 2025, Nam Tran wrote:
> 
> > The LP5812 is a 4x3 matrix RGB LED driver with an autonomous animation
> > engine and time-cross-multiplexing (TCM) support for up to 12 LEDs or
> > 4 RGB LEDs. Each LED can be configured through the related registers
> > to realize vivid and fancy lighting effects.
> > 
> > Signed-off-by: Nam Tran <trannamatk@gmail.com>
> > ---
> >  MAINTAINERS                    |    4 +
> >  drivers/leds/rgb/Kconfig       |   13 +
> >  drivers/leds/rgb/Makefile      |    1 +
> >  drivers/leds/rgb/leds-lp5812.c | 1943 ++++++++++++++++++++++++++++++++
> >  drivers/leds/rgb/leds-lp5812.h |  227 ++++
> >  5 files changed, 2188 insertions(+)
> 
> Reviewing a 2k+ line driver is not fun!
> 
> Better to reduce it down to bare bones and add new functionality over
> time.  Or at least over different patches within a set.

I agree - reviewing such a large patch isn't ideal. For the next revision,
I'll submit the smallest version of the driver that retains only the essential
functionality, such as basic brightness control and LED registration.
Additional features like the autonomous animation engine will be submitted as
separate follow-up patches.

...

> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/init.h>
> > +#include <linux/i2c.h>
> > +#include <linux/sysfs.h>
> > +#include <linux/mutex.h>
> > +#include <linux/types.h>
> > +#include <linux/leds.h>
> > +#include <linux/delay.h>
> > +#include <linux/led-class-multicolor.h>
> > +#include "leds-lp5812.h"
> 
> Alphabetical.
> 

I will reorder them.

> > +#define LP5812_SC_LED "SC_LED"
> > +#define LP5812_MC_LED "MC_LED"
> > +
> > +#define LP5812_AUTO_PAUSE_ADDR(chan)  (LP5812_AEU_BASE + (chan) * 26)
> > +#define LP5812_AUTO_PLAYBACK_ADDR(chan)  (LP5812_AEU_BASE + (chan) * 260 + 1)
> 
> Bring these 2 down to the line below like the others.  Just to make it
> more uniform / easier to read.
> 

I will update it.

> > +#define LP5812_AEU_PWM_ADDR(chan, aeu, pwm_chan)  \
> > +	(LP5812_AEU_BASE + (chan) * 26 + ((aeu) - 1) * 8 + 2 + (pwm_chan) - 1)
> > +#define LP5812_AEU_SLOPE_TIME_ADDR(chan, aeu, slope_chan)  \
> > +	(LP5812_AEU_BASE + (chan) * 26 + ((aeu) - 1) * 8 + 2 + 5 + ((slope_chan) / 2))
> > +#define LP5812_AEU_PLAYBACK_ADDR(chan, aeu)  \
> > +	(LP5812_AEU_BASE + (chan) * 26 + ((aeu) - 1) * 8 + 2 + 5 + 2)
> > +
> > +#define to_lp5812_led(x) container_of(x, struct lp5812_data, kobj)
> > +#define to_anim_engine_unit(x) container_of(x, struct anim_engine_unit, kobj)
> > +
> > +static int lp5812_read_tsd_config_status(struct lp5812_chip *chip, u8 *reg_val);
> 
> No forward declarations.  Rearrange the functions instead.
> 

I will rearrange the functions.

> > +
> > +/* Begin common functions */
> 
> This comment is superfluous.
> 

I will drop it.

> > +static struct lp5812_led *cdev_to_lp5812_led(struct led_classdev *cdev)
> > +{
> > +	return container_of(cdev, struct lp5812_led, cdev);
> > +}
> > +
> > +static struct lp5812_led *mcled_cdev_to_lp5812_led(struct led_classdev_mc *mc_cdev)
> > +{
> > +	return container_of(mc_cdev, struct lp5812_led, mc_cdev);
> > +}
> 
> Are you sure you need 4 of these.  This seems excessive.
> 

You are right. I will inline them to simplify the code.

> > +static struct lp5812_led *dev_to_lp5812_led(struct device *dev)
> > +{
> > +	return cdev_to_lp5812_led(dev_get_drvdata(dev));
> > +}
> > +
> > +static struct lp5812_led *dev_to_lp5812_led_mc(struct device *dev)
> > +{
> > +	return mcled_cdev_to_lp5812_led(dev_get_drvdata(dev));
> > +}
> > +
> > +static int lp5812_write(struct lp5812_chip *chip, u16 reg, u8 val)
> > +{
> > +	int ret;
> 
> Nit: Small variables at the bottom.
> 

I will reorder them.

> > +	struct i2c_msg msg;
> > +	struct device *dev = &chip->i2c_cl->dev;
> > +	u8 extracted_bits; /* save 9th and 8th bit of reg address */
> 
> All comments should start with an uppercase char.
> 
> Place this comment where you do the work.
> 
> Save them to do what?  More information please.
> 

I will fix the comment placement, and clarify it as suggested.

> > +	u8 buf[2] = {(u8)(reg & 0xFF), val};
> > +
> > +	extracted_bits = (reg >> 8) & 0x03;
> > +	msg.addr = (chip->i2c_cl->addr << 2) | extracted_bits;
> > +	msg.flags = 0;
> > +	msg.len = sizeof(buf);
> > +	msg.buf = buf;
> > +
> > +	ret = i2c_transfer(chip->i2c_cl->adapter, &msg, 1);
> > +	if (ret != 1) {
> > +		dev_err(dev, "i2c write error, ret=%d\n", ret);
> 
> I2C
> 

I will update it.

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
> > +	int ret;
> > +	u8 ret_val;  /* lp5812_chip return value */
> 
> /* Value returned by the hardware */   ?
> 
> > +	u8 extracted_bits; /* save 9th and 8th bit of reg address */
> > +	u8 converted_reg;  /* extracted 8bit from reg */
> 
> Place all of these comments in the code.
> 
> Saved and extracted for what purpose?  Tell us about the h/w.
> 

I will clarify the comments and move them next to the relevant code lines.

> > +	struct device *dev = &chip->i2c_cl->dev;
> > +	struct i2c_msg msgs[2];
> > +
> > +	extracted_bits = (reg >> 8) & 0x03;
> > +	converted_reg = (u8)(reg & 0xFF);
> > +
> > +	msgs[0].addr = (chip->i2c_cl->addr << 2) | extracted_bits;
> > +	msgs[0].flags = 0;
> > +	msgs[0].len = 1;
> > +	msgs[0].buf = &converted_reg;
> > +
> > +	msgs[1].addr = (chip->i2c_cl->addr << 2) | extracted_bits;
> > +	msgs[1].flags = I2C_M_RD;
> > +	msgs[1].len = 1;
> > +	msgs[1].buf = &ret_val;
> > +
> > +	ret = i2c_transfer(chip->i2c_cl->adapter, msgs, 2);
> > +	if (ret != 2) {
> > +		dev_err(dev, "Read reg value error, ret=%d\n", ret);
> 
> Why is this different to the one above?
> 
> "I2C read error" ?
> 

Agreed, I'll update the message to "I2C read error" for consistency.

> > +		*val = 0;
> > +		ret = ret < 0 ? ret : -EIO;
> > +	} else {
> > +		*val = ret_val;
> > +		ret = 0;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static int lp5812_parse_common_child(struct device_node *child,
> 
> 'child' here is Device Tree terminology.
> 
> Speak in terms of the hardware / device instead.

I'll rename child to led_node to better reflect the hardware context.

...
> > +static int lp5812_parse_single_led(struct device_node *np,
> > +				   struct lp5812_led_config *cfg,
> > +				   int child_number)
> > +{
> > +	int ret;
> > +
> > +	ret = lp5812_parse_common_child(np, cfg, child_number, 0);
> > +	if (ret)
> > +		return ret;
> > +
> > +	cfg[child_number].num_colors = 1;
> > +	cfg[child_number].is_sc_led = 1;
> > +
> > +	return 0;
> > +}
> 
> Wouldn't it make things twice as easy if we took the multi path every
> time and just make the color optional?
> 
> > +static int lp5812_parse_logical_led(struct device_node *np,
> > +				    struct lp5812_led_config *cfg,
> > +				    int child_number)
> > +{
> > +	int chan_nr, ret;
> > +
> > +	of_property_read_string(np, "label", &cfg[child_number].name);
> > +
> > +	ret = of_property_read_u32(np, "reg", &chan_nr);
> > +	if (ret)
> > +		return ret;
> > +
> > +	cfg[child_number].chan_nr = chan_nr;
> > +
> > +	if (of_node_name_eq(np, "multi-led"))
> > +		return lp5812_parse_multi_led(np, cfg, child_number);
> > +	else
> > +		return lp5812_parse_single_led(np, cfg, child_number);
> 
> Most devices have more than one LED and the supporting code can often
> handle one or more than one LEDs.  Why do we need to take two different
> paths here to handle this?
> 

Got it. I'll refactor to use a single path that handles both single and
multi-color LEDs.

> > +}
> > +
> > +static struct lp5812_data *lp5812_of_populate_pdata(struct device *dev,
> > +						    struct device_node *np,
> > +						    struct lp5812_chip *chip)
> > +{
> > +	struct lp5812_data *pdata;
> > +	struct lp5812_led_config *cfg;
> > +	int num_channels, i = 0, ret;
> > +
> > +	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
> 
> pdata is collated and passed IN from the platform device registering
> code.  Once we have it, it becomes device data, assuming we're not
> passing it forward to yet another child device?

I will refactor the code to store the data directly in the 'chip',
so there’s no need to allocate memory for pdata.

...
> > +static ssize_t lp5812_auto_time_pause_store(struct device *dev,
> > +					    struct device_attribute *attr,
> > +					    const char *buf, size_t len, bool start)
> > +{
> > +	struct lp5812_led *led;
> > +	struct lp5812_chip *chip;
> > +	struct lp5812_led_config *led_cfg;
> > +	const char *name = dev->platform_data;
> > +	u8 chan_nr = 0, curr_val;
> > +	int i, ret, val[LED_COLOR_ID_MAX];
> > +	char *sub_str, *str = (char *)buf;
> > +	u16 reg;
> > +
> > +	if (strcmp(name, LP5812_SC_LED) == 0)
> > +		led = dev_to_lp5812_led(dev);
> > +	else
> > +		led = dev_to_lp5812_led_mc(dev);
> 
> Put this whole thing in the helper above.

Agreed, I will move that logic into a helper to avoid duplication.

...
> > +struct lp5812_reg {
> > +	u16 addr;
> > +	union {
> > +		u8 val;
> > +		u8 mask;
> > +		u8 shift;
> > +	};
> > +};
> > +
> > +struct lp5812_led;
> 
> Move the definition here instead.
> 

Sure, I will move it.

> > +struct lp5812_device_config {
> > +	const struct lp5812_reg reg_reset;
> > +	const struct lp5812_reg reg_chip_en;
> > +	const struct lp5812_reg reg_dev_config_0;
> > +	const struct lp5812_reg reg_dev_config_1;
> > +	const struct lp5812_reg reg_dev_config_2;
> > +	const struct lp5812_reg reg_dev_config_3;
> > +	const struct lp5812_reg reg_dev_config_4;
> > +	const struct lp5812_reg reg_dev_config_5;
> > +	const struct lp5812_reg reg_dev_config_6;
> > +	const struct lp5812_reg reg_dev_config_7;
> > +	const struct lp5812_reg reg_dev_config_12;
> > +	const struct lp5812_reg reg_cmd_update;
> > +	const struct lp5812_reg reg_cmd_start;
> > +	const struct lp5812_reg reg_cmd_stop;
> > +	const struct lp5812_reg reg_cmd_pause;
> > +	const struct lp5812_reg reg_cmd_continue;
> > +
> > +	const struct lp5812_reg reg_led_en_1;
> > +	const struct lp5812_reg reg_led_en_2;
> > +	const struct lp5812_reg reg_fault_clear;
> > +	const struct lp5812_reg reg_manual_dc_base;
> > +	const struct lp5812_reg reg_auto_dc_base;
> > +	const struct lp5812_reg reg_manual_pwm_base;
> > +	const struct lp5812_reg reg_tsd_config_status;
> > +	const struct lp5812_reg reg_aeu_base;
> > +	const struct lp5812_reg reg_lod_status_base;
> > +	const struct lp5812_reg reg_lsd_status_base;
> > +
> > +	/* set LED brightness */
> > +	int (*brightness_fn)(struct lp5812_led *led);
> > +
> > +	/* set multicolor LED brightness */
> > +	int (*multicolor_brightness_fn)(struct lp5812_led *led);
> 
> Why do you need call-back functions for these?
> 

They are not needed at the moment.
I will remove the callbacks and use direct function calls instead.

> > +	/* additional device specific attributes */
> > +	const struct attribute_group *dev_attr_group;
> > +};
> > +
> > +struct lp5812_led_config {
> > +	const char *name;
> > +	int led_id[LED_COLOR_ID_MAX];
> > +	u8 color_id[LED_COLOR_ID_MAX];
> > +	u8 max_current[LED_COLOR_ID_MAX];
> > +	int num_colors;
> > +	u8 chan_nr;
> > +	bool is_sc_led;
> > +};
> > +
> > +struct lp5812_data {
> > +	struct lp5812_led_config *led_config;
> > +	u8 num_channels;
> > +	const char *label;
> > +};
> 
> How is data different from config here?
> 
> Config to me would be the parameters used to set-up a device.
> 

Based on the comment above regarding 'pdata', I'll merge lp5812_data
into lp5812_chip to simplify the design.

> > +struct lp5812_chip {
> > +	struct i2c_client *i2c_cl;
> 
> Just "client" is fine.
> 

Yes, I will rename it to 'client'.

> > +	struct mutex lock; /* Protects reg access */
> 
> "register"
> 

I will update it.

> > +	struct lp5812_data *pdata;
> > +	const struct lp5812_device_config *cfg;
> > +	union u_scan_order u_scan_order;
> > +	union u_drive_mode u_drive_mode;
> > +};
> > +
> > +struct lp5812_led {
> > +	int chan_nr;
> > +	struct led_classdev cdev;
> > +	struct led_classdev_mc mc_cdev;
> > +	u8 brightness;
> > +	struct lp5812_chip *chip;
> > +};
> > +
> > +#endif /*_LP5812_H_*/
> > -- 
> > 2.25.1

Thank you for the review and your time. I truly appreciate it!

Best regards,
Nam Tran

