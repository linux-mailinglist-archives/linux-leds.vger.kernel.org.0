Return-Path: <linux-leds+bounces-1587-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6858BBDA1
	for <lists+linux-leds@lfdr.de>; Sat,  4 May 2024 20:28:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21C92281EF4
	for <lists+linux-leds@lfdr.de>; Sat,  4 May 2024 18:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF2D745D9;
	Sat,  4 May 2024 18:27:56 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtprelay02.ispgateway.de (smtprelay02.ispgateway.de [80.67.31.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524C86EB68;
	Sat,  4 May 2024 18:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.67.31.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714847276; cv=none; b=IDLEJTGIRJpnQ7OfEmbX0HPXz2ztJ39/lkt0ubgC1ZTxIQ0GGJ9N7HC/Xcf1g7/aBwjrHbtoqyRufi4CZEE7UlubfU3u/4iMYeMpfmmqnqjw1Ba3kzvm9FhskeN5ROhXW7/l6ng+cyUsaS+EPDC8mUcix5aAqrySBK/DRxdVY3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714847276; c=relaxed/simple;
	bh=xFJ6dbahCUZbUAhjcrhX4bh6Ij+UbOLcDakcsigJlvI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zk3caJerawX8ieILrAJwK+V0t1TzN36q7iMtksjmJGM8oid4MBMyTitwfRibguB4hOvvdk7xlhhcwEFfM1XcFTBthfGOH9eew9epptT33kraUd7vCSU7lXHKWdCZthVWH7fkTUvLDXhebEUjGMN6/YO+l31dWGsB71AFrGEIVys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; arc=none smtp.client-ip=80.67.31.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
Received: from [92.206.191.65] (helo=framework.lan)
	by smtprelay02.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <git@apitzsch.eu>)
	id 1s3K6A-00000000348-3Dby;
	Sat, 04 May 2024 20:27:02 +0200
Message-ID: <3309a9f1f5848681d0acf3bfdf9b6525fc88e1bc.camel@apitzsch.eu>
Subject: Re: [PATCH v2 2/3] leds: sy7802: Add support for Silergy SY7802
 flash LED controller
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <keescook@chromium.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>,  Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Date: Sat, 04 May 2024 20:27:11 +0200
In-Reply-To: <20240503071953.GD1227636@google.com>
References: <20240401-sy7802-v2-0-1138190a7448@apitzsch.eu>
	 <20240401-sy7802-v2-2-1138190a7448@apitzsch.eu>
	 <20240411124855.GJ1980182@google.com> <20240503071953.GD1227636@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Df-Sender: YW5kcmVAYXBpdHpzY2guZXU=

Am Freitag, dem 03.05.2024 um 08:19 +0100 schrieb Lee Jones:
> On Thu, 11 Apr 2024, Lee Jones wrote:
>=20
> > On Mon, 01 Apr 2024, Andr=C3=A9 Apitzsch via B4 Relay wrote:
> >=20
> > > From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > >=20
> > > Add support for SY7802 flash LED controller. It can support up to
> > > 1.8A
> > > flash current.
> >=20
> > This is a very small commit message for a 500+ line change!
> >=20
> > Please, tell us more.
> >=20
> > > Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > > ---
> > > =C2=A0drivers/leds/flash/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 11 +
> > > =C2=A0drivers/leds/flash/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 1 +
> > > =C2=A0drivers/leds/flash/leds-sy7802.c | 532
> > > +++++++++++++++++++++++++++++++++++++++
> > > =C2=A03 files changed, 544 insertions(+)
> > >=20
> > > diff --git a/drivers/leds/flash/Kconfig
> > > b/drivers/leds/flash/Kconfig
> > > index 809b6d98bb3e..f39f0bfe6eef 100644
> > > --- a/drivers/leds/flash/Kconfig
> > > +++ b/drivers/leds/flash/Kconfig
> > > @@ -121,4 +121,15 @@ config LEDS_SGM3140
> > > =C2=A0	=C2=A0 This option enables support for the SGM3140 500mA
> > > Buck/Boost Charge
> > > =C2=A0	=C2=A0 Pump LED Driver.
> > > =C2=A0
> > > +config LEDS_SY7802
> > > +	tristate "LED support for the Silergy SY7802"
> > > +	depends on I2C && OF
> > > +	depends on GPIOLIB
> > > +	select REGMAP_I2C
> > > +	help
> > > +	=C2=A0 This option enables support for the SY7802 flash LED
> > > controller.
> > > +	=C2=A0 SY7802 includes torch and flash functions with
> > > programmable current.
> > > +
> > > +	=C2=A0 This driver can be built as a module, it will be
> > > called "leds-sy7802".
> > > +
> > > =C2=A0endif # LEDS_CLASS_FLASH
> > > diff --git a/drivers/leds/flash/Makefile
> > > b/drivers/leds/flash/Makefile
> > > index 91d60a4b7952..48860eeced79 100644
> > > --- a/drivers/leds/flash/Makefile
> > > +++ b/drivers/leds/flash/Makefile
> > > @@ -11,3 +11,4 @@ obj-$(CONFIG_LEDS_QCOM_FLASH)	+=3D leds-qcom-
> > > flash.o
> > > =C2=A0obj-$(CONFIG_LEDS_RT4505)	+=3D leds-rt4505.o
> > > =C2=A0obj-$(CONFIG_LEDS_RT8515)	+=3D leds-rt8515.o
> > > =C2=A0obj-$(CONFIG_LEDS_SGM3140)	+=3D leds-sgm3140.o
> > > +obj-$(CONFIG_LEDS_SY7802)	+=3D leds-sy7802.o
> > > diff --git a/drivers/leds/flash/leds-sy7802.c
> > > b/drivers/leds/flash/leds-sy7802.c
> > > new file mode 100644
> > > index 000000000000..c03a571b0e08
> > > --- /dev/null
> > > +++ b/drivers/leds/flash/leds-sy7802.c
> > > @@ -0,0 +1,532 @@
>=20
> [...]
>=20
> > > +static int sy7802_torch_brightness_set(struct led_classdev
> > > *lcdev, enum led_brightness level)
> >=20
> > s/level/brightness/
> >=20
> > > +{
> > > +	struct sy7802_led *led =3D container_of(lcdev, struct
> > > sy7802_led, flash.led_cdev);
> > > +	u32 led_enable_mask =3D led->led_no =3D=3D SY7802_LED_JOINT ?
> > > SY7802_LEDS_MASK_ALL :
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SY7802_LEDS_MASK(led->led_no);
> >=20
> > Do all of the fancy multi-line assignment outside of the
> > declaration block.
> >=20
> > > +	u32 enable_mask =3D SY7802_MODE_MASK | led_enable_mask;
> > > +	u32 val =3D level ? led_enable_mask : SY7802_MODE_OFF;
> > > +	struct sy7802 *chip =3D led->chip;
> > > +	u32 curr;
> >=20
> > This is a temporary placeholder for fled_torch_used, right?
> >=20
> > fled_torch_used_tmp?=C2=A0 Sometimes abbreviated to tmp.
> >=20
> > > +	u32 mask;
> >=20
> > That's a lot of masks.=C2=A0 Which one is this?
> >=20
> > > +	int ret;
> > > +
> > > +	mutex_lock(&chip->mutex);
> > > +
> > > +	/*
> > > +	 * There is only one set of flash control logic, and
> > > this flag is used to check if 'strobe'
> >=20
> > The ',' before 'and' is superfluous.
> >=20
> > > +	 * is currently being used.
> > > +	 */
> >=20
> > Doesn't the variable name kind of imply this?
> >=20
> > > +	if (chip->fled_strobe_used) {
> > > +		dev_warn(chip->dev, "Please disable strobe first
> > > [%d]\n", chip->fled_strobe_used);
> >=20
> > "Cannot set torch brightness whilst strobe is enabled"
> >=20
> > > +		ret =3D -EBUSY;
> > > +		goto unlock;
> > > +	}
> > > +
> > > +	if (level)
> > > +		curr =3D chip->fled_torch_used | BIT(led->led_no);
> > > +	else
> > > +		curr =3D chip->fled_torch_used & ~BIT(led-
> > > >led_no);
> > > +
> > > +	if (curr)
> > > +		val |=3D SY7802_MODE_TORCH;
> > > +
> > > +	/* Torch needs to be disabled first to apply new
> > > brightness */
> >=20
> > "Disable touch to apply brightness"
> >=20
> > > +	ret =3D regmap_update_bits(chip->regmap,
> > > SY7802_REG_ENABLE, SY7802_MODE_MASK,
> > > +				 SY7802_MODE_OFF);
> > > +	if (ret)
> > > +		goto unlock;
> > > +
> > > +	mask =3D led->led_no =3D=3D SY7802_LED_JOINT ?
> > > SY7802_TORCH_CURRENT_MASK_ALL :
> >=20
> > Why not just use led->led_no in place of mask?
>=20
> mask and led->led_no are assigned the same value from this point on.

Thanks for the clarification.
How to you come to the conclusion that mask and led->led_no are
assigned the same value from this point on?

The value of led->led_no is used here only as part of the if condition
(led->led_no =3D=3D SY7802_LED_JOINT) and not assigned to mask.
>=20
> > Easier to read if you drop SY7802_TORCH_CURRENT_MASK_ALL to its own
> > line.
> >=20
> > > +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SY7802_TORCH_CURRENT_MASK(led-=
>led_no);
> > > +
> > > +	/* Register expects brightness between 0 and
> > > MAX_BRIGHTNESS - 1 */
> > > +	if (level)
> > > +		level -=3D 1;
> > > +
> > > +	level |=3D (level << SY7802_TORCH_CURRENT_SHIFT);
> > > +
> > > +	ret =3D regmap_update_bits(chip->regmap,
> > > SY7802_REG_TORCH_BRIGHTNESS, mask, level);
>=20
> So why not kill the single-use 'mask' variable and use a cast version
> of led->led_no here instead?
>=20
> > > +	if (ret)
> > > +		goto unlock;
> > > +
> > > +	ret =3D regmap_update_bits(chip->regmap,
> > > SY7802_REG_ENABLE, enable_mask, val);
> > > +	if (ret)
> > > +		goto unlock;
> > > +
> > > +	chip->fled_torch_used =3D curr;
> > > +
> > > +unlock:
> > > +	mutex_unlock(&chip->mutex);
> > > +	return ret;
> > > +}
>=20


