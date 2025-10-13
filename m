Return-Path: <linux-leds+bounces-5756-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEAFBD2F56
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 14:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1901E3C5287
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 12:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6485271441;
	Mon, 13 Oct 2025 12:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LS35QxNN"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95D8270576
	for <linux-leds@vger.kernel.org>; Mon, 13 Oct 2025 12:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760358514; cv=none; b=Mz9VVSkqTUzCbOuOZcgz35AFIQ1kcbBSo3rDRu7LTIKcgSRo95FHpSjsHME2MMcmP74DR+MsrTu1wX7ZTO1m86jFEBhEsBwj4bLNwil+U16AbLxY9N/eAJIwux1EoqoLh5K1hhEBoixCM/DoLHzSdC2v/amqZnJ9voR8AMLcLHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760358514; c=relaxed/simple;
	bh=+vbyFrZcBnFsvtcYalRuaDry0I2W4DKDBtFCjWgAn4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JEk0LWmayeI/aK5Wu8aU4Y0gVOgBYeuhESqx6dGkzIQI+zuR8JhQaD4G26BZU6ACy6zDoeem+v9v3qhi9Fk/TDg4nGkHL13oPlhs9ZtDBrLbmPCVuA86tyNIigdB9aEVxTgke/0nUausSs05GxEhkgP5S8S8Io5xE2oxP7UkRUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LS35QxNN; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-33082aed31dso4321294a91.3
        for <linux-leds@vger.kernel.org>; Mon, 13 Oct 2025 05:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760358512; x=1760963312; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1Hfyx/yKH/qoWr47V08+NxngS+OiO3dtYiWQ1I4tci4=;
        b=LS35QxNNN7opFVYyh8O4P9rQdZ9CqGR3yVgFC7mjkECcxzHNUNKjXSiJ7ZSKU08l83
         igDPm3dC6FFruydFC8u7gR4crJyetjjLEUfXNYDJrWgJcfWorYrrMngX/X40CuX/7Sd6
         ylEMH9TPytKsYqQa3oAlekfumKxw77aNvZDbf2fiVG7Wj0T3lBTU5puof1vNvbLqsNKM
         ni211UaKq7dJyuN4lahewAbzfNPvWFcD4wH2yx4C0rjFSO+90L+s4QnoRogRqBEXfJBY
         hprX7gfP8zeUV8SYeYVXU72/fPOnrgrxFGaa7MT2rFN3QoyI99oWKR+q8MeYythMe6mj
         wgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760358512; x=1760963312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Hfyx/yKH/qoWr47V08+NxngS+OiO3dtYiWQ1I4tci4=;
        b=WxRLbRulvvN6jeTURQz8E58/UW3y/OPxQNQ12kZzJInp7hWTZDwSocliKgW0fUBPVd
         B+EUsu4nhsfK+OH8aU1Za5pRo+ZoQ9LSvDud4ykkJ1kgSEB3+YjAQk5tDB35TMe+4oZx
         oRX/N7XABr7nh/OE894Vqy6Sm9BbImK6pWfWzdVcm+9TMxMqmJZtkjpuf5HeEHanPy1O
         fTo3MbDxJrZC7ppLNHgtvtMKFBvKyosIC0pzGEbG8GvjbiQevcyfxGzG+65jkR/ygDNO
         Q0A0JTAJ3XSSfl9ljNtkGzyeX7eAiY9QykNap7/WNd18SHfnaYQDFFX8x2baCTJjtRaK
         qYBw==
X-Forwarded-Encrypted: i=1; AJvYcCU6ruSX4cC76HzruQp/OQwnvvH+2r0coLLyy7Lbih8BnlD8u/kTmLbwfR2BgfbUkZvhmhnEjSQpNY4d@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq90EEKGTANli4MaxO1VHNgRF9Chn2GGdgDGf4XKVMeAO091Re
	XdebP4Q8NIn/YN6/tjvy3Rl+d20V7Al4CB+G/r8NXUp+R/VRrfYBZk15FXZpJLfjAzBh6BX6+C8
	fVLrHxkyEXyIikxwgE6mlgii8pvzzcIM=
