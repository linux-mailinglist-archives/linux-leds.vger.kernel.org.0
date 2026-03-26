Return-Path: <linux-leds+bounces-7529-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cC2RAz8bxWnr6QQAu9opvQ
	(envelope-from <linux-leds+bounces-7529-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 12:40:47 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FD1334A25
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 12:40:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3EC13007E15
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 11:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF5F3E6DF6;
	Thu, 26 Mar 2026 11:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X7a7T12q"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854543DD538;
	Thu, 26 Mar 2026 11:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774524821; cv=none; b=GvKw5xVFJlrHzcwBi5Jg04LiHunZnwee+Ee2pMoYp9dXyqwfYORYltWhQeqNnLDqPhlslysLvLuguCtjBqHYkmRXZMeKlKLNlFftAYtM3WE/Qri6N52dyh8vc5Z80Svn5sR5sxBn20AZP+njJCWJi5nO55zzpLtr0B9EYRXmzT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774524821; c=relaxed/simple;
	bh=Dc+43LLKGIafXxSPWH2OdPjAKwX62l5GrjzWHtYmxPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mlze158zX52ipjT+X8+pZXkmu+Q1RA1p0M/YqUCgYrOZgGcM12AYH9mcZ0po+2mTx7LjMUxZrGQs4rrd/Ebum8nyMiZJUWZgS3OuAiRuyxzyI4tNayRujcBpz2MvWGQqydM8R92UvsnzXrE3QhS9mYuvDtzpX23WtwO/RLfFV7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X7a7T12q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F743C116C6;
	Thu, 26 Mar 2026 11:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774524821;
	bh=Dc+43LLKGIafXxSPWH2OdPjAKwX62l5GrjzWHtYmxPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X7a7T12q6MfWYUyQJCE2/FtFTMKN205bSLUyZR43+GoUNvKEz6IntB1Z4YFQYAiZK
	 ZQp2v3KSudzJ7S5ioY2gyT5KUTE+3M07DBO2dsp4ptrZnunDSGuPNxeY276JoCkooa
	 t97o61sFCVizwspb0dMzhIHf12Irqi52OWx5SPIY90irRhZp4QFwZwUWJL1wDl3HJ3
	 4uABZZhyLQxhnfAeuf8JnYGr1M6vEdaF6DEgst4dHt+GKxzffc80cnUg3FuXJv5HHZ
	 tCHu3cTRB3XlpbM2IGJR1UIhpqor3Zx2ULRqKvxChu5KlYeCUQMsvKQdYmB48enZpE
	 fF5Tn1XQSJK9g==
Date: Thu, 26 Mar 2026 11:33:36 +0000
From: Lee Jones <lee@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH] leds: pca955x: kzalloc + kcalloc to single kzalloc
Message-ID: <20260326113336.GK1141718@google.com>
References: <20260320040821.46540-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260320040821.46540-1-rosenp@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7529-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 60FD1334A25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 19 Mar 2026, Rosen Penev wrote:

> Two fewer allocations as a result.
> 
> Required placing some structs before others as flexible array members
> require a complete definition. Declaration is not enough.
> 
> Added __counted_by support for one of the structs for extra runtime
> analysis.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/leds/leds-pca955x.c | 45 ++++++++++++++-----------------------
>  1 file changed, 17 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
> index 2007fe6217ec..ee5f02eaa3c9 100644
> --- a/drivers/leds/leds-pca955x.c
> +++ b/drivers/leds/leds-pca955x.c
> @@ -112,19 +112,6 @@ static const struct pca955x_chipdef pca955x_chipdefs[] = {
>  	},
>  };
>  
> -struct pca955x {
> -	struct mutex lock;
> -	struct pca955x_led *leds;
> -	const struct pca955x_chipdef	*chipdef;
> -	struct i2c_client	*client;
> -	unsigned long active_blink;
> -	unsigned long active_pins;
> -	unsigned long blink_period;
> -#ifdef CONFIG_LEDS_PCA955X_GPIO
> -	struct gpio_chip gpio;
> -#endif
> -};
> -
>  struct pca955x_led {
>  	struct pca955x	*pca955x;
>  	struct led_classdev	led_cdev;
> @@ -137,8 +124,21 @@ struct pca955x_led {
>  #define led_to_pca955x(l)	container_of(l, struct pca955x_led, led_cdev)
>  
>  struct pca955x_platform_data {
> -	struct pca955x_led	*leds;
>  	int			num_leds;
> +	struct pca955x_led	leds[] __counted_by(num_leds);

Where is the memory allocated to this now?

Why do we need this in both structs?

> +};
> +
> +struct pca955x {
> +	struct mutex lock;
> +	const struct pca955x_chipdef	*chipdef;
> +	struct i2c_client	*client;
> +	unsigned long active_blink;
> +	unsigned long active_pins;
> +	unsigned long blink_period;
> +#ifdef CONFIG_LEDS_PCA955X_GPIO
> +	struct gpio_chip gpio;
> +#endif
> +	struct pca955x_led leds[];
>  };
>  
>  /* 8 bits per input register */
> @@ -542,15 +542,11 @@ pca955x_get_pdata(struct i2c_client *client, const struct pca955x_chipdef *chip)
>  	if (count > chip->bits)
>  		return ERR_PTR(-ENODEV);
>  
> -	pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
> +	pdata = devm_kzalloc(&client->dev, struct_size(pdata, leds, chip->bits), GFP_KERNEL);
>  	if (!pdata)
>  		return ERR_PTR(-ENOMEM);
>  
> -	pdata->leds = devm_kcalloc(&client->dev,
> -				   chip->bits, sizeof(struct pca955x_led),
> -				   GFP_KERNEL);
> -	if (!pdata->leds)
> -		return ERR_PTR(-ENOMEM);
> +	pdata->num_leds = chip->bits;
>  
>  	device_for_each_child_node(&client->dev, child) {
>  		u32 reg;
> @@ -568,8 +564,6 @@ pca955x_get_pdata(struct i2c_client *client, const struct pca955x_chipdef *chip)
>  		fwnode_property_read_u32(child, "type", &led->type);
>  	}
>  
> -	pdata->num_leds = chip->bits;
> -
>  	return pdata;
>  }
>  
> @@ -623,15 +617,10 @@ static int pca955x_probe(struct i2c_client *client)
>  		return -ENODEV;
>  	}
>  
> -	pca955x = devm_kzalloc(&client->dev, sizeof(*pca955x), GFP_KERNEL);
> +	pca955x = devm_kzalloc(&client->dev, struct_size(pca955x, leds, chip->bits), GFP_KERNEL);
>  	if (!pca955x)
>  		return -ENOMEM;
>  
> -	pca955x->leds = devm_kcalloc(&client->dev, chip->bits,
> -				     sizeof(*pca955x_led), GFP_KERNEL);
> -	if (!pca955x->leds)
> -		return -ENOMEM;
> -
>  	i2c_set_clientdata(client, pca955x);
>  
>  	mutex_init(&pca955x->lock);
> -- 
> 2.53.0
> 

-- 
Lee Jones [李琼斯]

