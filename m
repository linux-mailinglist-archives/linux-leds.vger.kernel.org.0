Return-Path: <linux-leds+bounces-4871-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3DCAE75A0
	for <lists+linux-leds@lfdr.de>; Wed, 25 Jun 2025 06:02:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2796417A2ED
	for <lists+linux-leds@lfdr.de>; Wed, 25 Jun 2025 04:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901571C1ADB;
	Wed, 25 Jun 2025 04:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mxkYqqnQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC16AD58;
	Wed, 25 Jun 2025 04:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750824155; cv=none; b=Q6fuEK/qdPxpWkQiHcWVr6IaOx8CqCV92SGL57M9/4E85TmE+Kqu3FqM72Xxu8ZZzFIsCu7Wkh8K5NQxybXbNDCQUUC6xpo6kRr2zdFnsoLS7AqQKZkANwTkWA6/RzSk+phv95a98zne3NU4YKaMacU2I8Bauks1TkkRgzwSZhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750824155; c=relaxed/simple;
	bh=O21scKjBjCYqhOcRsIeQl446xModxPPXhKh/+5x9Mzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P8yPHQvYbkQGRF9TYn/Or7VGyAXmCpz818nGxkXOPBIS21O3auSvBDNORoKX+2ZxJJyn68HVsdxSyWH3mgNJslgW0dbd5N+ebJtTEA1EJvUL0euUBZrKmm4LHMTtMKcJA3AhRvQg4yThZatkh3D1sSwVGP3+WXwWar0GSUldUtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mxkYqqnQ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=ChYOoIrjyn9EZyp3mWMJRayCKpw54Lkx/7MojD3irCA=; b=mxkYqqnQ2wYj1/rtGJOhEslqbm
	xZMR+RE4yyR6kDjK6ujzwkSrtks//4eyBgwqltxunY5u0FI12Sf1KQzJ1v2bE2l5swl4ga/CLvJva
	3lrNnDM+iKwApbzubLXhAhV8RVQJ0KU/Am0MLDV4tU/O9NjTepI4l3X/guHwL1l8C9ThGyW52PWuK
	XapvtVyp4dbPR2JfxZPXsOG7CGWQfGRlbivgBbIIrnYM7ae73zfK5cD3RXAynhg7W+ANFAUDf8SLN
	yjhrf4YBe1G5VypGlmYSE54aAKjx3DfYF0tkNrZoCHx85o3ign1H3xUbNGopiQkIICLKUsbmESXUI
	Ns5YuY1A==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUHLA-00000008P7Z-0eaD;
	Wed, 25 Jun 2025 04:02:28 +0000
Message-ID: <e99773dd-c49e-4a09-bf2c-dacadfdd1c5b@infradead.org>
Date: Tue, 24 Jun 2025 21:02:25 -0700
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: tps6131x: add V4L2_FLASH_LED_CLASS dependency
To: Arnd Bergmann <arnd@kernel.org>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Matthias Fend <matthias.fend@emfend.at>
Cc: Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250620114440.4080938-1-arnd@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250620114440.4080938-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/20/25 4:43 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This driver can optionally use the v4l2_flash infrastructure, but fails to
> link built=in if that is in a loadable module:
> 
> ld.lld-21: error: undefined symbol: v4l2_flash_release
>>>> referenced by leds-tps6131x.c:792 (drivers/leds/flash/leds-tps6131x.c:792)
> 
> Add the usual Kconfig dependency for it, still allowing it to be built when
> CONFIG_V4L2_FLASH_LED_CLASS is disabled.
> 
> Fixes: b338a2ae9b31 ("leds: tps6131x: Add support for Texas Instruments TPS6131X flash LED driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I just made this same patch, so

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/leds/flash/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
> index 55ca663ca506..5e08102a6784 100644
> --- a/drivers/leds/flash/Kconfig
> +++ b/drivers/leds/flash/Kconfig
> @@ -136,6 +136,7 @@ config LEDS_TPS6131X
>  	tristate "LED support for TI TPS6131x flash LED driver"
>  	depends on I2C && OF
>  	depends on GPIOLIB
> +	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
>  	select REGMAP_I2C
>  	help
>  	  This option enables support for Texas Instruments TPS61310/TPS61311

-- 
~Randy

