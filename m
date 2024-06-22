Return-Path: <linux-leds+bounces-2101-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5266D913397
	for <lists+linux-leds@lfdr.de>; Sat, 22 Jun 2024 13:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1159D284487
	for <lists+linux-leds@lfdr.de>; Sat, 22 Jun 2024 11:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F7AB15531A;
	Sat, 22 Jun 2024 11:57:55 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtprelay01.ispgateway.de (smtprelay01.ispgateway.de [80.67.18.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B2814C591;
	Sat, 22 Jun 2024 11:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.67.18.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719057475; cv=none; b=Rtc7zUCmiMKIKKrQkqXzyzkDUEm2NqkoGgtjI54Ore7E0hra2AaSJ5+ZNGTBqsXOxwdmi/oHCfg3S5sNtPCTkcibgpW0jv4ovPuG4vB+ePai3Y0JeuZ450vieutnatp75p+SO7Jc2XklR1fvIonurSdsXFFhqGZ3ooqJkNxi4bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719057475; c=relaxed/simple;
	bh=4nNz2jv+VOICXuXw2R1uGsao3nWrsCy0ZjQNa4eOHH0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZOrnFbti2DBaOVcbTgrLbp/8xqK4QWxhl8oOyTth0UpeAoq60e50hgJ5WI6LbV9QQYWdNQ4EsBkbd/jqKG3uq6n2RfH/GEOYM5zUJk9OApJXB1zvR6TB/FDqMXLPFziWNhZh3BMp4bKmaQgwgVMhYz871sxmbBL3QvO/rcSA63M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; arc=none smtp.client-ip=80.67.18.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
Received: from [92.206.190.41] (helo=framework.lan)
	by smtprelay01.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <git@apitzsch.eu>)
	id 1sKzKz-000000005fV-1pf2;
	Sat, 22 Jun 2024 13:55:21 +0200
Message-ID: <86f8110e8edc24d0df035b77a1aa68422e48bde1.camel@apitzsch.eu>
Subject: Re: [PATCH v4 2/3] leds: sy7802: Add support for Silergy SY7802
 flash LED controller
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,  Trilok Soni
 <quic_tsoni@quicinc.com>, Kees Cook <kees@kernel.org>,
 linux-leds@vger.kernel.org,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-hardening@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,  ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
Date: Sat, 22 Jun 2024 13:55:25 +0200
In-Reply-To: <20240621102656.GK1318296@google.com>
References: <20240616-sy7802-v4-0-789994180e05@apitzsch.eu>
	 <20240616-sy7802-v4-2-789994180e05@apitzsch.eu>
	 <20240621102656.GK1318296@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Df-Sender: YW5kcmVAYXBpdHpzY2guZXU=

Hello Lee,

Am Freitag, dem 21.06.2024 um 11:26 +0100 schrieb Lee Jones:
> On Sun, 16 Jun 2024, Andr=C3=A9 Apitzsch via B4 Relay wrote:
>=20
> > From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> >=20
> > The SY7802 is a current-regulated charge pump which can regulate
> > two
> > current levels for Flash and Torch modes.
> >=20
> > It is a high-current synchronous boost converter with 2-channel
> > high
> > side current sources. Each channel is able to deliver 900mA
> > current.
> >=20
> > Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > ---
> > =C2=A0drivers/leds/flash/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 11 +
> > =C2=A0drivers/leds/flash/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 1 +
> > =C2=A0drivers/leds/flash/leds-sy7802.c | 542
> > +++++++++++++++++++++++++++++++++++++++
> > =C2=A03 files changed, 554 insertions(+)
>=20
> Generally very nice.
>=20
> Just a couple of teensy nits to fix then add my and resubmit please.
>=20
> Acked-by: Lee Jones <lee@kernel.org>
>=20
> > [...]
> > diff --git a/drivers/leds/flash/leds-sy7802.c
> > b/drivers/leds/flash/leds-sy7802.c
> > new file mode 100644
> > index 000000000000..c4bea55a62d0
> > --- /dev/null
> > +++ b/drivers/leds/flash/leds-sy7802.c
> > @@ -0,0 +1,542 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Silergy SY7802 flash LED driver with I2C interface
>=20
> "an I2C interface"
>=20
> Or
>=20
> "I2C interfaces"
>=20
> > + * Copyright 2024 Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > + */
> > +
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/kernel.h>
> > +#include <linux/led-class-flash.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> > +
> > +#define SY7802_MAX_LEDS 2
> > +#define SY7802_LED_JOINT 2
> > +
> > +#define SY7802_REG_ENABLE		0x10
> > +#define SY7802_REG_TORCH_BRIGHTNESS	0xa0
> > +#define SY7802_REG_FLASH_BRIGHTNESS	0xb0
> > +#define SY7802_REG_FLASH_DURATION	0xc0
> > +#define SY7802_REG_FLAGS		0xd0
> > +#define SY7802_REG_CONFIG_1		0xe0
> > +#define SY7802_REG_CONFIG_2		0xf0
> > +#define SY7802_REG_VIN_MONITOR		0x80
> > +#define SY7802_REG_LAST_FLASH		0x81
> > +#define SY7802_REG_VLED_MONITOR		0x30
> > +#define SY7802_REG_ADC_DELAY		0x31
> > +#define SY7802_REG_DEV_ID		0xff
> > +
> > +#define SY7802_MODE_OFF		0
> > +#define SY7802_MODE_TORCH	2
> > +#define SY7802_MODE_FLASH	3
> > +#define SY7802_MODE_MASK	GENMASK(1, 0)
> > +
> > +#define SY7802_LEDS_SHIFT	3
> > +#define SY7802_LEDS_MASK(_id)	(BIT(_id) << SY7802_LEDS_SHIFT)
> > +#define SY7802_LEDS_MASK_ALL	(SY7802_LEDS_MASK(0) |
> > SY7802_LEDS_MASK(1))
> > +
> > +#define SY7802_TORCH_CURRENT_SHIFT	3
> > +#define SY7802_TORCH_CURRENT_MASK(_id) \
> > +	(GENMASK(2, 0) << (SY7802_TORCH_CURRENT_SHIFT * (_id)))
> > +#define SY7802_TORCH_CURRENT_MASK_ALL \
> > +	(SY7802_TORCH_CURRENT_MASK(0) |
> > SY7802_TORCH_CURRENT_MASK(1))
> > +
> > +#define SY7802_FLASH_CURRENT_SHIFT	4
> > +#define SY7802_FLASH_CURRENT_MASK(_id) \
> > +	(GENMASK(3, 0) << (SY7802_FLASH_CURRENT_SHIFT * (_id)))
> > +#define SY7802_FLASH_CURRENT_MASK_ALL \
> > +	(SY7802_FLASH_CURRENT_MASK(0) |
> > SY7802_FLASH_CURRENT_MASK(1))
> > +
> > +#define SY7802_TIMEOUT_DEFAULT_US	512000U
> > +#define SY7802_TIMEOUT_MIN_US		32000U
> > +#define SY7802_TIMEOUT_MAX_US		1024000U
> > +#define SY7802_TIMEOUT_STEPSIZE_US	32000U
> > +
> > +#define SY7802_TORCH_BRIGHTNESS_MAX 8
> > +
> > +#define SY7802_FLASH_BRIGHTNESS_DEFAULT	14
> > +#define SY7802_FLASH_BRIGHTNESS_MIN	0
> > +#define SY7802_FLASH_BRIGHTNESS_MAX	15
> > +#define SY7802_FLASH_BRIGHTNESS_STEP	1
> > +
> > +#define SY7802_FLAG_TIMEOUT			BIT(0)
> > +#define SY7802_FLAG_THERMAL_SHUTDOWN		BIT(1)
> > +#define SY7802_FLAG_LED_FAULT			BIT(2)
> > +#define SY7802_FLAG_TX1_INTERRUPT		BIT(3)
> > +#define SY7802_FLAG_TX2_INTERRUPT		BIT(4)
> > +#define SY7802_FLAG_LED_THERMAL_FAULT		BIT(5)
> > +#define SY7802_FLAG_FLASH_INPUT_VOLTAGE_LOW	BIT(6)
> > +#define SY7802_FLAG_INPUT_VOLTAGE_LOW		BIT(7)
> > +
> > +#define SY7802_CHIP_ID	0x51
> > +
> > +static const struct reg_default sy7802_regmap_defs[] =3D {
> > +	{ SY7802_REG_ENABLE, SY7802_LEDS_MASK_ALL },
> > +	{ SY7802_REG_TORCH_BRIGHTNESS, 0x92 },
> > +	{ SY7802_REG_FLASH_BRIGHTNESS,
> > SY7802_FLASH_BRIGHTNESS_DEFAULT |
> > +		SY7802_FLASH_BRIGHTNESS_DEFAULT <<
> > SY7802_FLASH_CURRENT_SHIFT },
> > +	{ SY7802_REG_FLASH_DURATION, 0x6f },
> > +	{ SY7802_REG_FLAGS, 0x0 },
> > +	{ SY7802_REG_CONFIG_1, 0x68 },
> > +	{ SY7802_REG_CONFIG_2, 0xf0 },
>=20
> Not your fault, but this interface is frustrating since we have no
> idea
> what these register values mean.=C2=A0 IMHO, they should be defined and
> ORed
> together in some human readable way.
>=20
> I say that it's not your fault because I see that this is the most
> common usage.
>=20

I don't know how to interpret some bits of the default values. I don't
have the documentation and changing the bits and observing the behavior
of the device also didn't help.

Should I remove the entries from sy7802_regmap_defs, which have values
that we don't fully understand?

Regards,
Andr=C3=A9

