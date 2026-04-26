Return-Path: <linux-leds+bounces-7847-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WF+mGhTI7WmengAAu9opvQ
	(envelope-from <linux-leds+bounces-7847-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 26 Apr 2026 10:08:52 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 60944469055
	for <lists+linux-leds@lfdr.de>; Sun, 26 Apr 2026 10:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 77CE7300293E
	for <lists+linux-leds@lfdr.de>; Sun, 26 Apr 2026 08:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7484C22A4E1;
	Sun, 26 Apr 2026 08:08:46 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D22175A98;
	Sun, 26 Apr 2026 08:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777190926; cv=none; b=WOzYHbroxQAl9Cq5uk5MLaSXfmFgb2Sa3Or535+QC6rMWuYwbAhW1wyV4qCjgSL55FGnCVY9zTsUjw0zdS7splG8fn5Qdnm76gwQBzczXFufV0+x/K8bD+e3poKK4DdSJzn2lRwC8I49eLG5S0wqU7rgiVjOY05ir5fr85bMPq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777190926; c=relaxed/simple;
	bh=uvmdsFcjhTjjfmGOUFG8WIXep7laVxpdYwiLE48E29k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XpdN4HRE5fsnzvC7frrGy8KGaHI7EapYuBZVGb2rmANdjJXWFXW59jvos8fp043gtV1nEzM7VH4k+ea79BJ1cXyIOgpNTTLAKn1B/pVk6v0SIbalW2xYqtyampAnpHMuGMKa1ugadubkgZgN9a3R2Rk8YvmxSt8vOdYkG4nJKpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4g3K8F3rgdz9sp5;
	Sun, 26 Apr 2026 10:08:29 +0200 (CEST)
Date: Sun, 26 Apr 2026 10:08:26 +0200
From: Lukas Timmermann <linux@timmermann.space>
To: Sasha Levin <sashal@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: as3668: Fix Kconfig symbol name mismatch in
 Makefile
Message-ID: <ae3FDpQF8rBmoiKn@archstation>
References: <20260426000322.55999-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260426000322.55999-1-sashal@kernel.org>
X-Rspamd-Queue-Id: 60944469055
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[timmermann.space];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7847-lists,linux-leds=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@timmermann.space,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Sat, Apr 25, 2026 at 08:03:21PM -0400, Sasha Levin wrote:
> kconfiglint reports:
> 
>   X001: CONFIG_LEDS_AS3668 referenced in Makefile but not defined
>         in any Kconfig
> 
> The AS3668 LED driver was introduced in
> commit c7dd343a3756 ("leds:
> as3668: Driver for the ams Osram 4-channel i2c LED driver").
> That commit defined the Kconfig symbol as LEDS_OSRAM_AMS_AS3668 in
> drivers/leds/Kconfig but used the shorter name LEDS_AS3668 in the
> Makefile's obj-* line.
> 
> Because the Makefile references CONFIG_LEDS_AS3668 which does not exist,
> the driver can never be built — the obj-* line always evaluates to
> obj- += leds-as3668.o (empty config), so the object file is never
> compiled regardless of what the user selects in menuconfig.
Thanks for pointing that out. Seems like I tested with an older .config
or something like that.

Acked-by: Lukas Timmermann <linux@timmermann.space>

> 
> Fix the Makefile to reference the correct Kconfig symbol
> CONFIG_LEDS_OSRAM_AMS_AS3668, matching what is defined in
> drivers/leds/Kconfig.
> 
> Assisted-by: Claude:claude-opus-4-6 kconfiglint
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/leds/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 8fdb45d5b4393..7db3768912ca5 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -15,7 +15,7 @@ obj-$(CONFIG_LEDS_ADP5520)		+= leds-adp5520.o
>  obj-$(CONFIG_LEDS_AN30259A)		+= leds-an30259a.o
>  obj-$(CONFIG_LEDS_APU)			+= leds-apu.o
>  obj-$(CONFIG_LEDS_ARIEL)		+= leds-ariel.o
> -obj-$(CONFIG_LEDS_AS3668)		+= leds-as3668.o
> +obj-$(CONFIG_LEDS_OSRAM_AMS_AS3668)	+= leds-as3668.o
>  obj-$(CONFIG_LEDS_AW200XX)		+= leds-aw200xx.o
>  obj-$(CONFIG_LEDS_AW2013)		+= leds-aw2013.o
>  obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
> -- 
> 2.53.0
> 
> 

