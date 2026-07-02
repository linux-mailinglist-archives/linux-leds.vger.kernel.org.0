Return-Path: <linux-leds+bounces-8842-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m3OmDEuARmq6XQsAu9opvQ
	(envelope-from <linux-leds+bounces-8842-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 17:14:19 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB8A6F9459
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 17:14:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=l69zlLv5;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8842-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8842-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 777BE30BEDAB
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 14:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A0B381E95;
	Thu,  2 Jul 2026 14:49:23 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB7930B508;
	Thu,  2 Jul 2026 14:49:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783003763; cv=none; b=fxuWX8zSSQOKn6nNqgCWUTc1P1g8KpEXM5U55h0fB2Yif5QHLbZ78HUN3y7ogY+GK0ZiHoFth8XVAUSt2iwimtBRKd4w/O8BU2cWedxh4GHtiWIs7HEYe0uGOgUhDn5cKrXpGOj5fJ1elX8UAWgRQ0zdFOwVVlBRtem055VmiQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783003763; c=relaxed/simple;
	bh=5so+iBzOCGmZx7PVpW8vN3JgPOVce9p9DBHIEUfiu7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ciK67fNEVq2QuIrx9ZpQitSj+3kfCIncciVrG0q+9BPvpZ29gjqLYaSB0j1ociJC+Zb4ABvXt4ewQjVudSZvufEj9WbcnAzw07loX5IlLJi6uPQqbtFSf/NQHVigiQV2zYI2SSbg5VLGIi2XhOaHv0HxIVd2esAuHolIGzYBm2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l69zlLv5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C1271F000E9;
	Thu,  2 Jul 2026 14:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783003761;
	bh=Ls25PIs9YFYZrqzFTFV67vEkc9PmPONaTabrQd4rtDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l69zlLv5Er8r91i38Wfg7ucNiN6dteRak7fGQRXprsEbgfgdYrmxRDir7gRQLQPYP
	 e6tAAcl1DCyM2eAN0iLS24oZhjIoOWcyDQzPmxqNqN+OuWmQiJhePS+zpjxDpI9+Et
	 qOlXf5luUNudE5dWD+Q5/gPijMFyYD4AE8/4Omifel1y1vRnMhD+HZ5oGDBFYnRwz9
	 uAzHT+bARQLS8jPpy66sJQVozqRET/Kb+uRJdJydS/eh7d0dipZA6YJOdXnJlZ62oY
	 22Z0tB4aCoqTF3ZZB78xXMy5xnGS87VqoPrlISkoaMOdgJdV5ch7j+gvyimhT9ZByF
	 rS527iuyTefLw==
Date: Thu, 2 Jul 2026 15:49:17 +0100
From: Lee Jones <lee@kernel.org>
To: Mert Seftali <mertsftl@gmail.com>
Cc: Pavel Machek <pavel@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	linux-leds@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: pwm: Annotate leds[] with __counted_by()
Message-ID: <20260702144917.GR2108533@google.com>
References: <20260619162113.416864-1-mertsftl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619162113.416864-1-mertsftl@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-8842-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mertsftl@gmail.com,m:pavel@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:linux-leds@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2BB8A6F9459

On Fri, 19 Jun 2026, Mert Seftali wrote:

> Add the __counted_by() attribute to the flexible array member leds[] in
> struct led_pwm_priv so the compiler and runtime (e.g. FORTIFY_SOURCE,
> UBSAN_BOUNDS) can bounds-check accesses against num_leds.
> 
> For the annotation to be correct, num_leds must reflect the number of
> allocated elements before leds[] is accessed. The driver already
> allocates space for device_get_child_node_count() elements up front, so
> set num_leds to that count right after allocation and fill the array by
> explicit index, instead of incrementing num_leds as each LED is added.
> 
> No functional change intended.
> 
> Signed-off-by: Mert Seftali <mertsftl@gmail.com>
> ---
> Build-tested only (also with FORTIFY_SOURCE and UBSAN_BOUNDS enabled).
> 
>  drivers/leds/leds-pwm.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> index 6c1f2f50ff85..4c99a07da576 100644
> --- a/drivers/leds/leds-pwm.c
> +++ b/drivers/leds/leds-pwm.c
> @@ -36,7 +36,7 @@ struct led_pwm_data {
>  
>  struct led_pwm_priv {
>  	int num_leds;
> -	struct led_pwm_data leds[];
> +	struct led_pwm_data leds[] __counted_by(num_leds);
>  };
>  
>  static int led_pwm_set(struct led_classdev *led_cdev,
> @@ -82,9 +82,10 @@ static int led_pwm_default_brightness_get(struct fwnode_handle *fwnode,
>  
>  __attribute__((nonnull))
>  static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
> -		       struct led_pwm *led, struct fwnode_handle *fwnode)
> +		       int idx, struct led_pwm *led,
> +		       struct fwnode_handle *fwnode)
>  {
> -	struct led_pwm_data *led_data = &priv->leds[priv->num_leds];
> +	struct led_pwm_data *led_data = &priv->leds[idx];
>  	struct led_init_data init_data = { .fwnode = fwnode };
>  	int ret;
>  
> @@ -167,14 +168,13 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
>  		}
>  	}
>  
> -	priv->num_leds++;
>  	return 0;
>  }
>  
>  static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv *priv)
>  {
>  	struct led_pwm led;
> -	int ret;
> +	int ret, i = 0;
>  	device_for_each_child_node_scoped(dev, fwnode) {
>  		memset(&led, 0, sizeof(led));
> @@ -193,7 +193,7 @@ static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv *priv)
>  
>  		led.default_state = led_init_default_state_get(fwnode);
>  
> -		ret = led_pwm_add(dev, priv, &led, fwnode);
> +		ret = led_pwm_add(dev, priv, i++, &led, fwnode);

Nit, why not keep the variable names the same rather than use the for
iterator?  i's and j's are usually for throw-away variables, but this is
counting something real.

Or if you wanted to be even smarter, why not just pass the priv->leds[n]
that you want to operate on and increment num_leds here instead?

Less args == more better.

>  		if (ret)
>  			return ret;
>  	}
> @@ -217,6 +217,8 @@ static int led_pwm_probe(struct platform_device *pdev)
>  	if (!priv)
>  		return -ENOMEM;
>  
> +	priv->num_leds = count;
> +
>  	ret = led_pwm_create_fwnode(&pdev->dev, priv);
>  
>  	if (ret)
> -- 
> 2.54.0
> 

-- 
Lee Jones

