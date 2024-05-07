Return-Path: <linux-leds+bounces-1623-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCD18BDD46
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2024 10:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAF0F1C210CC
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2024 08:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F65614D2B8;
	Tue,  7 May 2024 08:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KhSBliwr"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123AF13CA8D;
	Tue,  7 May 2024 08:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715071259; cv=none; b=kIkMsXnMuFJrDGh1WcljmzDxJmeSN40pWVuYFPl89s/OUibjcdc2LwdGwmUtFkzn8YlB6sxQGQshiqyjoDK6lxxHIznDiofuATNGS9tktc0JRv/gr35fq1E2RA5YMAqK/+rqKsC2mECTJ0d5pepsylcF3wD90k01lWDUbm9vjfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715071259; c=relaxed/simple;
	bh=sUjfAESTunl9013EBi9dsmv2GLZ5rTVceLRbegv7l8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mKIbnsDIBnDG6EuFvzxCbcSPW5IMZyGfO6YjIYDXvLQaDA7iCZra+ygqJCuRYy0cJ9Xke9AU4JRF5apqnRvZd5es94TgD1J4BwA6E/BmrICxThTRqpQ3Qk1MwThWvGVCN57sHGWcRnH3OIGRZCzh7Q4fsc4EBSoVOIpqkYZzQaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KhSBliwr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2607AC3277B;
	Tue,  7 May 2024 08:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715071258;
	bh=sUjfAESTunl9013EBi9dsmv2GLZ5rTVceLRbegv7l8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KhSBliwrI/bU2fZ42hVY1khLzHigeyRIA/KhyOPr/A0NKIb3ugHhAkZYBAYYg78+4
	 nDFLqlYda/5fbLCZhTM/cMxc9mM2X5Dw3nAeNJFVsLQReagAvalOWQd+4dWCwnI1WR
	 yjWc+JBRcVIdp0YdqdB0fYPDFlAuhysswwhXi86TgowjWEDnXJ3o7dkyo00xCMy5eN
	 D6ZKTyybzFg+so1fTvzcXQK/v8K3FIoKubLjPQKCtHRsvjYB65fMeK/GhoibnrZ866
	 97fyP0TE8kIdSkfuEaADnQyyLKWndlw9vs9NiwCdPbrmQ0OUGmb117mNbbur88tUeq
	 3m7Hrytq62LpA==
Date: Tue, 7 May 2024 09:40:52 +0100
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] leds: sy7802: Add support for Silergy SY7802
 flash LED controller
Message-ID: <20240507084052.GW1227636@google.com>
References: <20240401-sy7802-v2-0-1138190a7448@apitzsch.eu>
 <20240401-sy7802-v2-2-1138190a7448@apitzsch.eu>
 <20240411124855.GJ1980182@google.com>
 <20240503071953.GD1227636@google.com>
 <3309a9f1f5848681d0acf3bfdf9b6525fc88e1bc.camel@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3309a9f1f5848681d0acf3bfdf9b6525fc88e1bc.camel@apitzsch.eu>

On Sat, 04 May 2024, André Apitzsch wrote:

