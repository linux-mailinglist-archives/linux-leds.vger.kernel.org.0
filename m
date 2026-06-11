Return-Path: <linux-leds+bounces-8574-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WuhiEErDKmqgwQMAu9opvQ
	(envelope-from <linux-leds+bounces-8574-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jun 2026 16:16:42 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0773672A3F
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jun 2026 16:16:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ZRwFLpK6;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8574-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8574-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49A7030760B8
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jun 2026 14:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1617233922;
	Thu, 11 Jun 2026 14:16:13 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A090272621;
	Thu, 11 Jun 2026 14:16:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781187373; cv=none; b=Ev5NAEr3oURiobQCV6kgh3gWo+iggAhy7rzF8mZEc6mseX506soVHHH1xqKRtgWzWJ2AE+XSMojDxrvjXZnKDwoIDO4cYtk75Dt9mZ5690wbLhWKs2mBkn7tEBkIEFJlgb66GmQJiqKUswHEZNIRCpWrUxHOVAQQEzjob9YB8pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781187373; c=relaxed/simple;
	bh=ljahLG0pkYr2bmOBc3UwlS/3LpJTRt3/0eVJyRrlybY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNrl5/kM/UljcdNjflx+Bb9dRE9vEWEBpNbZup3TkBZ5T0mKgmlKfoIFk7KzpbXN3T6UQt1UlXkgxkRbVss+9n/YDvXykKvui1vQAPQiZNsdUSTrSKQJvkfNda6uGmhEcUc9Pfa2LgdHvog/x79NgXF0OiK6UwmcpMe5C+4VzHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZRwFLpK6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 123F51F00893;
	Thu, 11 Jun 2026 14:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781187372;
	bh=lGswX8/yayLYjhBusI+IVp1OKF8uHqCyBzsaQbj9hF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZRwFLpK6KOIL5VR46avCy3I0K7cjz4BgYMlSpG6/zGp0pWSXDoAM6WvSpDFtkZqA5
	 t9AGM5rs5R/ARn/fOwU1j7ycXw7q6NnzijOmI/x3uvsnuPPjakvDOxzoqBIgptZxub
	 A0zYkFXgNhpjTpzj0URWE/E0EJc71KY7/7X6k12opyShZ75OFq7wa6vWtzL79JHtKm
	 CUWPEUkd52T/+r3Zrts4hDvwAxN5V8ZN8qSVf+LP5fl59E84CXuIAZ4lPT1xIe8UXL
	 zTlCCAr7NJuJIEZUd8iTdm0jWdIWaubcI6x5WCm8U4G1sFirelqrAHOU3RmZQSEMqE
	 qIEteads/eRMg==
Date: Thu, 11 Jun 2026 15:16:08 +0100
From: Lee Jones <lee@kernel.org>
To: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
Cc: Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
	Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] leds: group-multicolor: Add support for initial value.
Message-ID: <20260611141608.GQ4151951@google.com>
References: <20260602105608.196291-1-martijn.de.gouw@prodrive-technologies.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602105608.196291-1-martijn.de.gouw@prodrive-technologies.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:martijn.de.gouw@prodrive-technologies.com,m:jjhiblot@traphandler.com,m:pavel@kernel.org,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-8574-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,prodrive-technologies.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A0773672A3F

/* Sashiko Automation: Issues Found (5 Findings) */

Please answer or act upon these Sashiko reviews:

On Tue, 02 Jun 2026, Martijn de Gouw wrote:
> When the driver is loaded, it turned off all LEDs in the group. This
> patch changes the driver to take over existing LED states and set
> the brighness and intensity in the group accordingly.
> 
> Signed-off-by: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
> ---
> Changes in v4:
> - Use DIV_ROUND_CLOSEST_ULL to avoid potential overflow when calculating
>   the intensity
> - Protect reading of led_cdev->brightness by acquire the lock.
> - Link to v3: https://lore.kernel.org/linux-leds/20260316201321.2789158-1-martijn.de.gouw@prodrive-technologies.com/
> 
> Changes in v3:
> - Use is_on boolean instead of storing the max_brightness twice
> - Link to v2: https://lore.kernel.org/linux-leds/20251124210521.2064660-1-martijn.de.gouw@prodrive-technologies.com/
> 
> Changes in v2:
> - Fix multiline comments
> - Improve comments
> - Link to v1: https://lore.kernel.org/linux-leds/20251111204556.2803878-1-martijn.de.gouw@prodrive-technologies.com/
> ---
>  drivers/leds/rgb/leds-group-multicolor.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/rgb/leds-group-multicolor.c b/drivers/leds/rgb/leds-group-multicolor.c
> index 548c7dd63ba1e..7a77ee6776255 100644
> --- a/drivers/leds/rgb/leds-group-multicolor.c
> +++ b/drivers/leds/rgb/leds-group-multicolor.c
> @@ -69,6 +69,7 @@ static int leds_gmc_probe(struct platform_device *pdev)
>  	struct mc_subled *subled;
>  	struct leds_multicolor *priv;
>  	unsigned int max_brightness = 0;
> +	bool is_on = false;
>  	int i, ret, count = 0, common_flags = 0;
>  
>  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> @@ -96,6 +97,15 @@ static int leds_gmc_probe(struct platform_device *pdev)
>  
>  		max_brightness = max(max_brightness, led_cdev->max_brightness);
>  
> +		/*
> +		 * If any LED is on, set brightness to the max brightness.
> +		 * The actual brightness of the LED is set as intensity value.
> +		 */
> +		mutex_lock(&led_cdev->led_access);
> +		if (led_cdev->brightness)
> +			is_on = true;
> +		mutex_unlock(&led_cdev->led_access);

