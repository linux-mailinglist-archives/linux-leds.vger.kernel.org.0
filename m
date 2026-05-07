Return-Path: <linux-leds+bounces-8025-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFSWFwJ8/Gl0QgAAu9opvQ
	(envelope-from <linux-leds+bounces-8025-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 07 May 2026 13:48:18 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D543D4E7B51
	for <lists+linux-leds@lfdr.de>; Thu, 07 May 2026 13:48:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1722C300D68C
	for <lists+linux-leds@lfdr.de>; Thu,  7 May 2026 11:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2AE13B6367;
	Thu,  7 May 2026 11:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uafKWfbE"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7DF391E4B;
	Thu,  7 May 2026 11:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778154362; cv=none; b=RpgZJYnxvq/aWRlk5aTa+ruCB8DOEcBhA4TEEGhKmUjIoEf+WtWFmhES8WHUgBMmQP5vhCdF6eAlqxem8Ho+M+59dkNRdPzuAYAj3CSmB5cAP5msWZ/ymC5uNFQSQHPGBfKxjXArYxx8mqNJ9hRsfk8ZuhAzg6s+B7TcEXwN26k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778154362; c=relaxed/simple;
	bh=LpCRq+tkyDSG88xZdWGkj0pm53r6iQgcZv1jcLqdU2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJt889f/sEg3E+CngJ6CLdUnAZhgEaltoo2PboYBU/kk1xYxqDERBh5lxnN7hg19THlXrw2k2e7wvhYyg6qwUhu4xX7muo+evtQUFcjLh6GvpvkdeQ10eGlTmLlkqz4dQ+fa1IYYTq66E/AD5NBAFvMljcWhYWRlEZi4dPgDKrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uafKWfbE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 519A6C2BCB2;
	Thu,  7 May 2026 11:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778154362;
	bh=LpCRq+tkyDSG88xZdWGkj0pm53r6iQgcZv1jcLqdU2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uafKWfbETZ2RGhBQSqZa21ov0RrELMqQHTJ2QmzAjpuDBQuEpsWmH6eZbJeyHYAaL
	 xqwpQaIpr1TN91GBi/dBVyFTP8Ll0bVuc6qGFTWh+g0WJEp7tR2WT64Vy8i/1uUydc
	 iDUmvQ7BrNLleOotN3EOaFVM4SW93d63r2DituXCpnBADSCxUxubmMGkCczztmOwkW
	 S44lYxPzbNPxXmhSq/4twFQNiVKFRekJkRIUNaClTqTEcwxyIjOqljfb8SwrgL9Pf4
	 puRp5KzfE4f5G0hGSHJhjn1sNy+V3hdmTw8Thgz9WH4NoY+y76WGi0dGcJLpr2Oo7H
	 CXVrUkcXq+brQ==
Date: Thu, 7 May 2026 12:45:58 +0100
From: Lee Jones <lee@kernel.org>
To: Alban Bedel <alban.bedel@lht.dlh.de>
Cc: linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: class: Use firmware nodes for device lookup
Message-ID: <20260507114558.GE305027@google.com>
References: <20260422142324.1079185-1-alban.bedel@lht.dlh.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422142324.1079185-1-alban.bedel@lht.dlh.de>
X-Rspamd-Queue-Id: D543D4E7B51
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8025-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,dlh.de:email]
X-Rspamd-Action: no action

On Wed, 22 Apr 2026, Alban Bedel wrote:

> Replace the OF based lookup with the fwnode equivalent to get support
> for ACPI and software nodes.
> 
> Signed-off-by: Alban Bedel <alban.bedel@lht.dlh.de>
> ---
>  drivers/leds/led-class.c | 32 ++++++++++++--------------------
>  1 file changed, 12 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 9e14ae588f780..d578cc0abb7c7 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -248,33 +248,25 @@ static const struct class leds_class = {
>  	.pm = &leds_class_dev_pm_ops,
>  };
>  
> -/**
> - * of_led_get() - request a LED device via the LED framework
> - * @np: device node to get the LED device from
> - * @index: the index of the LED
> - * @name: the name of the LED used to map it to its function, if present
> - *
> - * Returns the LED device parsed from the phandle specified in the "leds"
> - * property of a device tree node or a negative error-code on failure.
> - */

You're removing the function header here without any mention of why.

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
>  	 * If it cannot be found, then of_parse_phandle() will propagate the error.
>  	 */

Comment needs an update.

>  	if (name)
> -		index = of_property_match_string(np, "led-names", name);
> -	led_node = of_parse_phandle(np, "leds", index);
> -	if (!led_node)
> -		return ERR_PTR(-ENOENT);
> +		index = fwnode_property_match_string(fwnode, "led-names",
> +						     name);
> +	led_node = fwnode_find_reference(fwnode, "leds", index);
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
> @@ -332,7 +324,7 @@ struct led_classdev *__must_check devm_of_led_get(struct device *dev,
>  	if (!dev)
>  		return ERR_PTR(-EINVAL);
>  
> -	led = of_led_get(dev->of_node, index, NULL);
> +	led = fwnode_led_get(dev_fwnode(dev), index, NULL);
>  	if (IS_ERR(led))
>  		return led;
>  
> @@ -354,7 +346,7 @@ struct led_classdev *led_get(struct device *dev, char *con_id)
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

-- 
Lee Jones

