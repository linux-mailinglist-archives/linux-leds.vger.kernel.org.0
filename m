Return-Path: <linux-leds+bounces-7398-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AH9YFCARvGnbrwIAu9opvQ
	(envelope-from <linux-leds+bounces-7398-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 16:07:12 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7572CD666
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 16:07:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7756D3002D4D
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 15:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77DF03C8729;
	Thu, 19 Mar 2026 15:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RNX7ZnvH"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30F03E0C65;
	Thu, 19 Mar 2026 15:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773932622; cv=none; b=Pqa+RuIWc5OquzVBqYBEIO1Wrg1vt/dnQOHeguEkeJtl6ZLXMqa+XO7L0igl1zlHWuiKqKirqz5k1ho2FYV1IUmBT0xSGOkaDfLV2p64fOiMy4PmhyvtEGqJ4sz5WzZAHfZAkqXNGKhT5UtXuqDk3hcnDM3EiP+K5noPFS33uUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773932622; c=relaxed/simple;
	bh=93wh7xteWy5BYiWPBUGp8F3Lh3Nh6uM2n1V2prrcf2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S8lA8D1weigwga8lUPFKltEeONAZ/e2RYW0YrpV11EWpZZo9aF/Nx6MX7nTo1n/r9UwYcYkiJSBNd0VGR1CjFwkoO3zeRnWO2EDEepc0BURBdpHJVIrdSJqoJJGCAFdd0JxNQKdft1sPcYCDZXrhCEQiTdbKWg9SVJTmkqMaw3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RNX7ZnvH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01CA1C19424;
	Thu, 19 Mar 2026 15:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773932621;
	bh=93wh7xteWy5BYiWPBUGp8F3Lh3Nh6uM2n1V2prrcf2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RNX7ZnvHiU/KPUB40g2bgvLJPhXtDHKu+wXwqLOTFaqFsTZ1LN7bv162q9ths8Z+C
	 uxpqPJMaZk1kQlSKhnjPUOC+7ODntXkNmk1X2SCDQpPKB/bk2z3TYmGc2MJ8Y2XEM/
	 EG5L6puFXVVaAHFphhBaQkRjOagfAS3tgIdseZHh128M5vlzo/LtvhH5to+L4yPbHa
	 qHaH/k3XQJtSmVAtAynPai808f8pOMESjqupJJsVFo+twJCCiU98lskHmY3B1X8+BA
	 5qekrWXt/lmz6/5zttitSucegGB0pseBtZzVcHKbNh2DwYKqA4Yat/+GCZDHM5/lVa
	 /8iR+CFBc0ekQ==
Date: Thu, 19 Mar 2026 15:03:30 +0000
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Craig McQueen <craig@mcqueen.au>, linux-kernel@vger.kernel.org,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v1 1/1] leds: Adjust documentation of brightness sysfs
 node
Message-ID: <20260319150330.GL554736@google.com>
References: <20260310165143.354065-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260310165143.354065-1-andriy.shevchenko@linux.intel.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7398-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: BE7572CD666
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 10 Mar 2026, Andy Shevchenko wrote:

> Adjust documentation of brightness sysfs node about accepted value range.
> The code accepts only decimal values. We may not relax that due to different
> readings for, e.g., octal 0100, which becomes 64 instead of currently parsed
> 100.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  Documentation/ABI/testing/sysfs-class-led | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
> index 0313b82644f2..39ac8453e670 100644
> --- a/Documentation/ABI/testing/sysfs-class-led
> +++ b/Documentation/ABI/testing/sysfs-class-led
> @@ -22,7 +22,7 @@ Description:
>  		  For additional details please refer to
>  		  Documentation/leds/leds-class-multicolor.rst.
>  
> -		The value is between 0 and
> +		The decimal value is between 0 and

How about?

The value is between 0 and /sys/class/leds/<led>/max_brightness and is
represented by as a decimal.

>  		/sys/class/leds/<led>/max_brightness.
>  
>  		Writing 0 to this file clears active trigger.
> -- 
> 2.50.1
> 
> 

-- 
Lee Jones [李琼斯]

