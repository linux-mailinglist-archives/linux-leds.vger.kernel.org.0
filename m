Return-Path: <linux-leds+bounces-2104-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A69F5914844
	for <lists+linux-leds@lfdr.de>; Mon, 24 Jun 2024 13:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 077E5B22F53
	for <lists+linux-leds@lfdr.de>; Mon, 24 Jun 2024 11:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321D045023;
	Mon, 24 Jun 2024 11:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HL+PwkPn"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79EA49620;
	Mon, 24 Jun 2024 11:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719227693; cv=none; b=A8ElDtB7Iy1iq9JKkCatCFlhNZxV8Fef8ResTEcvqAOrE9mR7hNJSC16/0yhEl/T09YrBAb8frZIMNK/4PPoIVPC4sbT45cNIGiDEqegofuFc72M9+DZdxz7fyaWfLZT6HhdE5MMnsoOsoVQlMLI2S5IONapNoGUYQzuD0QaWZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719227693; c=relaxed/simple;
	bh=zD2eSo75ryZYFX1va5sIibpLycZqPyqdenRQ6fO/VY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WZqeDARkc7DrtCIVU6CRWAcEyoQAqCAG4ccjpbAJMP9tMrNiYTGzrnotzzBPV5lENean6FdKSj+8IqAVBULcpzGsQOmJTaAe+tBlG3ZYyh9rb3eVNGF/46/WExF/Wh2erRDqlwjyzbD+AV1yPNvWiuVODZJxVkrdyXHxxNhJpJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HL+PwkPn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D08DC2BBFC;
	Mon, 24 Jun 2024 11:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719227692;
	bh=zD2eSo75ryZYFX1va5sIibpLycZqPyqdenRQ6fO/VY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HL+PwkPniPDdrLpWKapbrtdsjGL4duzCq43MmME/DrHp1kfG8QgQLNtwlvT+r+0bM
	 g6jHuep8jV3IR+KqWP92cVjMYJYCN3mCm3kxqC/ac65+iU3+HIXuZH7cqaLKsGnwaU
	 gjVP+3Jt53e0DihoHnHQKXAluUUU7g8yoZdwWxQSyn7JgP+cZ+IYSV857/a8JMzOc2
	 BD37e7J2yhwYNfal/i78WGrisQTX5CVLOh8aazyNNds5w6TKBBAd2kexhNTw/49hFY
	 7d5ZYPsZimodO08QDbvmmdPyHUjRwSraMEkn22wpb0xxuomngdnxk2eSdiSuidrukv
	 bXxlPgy5vj+fg==
Date: Mon, 24 Jun 2024 12:14:46 +0100
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Trilok Soni <quic_tsoni@quicinc.com>, Kees Cook <kees@kernel.org>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] leds: sy7802: Add support for Silergy SY7802
 flash LED controller
Message-ID: <20240624111446.GT1318296@google.com>
References: <20240616-sy7802-v4-0-789994180e05@apitzsch.eu>
 <20240616-sy7802-v4-2-789994180e05@apitzsch.eu>
 <20240621102656.GK1318296@google.com>
 <86f8110e8edc24d0df035b77a1aa68422e48bde1.camel@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86f8110e8edc24d0df035b77a1aa68422e48bde1.camel@apitzsch.eu>

On Sat, 22 Jun 2024, André Apitzsch wrote:

