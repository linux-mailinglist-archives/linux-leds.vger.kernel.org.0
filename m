Return-Path: <linux-leds+bounces-230-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD508009D4
	for <lists+linux-leds@lfdr.de>; Fri,  1 Dec 2023 12:23:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 777762813AB
	for <lists+linux-leds@lfdr.de>; Fri,  1 Dec 2023 11:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A4C2135A;
	Fri,  1 Dec 2023 11:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eYrewmz1"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A1F20B04;
	Fri,  1 Dec 2023 11:23:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDFC6C433C7;
	Fri,  1 Dec 2023 11:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701429816;
	bh=k9wnKhrIhEvHRxE0/PCdI7t16H05+fR/MeMFqqxEdr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eYrewmz152LCJlJJ0lVlUEoykuOUHQ5KW+Py7xAXh8nvks0nPENYy7cLVImieYgbD
	 uFGJDUqOZjOsJBlgEOt5v2QuheeW7GAIfe+tOUIiCbslhMP54gel1ppKChpnbZHMwm
	 FSsXGy3i2wPSQ1W2HUS04rF9Gja6SpGBQwsCfilYYvORXmfgFZuYc1cFYjyBvZkrxq
	 L5SvxNsHMN/IZ8sPcl6Hz/0ojnChpDylDdv+762VH4MRizQb7rwtYvISnSzVLKPceg
	 ev07BYxsjL6kf7sPSRV9m1SQEEgAINpfAkP1iq9oVxhCqQyW656xsNnG2uo0QU6ZpE
	 f+vWZcKHXgnvQ==
Date: Fri, 1 Dec 2023 11:23:30 +0000
From: Lee Jones <lee@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Pavel Machek <pavel@ucw.cz>, bcm-kernel-feedback-list@broadcom.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH V2 1/2] leds: gpio: Add kernel log if
 devm_fwnode_gpiod_get fails
Message-ID: <20231201112330.GD3259151@google.com>
References: <20231118124252.14838-1-wahrenst@gmx.net>
 <20231118124252.14838-2-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231118124252.14838-2-wahrenst@gmx.net>

On Sat, 18 Nov 2023, Stefan Wahren wrote:

> In case leds-gpio fails to get the GPIO from the DT (e.g. the GPIO is
> already requested) the driver doesn't provide any helpful error log:
> 
>     leds-gpio: probe of leds failed with error -16
> 
> So add a new error log in case devm_fwnode_gpiod_get() fails.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  drivers/leds/leds-gpio.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index 710c319ad312..0159cedffa9e 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -172,6 +172,8 @@ static struct gpio_leds_priv *gpio_leds_create(struct device *dev)
>  		led.gpiod = devm_fwnode_gpiod_get(dev, child, NULL, GPIOD_ASIS,
>  						  NULL);
>  		if (IS_ERR(led.gpiod)) {
> +			dev_err_probe(dev, PTR_ERR(led.gpiod), "Failed to get gpio '%pfw'\n",

Nit: GPIO

> +				      child);
>  			fwnode_handle_put(child);
>  			return ERR_CAST(led.gpiod);
>  		}
> --
> 2.34.1
> 

-- 
Lee Jones [李琼斯]