X-Gm-Gg: ASbGncthPZECAbralc6qdXPd6QSGuAuDMMwXXNpswdfT5+LT6+HPPb7ZFPvaYDvrpoL
	5nFn6iyTiFDoaSC7a0cqH/4caxeIdXeY40vJ6bu7YzKcb/29LN5IkSfNfFhJZkdqxFBspRcsOOP
	3AeuzvvnCqRSfyYHJ5/PeZOnQ4t+YYpjjfEjVff6XTc8FbCyFKy8kxvnnMa7NzTVhDG9T+5jDQS
	VyRo+NlVexBsMRBosPKtMnUYjj2R7M3O/gHLRGYC0Xk1Iv4sQs1cTJv58JE
X-Google-Smtp-Source: AGHT+IFDFAOFmZ461XoI5RW9YuCzah5zLExPQE6vCScxrqfd5twVWI97u4O0yepFXgRtTULwZnxCG8cuEBCFsRqZlPE=
X-Received: by 2002:a17:90b:38cc:b0:32e:f1c:e778 with SMTP id
 98e67ed59e1d1-33b51105f5dmr28620196a91.3.1760358511952; Mon, 13 Oct 2025
 05:28:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1759824376.git.mazziesaccount@gmail.com>
 <93142a80d90a0ac80b27090d0c83914675aad94d.1759824376.git.mazziesaccount@gmail.com>
 <20251009161847.GE2890766@google.com> <8ea507eb-f78c-4a16-882b-112e277fa1b6@gmail.com>
 <20251010144515.GI2988639@google.com>
In-Reply-To: <20251010144515.GI2988639@google.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Date: Mon, 13 Oct 2025 15:28:20 +0300
X-Gm-Features: AS18NWD7Fn8K61uYpxry40G4lSMSR38Hgj7AfijgSk6lHd0n6-E_snhITV5UyEs
Message-ID: <CANhJrGMEN0QRLoBzntVnaYgfFDyre=Yfw-dNdmi226p6pnpgHw@mail.gmail.com>
Subject: Re: [RFC PATCH 06/13] mfd: bd71828: Support ROHM BD72720
To: Lee Jones <lee@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andreas Kemnade <andreas@kemnade.info>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

pe 10.10.2025 klo 17.45 Lee Jones (lee@kernel.org) kirjoitti:
>
> On Fri, 10 Oct 2025, Matti Vaittinen wrote:
>
> > Hi deee Ho Lee,
> >
> > And Thanks for the review!
> >
> > On 09/10/2025 19:18, Lee Jones wrote:
> > > On Tue, 07 Oct 2025, Matti Vaittinen wrote:
> > >
> > > > The ROHM BD72720 is a power management IC which continues the BD71828
> > > > family of PMICs. Similarly to the BD71815 and BD71828, the BD72720
> > > > integrates regulators, charger, RTC, clock gate and GPIOs.
> > > >
> > > > The main difference to the earlier PMICs is that the BD72720 has two
> > > > different I2C slave addresses. In addition to the registers behind the
> > > > 'main I2C address', most of the charger (and to some extent LED) control
> > > > is done via registers behind a 'secondary I2C slave address', 0x4c.
> > > >
> > > > Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

// snip

> > > > +
> > > > +static struct regmap *bd72720_secondary_regmap;
> > >
> > > Dynamically allocate this and add it to .platform_data once it's
> > > populated.
> > >
> >
> > This can be done but I suppose it's unnecessary churn. This driver does not
> > (at the moment) support more than one instance of the PMIC anyways. (The
> > button data is not alloacted).
> >
> > This is not really a problem as typically there is only 1 of these PMICs to
> > be controlled.
>
> I'd take a few lines of extra code over a globally defined variable any
> day of the week.

