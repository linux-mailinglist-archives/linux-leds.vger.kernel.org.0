Return-Path: <linux-leds+bounces-7404-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yL+MBNM7vGl3uwIAu9opvQ
	(envelope-from <linux-leds+bounces-7404-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 19:09:23 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AB82D0941
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 19:09:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3942B3002D54
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 18:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5CD3988F1;
	Thu, 19 Mar 2026 18:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="snsion2J"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D02397E7D;
	Thu, 19 Mar 2026 18:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773943745; cv=none; b=iAuA3h0iWhHYNVpUDZ4f2DyTlFLWM+I51RpVhYzBm7oUaXI2zoWbW+FkE2AUHMfdwwA2fL0TANYl4VW1bRE9Xob5CFGKbxyu/TMi6yNWVTQzJ2qUHP1biAvvaKqBQ0CS+5qsgo9ClhbX0IHdXF6xyjcVxCNu1GJfQwxR3d9MK8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773943745; c=relaxed/simple;
	bh=KVQUuInv2BEI/9De+//VJanX2324GLpt+IHYEawboWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gRCqkUqp2OLlajee2AE8IBN6rKtCNY1NcWDJ+CbTkqAcnoZH3jTP7M5NotHITeAcob1vLg5tvJMlVaCf4S4vowN8UBo5U65FfiizLEIdl3L5NB23btNNpg6PJfulOF4JRPNR/Q+BbQjBbCVZgTHkpo/WuSbC4Ff1qAIbl/7PobQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=snsion2J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C150EC19425;
	Thu, 19 Mar 2026 18:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773943745;
	bh=KVQUuInv2BEI/9De+//VJanX2324GLpt+IHYEawboWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=snsion2J0ud74YIbHAxDVuDZaJP/3Kf91wOXjZ7Y2RYpRASMjpSK31TX/rjq1V1wx
	 fui148neBIeqr8wtv3NbiZk0N9PC0fC/RqN8uAb9zgW3ZPABc6xx61hnwADqkH4HB2
	 642JWkbC5hRjHwPHp4gQjaQFXRze/KHsNe/MPSLcE2OnU6AdxMmJKgdyejFEW619M9
	 JHEnJLY8D4kRt1uq/twFbriGCyALoUHUyR3ehP7KGWDIiiHdr3n/5Llom2zfk1aqzO
	 EmZiPnjeOoJI88L0XfXRky4F74fkUIiP1RjSDOyjVOMBKDx/uDAR6Q7p8LNftvIGwE
	 l9u7yKnqHXrEg==
Date: Thu, 19 Mar 2026 18:09:00 +0000
From: Lee Jones <lee@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Pavel Machek <pavel@kernel.org>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 2/2] leds: lp5860: detect and report fault state
Message-ID: <20260319180900.GB2902881@google.com>
References: <20260311-v6-19-topic-ti-lp5860-fault-v2-0-f9454910f009@pengutronix.de>
 <20260311-v6-19-topic-ti-lp5860-fault-v2-2-f9454910f009@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260311-v6-19-topic-ti-lp5860-fault-v2-2-f9454910f009@pengutronix.de>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7404-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pengutronix.de:email]
X-Rspamd-Queue-Id: 80AB82D0941
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 11 Mar 2026, Steffen Trumtrar wrote:

> The lp5860 can detect shorts and open circuits. If an open (LOD) or
> short (LSD) is detected, the global bit in LP5860_FAULT_STATE is set.
> The channel that caused this can be read from the corresponding Dot_lsdX
> and Dot_lodX register and bit offset.
> 
> The global bits can be cleared by writing 0xf to the LOD/LSD_clear
> register.

The commit message describes what the hardware does, which is good context,
but it should also describe what this patch does. For instance, it adds
sysfs attributes to expose this fault detection functionality. Could you
please add a sentence or two about the implementation?

> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  drivers/leds/rgb/leds-lp5860-core.c       | 143 ++++++++++++++++++++++++++++++
>  include/linux/platform_data/leds-lp5860.h |  19 +++-
>  2 files changed, 159 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-lp5860-core.c
> index 28b4d86e11f1a..b62a1db18c05b 100644
> --- a/drivers/leds/rgb/leds-lp5860-core.c
> +++ b/drivers/leds/rgb/leds-lp5860-core.c
> @@ -19,6 +19,149 @@ static struct lp5860_led *mcled_cdev_to_led(struct led_classdev_mc *mc_cdev)
>  	return container_of(mc_cdev, struct lp5860_led, mc_cdev);
>  }
>  
> +static const char *lp5860_led_name(struct lp5860 *lp, unsigned int idx)
> +{
> +	for (int i = 0; i < lp->leds_count; i++) {
> +		struct mc_subled *mc_led_info;
> +		struct lp5860_led *led;
> +
> +		led = &lp->leds[i];
> +
> +		mc_led_info = led->mc_cdev.subled_info;
> +
> +		for (int j = 0; j < led->mc_cdev.num_colors; j++) {
> +			if (mc_led_info[j].channel == idx)
> +				return led->mc_cdev.led_cdev.dev->kobj.name;
> +		}
> +	}
> +
> +	return 0;
> +}