[Severity: High]
Does reading led_cdev->brightness directly risk getting a stale value?

If any of the monochromatic LED drivers implement the brightness_get()
callback, they might change autonomously by hardware or firmware. Should
this code call led_update_brightness() to correctly query the actual
hardware brightness before attempting to preserve state?



[Severity: Medium]
Can userspace alter a sub-LED's brightness concurrently between this loop
and the next one?

Since individual sub-LEDs are fully registered devices whose sysfs
interfaces are not disabled until the end of the probe function, their
brightness could change from > 0 to 0 after this first loop. If that
happens, is_on remains true, but the second loop would compute an
intensity of 0.


> +
>  		count++;
>  	}
>  
> @@ -109,14 +119,22 @@ static int leds_gmc_probe(struct platform_device *pdev)
>  
>  		subled[i].color_index = led_cdev->color;
>  
> -		/* Configure the LED intensity to its maximum */
> -		subled[i].intensity = max_brightness;
> +		/* Configure the LED intensity to its current brightness */
> +		if (led_cdev->max_brightness) {
> +			mutex_lock(&led_cdev->led_access);
> +			subled[i].intensity = DIV_ROUND_CLOSEST_ULL((u64)led_cdev->brightness *
> +								    max_brightness,
> +								    led_cdev->max_brightness);
> +			mutex_unlock(&led_cdev->led_access);
> +		} else
> +			subled[i].intensity = 0;
>  	}

[Severity: High]
Does initializing the intensity based on the current brightness break
standard sysfs control and permanently cap the dynamic range?

If all sub-LEDs are off during probe, intensity becomes 0. Because
leds_gmc_set() calculates physical brightness by multiplying the requested
brightness with this intensity, the resulting hardware brightness will
always be 0 unless userspace manually writes to the multi_intensity file.

Additionally, if LEDs are dimmed during probe (e.g., 50% brightness), that
dimming factor is permanently baked into the intensity array, artificially
capping the maximum possible brightness the user can request.


>  
>  	/* Initialise the multicolor's LED class device */
>  	cdev = &priv->mc_cdev.led_cdev;
>  	cdev->brightness_set_blocking = leds_gmc_set;
>  	cdev->max_brightness = max_brightness;
> +	cdev->brightness = is_on ? max_brightness : 0;
>  	cdev->color = LED_COLOR_ID_MULTI;
>  	priv->mc_cdev.num_colors = count;

[Severity: High]
This is a pre-existing issue, but the group LED device seems to be exposed
to userspace before its initial hardware state is synchronized.

Further down in leds_gmc_probe(), devm_led_classdev_multicolor_register_ext()
is called before leds_gmc_set(). Once registered, the multi-color LED is
visible in sysfs, and userspace can immediately write to its attributes.
These sysfs writes correctly acquire the group's cdev->led_access mutex.

However, probe continues and calls leds_gmc_set() directly without holding
the mutex:

    ret = leds_gmc_set(cdev, cdev->brightness);

Can this result in concurrent executions of leds_gmc_set() corrupting the
hardware state?



[Severity: High]
This is a pre-existing issue, but does the 32-bit integer math in
leds_gmc_set() overflow for hardware with high-resolution max_brightness?

leds_gmc_set() calculates physical brightness using:

    mono_brightness = DIV_ROUND_CLOSEST(brightness * intensity * mono_max_brightness,
                                        group_max_brightness * group_max_brightness);

If the underlying monochromatic LED components use a high-resolution
max_brightness value (e.g., 4095 or 65535), their product can easily exceed
UINT_MAX. This would silently overflow the 32-bit integer limit before
division, resulting in wrapped hardware brightness values being sent to the
LED driver.

>  
> -- 
> 2.39.2
> 

-- 
Lee Jones

