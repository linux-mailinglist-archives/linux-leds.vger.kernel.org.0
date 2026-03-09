Return-Path: <linux-leds+bounces-7160-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEL/K0wPr2kYNQIAu9opvQ
	(envelope-from <linux-leds+bounces-7160-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 09 Mar 2026 19:19:56 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EFE23E83D
	for <lists+linux-leds@lfdr.de>; Mon, 09 Mar 2026 19:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48E8F3015E28
	for <lists+linux-leds@lfdr.de>; Mon,  9 Mar 2026 18:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C369B344031;
	Mon,  9 Mar 2026 18:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BEUxaf1O"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C238342CBD;
	Mon,  9 Mar 2026 18:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773080226; cv=none; b=JbkV2coPAeghDlh52Q5JXa2c7i2Y7WFsdiKERvLrt1fVb7rZPnwvf0y4SC4KCRk3ICO0gAEhO6MtvCR8XLW6NKC5p+KUHA+G2FOgaednI/hSFNZJSTSwLdTCkYL5v5Hg3oBVl3+HgoFDp0KAesKkp4dESksS65j4Ewr3QS1ddZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773080226; c=relaxed/simple;
	bh=G4UNyhfubQhW15enrhRhpshIhEet1IEL+6vNIUx2R8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=So6T+WUieDD/ST0ZO9e9f1nf7YGr4WBP8UIerB4Wxfw8x8Ig2wuuNHpQY3+6IHGLHQ3p3m1F9spb+CN1IlUMnsl5+pQyeOm9q9rQ9TyEYngtWQ15WdA7WihI/UiQMb7ASApaMwU4DbtUDOMqZ+rJtcMfeKakLF9dIeZZoopmqx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BEUxaf1O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17DE5C2BC87;
	Mon,  9 Mar 2026 18:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773080226;
	bh=G4UNyhfubQhW15enrhRhpshIhEet1IEL+6vNIUx2R8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BEUxaf1O7G0wPzRsCpeV9oRD65XYGfApNyfeRw3FyR8/abKWf5+oglRDHwSLIhWqr
	 ktJqiQV0cocViMyOHafu/K8xe7jh+Q0R+fsQYpesap4z44NyMiQmZhfmR71YfDjA5h
	 017pf5OlKVICUno8JFitNFQ//TPgxaDbQikNKFcaLKcfZgWwRfd/vHLxofSu4l4dgT
	 2ZwPO5Zn6qNkTskXj/8wXSDJ9BGZmzBnz2koP6/Qhm0YtzM7/C3zR+uRg0yqrIdqi7
	 oDedcctWn21umG3DdvZcLV7YO2mvXPml9tI3YM0yFNqpzvqRpVuF+k7dd3I8HLbLAB
	 lTnSQ1rorwK9w==
Date: Mon, 9 Mar 2026 18:17:02 +0000
From: Lee Jones <lee@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Pavel Machek <pavel@kernel.org>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH RESEND] leds: lp5860: detect and report fault state
Message-ID: <20260309181702.GX183676@google.com>
References: <20260305-v6-19-topic-ti-lp5860-fault-v1-1-2219827f0524@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260305-v6-19-topic-ti-lp5860-fault-v1-1-2219827f0524@pengutronix.de>
X-Rspamd-Queue-Id: 18EFE23E83D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7160-lists,linux-leds=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pengutronix.de:email]
X-Rspamd-Action: no action

On Thu, 05 Mar 2026, Steffen Trumtrar wrote:

> The lp5860 can detect shorts and open circuits. If an open (LOD) or
> short (LSD) is detected, the global bit in LP5860_FAULT_STATE is set.
> The channel that caused this can be read from the corresponding Dot_lsdX
> and Dot_lodX register and bit offset.
> 
> The global bits can be cleared by writing 0xf to the LOD/LSD_clear
> register.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  Documentation/ABI/testing/sysfs-class-spi-lp5860 |  50 +++++++++
>  drivers/leds/rgb/leds-lp5860-core.c              | 135 +++++++++++++++++++++++
>  include/linux/platform_data/leds-lp5860.h        |  12 +-
>  3 files changed, 196 insertions(+), 1 deletion(-)

