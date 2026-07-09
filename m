Return-Path: <linux-leds+bounces-8992-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DrFHLqGIT2rgiwIAu9opvQ
	(envelope-from <linux-leds+bounces-8992-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 09 Jul 2026 13:40:17 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5208D7307A5
	for <lists+linux-leds@lfdr.de>; Thu, 09 Jul 2026 13:40:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=luqf4TSA;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8992-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8992-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3070D30262B4
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jul 2026 11:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4D640E8D7;
	Thu,  9 Jul 2026 11:35:46 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D553F888B;
	Thu,  9 Jul 2026 11:35:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596946; cv=none; b=bj4W2gw3Vmg6nqKCM2gKcd1JPoJ9gxYcMU5ePV+8SuQkBR23JjEC/fId8hJnO15mLOJkudAfQafqbVZXCFtVHaTzFtnxGe/ik66JzkBEKSi44TCKnSGV0ZghVfizum8KfAYe9zI4mhCflF7lr2L9ApFD8ZZA1V9832Byg7mfrak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596946; c=relaxed/simple;
	bh=0rjQcI2OPKUKUl9Yko9tsMHD8MNqThC6iECyloXvAVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eA+O5kn2YiUUYGpWOGeu8VzqtbAQF0f7qhv3f0MwOKOwPDNrKt5J+SHJYs3MP8pDkju0Xp8MTV8i6axbg++5CM7XxQXRebkt1K4hiECblarVYpZamTafJP2wI11qkxmR/Y5SUx6Iap0chMBuoCYilMo8yfq6jvnL3gfs7Jhl0bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=luqf4TSA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05BB41F000E9;
	Thu,  9 Jul 2026 11:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783596944;
	bh=1c6mUjCZOqLQwrGzIogJ2i8Aw7ouEW2uw/W/sP+YbgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=luqf4TSAgD+NYg0nCAmX8WQHb8724ci4Vp2ajIFJvqgeQzPlNZ5WGrMdPrYdcaZF8
	 d8eTTKxqsmIp4uQgi/rTxsX2mGfK1uNE8UVtVHBCg+H1lbJ1ESMbHEN6Hty+QZ4t/f
	 tF0UeOAghkh+ukka6w99rwNJ2acJO/z2SNxeHhBUd2yw7GHBPAKNITnElM9JPkoRzl
	 USw4ZJnLltbYf16nsct/XoNzfro02kXS24POJoPbTxrQkZvmxNqBgeCVsnwHguxjWB
	 9P1pvlM5zi2VIYdVGzep+vtnLP2QP36Pnu/SfZfW+ehtnP2IbK4k2OZHB2RDiMF2VM
	 5lOlT1wA8xpMA==
Date: Thu, 9 Jul 2026 12:35:39 +0100
From: Lee Jones <lee@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/3] leds: pca963x: add multicolor LED class support
Message-ID: <20260709113539.GH2045740@google.com>
References: <20260701-monza-leds-v2-0-c1be0b472926@oss.qualcomm.com>
 <20260701-monza-leds-v2-2-c1be0b472926@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701-monza-leds-v2-2-c1be0b472926@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8992-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5208D7307A5

/* Sashiko Automation: Reviewed (0 Findings) */

On Wed, 01 Jul 2026, Loic Poulain wrote:

