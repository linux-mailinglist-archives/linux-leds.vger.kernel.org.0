Return-Path: <linux-leds+bounces-8826-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0yrvDzSNRWqVBwsAu9opvQ
	(envelope-from <linux-leds+bounces-8826-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 01 Jul 2026 23:57:08 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6016F1FCD
	for <lists+linux-leds@lfdr.de>; Wed, 01 Jul 2026 23:57:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YIR8jvxg;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8826-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8826-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F4313039C96
	for <lists+linux-leds@lfdr.de>; Wed,  1 Jul 2026 21:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E64E836F437;
	Wed,  1 Jul 2026 21:54:48 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B3925333F;
	Wed,  1 Jul 2026 21:54:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782942888; cv=none; b=nnGkB/8oiRSD8oroQjlVVgtD6JnxuQhzQUKU/1jIAFF/av+GfINCffDi+2yMHgBeUcyd8IYq+/O8zRZMteRGzNsYLE5cUj5mXvrV3e968Tm9Zw7BXIRsCxFFRWSVMg2GrUwz9Z3Ls0rij2yS7RZ6R4ljt8z7bhLOZjaXKMMPjB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782942888; c=relaxed/simple;
	bh=NHkH/F/ipxbQPPeiL8PLhdC6Mb9ppFEq8TH8Pa+7f7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KWUKmRjJqccDUKmEOoBtknpqTgrEqSwlZq493IPyaaMjiPv9X1QDFiiAEQeYsmcjSPcMGAyC2ylnB7lnwMCz0FmzuMMUgT//1F6TbFtF6AIgrtg51I6I9yYENd6gSk1waKUh4lvejDKmjv7E0Wq06kynlST7CA6qWKARp7ULJfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YIR8jvxg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21C281F000E9;
	Wed,  1 Jul 2026 21:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782942887;
	bh=h8NBwEteNf/erIgoW51XAt2NmtftxCGZ9sVzxOs4kkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YIR8jvxg01wXAcq1WHmv/+Wmz/3yH4BnAITjxY2r24skN+h/jRlc/5FYgyVF+XEDk
	 ey5t/NNzbeBV70uI3tHsHFJl5v9Zj8HT7U7RL7i3hSYFsOs8wJ5GBdjlWGyTHXyfw1
	 ozL0GvjjVd+JoVGZ7uY8FLgJjVwvNvr3wctjx8Uc9SJmyB0xPHzm9K7R5EgFSVxYTv
	 hy3Uz1JQaOWCbKW9llYkAhyZen0n67Ys5fjl9dRjkOgVn3lBlRZEHP59E+Zsr9mKgo
	 j0s/s4YY9fJOFBlT8UUsi1VuvcGjtE63rbwHdTsnzWQxZGPqzxdJfh6IHWHTOq6csp
	 Ft5CdwAvZCb+A==
Date: Wed, 1 Jul 2026 22:54:40 +0100
From: Lee Jones <lee@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: lp55xx: roll back engine sysfs group on failure
Message-ID: <20260701215440.GE2108533@google.com>
References: <20260615064913.58433-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615064913.58433-1-pengpeng@iscas.ac.cn>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8826-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:pavel@kernel.org,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8D6016F1FCD

On Mon, 15 Jun 2026, Pengpeng Hou wrote:

> lp55xx_register_sysfs() creates the common engine sysfs group before
> creating the optional chip-specific sysfs group.
> 
> If the chip-specific group creation fails, the function returns the
> error directly and leaves the engine group published even though probe
> fails and the chip state will be torn down.
> 
> Remove the engine group when the later chip-specific group creation
> fails.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/leds/leds-lp55xx-common.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
> index ea131177de96..501762b02667 100644
> --- <mark>drivers/leds/leds-lp55xx-common.c</mark>
> +++ b/drivers/leds/leds-lp55xx-common.c
> @@ -1090,6 +1090,7 @@ static int lp55xx_register_sysfs(struct lp55xx_chip *chip)
>  {
>  	struct device *dev = &chip->cl->dev;
>  	const struct lp55xx_device_config *cfg = chip->cfg;
> +	bool engine_group_created = false;

This is almost certainly a NACK.

>  	int ret;
>  
>  	if (!cfg->run_engine || !cfg->firmware_cb)
> @@ -1098,10 +1099,17 @@ static int lp55xx_register_sysfs(struct lp55xx_chip *chip)
>  	ret = sysfs_create_group(&dev->kobj, &lp55xx_engine_attr_group);
>  	if (ret)
>  		return ret;
> +	engine_group_created = true;
>  
>  dev_specific_attrs:
> -	return cfg->dev_attr_group ?
> -		sysfs_create_group(&dev->kobj, cfg->dev_attr_group) : 0;
> +	if (!cfg->dev_attr_group)
> +		return 0;
> +
> +	ret = sysfs_create_group(&dev->kobj, cfg->dev_attr_group);
> +	if (ret && engine_group_created)

3 things:

Firstly, doesn't the driver core unwind these for us if probe fails?

Secondly, isn't sysfs_remove_group() okay to call regardless?

And lastly, _even_ checking 'cfg->run_engine' and 'cfg->firmware_cb'
would be better than introducing a new random variable to track this.

> +		sysfs_remove_group(&dev->kobj, &lp55xx_engine_attr_group);
> +
> +	return ret;
>  }
>  
>  static void lp55xx_unregister_sysfs(struct lp55xx_chip *chip)
> -- 
> 2.50.1 (Apple Git-155)
> 

-- 
Lee Jones