Even though that'll require us to drop the const from the
bd72720_mfd_cells MFD cell array? Which, in turn, will probably
require us to drop the const from the MFD cell pointer in probe as
well. Additionally, this will require us to skim through the MFD cell
array in probe, so we locate the power cell, adding one more spot for
errors. I think this is quite a cost just a princible of dropping a
global, which is accessed from one function only. I'd definitely agree
if it was driver data which gets used in a variety of functions, but
here we really just need a memory location for a pointer so MFD can
copy it when kicking the 'sub drivers'. Do you think you can still
reconsider?

>
> > // snip
> >
> > > > +/*
> > > > + * The BD72720 is an odd beast in that it contains two separate sets of
> > > > + * registers, both starting from address 0x0. The twist is that these "pages"
> > > > + * are behind different I2C slave addresses. Most of the registers are behind
> > > > + * a slave address 0x4b, which will be used as the "main" address for this
> > > > + * device.
> > > > + * Most of the charger related registers are located behind slave address 0x4c.
> > > > + * It is tempting to push the dealing with the charger registers and the extra
> > > > + * 0x4c device in power-supply driver - but perhaps it's better for the sake of
> > > > + * the cleaner re-use to deal with setting up all of the regmaps here.
> > > > + * Furthermore, the LED stuff may need access to both of these devices.
> > > > + */
> > > > +#define BD72720_SECONDARY_I2C_SLAVE 0x4c
> > > > +static const struct regmap_range bd72720_volatile_ranges_4b[] = {
> > > > + {
> > > > +         /* RESETSRC1 and 2 are write '1' to clear */
> > > > +         .range_min = BD72720_REG_RESETSRC_1,
> > > > +         .range_max = BD72720_REG_RESETSRC_2,
> > >
> > > regmap_reg_range()?
> >
> > Ah, thanks. Out of the curiosity - do you know why this macro is written on
> > lowercase?
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Signed-off-by: Mark Brown <broonie@linaro.org>
>
> =:-)

Yeah. I just thought that maybe you knew :)

>
> > // snip
> > > > +static int bd72720_set_type_config(unsigned int **buf, unsigned int type,
> > > > +                            const struct regmap_irq *irq_data,
> > > > +                            int idx, void *irq_drv_data)
> > > > +{
> > > > + const struct regmap_irq_type *t = &irq_data->type;
> > > > +
> > > > + /*
> > > > +  * The regmap IRQ ecpects IRQ_TYPE_EDGE_BOTH to be written to register
> > > > +  * as logical OR of the type_falling_val and type_rising_val. This is
> > > > +  * not how the BD72720 implements this configuration, hence we need
> > > > +  * to handle this specific case separately.
> > > > +  */
> > > > + if (type == IRQ_TYPE_EDGE_BOTH) {
> > > > +         buf[0][idx] &= ~t->type_reg_mask;
> > > > +         buf[0][idx] |= BD72720_GPIO_IRQ_TYPE_BOTH;
> > > > +
> > > > +         return 0;
> > > > + }
> > > > +
> > > > + return regmap_irq_set_type_config_simple(buf, type, irq_data, idx,
> > > > +                                          irq_drv_data);
> > >
> > > Use 100-chars to avoid these pointless wraps please.
> >
> > gnarl. I think we have discussed this before :)
> > I would love to keep the lines short - closer to 80 chars - because that way
> > I can fit 3 terminals on my screen. All the years spent staring at the
> > monitor are taking their toll, and my vision isn't as good as it used to be.
> > Frightening thing being that it seems I will only need to increase the font
> > in the future :/
> >
> > Well, sure the lines can be split if you feel strongly about it - but I have
> > a real reason (other than the usual - "they have always been like that") to
> > try keep them short...
>
> Welcome to the year 2000 when 32" monitors are super affordable.

I know. But work rooms where I can fit larger table aren't. Not even
in Finland which should have plenty of space. And my table is really
packed.

Yours,
    -- Matti

-- 

Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

Discuss - Estimate - Plan - Report and finally accomplish this:
void do_work(int time) __attribute__ ((const));

