Return-Path: <linux-leds+bounces-554-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D097828230
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jan 2024 09:42:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB986285B2F
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jan 2024 08:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCD30321AC;
	Tue,  9 Jan 2024 08:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G1e/mcjH"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A295732187
	for <linux-leds@vger.kernel.org>; Tue,  9 Jan 2024 08:37:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E7CC433C7;
	Tue,  9 Jan 2024 08:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704789464;
	bh=zy9sSXfxLJbRplaZmzyTBLSlFgLOYFl9vybC0oLdcnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G1e/mcjHS/l8SnDwFbmXUmw+qge4/we0MR4j6OEh2LaVgs8f8l9Iw0ggiyzL+F9CN
	 yCA7DEXP8vr5QDhqqbsuNFfChLzTNnaD6LdxcKTcVw7vVY3/x7m7WsDgOsccnxrVen
	 7mZhKNsCWunniAcXfrzfdYI2KSaspf7wPmJgot6Cx0AbpD2tibqWTUuax1AkCsk4Ar
	 YrGtTC8lzMbKGxyI+VnjTx1gXsJejRFR5NpzNG/rf5CSK+pZI4UqoLusW4vOkk7eXd
	 sdZg3uIOQ4vrpAoOONmFGbthnvCs3vioBwZmp7X8uKvqFZUmBboSuwhFZgKXRDzc5l
	 qB6NQxedJAQZQ==
Date: Tue, 9 Jan 2024 08:37:39 +0000
From: Lee Jones <lee@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>, arnd@arndb.de
Cc: Pavel Machek <pavel@ucw.cz>, Andrew Lunn <andrew@lunn.ch>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH] leds: Change devm_led_classdev_register_ext stub logic
 to use IS_REACHABLE
Message-ID: <20240109083739.GE7948@google.com>
References: <0f6f432b-c650-4bb8-a1b5-fe3372804d52@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f6f432b-c650-4bb8-a1b5-fe3372804d52@gmail.com>

On Thu, 28 Dec 2023, Heiner Kallweit wrote:

> If CONFIG_LEDS_CLASS = m and the caller of devm_led_classdev_register
> is built-in, we get a compile/link error.
> To avoid this we could add conditional compiling to the caller, but
> exactly this overhead we wanted to avoid with adding the stubs.
> Easiest solution is to use the existing stub also in case IS_ENABLED
> is true, but IS_REACHABLE is false.
> 
> Fixes: 18764b883e15 ("r8169: add support for LED's on RTL8168/RTL8101")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312281159.9TPeXbNd-lkp@intel.com/
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  include/linux/leds.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Arnd pretty much NACKed this, right?

https://lore.kernel.org/r/b310230b-f20b-489a-97ed-908df193a942@app.fastmail.com

> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 4754b02d3..1eecee316 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -279,7 +279,7 @@ static inline int led_classdev_register(struct device *parent,
>  	return led_classdev_register_ext(parent, led_cdev, NULL);
>  }
>  
> -#if IS_ENABLED(CONFIG_LEDS_CLASS)
> +#if IS_REACHABLE(CONFIG_LEDS_CLASS)
>  int devm_led_classdev_register_ext(struct device *parent,
>  					  struct led_classdev *led_cdev,
>  					  struct led_init_data *init_data);
> -- 
> 2.43.0
> 

-- 
Lee Jones [李琼斯]

