Return-Path: <linux-leds+bounces-8583-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u9X5Eh9pLGpIQgQAu9opvQ
	(envelope-from <linux-leds+bounces-8583-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jun 2026 22:16:31 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A838A67C403
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jun 2026 22:16:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8583-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8583-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 187153022F4C
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jun 2026 20:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4305B3B0AED;
	Fri, 12 Jun 2026 20:16:27 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792223438B4;
	Fri, 12 Jun 2026 20:16:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781295387; cv=none; b=V9/E3F6FF/F+gzgYQEdVn9EQ7MpgvYiqI142Gjx73SC46ErvOTPS+IwZLloJAZV/9BgtnFkKxdnG6sqklFjtSS62sFiQYIxplNJCC6eC14FLfp4sf3xoXPD9qfaxs5pS8eSu0UcEJmQAheEdrnjENPknfTE5G/QoaQpkMC8OSO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781295387; c=relaxed/simple;
	bh=D39oCbI6GnTZppIvDAl9pgGpJpOY19zw9047pMIJRo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPIH9ypq9MODXy5Mem9MfNU5uPbnCMsbv54PhySWZHTCZwSZlHjiZjcdkmZRUTT0TXoDYq8WvyN1n33R0eCniGKrWY5RtONxat3vVHN12d0+iGeYT6kqr44vGttpcNfo5Yh2ZDwH17+6dsgk+xW6v/xRapFE2jfH3blwcZN0vLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.172
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gcW4F44bJz9tPs;
	Fri, 12 Jun 2026 22:16:13 +0200 (CEST)
Date: Fri, 12 Jun 2026 22:16:10 +0200
From: Lukas Timmermann <linux@timmermann.space>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org
Cc: stable@vger.kernel.org, Pavel Machek <pavel@kernel.org>
Subject: Re: [PATCH] leds: as3668: correct name of config option to match
 Makefile
Message-ID: <aixoF5WDjhcdn7o_@archstation>
References: <20260610224244.128063-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610224244.128063-1-enelsonmoore@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:enelsonmoore@gmail.com,m:lee@kernel.org,m:linux-leds@vger.kernel.org,m:stable@vger.kernel.org,m:pavel@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[timmermann.space];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[linux@timmermann.space,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@timmermann.space,linux-leds@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-8583-lists,linux-leds=lfdr.de];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_FIVE(0.00)[5];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A838A67C403

On Wed, Jun 10, 2026 at 03:42:43PM -0700, Ethan Nelson-Moore wrote:
> The Makefile for the AS3668 LED driver refers to CONFIG_LEDS_AS3668,
> whereas the config file defines CONFIG_LEDS_OSRAM_AMS_AS3668. This
> causes the driver to never be compiled. Correct the name in the Kconfig
> file to match the Makefile. Doing the opposite would also have worked,
> but the name in the Makefile better matches the format of other
> drivers' options.
> 
> Fixes: c7dd343a3756 ("leds: as3668: Driver for the ams Osram 4-channel i2c LED driver")
> Cc: stable@vger.kernel.org # 7.0+
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> ---
>  drivers/leds/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index f4a0a3c8c870..5ac63cb59469 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -107,7 +107,7 @@ config LEDS_ARIEL
>  
>  	  Say Y to if your machine is a Dell Wyse 3020 thin client.
>  
> -config LEDS_OSRAM_AMS_AS3668
> +config LEDS_AS3668
>  	tristate "LED support for Osram AMS AS3668"
>  	depends on LEDS_CLASS
>  	depends on I2C
> -- 
> 2.43.0
> 
> 
Hi Ethan,

thank you for noticing that issue.

This was already fixed here:
https://lore.kernel.org/all/177815964265.1857555.230971455145782585.b4-ty@b4/

Best regards
Lukas

