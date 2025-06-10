Return-Path: <linux-leds+bounces-4781-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A638CAD41C1
	for <lists+linux-leds@lfdr.de>; Tue, 10 Jun 2025 20:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D6FF18844A7
	for <lists+linux-leds@lfdr.de>; Tue, 10 Jun 2025 18:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 986DB245035;
	Tue, 10 Jun 2025 18:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="I8gGceFX"
X-Original-To: linux-leds@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E426F1EFFB0;
	Tue, 10 Jun 2025 18:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749579212; cv=none; b=lwaPDNg1uWfbAXljI+rESPlm62EeyCaDdnJbOGKXXUreE70jyJWM9UB/m/zyyeBzLhKR8b+H/dOFjGaczHkxRCAlQ8JEB25Peg3pm8NXBrHR1DKyYPgXk2bckuBKRlk1mGc3X2P0WANz0lHMqTVWskPBOKSlUPoybCj/nmiTQAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749579212; c=relaxed/simple;
	bh=5K76vAyO3mXwsdKGSY8sDy43DTUzEL4sTBtr19b7DJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RQjoZnURlld2AiX/7u/OIDZfXBpkFuBKVJZg8Xz69LkkQV1Xzzqwr7fFpiovLqSQd8nnvcsAdFiZ2bUjunTmoRNkxivXVx2tPYsghGjkStDLcuDqcm2MGJRseCQhYXRgJGv2XF6uregkQGXTZr+XFFDJJkvFykDzGM35r/drBP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=I8gGceFX; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UiP1HNk84qh0COEAXQ4AqfZ8ry4GsFrRYXKAs0x+oy0=; b=I8gGceFXf2VJiI90YczP11k9TM
	Rp7uKCwCBBPVd09pJIBdo0jF7dv9WKmR7CPc+lA6RzdK4HXE6IjvI+pRk3kMzz/64GEUVD06Y4jL2
	eqdmqomRRYVt60GwMq/dyYyU3N5PS7Opw1qVZgWiD08UTOUy6tFPTHjSkzl+HjnXbbbM1mgJe9ylp
	R5YyKEQ4MMhuIVvgpWwCJ/9g3typTBYf51c4PJXYGlXM6OdOfLy4IHCJc5Gnt4vx+o4d8iL5jqIit
	05688v5Hx9BpBhHnOJKmAk8buO3SutUGTXRsyi/gzxGzoCx0sp6MO4WKW/imyVwTLsKJa/5K18OuL
	qhmcwdvA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP3TS-00000001ySd-37Yb;
	Tue, 10 Jun 2025 18:13:27 +0000
Message-ID: <8a9647fc-3156-461e-8460-e3cade2c6f5d@infradead.org>
Date: Tue, 10 Jun 2025 11:13:22 -0700
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/4] leds: add TI/National Semiconductor LP5812 LED
 Driver
To: Nam Tran <trannamatk@gmail.com>, lee@kernel.org
Cc: pavel@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 conor+dt@kernel.org, corbet@lwn.net, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250610174319.183375-1-trannamatk@gmail.com>
 <20250610174319.183375-4-trannamatk@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250610174319.183375-4-trannamatk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/10/25 10:43 AM, Nam Tran wrote:
> diff --git a/drivers/leds/rgb/Kconfig b/drivers/leds/rgb/Kconfig
> index 222d943d826a..becee5c1d21c 100644
> --- a/drivers/leds/rgb/Kconfig
> +++ b/drivers/leds/rgb/Kconfig
> @@ -26,6 +26,19 @@ config LEDS_KTD202X
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called leds-ktd202x.
>  
> +config LEDS_LP5812
> +	tristate "LED support for Texas Instruments LP5812"
> +	depends on I2C
> +	help
> +	  If you say Y here you get support for TI LP5812 LED driver.
> +	  The LP5812 is a 4 × 3 matrix RGB LED driver with autonomous

	The '×' character does not display well (not at all) in menuconfig
	or nconfig. The graphical configs (gconfig, xconfig) can display it.
	I would change it to 4x3 (letter 'x') but it's up to you.


> +	  animation engine control.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called leds-lp5812.
> +
> +	  If unsure, say N.

-- 
~Randy