> Am Freitag, dem 03.05.2024 um 08:19 +0100 schrieb Lee Jones:
> > On Thu, 11 Apr 2024, Lee Jones wrote:
> > 
> > > On Mon, 01 Apr 2024, André Apitzsch via B4 Relay wrote:
> > > 
> > > > From: André Apitzsch <git@apitzsch.eu>
> > > > 
> > > > Add support for SY7802 flash LED controller. It can support up to
> > > > 1.8A
> > > > flash current.
> > > 
> > > This is a very small commit message for a 500+ line change!
> > > 
> > > Please, tell us more.
> > > 
> > > > Signed-off-by: André Apitzsch <git@apitzsch.eu>
> > > > ---
> > > >  drivers/leds/flash/Kconfig       |  11 +
> > > >  drivers/leds/flash/Makefile      |   1 +
> > > >  drivers/leds/flash/leds-sy7802.c | 532
> > > > +++++++++++++++++++++++++++++++++++++++
> > > >  3 files changed, 544 insertions(+)
> > > > 
> > > > diff --git a/drivers/leds/flash/Kconfig
> > > > b/drivers/leds/flash/Kconfig
> > > > index 809b6d98bb3e..f39f0bfe6eef 100644
> > > > --- a/drivers/leds/flash/Kconfig
> > > > +++ b/drivers/leds/flash/Kconfig
> > > > @@ -121,4 +121,15 @@ config LEDS_SGM3140
> > > >  	  This option enables support for the SGM3140 500mA
> > > > Buck/Boost Charge
> > > >  	  Pump LED Driver.
> > > >  
> > > > +config LEDS_SY7802
> > > > +	tristate "LED support for the Silergy SY7802"
> > > > +	depends on I2C && OF
> > > > +	depends on GPIOLIB
> > > > +	select REGMAP_I2C
> > > > +	help
> > > > +	  This option enables support for the SY7802 flash LED
> > > > controller.
> > > > +	  SY7802 includes torch and flash functions with
> > > > programmable current.
> > > > +
> > > > +	  This driver can be built as a module, it will be
> > > > called "leds-sy7802".
> > > > +
> > > >  endif # LEDS_CLASS_FLASH
> > > > diff --git a/drivers/leds/flash/Makefile
> > > > b/drivers/leds/flash/Makefile
> > > > index 91d60a4b7952..48860eeced79 100644
> > > > --- a/drivers/leds/flash/Makefile
> > > > +++ b/drivers/leds/flash/Makefile
> > > > @@ -11,3 +11,4 @@ obj-$(CONFIG_LEDS_QCOM_FLASH)	+= leds-qcom-
> > > > flash.o
> > > >  obj-$(CONFIG_LEDS_RT4505)	+= leds-rt4505.o
> > > >  obj-$(CONFIG_LEDS_RT8515)	+= leds-rt8515.o
> > > >  obj-$(CONFIG_LEDS_SGM3140)	+= leds-sgm3140.o
> > > > +obj-$(CONFIG_LEDS_SY7802)	+= leds-sy7802.o
> > > > diff --git a/drivers/leds/flash/leds-sy7802.c
> > > > b/drivers/leds/flash/leds-sy7802.c
> > > > new file mode 100644
> > > > index 000000000000..c03a571b0e08
> > > > --- /dev/null
> > > > +++ b/drivers/leds/flash/leds-sy7802.c
> > > > @@ -0,0 +1,532 @@
> > 
> > [...]
> > 
> > > > +static int sy7802_torch_brightness_set(struct led_classdev
> > > > *lcdev, enum led_brightness level)
> > > 
> > > s/level/brightness/
> > > 
> > > > +{
> > > > +	struct sy7802_led *led = container_of(lcdev, struct
> > > > sy7802_led, flash.led_cdev);
> > > > +	u32 led_enable_mask = led->led_no == SY7802_LED_JOINT ?
> > > > SY7802_LEDS_MASK_ALL :
> > > > +			      SY7802_LEDS_MASK(led->led_no);
> > > 
> > > Do all of the fancy multi-line assignment outside of the
> > > declaration block.
> > > 
> > > > +	u32 enable_mask = SY7802_MODE_MASK | led_enable_mask;
> > > > +	u32 val = level ? led_enable_mask : SY7802_MODE_OFF;
> > > > +	struct sy7802 *chip = led->chip;
> > > > +	u32 curr;
> > > 
> > > This is a temporary placeholder for fled_torch_used, right?
> > > 
> > > fled_torch_used_tmp?  Sometimes abbreviated to tmp.
> > > 
> > > > +	u32 mask;
> > > 
> > > That's a lot of masks.  Which one is this?
> > > 
> > > > +	int ret;
> > > > +
> > > > +	mutex_lock(&chip->mutex);
> > > > +
> > > > +	/*
> > > > +	 * There is only one set of flash control logic, and
> > > > this flag is used to check if 'strobe'
> > > 
> > > The ',' before 'and' is superfluous.
> > > 
> > > > +	 * is currently being used.
> > > > +	 */
> > > 
> > > Doesn't the variable name kind of imply this?
> > > 
> > > > +	if (chip->fled_strobe_used) {
> > > > +		dev_warn(chip->dev, "Please disable strobe first
> > > > [%d]\n", chip->fled_strobe_used);
> > > 
> > > "Cannot set torch brightness whilst strobe is enabled"
> > > 
> > > > +		ret = -EBUSY;
> > > > +		goto unlock;
> > > > +	}
> > > > +
> > > > +	if (level)
> > > > +		curr = chip->fled_torch_used | BIT(led->led_no);
> > > > +	else
> > > > +		curr = chip->fled_torch_used & ~BIT(led-
> > > > >led_no);
> > > > +
> > > > +	if (curr)
> > > > +		val |= SY7802_MODE_TORCH;
> > > > +
> > > > +	/* Torch needs to be disabled first to apply new
> > > > brightness */
> > > 
> > > "Disable touch to apply brightness"
> > > 
> > > > +	ret = regmap_update_bits(chip->regmap,
> > > > SY7802_REG_ENABLE, SY7802_MODE_MASK,
> > > > +				 SY7802_MODE_OFF);
> > > > +	if (ret)
> > > > +		goto unlock;
> > > > +
> > > > +	mask = led->led_no == SY7802_LED_JOINT ?
> > > > SY7802_TORCH_CURRENT_MASK_ALL :
> > > 
> > > Why not just use led->led_no in place of mask?
> > 
> > mask and led->led_no are assigned the same value from this point on.
> 
> Thanks for the clarification.
> How to you come to the conclusion that mask and led->led_no are
> assigned the same value from this point on?

Because I am blind and didn't see the double equals ("==").

#shouldhavegonetospecsavers

-- 
Lee Jones [李琼斯]