> Hello Lee,
> 
> Am Freitag, dem 21.06.2024 um 11:26 +0100 schrieb Lee Jones:
> > On Sun, 16 Jun 2024, André Apitzsch via B4 Relay wrote:
> > 
> > > From: André Apitzsch <git@apitzsch.eu>
> > > 
> > > The SY7802 is a current-regulated charge pump which can regulate
> > > two
> > > current levels for Flash and Torch modes.
> > > 
> > > It is a high-current synchronous boost converter with 2-channel
> > > high
> > > side current sources. Each channel is able to deliver 900mA
> > > current.
> > > 
> > > Signed-off-by: André Apitzsch <git@apitzsch.eu>
> > > ---
> > >  drivers/leds/flash/Kconfig       |  11 +
> > >  drivers/leds/flash/Makefile      |   1 +
> > >  drivers/leds/flash/leds-sy7802.c | 542
> > > +++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 554 insertions(+)
> > 
> > Generally very nice.
> > 
> > Just a couple of teensy nits to fix then add my and resubmit please.
> > 
> > Acked-by: Lee Jones <lee@kernel.org>
> > 
> > > [...]
> > > diff --git a/drivers/leds/flash/leds-sy7802.c
> > > b/drivers/leds/flash/leds-sy7802.c
> > > new file mode 100644
> > > index 000000000000..c4bea55a62d0
> > > --- /dev/null
> > > +++ b/drivers/leds/flash/leds-sy7802.c
> > > @@ -0,0 +1,542 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * Silergy SY7802 flash LED driver with I2C interface
> > 
> > "an I2C interface"
> > 
> > Or
> > 
> > "I2C interfaces"
> > 
> > > + * Copyright 2024 André Apitzsch <git@apitzsch.eu>
> > > + */
> > > +
> > > +#include <linux/gpio/consumer.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/led-class-flash.h>
> > > +#include <linux/module.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/regmap.h>
> > > +#include <linux/regulator/consumer.h>
> > > +
> > > +#define SY7802_MAX_LEDS 2
> > > +#define SY7802_LED_JOINT 2
> > > +
> > > +#define SY7802_REG_ENABLE		0x10
> > > +#define SY7802_REG_TORCH_BRIGHTNESS	0xa0
> > > +#define SY7802_REG_FLASH_BRIGHTNESS	0xb0
> > > +#define SY7802_REG_FLASH_DURATION	0xc0
> > > +#define SY7802_REG_FLAGS		0xd0
> > > +#define SY7802_REG_CONFIG_1		0xe0
> > > +#define SY7802_REG_CONFIG_2		0xf0
> > > +#define SY7802_REG_VIN_MONITOR		0x80
> > > +#define SY7802_REG_LAST_FLASH		0x81
> > > +#define SY7802_REG_VLED_MONITOR		0x30
> > > +#define SY7802_REG_ADC_DELAY		0x31
> > > +#define SY7802_REG_DEV_ID		0xff
> > > +
> > > +#define SY7802_MODE_OFF		0
> > > +#define SY7802_MODE_TORCH	2
> > > +#define SY7802_MODE_FLASH	3
> > > +#define SY7802_MODE_MASK	GENMASK(1, 0)
> > > +
> > > +#define SY7802_LEDS_SHIFT	3
> > > +#define SY7802_LEDS_MASK(_id)	(BIT(_id) << SY7802_LEDS_SHIFT)
> > > +#define SY7802_LEDS_MASK_ALL	(SY7802_LEDS_MASK(0) |
> > > SY7802_LEDS_MASK(1))
> > > +
> > > +#define SY7802_TORCH_CURRENT_SHIFT	3
> > > +#define SY7802_TORCH_CURRENT_MASK(_id) \
> > > +	(GENMASK(2, 0) << (SY7802_TORCH_CURRENT_SHIFT * (_id)))
> > > +#define SY7802_TORCH_CURRENT_MASK_ALL \
> > > +	(SY7802_TORCH_CURRENT_MASK(0) |
> > > SY7802_TORCH_CURRENT_MASK(1))
> > > +
> > > +#define SY7802_FLASH_CURRENT_SHIFT	4
> > > +#define SY7802_FLASH_CURRENT_MASK(_id) \
> > > +	(GENMASK(3, 0) << (SY7802_FLASH_CURRENT_SHIFT * (_id)))
> > > +#define SY7802_FLASH_CURRENT_MASK_ALL \
> > > +	(SY7802_FLASH_CURRENT_MASK(0) |
> > > SY7802_FLASH_CURRENT_MASK(1))
> > > +
> > > +#define SY7802_TIMEOUT_DEFAULT_US	512000U
> > > +#define SY7802_TIMEOUT_MIN_US		32000U
> > > +#define SY7802_TIMEOUT_MAX_US		1024000U
> > > +#define SY7802_TIMEOUT_STEPSIZE_US	32000U
> > > +
> > > +#define SY7802_TORCH_BRIGHTNESS_MAX 8
> > > +
> > > +#define SY7802_FLASH_BRIGHTNESS_DEFAULT	14
> > > +#define SY7802_FLASH_BRIGHTNESS_MIN	0
> > > +#define SY7802_FLASH_BRIGHTNESS_MAX	15
> > > +#define SY7802_FLASH_BRIGHTNESS_STEP	1
> > > +
> > > +#define SY7802_FLAG_TIMEOUT			BIT(0)
> > > +#define SY7802_FLAG_THERMAL_SHUTDOWN		BIT(1)
> > > +#define SY7802_FLAG_LED_FAULT			BIT(2)
> > > +#define SY7802_FLAG_TX1_INTERRUPT		BIT(3)
> > > +#define SY7802_FLAG_TX2_INTERRUPT		BIT(4)
> > > +#define SY7802_FLAG_LED_THERMAL_FAULT		BIT(5)
> > > +#define SY7802_FLAG_FLASH_INPUT_VOLTAGE_LOW	BIT(6)
> > > +#define SY7802_FLAG_INPUT_VOLTAGE_LOW		BIT(7)
> > > +
> > > +#define SY7802_CHIP_ID	0x51
> > > +
> > > +static const struct reg_default sy7802_regmap_defs[] = {
> > > +	{ SY7802_REG_ENABLE, SY7802_LEDS_MASK_ALL },
> > > +	{ SY7802_REG_TORCH_BRIGHTNESS, 0x92 },
> > > +	{ SY7802_REG_FLASH_BRIGHTNESS,
> > > SY7802_FLASH_BRIGHTNESS_DEFAULT |
> > > +		SY7802_FLASH_BRIGHTNESS_DEFAULT <<
> > > SY7802_FLASH_CURRENT_SHIFT },
> > > +	{ SY7802_REG_FLASH_DURATION, 0x6f },
> > > +	{ SY7802_REG_FLAGS, 0x0 },
> > > +	{ SY7802_REG_CONFIG_1, 0x68 },
> > > +	{ SY7802_REG_CONFIG_2, 0xf0 },
> > 
> > Not your fault, but this interface is frustrating since we have no
> > idea
> > what these register values mean.  IMHO, they should be defined and
> > ORed
> > together in some human readable way.
> > 
> > I say that it's not your fault because I see that this is the most
> > common usage.
> > 
> 
> I don't know how to interpret some bits of the default values. I don't
> have the documentation and changing the bits and observing the behavior
> of the device also didn't help.

And this is the problem.

> Should I remove the entries from sy7802_regmap_defs, which have values
> that we don't fully understand?

No, as I say, it's not your fault.  Sadly this appears to be the norm.

-- 
Lee Jones [李琼斯]