This nested loop appears to be quite inefficient, especially since it may be
called many times from `lp5860_get_fault_state()`.

It would be better to build a reverse mapping array (channel index to
LED name) during probe to make this an O(1) lookup at runtime?

> +
> +static ssize_t lp5860_get_fault_state(struct lp5860 *led, char *buf,
> +				     unsigned int reg, unsigned int length)

The parameter name `led` here is a bit confusing, as it refers to the chip
private data, not a specific LED. This should be `lp` or `chip`.

> +{
> +	int len = 0;
> +
> +	for (unsigned int dot = 0; dot < length; dot++) {
> +		unsigned int offset = 0;
> +		unsigned int value;
> +		unsigned int max_bits;
> +		int ret;
> +
> +		ret = regmap_read(led->regmap, reg + dot, &value);
> +		if (ret)
> +			return ret;
> +
> +		max_bits = BITS_PER_BYTE;
> +		/* Every 3rd Dot_x register only has 2 bits */
> +		if (dot % 3 == 2)
> +			max_bits = 2;
> +
> +		for (unsigned int bit = 0; bit < max_bits; bit++) {
> +			offset++;
> +
> +			if (value & BIT(bit)) {
> +				len += sprintf(buf + len, "%s:%d", lp5860_led_name(led, offset),
> +					      offset - 1);

A sysfs buffer is only `PAGE_SIZE`. Using unbounded `sprintf` in a loop
risks a buffer overflow if there are many faults and/or long LED names.
It would be safer to use `scnprintf` here to ensure you don't write past
the end of the buffer.

> +				len += sprintf(buf + len, " ");

Why not add the space in during the one above?

> +			}
> +		}
> +	}
> +
> +	buf[len++] = '\n';
> +
> +	return len;
> +}
> +
> +static ssize_t lp5860_fault_state_open_show(struct device *dev,
> +					   struct device_attribute *attr,
> +					   char *buf)
> +{
> +	struct lp5860 *led = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = regmap_read(led->regmap, LP5860_REG_FAULT_STATE, &value);
> +	if (ret)
> +		return ret;
> +
> +	if (!(value & LP5860_FAULT_STATE_OPEN_DETECTION))
> +		return 0;
> +
> +	return lp5860_get_fault_state(led, buf, LP5860_REG_DOT_LOD_START,
> +				     LP5860_DOT_LOD_LENGTH);
> +}
> +static LP5860_DEV_ATTR_R(fault_state_open);
> +
> +static ssize_t lp5860_fault_state_short_show(struct device *dev,
> +					    struct device_attribute *attr, char *buf)
> +{
> +	struct lp5860 *led = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = regmap_read(led->regmap, LP5860_REG_FAULT_STATE, &value);
> +	if (ret)
> +		return ret;
> +
> +	if (!(value & LP5860_FAULT_STATE_SHORT_DETECTION))
> +		return 0;
> +
> +	return lp5860_get_fault_state(led, buf, LP5860_REG_DOT_LSD_START,
> +				     LP5860_DOT_LSD_LENGTH);
> +}
> +static LP5860_DEV_ATTR_R(fault_state_short);
> +
> +static ssize_t lp5860_fault_state_show(struct device *dev,
> +				 struct device_attribute *attr, char *buf)
> +{
> +	struct lp5860 *led = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = regmap_read(led->regmap, LP5860_REG_FAULT_STATE, &value);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%d\n", (value & 0x3));

No magic numbers.  Please define the 3.

> +}
> +
> +static ssize_t lp5860_fault_state_store(struct device *dev,
> +					struct device_attribute *attr,
> +					const char *buf, size_t len)
> +{
> +	struct lp5860 *led = dev_get_drvdata(dev);
> +	unsigned int value = 0;
> +	int ret;

The `ret` variable is not initialized here. If `value` is 0, `ret` will be
used uninitialized in the `if (ret < 0)` check below. Please initialize it
to 0.

> +
> +	if (kstrtoint(buf, 0, &value))
> +		return -EINVAL;
> +
> +	if (value & LP5860_FAULT_STATE_OPEN_DETECTION)
> +		ret = regmap_write(led->regmap, LP5860_REG_LOD_CLEAR, 0xf);

The value `0xf` seems magical. The commit message mentions it, but could we
have a define for this, like `LP5860_FAULT_CLEAR_ALL`?

Also, if this `regmap_write()` fails, the next `if` block will still be
executed, overwriting the error code in `ret`. We should probably check and
return on failure immediately.

> +
> +	if (value & LP5860_FAULT_STATE_SHORT_DETECTION)
> +		ret = regmap_write(led->regmap, LP5860_REG_LSD_CLEAR, 0xf);

Define the 0xf.

> +
> +	if (ret < 0)
> +		return ret;
> +
> +	return len;
> +}
> +static LP5860_DEV_ATTR_RW(fault_state);
> +
> +static struct attribute *lp5860_led_attrs[] = {
> +	&dev_attr_fault_state_open.attr,
> +	&dev_attr_fault_state_short.attr,
> +	&dev_attr_fault_state.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group lp5860_led_group = {
> +	.attrs = lp5860_led_attrs,
> +};

Where is this used?

> +
>  static int lp5860_set_dot_onoff(struct lp5860_led *led, unsigned int dot, bool enable)
>  {
>  	unsigned int offset = dot / LP5860_MAX_DOT_ONOFF_GROUP_NUM;
> diff --git a/include/linux/platform_data/leds-lp5860.h b/include/linux/platform_data/leds-lp5860.h
> index 7bc69a7a550dd..7b2cc88d70e24 100644
> --- a/include/linux/platform_data/leds-lp5860.h
> +++ b/include/linux/platform_data/leds-lp5860.h
> @@ -188,7 +188,9 @@
>  #define LP5860_DOT_CS_ON		0x01
>  #define LP5860_DOT_CS_OFF		0x00
>  
> -/* Dot lod value */
> +/* Dot LED open detection (LOD) value */
> +#define LP5860_FAULT_STATE_OPEN_DETECTION	BIT(1)
> +
>  #define LP5860_DOT_LOD0_OFFSET		0
>  #define LP5860_DOT_LOD1_OFFSET		1
>  #define LP5860_DOT_LOD2_OFFSET		2
> @@ -201,7 +203,11 @@
>  #define LP5860_DOT_LOD_ON		0x01
>  #define LP5860_DOT_LOD_OFF		0x00
>  
> -/* dot lsd value */
> +#define LP5860_DOT_LOD_LENGTH		0x20
> +
> +/* Dot LED short detection (LSD) value */
> +#define LP5860_FAULT_STATE_SHORT_DETECTION	BIT(0)
> +
>  #define LP5860_DOT_LSD0_OFFSET		0
>  #define LP5860_DOT_LSD1_OFFSET		1
>  #define LP5860_DOT_LSD2_OFFSET		2
> @@ -214,7 +220,8 @@
>  #define LP5860_DOT_LSD_ON		0x01
>  #define LP5860_DOT_LSD_OFF		0x00
>  
> -/* Register lod state */
> +#define LP5860_DOT_LSD_LENGTH		0x20
> +
>  #define LP5860_GLOBAL_LOD_OFFSET	1
>  #define LP5860_GLOBAL_LOD_STATE		BIT(1)
>  #define LP5860_GLOBAL_LSD_OFFSET	0
> @@ -248,6 +255,12 @@
>   */
>  #define LP5860_MAX_LED_CHANNELS		4
>  
> +#define LP5860_DEV_ATTR_R(name)	\
> +	DEVICE_ATTR(name, 0444, lp5860_##name##_show, NULL)
> +
> +#define LP5860_DEV_ATTR_RW(name)	\
> +	DEVICE_ATTR(name, 0644, lp5860_##name##_show, lp5860_##name##_store)

These macros seem like a bit of a superfluous abstraction. The standard
`DEVICE_ATTR_RO()` and `DEVICE_ATTR_RW()` macros are well-known and would
work just fine if you renamed the handler functions to drop the
`lp5860_` prefix (e.g., `fault_state_open_show()`).

> +
>  struct lp5860_led {
>  	struct lp5860 *chip;
>  	struct led_classdev_mc mc_cdev;
> 
> -- 
> 2.51.0
> 

-- 
Lee Jones [李琼斯]