I don't have a general issue with this.

Couple of nits to fix.

Also give the LED community chance to take a better look.

> diff --git a/Documentation/ABI/testing/sysfs-class-spi-lp5860 b/Documentation/ABI/testing/sysfs-class-spi-lp5860
> index 80b22a9d66421..ded9eec855bd9 100644
> --- a/Documentation/ABI/testing/sysfs-class-spi-lp5860
> +++ b/Documentation/ABI/testing/sysfs-class-spi-lp5860
> @@ -21,3 +21,53 @@ Contact:        Steffen Trumtrar <kernel@pengutronix.de>
>  Description:
>  	Contains and sets the global brightness for the R color group.
>  	Can be adjusted in 128 steps from 0% to 100% of the maximum brightness.

What is this applied to?

> +
> +What:           /sys/class/spi_master/spi<bus>/spi<bus>.<dev>/fault_state
> +Date:           January 2026
> +KernelVersion:  6.19

Update.

> +Contact:        Steffen Trumtrar <kernel@pengutronix.de>
> +Description:
> +	Contains and sets the global fault state:
> +
> +	* 3: Open and short detected
> +	* 2: Open detected
> +	* 1: Short detected
> +
> +	Can be cleared by writing the corresponding value back to fault_state.
> +
> +	Example usage::
> +
> +		## Read
> +		# cat /sys/class/spi_master/spi<bus>/spi<bus>.<dev>/fault_state
> +		2
> +
> +		## Write
> +		# echo 2 > /sys/class/spi_master/spi<bus>/spi<bus>.<dev>/fault_state
> +
> +What:           /sys/class/spi_master/spi<bus>/spi<bus>.<dev>/fault_state_open
> +Date:           January 2026
> +KernelVersion:  6.19
> +Contact:        Steffen Trumtrar <kernel@pengutronix.de>
> +Description:
> +	Contains all LEDs and channels where an open condition was detected.
> +	The format is ledname:channel.
> +
> +	Example usage::
> +
> +		## Read
> +		# cat /sys/class/spi_master/spi<bus>/spi<bus>.<dev>/fault_state_open
> +		rgb1:0 rgb2:4
> +
> +What:           /sys/class/spi_master/spi<bus>/spi<bus>.<dev>/fault_state_short
> +Date:           May 2025
> +KernelVersion:  6.15
> +Contact:        Steffen Trumtrar <kernel@pengutronix.de>
> +Description:
> +	Contains all LEDs and channels where a short condition was detected.
> +	The format is ledname:channel.
> +
> +	Example usage::
> +
> +		## Read
> +		# cat /sys/class/spi_master/spi<bus>/spi<bus>.<dev>/fault_state_short
> +		rgb1:0 rgb2:4
> diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-lp5860-core.c
> index 79a932edd1d24..ef00577a63a73 100644
> --- a/drivers/leds/rgb/leds-lp5860-core.c
> +++ b/drivers/leds/rgb/leds-lp5860-core.c
> @@ -19,6 +19,138 @@ static struct lp5860_led *mcled_cdev_to_led(struct led_classdev_mc *mc_cdev)
>  	return container_of(mc_cdev, struct lp5860_led, mc_cdev);
>  }
>  
> +static const char *lp5860_find_led(struct lp5860 *lp, unsigned int idx)

lp5860_led_name()

