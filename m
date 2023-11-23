Return-Path: <linux-leds+bounces-107-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AF47F5D51
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 12:05:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 797F51C20E7A
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 11:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC91A22F04;
	Thu, 23 Nov 2023 11:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WLVP+wUG"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA4E22F02
	for <linux-leds@vger.kernel.org>; Thu, 23 Nov 2023 11:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E19CC433C8;
	Thu, 23 Nov 2023 11:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700737542;
	bh=yqetw7zosrQdLVs1wXRaQ09UgUlARXEo96Fo2p9Et0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WLVP+wUGQg/KxAZFdxBrNZT5f8T7HhXpezp0CWAGFwL50Y5dvr2mz9b+x4oiB5oDu
	 4XPPiMay8e8kIOFCWpwEukgKOfjFhGpuhZObam4eMbAWXgcHw8tknT6FOsVzwVaQIe
	 11RcPm1vthHATIY/h5oI8d4CeaGEgc4WcRVRJ+8XNHWXe2P94KYktC3G4kCF6KD8D0
	 /OZ6wy/ulEXVI5sSh/tPegkqsVcGcQ0QBS/T9Llf5zLp3oW+Z92xpYKC9CRZQtRnTn
	 OGPgsRlZFDfUPtcQvC0gUuf1/e+5JuFyw4eKMGdY4XJaqLpm6aVE3yBAYndEInJVZC
	 jnoQ4Od1T9o9g==
Date: Thu, 23 Nov 2023 11:05:38 +0000
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v1 2/4] leds: trigger: gpio: Convert to use kstrtox()
Message-ID: <20231123110538.GA1243364@google.com>
References: <20231103195310.948327-1-andriy.shevchenko@linux.intel.com>
 <20231103195310.948327-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231103195310.948327-2-andriy.shevchenko@linux.intel.com>

On Fri, 03 Nov 2023, Andy Shevchenko wrote:

> sscanf() is a heavy one and moreover requires additional boundary checks.
> Convert driver to use kstrtou8() in gpio_trig_inverted_store().
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/leds/trigger/ledtrig-gpio.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/leds/trigger/ledtrig-gpio.c b/drivers/leds/trigger/ledtrig-gpio.c
> index d91ae7fde3cf..8a30f9228186 100644
> --- a/drivers/leds/trigger/ledtrig-gpio.c
> +++ b/drivers/leds/trigger/ledtrig-gpio.c
> @@ -53,14 +53,12 @@ static ssize_t gpio_trig_brightness_store(struct device *dev,
>  		struct device_attribute *attr, const char *buf, size_t n)
>  {
>  	struct gpio_trig_data *gpio_data = led_trigger_get_drvdata(dev);
> -	unsigned desired_brightness;
> +	u8 desired_brightness;
>  	int ret;
>  
> -	ret = sscanf(buf, "%u", &desired_brightness);
> -	if (ret < 1 || desired_brightness > 255) {
> -		dev_err(dev, "invalid value\n");
> -		return -EINVAL;
> -	}
> +	ret = kstrtou8(buf, 10, &desired_brightness);

Where does 10 come from?

> +	if (ret)
> +		return ret;
>  
>  	gpio_data->desired_brightness = desired_brightness;
>  
> -- 
> 2.40.0.1.gaa8946217a0b
> 

-- 
Lee Jones [李琼斯]

