Return-Path: <linux-leds+bounces-7618-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGYcMsswzGmwRAYAu9opvQ
	(envelope-from <linux-leds+bounces-7618-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 22:38:35 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F7D371306
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 22:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B3FBE3019DBC
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 20:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D913D7D70;
	Tue, 31 Mar 2026 20:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="HKXSj+63"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D031B24728F;
	Tue, 31 Mar 2026 20:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774989509; cv=none; b=T4ci8/esmYyh6KokNphQIDy5SWuB3T243/E4keGM8iLlY9Nyg3/z9m/i1v0Ans/GY1NG3vi3cOarDy3P8cN2Kl+hYeYeHz/jz4nIBsv5CQmKBteTg+Cp09oZg3PxucX5meHV25JuXsMzP8f2XI3vU7Nh4i6xDMvo3dkjkZLNsSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774989509; c=relaxed/simple;
	bh=09oynIkf/ul7uGmXCfgZs+pFvynRBgw3FgFV5V9uCpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NGLxFYln86izg83oak20LYMYr2+cqeX5mQW6Rtp71wFNNZWzyOPaFN6ZXlwpFKvOoNfpirOg5sXuO94fj+ubYjLjXPTGom1tAeLbi8CF20sNlaaGLitoOWDzc0Wt/J+6RgaMeFSIFPGpwo/QRB85N/60RXLfEc0uzuKNT747WKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=HKXSj+63; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.178.25] (i5C75F65A.versanet.de [92.117.246.90])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id B28212FC0057;
	Tue, 31 Mar 2026 22:38:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1774989498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KtyAzynuSGbYAq0uC7s8RjAvxvriLQ/RfZWfKCbcI5A=;
	b=HKXSj+63kU1TLlNemN2La8GK/hLdS1wPWswdKhZdHaKMwTghqfRstBkbjwO22XDh8ASmIt
	5tC7aypDy9/afVoVaYbdYZn2Adr759ZDfZ/T5f2ZO1FhXtiJpPkc4U/O4VvYgKyf+Hf+wH
	voil5E/3SeQi+AnbRRaz6aHXK14HMFg=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <f4f19b88-226c-4720-8375-52e37b36370d@tuxedocomputers.com>
Date: Tue, 31 Mar 2026 22:38:16 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] leds: Introduce the multi_max_intensity sysfs
 attribute
To: Armin Wolf <W_Armin@gmx.de>, lee@kernel.org, pavel@kernel.org
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 linux-leds@vger.kernel.org, linux-doc@vger.kernel.org,
 jacek.anaszewski@gmail.com, pobrn@protonmail.com, m.tretter@pengutronix.de