> +{
> +	struct mc_subled *mc_led_info;
> +	struct lp5860_led *led;

You could define these inside the scope.

> +	int i, j;
> +
> +	for (i = lp->leds_count - 1; i >= 0; i--) {

What's the reason for counting downwards?

> +		led = &lp->leds[i];
> +
> +		mc_led_info = led->mc_cdev.subled_info;
> +
> +		for (j = 0; j < led->mc_cdev.num_colors; j++) {

for (int j ... ?

> +			if (mc_led_info[j].channel == idx)

Is there no guarantee that j == channel?

Are there gaps?

> +				return led->mc_cdev.led_cdev.dev->kobj.name;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static ssize_t lp5860_fault_state_lod_lsd(struct lp5860 *led, char *buf,

What does that name even mean?

Can it be improved?

> +					  unsigned int reg, unsigned int length)
> +{
> +	unsigned int value = 0;
> +	unsigned int dot, bit;
> +	unsigned int max_bits;
> +	unsigned int offset = 0;
> +	int len = 0;
> +	bool match = false;

This doesn't need to be initialised.

> +	int ret;
> +
> +	for (dot = 0; dot < length; dot++) {
> +		match = false;

-ENOSQUISH - add a '\n'

> +		ret = regmap_read(led->regmap, reg + dot, &value)
> +		if (ret)
> +			return ret;
> +
> +		max_bits = BITS_PER_BYTE;
> +		/* every 3rd Dot_x register only has 2 bits */

Sentences start with an uppercase char.

> +		if (dot % 3 == 2)
> +			max_bits = 2;
> +
> +		for (bit = 0; bit < max_bits; bit++) {
> +			offset++;

-ENOSQUISH - add a '\n'

> +			if (value & BIT(bit)) {
> +				len += sprintf(buf + len, "%s:%d", lp5860_find_led(led, offset),
> +					       offset - 1);
> +				match = true;
> +				len += sprintf(buf + len, " ");
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
> +					    struct device_attribute *attr,
> +					    char *buf)
> +{
> +	struct lp5860 *led = dev_get_drvdata(dev);
> +	unsigned int value = 0;
> +	int ret;
> +
> +	ret = regmap_read(led->regmap, LP5860_REG_FAULT_STATE, &value);
> +	if (ret)
> +		return ret;
> +
> +	if (!(value & LP5860_FAULT_STATE_LOD))
> +		return 0;
> +
> +	return lp5860_fault_state_lod_lsd(led, buf, LP5860_REG_DOT_LOD_START,
> +					  LP5860_DOT_LOD_LENGTH);
> +}
> +static LP5860_DEV_ATTR_R(fault_state_open);
> +
> +static ssize_t lp5860_fault_state_short_show(struct device *dev,
> +					     struct device_attribute *attr, char *buf)
> +{
> +	struct lp5860 *led = dev_get_drvdata(dev);
> +	unsigned int value = 0;

Can regmap_read() succeed and not initialise value?

> +	int ret;
> +
> +	ret = regmap_read(led->regmap, LP5860_REG_FAULT_STATE, &value);
> +	if (ret)
> +		return ret;
> +
> +	if (!(value & LP5860_FAULT_STATE_LSD))
> +		return 0;
> +
> +	return lp5860_fault_state_lod_lsd(led, buf, LP5860_REG_DOT_LSD_START,
> +					  LP5860_DOT_LSD_LENGTH);
> +}
> +static LP5860_DEV_ATTR_R(fault_state_short);
> +
> +static ssize_t lp5860_fault_state_show(struct device *dev,
> +				  struct device_attribute *attr, char *buf)
> +{
> +	struct lp5860 *led = dev_get_drvdata(dev);
> +	unsigned int value = 0;
> +	int ret;
> +
> +	ret = regmap_read(led->regmap, LP5860_REG_FAULT_STATE, &value);
> +	if (ret)
> +		return ret;

-ENOSQUISH - add a '\n'

> +	return sysfs_emit(buf, "%d\n", (value & 0x3));
> +}
> +
> +static ssize_t lp5860_fault_state_store(struct device *dev,
> +					struct device_attribute *attr,
> +					const char *buf, size_t len)
> +{
> +	struct lp5860 *led = dev_get_drvdata(dev);
> +	unsigned int value = 0;
> +	int ret;
> +
> +	if (kstrtoint(buf, 0, &value))
> +		return -EINVAL;
> +
> +	if (value & LP5860_FAULT_STATE_LOD)
> +		ret = regmap_write(led->regmap, LP5860_REG_LOD_CLEAR, 0xf);
> +	if (value & LP5860_FAULT_STATE_LSD)
> +		ret = regmap_write(led->regmap, LP5860_REG_LSD_CLEAR, 0xf);
> +
> +	if (ret < 0)
> +		return ret;

-ENOSQUISH - add a '\n'

> +	return len;
> +}
> +static LP5860_DEV_ATTR_RW(fault_state);
> +
>  LP5860_SHOW_MODE(r_global_brightness_set, LP5860_REG_R_CURRENT_SET, LP5860_CC_GROUP_MASK, 0)
>  LP5860_STORE_MODE(r_global_brightness_set, LP5860_REG_R_CURRENT_SET, LP5860_CC_GROUP_MASK, 0)
>  DEVICE_ATTR_RW(r_global_brightness_set);
> @@ -35,6 +167,9 @@ static struct attribute *lp5860_led_attrs[] = {
>  	&dev_attr_r_global_brightness_set.attr,
>  	&dev_attr_g_global_brightness_set.attr,
>  	&dev_attr_b_global_brightness_set.attr,
> +	&dev_attr_fault_state_open.attr,
> +	&dev_attr_fault_state_short.attr,
> +	&dev_attr_fault_state.attr,
>  	NULL,
>  };
>  
> diff --git a/include/linux/platform_data/leds-lp5860.h b/include/linux/platform_data/leds-lp5860.h
> index 94d184702b11a..d032a0e6d2617 100644
> --- a/include/linux/platform_data/leds-lp5860.h
> +++ b/include/linux/platform_data/leds-lp5860.h
> @@ -189,6 +189,9 @@
>  #define LP5860_DOT_CS_OFF		0x00
>  
>  /* Dot lod value */
> +#define LP5860_FAULT_STATE_LOD		BIT(1)
> +#define LP5860_FAULT_STATE_LSD		BIT(0)

I don't see the point of defines if the nomenclature isn't self explanatory.

>  #define LP5860_DOT_LOD0_OFFSET		0
>  #define LP5860_DOT_LOD1_OFFSET		1
>  #define LP5860_DOT_LOD2_OFFSET		2
> @@ -201,7 +204,9 @@
>  #define LP5860_DOT_LOD_ON		0x01
>  #define LP5860_DOT_LOD_OFF		0x00
>  
> -/* dot lsd value */
> +/* Dot lsd value */
> +#define LP5860_DOT_LOD_LENGTH		0x20
> +
>  #define LP5860_DOT_LSD0_OFFSET		0
>  #define LP5860_DOT_LSD1_OFFSET		1
>  #define LP5860_DOT_LSD2_OFFSET		2
> @@ -215,6 +220,8 @@
>  #define LP5860_DOT_LSD_OFF		0x00
>  
>  /* Register lod state */
> +#define LP5860_DOT_LSD_LENGTH		0x20
> +
>  #define LP5860_GLOBAL_LOD_OFFSET	1
>  #define LP5860_GLOBAL_LOD_STATE		BIT(1)
>  #define LP5860_GLOBAL_LSD_OFFSET	0
> @@ -248,6 +255,9 @@
>   */
>  #define LP5860_MAX_LED_CHANNELS		4
>  
> +#define LP5860_DEV_ATTR_R(name)	\
> +	DEVICE_ATTR(name, 0444, lp5860_##name##_show, NULL)
> +
>  #define LP5860_DEV_ATTR_RW(name)	\
>  	DEVICE_ATTR(name, 0644, lp5860_##name##_show, lp5860_##name##_store)
>  
> 
> ---
> base-commit: d60f615f21e161506b3ac9bee8add471f0e27a8c
> change-id: 20260129-v6-19-topic-ti-lp5860-fault-c8bd1f59fc3f
> 
> Best regards,
> -- 
> Steffen Trumtrar <s.trumtrar@pengutronix.de>
> 
> 

-- 
Lee Jones [李琼斯]