> Allow grouping of individual PCA963x PWM channels into a single
> multicolor LED device by adding support for the LED multicolor class.
> 
> A child node with sub-children is treated as a multicolor group,
> others are treated as single leds, keeping full backwards compatibility.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/leds/Kconfig        |   1 +
>  drivers/leds/leds-pca963x.c | 126 ++++++++++++++++++++++++++++++++++++++------
>  2 files changed, 110 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index f4a0a3c8c8705e0f10ba26584277dbb2d5eac5b5..14df88f92b12bbe43908b67f9480cf23056e27e2 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -596,6 +596,7 @@ config LEDS_PCA963X
>  	tristate "LED support for PCA963x I2C chip"
>  	depends on LEDS_CLASS
>  	depends on I2C
> +	select LEDS_CLASS_MULTICOLOR
>  	help
>  	  This option enables support for LEDs connected to the PCA963x
>  	  LED driver chip accessed via the I2C bus. Supported
> diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
> index e3a81c60ee27c96e5050a829523dfd43e1f0663f..f6f6bafcc2bd5bad51a3184c4cb08fc50693a0a5 100644
> --- 'drivers/leds/leds-pca963x.c'
> +++ 'drivers/leds/leds-pca963x.c'
> @@ -27,6 +27,7 @@
>  #include <linux/string.h>
>  #include <linux/ctype.h>
>  #include <linux/leds.h>
> +#include <linux/led-class-multicolor.h>
>  #include <linux/err.h>
>  #include <linux/i2c.h>
>  #include <linux/property.h>
> @@ -101,8 +102,11 @@ struct pca963x;
>  struct pca963x_led {
>  	struct pca963x *chip;
>  	struct led_classdev led_cdev;
> +	struct led_classdev_mc mc_cdev;
> +	struct mc_subled subleds[4];
>  	int led_num; /* 0 .. 15 potentially */
>  	bool blinking;
> +	bool is_mc;
>  	u8 gdc;
>  	u8 gfrq;
>  };
> @@ -205,7 +209,7 @@ static int pca963x_power_state(struct pca963x_led *led)
>  	unsigned long *leds_on = &led->chip->leds_on;
>  	unsigned long cached_leds = *leds_on;
>  
> -	if (led->led_cdev.brightness)
> +	if (led->is_mc ? led->mc_cdev.led_cdev.brightness : led->led_cdev.brightness)
>  		set_bit(led->led_num, leds_on);
>  	else
>  		clear_bit(led->led_num, leds_on);
> @@ -237,6 +241,28 @@ static int pca963x_led_set(struct led_classdev *led_cdev,
>  	return ret;
>  }
>  
> +static int pca963x_led_mc_set(struct led_classdev *led_cdev,
> +			      enum led_brightness value)
> +{
> +	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(led_cdev);
> +	struct pca963x_led *led = container_of(mc_cdev, struct pca963x_led, mc_cdev);
> +	unsigned int i;

Remove this.

> +	int ret;
> +
> +	led_mc_calc_color_components(mc_cdev, value);
> +
> +	guard(mutex)(&led->chip->mutex);
> +
> +	for (i = 0; i < mc_cdev->num_colors; i++) {

for (int i = 0; ...

> +		led->led_num = mc_cdev->subled_info[i].channel;
> +		ret = pca963x_brightness(led, mc_cdev->subled_info[i].brightness);
> +		if (ret < 0)

Can (ret) work?

> +			return ret;
> +	}
> +
> +	return pca963x_power_state(led);
> +}
> +
>  static unsigned int pca963x_period_scale(struct pca963x_led *led,
>  					 unsigned int val)
>  {
> @@ -300,6 +326,84 @@ static int pca963x_blink_set(struct led_classdev *led_cdev,
>  	return 0;
>  }
>  
> +static int pca963x_register_single_led(struct device *dev,
> +					struct pca963x_led *led, u32 reg,
> +					struct fwnode_handle *fwnode,
> +					bool hw_blink)
> +{
> +	struct led_init_data init_data = {};
> +	char default_label[32];

How sure are you that this cannot overflow?

> +	struct i2c_client *client = led->chip->client;
> +
> +	led->led_num = reg;

There's quite a bit of duplication here.  How about calling a common
function an only do the genuinely different things in these two new
functions?

> +	led->is_mc = false;
> +	led->led_cdev.brightness_set_blocking = pca963x_led_set;
> +	if (hw_blink)
> +		led->led_cdev.blink_set = pca963x_blink_set;
> +
> +	init_data.fwnode = fwnode;
> +	init_data.devicename = "pca963x";
> +	snprintf(default_label, sizeof(default_label), "%d:%.2x:%u",
> +		 client->adapter->nr, client->addr, reg);
> +	init_data.default_label = default_label;
> +
> +	return devm_led_classdev_register_ext(dev, &led->led_cdev, &init_data);
> +}
> +
> +static int pca963x_register_mc_led(struct device *dev,
> +				   struct pca963x_led *led, u32 reg,
> +				   struct fwnode_handle *fwnode,
> +				   const struct pca963x_chipdef *chipdef)
> +{
> +	struct mc_subled *subleds = led->subleds;
> +	unsigned int num_colors = 0;
> +	struct led_init_data init_data = {};
> +	char default_label[32];
> +	struct i2c_client *client = led->chip->client;
> +	int ret;
> +
> +	fwnode_for_each_child_node_scoped(fwnode, sub) {
> +		u32 color, subreg;
> +
> +		if (num_colors >= ARRAY_SIZE(led->subleds)) {
> +			dev_err(dev, "Too many sub-LEDs for node %pfw\n", fwnode);

dev_err_probe()

> +			return -EINVAL;
> +		}
> +
> +		ret = fwnode_property_read_u32(sub, "reg", &subreg);
> +		if (ret || subreg >= chipdef->n_leds) {
> +			dev_err(dev, "Invalid 'reg' for sub-LED %pfw\n", sub);
> +			return -EINVAL;
> +		}
> +
> +		ret = fwnode_property_read_u32(sub, "color", &color);
> +		if (ret) {
> +			dev_err(dev, "Missing 'color' for sub-LED %pfw\n", sub);
> +			return ret;
> +		}
> +
> +		subleds[num_colors].channel = subreg;
> +		subleds[num_colors].color_index = color;
> +		subleds[num_colors].intensity = LED_FULL;
> +		num_colors++;
> +	}
> +
> +	led->led_num = reg;
> +	led->is_mc = true;
> +	led->mc_cdev.subled_info = subleds;
> +	led->mc_cdev.num_colors = num_colors;
> +	led->mc_cdev.led_cdev.max_brightness = LED_FULL;
> +	led->mc_cdev.led_cdev.brightness_set_blocking = pca963x_led_mc_set;
> +
> +	init_data.fwnode = fwnode;
> +	init_data.devicename = "pca963x";
> +	snprintf(default_label, sizeof(default_label), "%d:%.2x:%u",
> +		 client->adapter->nr, client->addr, reg);
> +	init_data.default_label = default_label;
> +
> +	return devm_led_classdev_multicolor_register_ext(dev, &led->mc_cdev, &init_data);
> +}
> +
>  static int pca963x_register_leds(struct i2c_client *client,
>  				 struct pca963x *chip)
>  {
> @@ -338,9 +442,6 @@ static int pca963x_register_leds(struct i2c_client *client,
>  		return ret;
>  
>  	device_for_each_child_node_scoped(dev, child) {
> -		struct led_init_data init_data = {};
> -		char default_label[32];
> -
>  		ret = fwnode_property_read_u32(child, "reg", &reg);
>  		if (ret || reg >= chipdef->n_leds) {
>  			dev_err(dev, "Invalid 'reg' property for node %pfw\n",
> @@ -348,22 +449,13 @@ static int pca963x_register_leds(struct i2c_client *client,
>  			return -EINVAL;
>  		}
>  
> -		led->led_num = reg;
>  		led->chip = chip;
> -		led->led_cdev.brightness_set_blocking = pca963x_led_set;
> -		if (hw_blink)
> -			led->led_cdev.blink_set = pca963x_blink_set;
>  		led->blinking = false;
>  
> -		init_data.fwnode = child;
> -		/* for backwards compatibility */
> -		init_data.devicename = "pca963x";
> -		snprintf(default_label, sizeof(default_label), "%d:%.2x:%u",
> -			 client->adapter->nr, client->addr, reg);
> -		init_data.default_label = default_label;
> -
> -		ret = devm_led_classdev_register_ext(dev, &led->led_cdev,
> -						     &init_data);
> +		if (fwnode_get_child_node_count(child) > 0)
> +			ret = pca963x_register_mc_led(dev, led, reg, child, chipdef);
> +		else
> +			ret = pca963x_register_single_led(dev, led, reg, child, hw_blink);
>  		if (ret) {
>  			dev_err(dev, "Failed to register LED for node %pfw\n",
>  				child);

dev_err_probe()

-- 
Lee Jones

