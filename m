Return-Path: <linux-leds+bounces-7101-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8L/bHt+FqWkd9gAAu9opvQ
	(envelope-from <linux-leds+bounces-7101-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 05 Mar 2026 14:32:15 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D00682129CD
	for <lists+linux-leds@lfdr.de>; Thu, 05 Mar 2026 14:32:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4269F302335A
	for <lists+linux-leds@lfdr.de>; Thu,  5 Mar 2026 13:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFA553A451C;
	Thu,  5 Mar 2026 13:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P66cYc2g"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F553A1E73;
	Thu,  5 Mar 2026 13:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772717532; cv=none; b=PhMpJaRnTUcqgGXUqZuU5V9V1iuZ6lrsCFWa8Mh5aoHTYPmXSEQK1gXbCbw463I8hTTCbn+ZKoUoLV5rO4pdyNPDkCca85TCPv6YE2jnRHdjd9byYiE2yNjcixJsn5kqot+0SOPslBPkD4wk8fG5gPddhampUBsuh518j+H5W14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772717532; c=relaxed/simple;
	bh=6vdERtTr9/ToduRS9qDR1mCqwiw5DW6Rq/v3NAhgH6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C77CI8E76la5fUSmZFsq6sy8pi8MEVhxeK6NueGSPAOfbB0FUHW7xgbBdbtrwpOZ7HEC4R009UB0RImw34xxCNHKhnX0mrPljKReelT1UwIZJbeozd0Yh5+2+zwAXkqfsZCK5eyT80iMtdEiZStg071JRkOX75IMezihKwzVuQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P66cYc2g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 097EDC116C6;
	Thu,  5 Mar 2026 13:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772717532;
	bh=6vdERtTr9/ToduRS9qDR1mCqwiw5DW6Rq/v3NAhgH6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P66cYc2gLOZNBjYt7w1KG0OaNWz7Dm6wBxIZame3jiaKA3uRI84UyialLoxiX0jZF
	 8Cj7CotBF+pGj54WF5y922xreMhA6wvEfedJ15YvGArdYqMqrgTNHrX1SWIFFh784m
	 C+fYwtpCncF9LSDOnAQTRss22UqsB+Wkm/LA6XK02vZIxCCVwWI1WXuO0FJt+R5sEe
	 6u2C2rDrF5Vp6izA7hvNr+Vk4m6NTr8Dt4HuGtE0Mw6vxv7NHeMvckAgNdj2mGE5py
	 CvorOYD0NdXrqANbQjYuXQKow0bV4uiJIW+cMDnf+S5Orf0m1R2iZodRcWny6IRhhw
	 4jCmGfmAEGj5Q==
Date: Thu, 5 Mar 2026 13:32:07 +0000
From: Lee Jones <lee@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2] leds: lp5860: Fix compilation as module
Message-ID: <20260305133207.GA183676@google.com>
References: <20260129-v6-19-topic-ti-lp5860-fixes-v1-0-635ab524ebbd@pengutronix.de>
 <20260129-v6-19-topic-ti-lp5860-fixes-v1-1-635ab524ebbd@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260129-v6-19-topic-ti-lp5860-fixes-v1-1-635ab524ebbd@pengutronix.de>
X-Rspamd-Queue-Id: D00682129CD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7101-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,pengutronix.de:email]
X-Rspamd-Action: no action

On Thu, 29 Jan 2026, Steffen Trumtrar wrote:

> When the lp5860 is compiled as module, the lp5860_device_init/remove
> functions must be exported or the spi-specific module can not use these
> functions and the compilation will fail.
> 
> Add the needed EXPORT_SYMBOL_GPL calls and while at it the
> MODULE_LICENSE and _DESCRIPTION for the lp5860-core module.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601230708.wwFMOXZp-lkp@intel.com/
> ---
>  drivers/leds/rgb/leds-lp5860-core.c | 6 ++++++
>  drivers/leds/rgb/leds-lp5860-spi.c  | 2 +-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-lp5860-core.c
> index 977741a070d19..28b4d86e11f1a 100644
> --- a/drivers/leds/rgb/leds-lp5860-core.c
> +++ b/drivers/leds/rgb/leds-lp5860-core.c
> @@ -185,6 +185,7 @@ int lp5860_device_init(struct device *dev)
>  
>  	return lp5860_init_dt(lp);
>  }
> +EXPORT_SYMBOL_GPL(lp5860_device_init);
>  
>  void lp5860_device_remove(struct device *dev)
>  {
> @@ -192,3 +193,8 @@ void lp5860_device_remove(struct device *dev)
>  
>  	lp5860_chip_enable_toggle(lp, LP5860_CHIP_DISABLE);
>  }
> +EXPORT_SYMBOL_GPL(lp5860_device_remove);
> +
> +MODULE_AUTHOR("Steffen Trumtrar <kernel@pengutronix.de>");
> +MODULE_DESCRIPTION("TI LP5860 RGB LED core driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/leds/rgb/leds-lp5860-spi.c b/drivers/leds/rgb/leds-lp5860-spi.c
> index d6b8d93c09978..1a35a18f50fde 100644
> --- a/drivers/leds/rgb/leds-lp5860-spi.c
> +++ b/drivers/leds/rgb/leds-lp5860-spi.c
> @@ -85,5 +85,5 @@ static struct spi_driver lp5860_driver = {
>  module_spi_driver(lp5860_driver);
>  
>  MODULE_AUTHOR("Steffen Trumtrar <kernel@pengutronix.de>");
> -MODULE_DESCRIPTION("TI LP5860 RGB LED driver");
> +MODULE_DESCRIPTION("TI LP5860 RGB LED spi driver");

Nit: "SPI"

Also, the set doesn't apply.  Please rebase.

-- 
Lee Jones [李琼斯]

