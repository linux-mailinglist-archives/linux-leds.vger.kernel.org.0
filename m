Return-Path: <linux-leds+bounces-4185-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4564CA55B08
	for <lists+linux-leds@lfdr.de>; Fri,  7 Mar 2025 00:47:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76C9E177624
	for <lists+linux-leds@lfdr.de>; Thu,  6 Mar 2025 23:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EB0C1DC9B1;
	Thu,  6 Mar 2025 23:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eA7lO/5C"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9B717B418;
	Thu,  6 Mar 2025 23:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741304850; cv=none; b=py0a6l2iStZ4tupBmi7ASFuNvo/PvLccaC+lss60E1VvlUeeJ/O6pevODf0L66txJ2zIFXX32gIemMxXpmh0SRCl4F6P58f6K5XW5HcGfbNkCjrhkGEnJW1OclA1ngG34Y9xPXzeCoSQHGSSL40z49fyOGGgxbQDH/idi/MJqz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741304850; c=relaxed/simple;
	bh=DPDFHwOuWeOLRB0gTOXwmS/u3WIBFvvLf2LIRRk9fW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JEI+00bwTqXl2YxK6/TYa+mE3xF/jm55e6UdJbm1vq3etUlShhJ3qRiT3UsOCKrvF6mX6ixHqpe1BYYhMda+Gw8nP35eaLi4qsEB0l2hREE/scewAELQOMnnXX6bZCsEdURrWuTD7kWvcWaaEnPKj8+a7o9//MaDG1TASFxhNG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eA7lO/5C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49890C4CEE0;
	Thu,  6 Mar 2025 23:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741304849;
	bh=DPDFHwOuWeOLRB0gTOXwmS/u3WIBFvvLf2LIRRk9fW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eA7lO/5CpDHSPlzxC0XqkWWtik1M4eXuqJMwc2VlezS62y8PmW4Assa+im9ZRUmeC
	 HS1G3R7d7JJEEK42n/JYVMWiORQ+NrS11OUrDR+d8xw/FNHR8lrkkFm3n0tyhsL9VJ
	 mzIvIQBfkYhdLGgnvKMaCmnEmjtYjpajQcy78FyTNbdTwRUDJT6jIViOG0bvpAwxjD
	 gBg35seW6OgR8jHGch56NrkXnX2H59YBRL5FPcF+h770mHdwWYxe2P39TYk5A6nW6C
	 /zmMDOINhkmqoSYlzMN5DaDPUstiG8oXLH0iyW4VgErM4hh+3ZS7ecdxlxpcxl73e/
	 zXwJodT0dJ9ww==
Date: Thu, 6 Mar 2025 15:47:27 -0800
From: Lee Jones <lee@kernel.org>
To: Manuel Fombuena <fombuena@outlook.com>
Cc: pavel@ucw.cz, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] leds: Kconfig: leds-st1202: add select for required
 LEDS_TRIGGER_PATTERN
Message-ID: <20250306234727.GD8350@google.com>
References: <CWLP123MB54739F38EF9CFA057021BC2DC5C22@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
 <CWLP123MB5473F4DF3A668F7DD057A280C5C22@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CWLP123MB5473F4DF3A668F7DD057A280C5C22@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>

On Wed, 26 Feb 2025, Manuel Fombuena wrote:

> leds-st1202 requires the LED Pattern Trigger (LEDS_TRIGGER_PATTERN), which
> is not selected when LED Trigger support is (LEDS_TRIGGERS).
> 
> To reproduce this:
> 
> - make menuconfig KCONFIG_CONFIG=
> - select LEDS_ST1202 dependencies OF, I2C and LEDS_CLASS.
> - select LEDS_ST1202
> - LEDS_TRIGGERS is selected but LEDS_TRIGGER_PATTERN isn't.
> 
> The absence of LEDS_TRIGGER_PATTERN explicitly required can lead to builds
> in which LEDS_ST1202 is selected while LEDS_TRIGGER_PATTERN isn't. The direct
> result of that would be that /sys/class/leds/<led>/hw_pattern wouldn't be
> available and there would be no way of interacting with the driver and
> hardware from user space.
> 
> Add select LEDS_TRIGGER_PATTERN to Kconfig to meet the requirement and
> indirectly document it as well.
> 
> Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
> ---
>  drivers/leds/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 2b27d043921c..8859e8fe292a 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -971,6 +971,7 @@ config LEDS_ST1202
>  	depends on I2C
>  	depends on OF
>  	select LEDS_TRIGGERS
> +	select LEDS_TRIGGER_PATTERN

Don't you need both?

>  	help
>  	  Say Y to enable support for LEDs connected to LED1202
>  	  LED driver chips accessed via the I2C bus.
> -- 
> 2.48.1
> 

-- 
Lee Jones [李琼斯]

