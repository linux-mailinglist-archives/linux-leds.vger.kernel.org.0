Return-Path: <linux-leds+bounces-8434-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LjC7JbvhHmpBYQAAu9opvQ
	(envelope-from <linux-leds+bounces-8434-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 15:59:23 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5003562F165
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 15:59:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aWUHG1qS;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8434-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8434-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3CC330732DF
	for <lists+linux-leds@lfdr.de>; Tue,  2 Jun 2026 13:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03CA03E3165;
	Tue,  2 Jun 2026 13:46:50 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E7C184540;
	Tue,  2 Jun 2026 13:46:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780408009; cv=none; b=BZ3tQr57C1l5ItOcQyNyHOt4snkhBPMGEsdIUgxKFPuwP4WdGoqtTauwrE6H4TLnvrf0EMNf4dyDnmoTvmTFSyFnpFyFDiEzAHQ4LPA/6c0oCoxVVMybft6qBBIBNrFoEziRVoaL4YgnwzXxqnwuenJFPppCLfiK6IxSRFC4gwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780408009; c=relaxed/simple;
	bh=/rFMl+t/sgIOPn5QzW96gzwP6SekZR6pe/WyeBDqoC4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mKFmZeGrJ9BZ08yVSnFzuQ1/8XBYn9plY8HaiMHNxj8GRtZ/0jVK4aAS4WYmWCHIeUh9tDWDJoAmr5N1bLwm5ahPZsgZAIPLzIvDSwoPCh3tuO47YAQXBPyyj5rsVRxDUn0Z+Evc0A5zZ8E/IW94h74KuUCZmRnmzL6rMJehcMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aWUHG1qS; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E97DE1F00893;
	Tue,  2 Jun 2026 13:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780408008;
	bh=GgeCHMOQLe7sziJLA5PC7VCAR6QFsAiheuuHn0qTd64=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=aWUHG1qS7mkth6CXBwpvSXYjBb1mcBxf/mTnTn8YApkbS84Ww7v9tkqSycJnQ1FoF
	 u0bJ0cITis94bgo0251eNpPSEWBBT7nStcjYqWHr2+Vi+R2xragrvI95L4n0ymf3R/
	 W7MhrtQS5doAZefjwSYdVJhHIHM7YtvNDK6w6L7Hiduo602lmhZO4+eGNYmaGaxCkL
	 /BsvDewnbkOgNvdOdJXQ2kyTqRGoEpl7chl+hL6jIByooAFN2QfeemARFuTLgmYKpE
	 hnhQYNCwa6S0ug5OX2CCXQSd39OxKK/gAWx9JkgTHwYat7rHU57hnNeOIh3pUNYn7j
	 yANrkBsMoO1Ow==
Date: Tue, 2 Jun 2026 14:46:40 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, Jingoo
 Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 05/11] mfd: lm3533: Convert to use OF bindings
Message-ID: <20260602144640.433b4d35@jic23-huawei>
In-Reply-To: <20260601151831.76350-6-clamor95@gmail.com>
References: <20260601151831.76350-1-clamor95@gmail.com>
	<20260601151831.76350-6-clamor95@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-8434-lists,linux-leds=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jic23-huawei:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5003562F165

On Mon,  1 Jun 2026 18:18:25 +0300
Svyatoslav Ryhel <clamor95@gmail.com> wrote:

> Since there are no users of this driver via platform data, remove the
> platform data support and switch to using Device Tree bindings.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>


> index 52136ca1abc9..55b35467a722 100644
> --- a/drivers/iio/light/lm3533-als.c
> +++ b/drivers/iio/light/lm3533-als.c
> @@ -16,16 +16,19 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/mfd/core.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
>  #include <linux/uaccess.h>
> +#include <linux/units.h>
>  
>  #include <linux/mfd/lm3533.h>
>  
>  
> -#define LM3533_ALS_RESISTOR_MIN			1
> -#define LM3533_ALS_RESISTOR_MAX			127
> +#define LM3533_ALS_RESISTOR_MIN			1575
> +#define LM3533_ALS_RESISTOR_MAX			200000
>  #define LM3533_ALS_CHANNEL_CURRENT_MAX		2
>  #define LM3533_ALS_THRESH_MAX			3
>  #define LM3533_ALS_ZONE_MAX			4
> @@ -57,6 +60,9 @@ struct lm3533_als {
>  
>  	atomic_t zone;
>  	struct mutex thresh_mutex;
> +
> +	bool pwm_mode;
> +	u32 r_select;
>  };
>  
>  
> @@ -411,7 +417,7 @@ static ssize_t show_thresh_either_en(struct device *dev,
>  	int enable;
>  	int ret;
>  
> -	if (als->irq) {
> +	if (als->irq > 0) {
>  		ret = lm3533_als_get_int_mode(indio_dev, &enable);
>  		if (ret)
>  			return ret;
> @@ -716,30 +722,34 @@ static const struct attribute_group lm3533_als_attribute_group = {
>  	.attrs = lm3533_als_attributes
>  };
>  
> -static int lm3533_als_setup(struct lm3533_als *als,
> -			    const struct lm3533_als_platform_data *pdata)
> +static int lm3533_als_setup(struct lm3533_als *als)
>  {
>  	struct device *dev = &als->pdev->dev;
>  	int ret;
>  
> +	als->pwm_mode = device_property_read_bool(dev, "ti,pwm-mode");
> +
>  	ret = regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_CONF,
>  				 LM3533_ALS_INPUT_MODE_MASK,
> -				 pdata->pwm_mode ? LM3533_ALS_INPUT_MODE_MASK : 0);
> +				 als->pwm_mode ? LM3533_ALS_INPUT_MODE_MASK : 0);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to set input mode %d\n",
> -				     pdata->pwm_mode);
> -
> +				     als->pwm_mode);
>  
>  	/* ALS input is always high impedance in PWM-mode. */
> -	if (!pdata->pwm_mode) {
> -		if (pdata->r_select < LM3533_ALS_RESISTOR_MIN ||
> -		    pdata->r_select > LM3533_ALS_RESISTOR_MAX) {
> -			dev_err(&als->pdev->dev, "invalid resistor value\n");
> -			return -EINVAL;
> -		}
> +	if (!als->pwm_mode) {
> +		ret = device_property_read_u32(dev, "ti,resistor-value-ohms",
> +					       &als->r_select);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to ger resistor value\n");
> +
> +		als->r_select = clamp(als->r_select, LM3533_ALS_RESISTOR_MIN,
> +				      LM3533_ALS_RESISTOR_MAX);

If we are getting garbage from DT I think I'd rather error out that paper over
that problem.  So similar to before, check valid value and if not fail probe
so that hopefully someone goes and fixes it!

> +		als->r_select = DIV_ROUND_UP(2 * MICRO, 10 * als->r_select);
Why do we need this when we didn't before?  The range checks are the same
so it smells like it shouldn't need transforming. I'd also rather we didn't do
rewriting of the meaning of r_select like this.  Just use a local variable for
the intermediate result.

>  
>  		ret = regmap_write(als->lm3533->regmap, LM3533_REG_ALS_RESISTOR_SELECT,
> -				   pdata->r_select);
> +				   als->r_select);
>  		if (ret)
>  			return dev_err_probe(dev, ret, "failed to set resistor\n");

