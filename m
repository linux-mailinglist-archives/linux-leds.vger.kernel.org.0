Return-Path: <linux-leds+bounces-8232-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cED2A6LZDWrE4AUAu9opvQ
	(envelope-from <linux-leds+bounces-8232-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 17:56:18 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8348D591506
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 17:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F84F3136BAD
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 15:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6523EF65F;
	Wed, 20 May 2026 15:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BAi49y3O"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4963B3EFD05;
	Wed, 20 May 2026 15:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779290551; cv=none; b=K0KBNQPfd1hOK3Dlg6XCdSfTzTTbqiCDqm2PXUAiHKAjzifUCMY+93CxwqcA4BHWvVnXjufW1E8tvnb2jJTrNKWf0JOuc5q3cEw3NwWlGbSW1fQpiwuXYBSS5H05sOPOkP3Jeyzvs1E/BEcL4MQhZBACYSzPwDbpnh068aTbgdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779290551; c=relaxed/simple;
	bh=wbGoCOdgwuxVd1xRlPnp+y3A9nbTYscIb98IusY0CeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t0jtS4+3emcENJpGoFOjmwsXPFgWfaiV0WrROIp81mDp19YOaqjpiHFFSnT+GpNDbj8huMpLHirW7xH8bef4SLK3mW17VbJPilx+8GkjD06Se4h2oGA+xYhI6THjYppuPquDXUdlYVeWuqW0LrphUrC2sy/4xbQJniZFp1tvA+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BAi49y3O; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C398E1F000E9;
	Wed, 20 May 2026 15:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779290549;
	bh=+S/tUNi5/lR2jSPqjA34mWFzaraQw7XTvBIQbGpfR+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BAi49y3OY9UWXYIlmNYgcrWtD4wuluUi25SQOeqHMyhBzc1FEScSiW/aGJZQHtW1o
	 v6NY5mYplc7IemOCHDcoD6UCpBB86Myg+5kr8LmxBzRy9Byha+j3fvbluqYBpaC12D
	 ZoM/sB0lr6RjneJhCqYJjurEQaqQV+BOvQ8SdVL9YCs2gYN1fobtwfDufDhHX0w3CW
	 nMKoetHfJP76WLOh2tuXtvqzhDy4SGZFM1/JDD4rcIYlypIalGFWOxY6/mShOrQP6r
	 7Jb7U6F/P74MKP47w+0sozTHvrlXyRSSrvQFAtCrzmyu01xIOXluJwOl72aqen5QDU
	 O+V94Nmnb00Yw==
Date: Wed, 20 May 2026 16:22:25 +0100
From: Lee Jones <lee@kernel.org>
To: Alban Bedel <alban.bedel@lht.dlh.de>
Cc: linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] leds: class: Use firmware nodes for device lookup
Message-ID: <20260520152225.GH2767592@google.com>
References: <20260513115853.1584230-1-alban.bedel@lht.dlh.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513115853.1584230-1-alban.bedel@lht.dlh.de>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8232-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8348D591506
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 13 May 2026, Alban Bedel wrote:

> Replace the OF based lookup with the fwnode equivalent to get support
> for ACPI and software nodes.
> 
> Signed-off-by: Alban Bedel <alban.bedel@lht.dlh.de>
> ---
> v2: * Keep the doc string
>     * Update comment to reference the function now used
> ---
>  drivers/leds/led-class.c | 30 ++++++++++++++++--------------
>  1 file changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 9e14ae588f78..a17db3d6644f 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -249,32 +249,34 @@ static const struct class leds_class = {
>  };
>  
>  /**
> - * of_led_get() - request a LED device via the LED framework
> - * @np: device node to get the LED device from
> + * fwnode_led_get() - request a LED device via the LED framework
> + * @fwnode: firmware node to get the LED device from
>   * @index: the index of the LED
>   * @name: the name of the LED used to map it to its function, if present
>   *
>   * Returns the LED device parsed from the phandle specified in the "leds"
>   * property of a device tree node or a negative error-code on failure.
>   */
> -static struct led_classdev *of_led_get(struct device_node *np, int index,
> -				       const char *name)
> +static struct led_classdev *fwnode_led_get(struct fwnode_handle *fwnode,
> +					   int index, const char *name)
>  {
> +	struct fwnode_handle *led_node;
>  	struct device *led_dev;
> -	struct device_node *led_node;
>  
>  	/*
>  	 * For named LEDs, first look up the name in the "led-names" property.
> -	 * If it cannot be found, then of_parse_phandle() will propagate the error.
> +	 * If it cannot be found, then fwnode_find_reference() will propagate
> +	 * the error.
>  	 */
>  	if (name)
> -		index = of_property_match_string(np, "led-names", name);
> -	led_node = of_parse_phandle(np, "leds", index);
> -	if (!led_node)
> -		return ERR_PTR(-ENOENT);
> +		index = fwnode_property_match_string(fwnode, "led-names",
> +						     name);
> +	led_node = fwnode_find_reference(fwnode, "leds", index);

What happens if fwnode_property_match_string() returns an error?

> +	if (IS_ERR(led_node))
> +		return ERR_CAST(led_node);
>  
> -	led_dev = class_find_device_by_fwnode(&leds_class, of_fwnode_handle(led_node));
> -	of_node_put(led_node);
> +	led_dev = class_find_device_by_fwnode(&leds_class, led_node);
> +	fwnode_handle_put(led_node);
>  
>  	return led_module_get(led_dev);
>  }
> @@ -332,7 +334,7 @@ struct led_classdev *__must_check devm_of_led_get(struct device *dev,
>  	if (!dev)
>  		return ERR_PTR(-EINVAL);
>  
> -	led = of_led_get(dev->of_node, index, NULL);
> +	led = fwnode_led_get(dev_fwnode(dev), index, NULL);
>  	if (IS_ERR(led))
>  		return led;
>  
> @@ -354,7 +356,7 @@ struct led_classdev *led_get(struct device *dev, char *con_id)
>  	const char *provider = NULL;
>  	struct device *led_dev;
>  
> -	led_cdev = of_led_get(dev->of_node, -1, con_id);
> +	led_cdev = fwnode_led_get(dev_fwnode(dev), -1, con_id);
>  	if (!IS_ERR(led_cdev) || PTR_ERR(led_cdev) != -ENOENT)
>  		return led_cdev;
>  
> -- 
> 2.39.5
> 

-- 
Lee Jones