References: <20260331191619.3729-1-W_Armin@gmx.de>
 <20260331191619.3729-2-W_Armin@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20260331191619.3729-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[tuxedocomputers.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[tuxedocomputers.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7618-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmx.de,kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lwn.net,linuxfoundation.org,gmail.com,protonmail.com,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wse@tuxedocomputers.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[tuxedocomputers.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,tuxedocomputers.com:dkim,tuxedocomputers.com:email,tuxedocomputers.com:mid]
X-Rspamd-Queue-Id: B8F7D371306
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Am 31.03.26 um 21:16 schrieb Armin Wolf:
> Some multicolor LEDs support global brightness control in hardware,
> meaning that the maximum intensity of the color components is not
> connected to the maximum global brightness. Such LEDs cannot be
> described properly by the current multicolor LED class interface,
> because it assumes that the maximum intensity of each color component
> is described by the maximum global brightness of the LED.
>
> Fix this by introducing a new sysfs attribute called
> "multi_max_intensity" holding the maximum intensity values for the
> color components of a multicolor LED class device. Drivers can use
> the new max_intensity field inside struct mc_subled to tell the
> multicolor LED class code about those values. Intensity values written
> by userspace applications will be limited to this maximum value.
>
> Drivers for multicolor LEDs that do not support global brightness
> control in hardware might still want to use the maximum global LED
> brightness supplied via devicetree as the maximum intensity of each
> individual color component. Such drivers should set max_intensity
> to 0 so that the multicolor LED core can act accordingly.
>
> The lp50xx and ncp5623 LED drivers already use hardware-based control
> for the global LED brightness. Modify those drivers to correctly
> initalize .max_intensity to avoid being limited to the maximum global
> brightness supplied via devicetree.

same as v1:

lgtm

Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>

Best regards,

Werner

>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   .../ABI/testing/sysfs-class-led-multicolor    | 19 ++++++--
>   Documentation/leds/leds-class-multicolor.rst  | 21 ++++++++-
>   drivers/leds/led-class-multicolor.c           | 47 ++++++++++++++++++-
>   drivers/leds/leds-lp50xx.c                    |  1 +
>   drivers/leds/rgb/leds-ncp5623.c               |  4 +-
>   include/linux/led-class-multicolor.h          | 30 +++++++++++-
>   6 files changed, 113 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
> index 16fc827b10cb..197da3e775b4 100644
> --- a/Documentation/ABI/testing/sysfs-class-led-multicolor
> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
> @@ -16,9 +16,22 @@ Date:		March 2020
>   KernelVersion:	5.9
>   Contact:	Dan Murphy <dmurphy@ti.com>
>   Description:	read/write
> -		This file contains array of integers. Order of components is
> -		described by the multi_index array. The maximum intensity should
> -		not exceed /sys/class/leds/<led>/max_brightness.
> +		This file contains an array of integers. The order of components
> +		is described by the multi_index array. The maximum intensity value
> +		supported by each color component is described by the multi_max_intensity
> +		file. Writing intensity values larger than the maximum value of a
> +		given color component will result in those values being clamped.
> +
> +		For additional details please refer to
> +		Documentation/leds/leds-class-multicolor.rst.
> +
> +What:		/sys/class/leds/<led>/multi_max_intensity
> +Date:		March 2026
> +KernelVersion:	7.1
> +Contact:	Armin Wolf <W_Armin@gmx.de>
> +Description:	read
> +		This file contains an array of integers describing the maximum
> +		intensity value for each intensity component.
>   
>   		For additional details please refer to
>   		Documentation/leds/leds-class-multicolor.rst.
> diff --git a/Documentation/leds/leds-class-multicolor.rst b/Documentation/leds/leds-class-multicolor.rst
> index c6b47b4093c4..68340644f80b 100644
> --- a/Documentation/leds/leds-class-multicolor.rst
> +++ b/Documentation/leds/leds-class-multicolor.rst
> @@ -25,10 +25,14 @@ color name to indexed value.
>   The ``multi_index`` file is an array that contains the string list of the colors as
>   they are defined in each ``multi_*`` array file.
>   
> -The ``multi_intensity`` is an array that can be read or written to for the
> +The ``multi_intensity`` file is an array that can be read or written to for the
>   individual color intensities.  All elements within this array must be written in
>   order for the color LED intensities to be updated.
>   
> +The ``multi_max_intensity`` file is an array that contains the maximum intensity
> +value supported by each color intensity. Intensity values above this will be
> +automatically clamped into the supported range.
> +
>   Directory Layout Example
>   ========================
>   .. code-block:: console
> @@ -38,6 +42,7 @@ Directory Layout Example
>       -r--r--r--    1 root     root          4096 Oct 19 16:16 max_brightness
>       -r--r--r--    1 root     root          4096 Oct 19 16:16 multi_index
>       -rw-r--r--    1 root     root          4096 Oct 19 16:16 multi_intensity
> +    -r--r--r--    1 root     root          4096 Oct 19 16:16 multi_max_intensity
>   
>   ..
>   
> @@ -104,3 +109,17 @@ the color LED group.
>       128
>   
>   ..
> +
> +Writing intensity values larger than the maximum specified in ``multi_max_intensity``
> +will result in those values being clamped into the supported range.
> +
> +.. code-block:: console
> +
> +   # cat /sys/class/leds/multicolor:status/multi_max_intensity
> +   255 255 255
> +
> +   # echo 512 512 512 > /sys/class/leds/multicolor:status/multi_intensity
> +   # cat /sys/class/leds/multicolor:status/multi_intensity
> +   255 255 255
> +
> +..
> diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-multicolor.c
> index 6b671f3f9c61..8d763b1ae76f 100644
> --- a/drivers/leds/led-class-multicolor.c
> +++ b/drivers/leds/led-class-multicolor.c
> @@ -7,10 +7,28 @@
>   #include <linux/init.h>
>   #include <linux/led-class-multicolor.h>
>   #include <linux/math.h>
> +#include <linux/minmax.h>
>   #include <linux/module.h>
>   #include <linux/slab.h>
>   #include <linux/uaccess.h>
>   
> +static unsigned int led_mc_get_max_intensity(struct led_classdev_mc *mcled_cdev, size_t index)
> +{
> +	unsigned int max_intensity;
> +
> +	/* The maximum global brightness value might still be changed by
> +	 * led_classdev_register_ext() using devicetree properties. This
> +	 * prevents us from changing subled_info[X].max_intensity when
> +	 * registering a multicolor LED class device, so we have to do
> +	 * this during runtime.
> +	 */
> +	max_intensity = mcled_cdev->subled_info[index].max_intensity;
> +	if (max_intensity)
> +		return max_intensity;
> +
> +	return mcled_cdev->led_cdev.max_brightness;
> +}
> +
>   int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
>   				 enum led_brightness brightness)
>   {
> @@ -27,6 +45,27 @@ int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
>   }
>   EXPORT_SYMBOL_GPL(led_mc_calc_color_components);
>   
> +static ssize_t multi_max_intensity_show(struct device *dev,
> +					struct device_attribute *intensity_attr, char *buf)
> +{
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
> +	unsigned int max_intensity;
> +	int len = 0;
> +	int i;
> +
> +	for (i = 0; i < mcled_cdev->num_colors; i++) {
> +		max_intensity = led_mc_get_max_intensity(mcled_cdev, i);
> +		len += sysfs_emit_at(buf, len, "%u", max_intensity);
> +		if (i < mcled_cdev->num_colors - 1)
> +			len += sprintf(buf + len, " ");
> +	}
> +
> +	buf[len++] = '\n';
> +	return len;
> +}
> +static DEVICE_ATTR_RO(multi_max_intensity);
> +
>   static ssize_t multi_intensity_store(struct device *dev,
>   				struct device_attribute *intensity_attr,
>   				const char *buf, size_t size)
> @@ -35,6 +74,7 @@ static ssize_t multi_intensity_store(struct device *dev,
>   	struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
>   	int nrchars, offset = 0;
>   	unsigned int intensity_value[LED_COLOR_ID_MAX];
> +	unsigned int max_intensity;
>   	int i;
>   	ssize_t ret;
>   
> @@ -56,8 +96,10 @@ static ssize_t multi_intensity_store(struct device *dev,
>   		goto err_out;
>   	}
>   
> -	for (i = 0; i < mcled_cdev->num_colors; i++)
> -		mcled_cdev->subled_info[i].intensity = intensity_value[i];
> +	for (i = 0; i < mcled_cdev->num_colors; i++) {
> +		max_intensity = led_mc_get_max_intensity(mcled_cdev, i);
> +		mcled_cdev->subled_info[i].intensity = min(intensity_value[i], max_intensity);
> +	}
>   
>   	if (!test_bit(LED_BLINK_SW, &led_cdev->work_flags))
>   		led_set_brightness(led_cdev, led_cdev->brightness);
> @@ -111,6 +153,7 @@ static ssize_t multi_index_show(struct device *dev,
>   static DEVICE_ATTR_RO(multi_index);
>   
>   static struct attribute *led_multicolor_attrs[] = {
> +	&dev_attr_multi_max_intensity.attr,
>   	&dev_attr_multi_intensity.attr,
>   	&dev_attr_multi_index.attr,
>   	NULL,
> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> index e2a9c8592953..69c3550f1a31 100644
> --- a/drivers/leds/leds-lp50xx.c
> +++ b/drivers/leds/leds-lp50xx.c
> @@ -525,6 +525,7 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
>   			}
>   
>   			mc_led_info[multi_index].color_index = color_id;
> +			mc_led_info[multi_index].max_intensity = 255;
>   			num_colors++;
>   		}
>   
> diff --git a/drivers/leds/rgb/leds-ncp5623.c b/drivers/leds/rgb/leds-ncp5623.c
> index 85d6be6fff2b..f2528f06507d 100644
> --- a/drivers/leds/rgb/leds-ncp5623.c
> +++ b/drivers/leds/rgb/leds-ncp5623.c
> @@ -56,8 +56,7 @@ static int ncp5623_brightness_set(struct led_classdev *cdev,
>   	for (int i = 0; i < mc_cdev->num_colors; i++) {
>   		ret = ncp5623_write(ncp->client,
>   				    NCP5623_PWM_REG(mc_cdev->subled_info[i].channel),
> -				    min(mc_cdev->subled_info[i].intensity,
> -					NCP5623_MAX_BRIGHTNESS));
> +				    mc_cdev->subled_info[i].intensity);
>   		if (ret)
>   			return ret;
>   	}
> @@ -190,6 +189,7 @@ static int ncp5623_probe(struct i2c_client *client)
>   			goto release_led_node;
>   
>   		subled_info[ncp->mc_dev.num_colors].channel = reg;
> +		subled_info[ncp->mc_dev.num_colors].max_intensity = NCP5623_MAX_BRIGHTNESS;
>   		subled_info[ncp->mc_dev.num_colors++].color_index = color_index;
>   	}
>   
> diff --git a/include/linux/led-class-multicolor.h b/include/linux/led-class-multicolor.h
> index db9f34c6736e..6f89d92566b2 100644
> --- a/include/linux/led-class-multicolor.h
> +++ b/include/linux/led-class-multicolor.h
> @@ -9,10 +9,31 @@
>   #include <linux/leds.h>
>   #include <dt-bindings/leds/common.h>
>   
> +/**
> + * struct mc_subled - Color component description.
> + * @color_index: Color ID.
> + * @brightness: Scaled intensity.
> + * @intensity: Current intensity.
> + * @max_intensity: Maximum supported intensity value.
> + * @channel: Channel index.
> + *
> + * Describes a color component of a multicolor LED. Many multicolor LEDs
> + * do no support gobal brightness control in hardware, so they use
> + * the brightness field in connection with led_mc_calc_color_components()
> + * to perform the intensity scaling in software.
> + * Such drivers should set max_intensity to 0 to signal the multicolor LED core
> + * that the maximum global brightness of the LED class device should be used for
> + * limiting incoming intensity values.
> + *
> + * Multicolor LEDs that do support global brightness control in hardware
> + * should instead set max_intensity to the maximum intensity value supported
> + * by the hardware for a given color component.
> + */
>   struct mc_subled {
>   	unsigned int color_index;
>   	unsigned int brightness;
>   	unsigned int intensity;
> +	unsigned int max_intensity;
>   	unsigned int channel;
>   };
>   
> @@ -53,7 +74,14 @@ int led_classdev_multicolor_register_ext(struct device *parent,
>    */
>   void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_cdev);
>   
> -/* Calculate brightness for the monochrome LED cluster */
> +/**
> + * led_mc_calc_color_components() - Calculates component brightness values of a LED cluster.
> + * @mcled_cdev - Multicolor LED class device of the LED cluster.
> + * @brightness - Global brightness of the LED cluster.
> + *
> + * Calculates the brightness values for each color component of a monochrome LED cluster,
> + * see Documentation/leds/leds-class-multicolor.rst for details.
> + */
>   int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
>   				 enum led_brightness brightness);
>   

