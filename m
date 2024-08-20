Return-Path: <linux-leds+bounces-2487-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2B19587AE
	for <lists+linux-leds@lfdr.de>; Tue, 20 Aug 2024 15:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 570A31C21C8C
	for <lists+linux-leds@lfdr.de>; Tue, 20 Aug 2024 13:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F5B1CA85;
	Tue, 20 Aug 2024 13:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="g3Q5raEj"
X-Original-To: linux-leds@vger.kernel.org
Received: from msa.smtpout.orange.fr (smtp-83.smtpout.orange.fr [80.12.242.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994C518A6A9;
	Tue, 20 Aug 2024 13:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724159716; cv=none; b=gFiYLjB8uHGCweaVF443iUXMkxQsMrcr4Yh8guCtcs6TiWtljsXCHlwu2b3YT2aJEHXDxKHEIxvUGcrJ5aB+iQUMYdGsmJhgEfI+4hO0WcPAIxHNdPna954ja7s4/FRmtQN36DAP/CgO1c15nherR8LRudNoNJpf2qQ5RTZlJio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724159716; c=relaxed/simple;
	bh=5i+yLQPmeFZ8E4IbsCLksmKXgX6TQ7IKIu7c/B1R5HE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BTSCsvbwKqUPI0g45CylzN3/JLL/JKF0zAYt06iCiLrF0WJGAjqFhxA2VS/KK48L7UryfGnEATSYedK9XIu8FhnTnkBiAk6z7Wpx5xqThrmG1kMLzzEuI8IPmqMxLenFe1pj8jIIMEaVbdpvLSNnOYB25O9dqIqw6OPgE5Y2FYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=g3Q5raEj; arc=none smtp.client-ip=80.12.242.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id gOgMsXDmswYVhgOgMsxjou; Tue, 20 Aug 2024 15:13:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1724159635;
	bh=hgJdXzVQK1cyKg+pw+lOrQNCRfcYaSJFanH+HWtpM5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=g3Q5raEjULcL5SZ31fkXyEDEcNSN7ruUg20UJK5U60wy08UG0p+VcF5an6ICXuD6e
	 K3n87r0t+tUwqR+tHlYBnWhF0D0I4Zl2Bh8tMaU789yLRYCnW06R4F/oxAmShrnSBz
	 d9jTvckUXWvGmlfmNq2ZZZYTwHUg+IHElWlVOCJxwTkmFO3FKRLDBHzyqi3O5KPmOJ
	 7hC/Z25+v6y7AOsLgTwa9WTFddDyC4IqX2Jc2bThLFDE5ywnYdxIZzC6aiPAxzEl+u
	 PjKHr7V++IFX03qCeYwcCxJfU/iumGEhoPROqbO++iC+XipXRImJmUDBQWaiVRVVcO
	 Goqx6SpFLLVPQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 20 Aug 2024 15:13:55 +0200
X-ME-IP: 90.11.132.44
Message-ID: <d8ae467b-de1b-4c65-a2b0-877ef887f9ae@wanadoo.fr>
Date: Tue, 20 Aug 2024 15:13:53 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: lp55xx: Use devm_clk_get_enabled() helpers
To: Huan Yang <link@vivo.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20240820102006.128840-1-link@vivo.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240820102006.128840-1-link@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 20/08/2024 à 12:20, Huan Yang a écrit :
> lp55xx lp55xx_is_extclk_used get, enable clk and
> deinit_device disable and unprepare it.
> 
> This can use a simplifies helper to cover.
> 
> Signed-off-by: Huan Yang <link@vivo.com>
> ---

Hi,

if you want to go 1 step further, I think that 'vlk' can now also be 
removed from struct lp55xx_chip.

Just my 2c.

CJ


>   drivers/leds/leds-lp55xx-common.c | 14 ++------------
>   1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
> index 29e7142dca72..76dc62a3bd45 100644
> --- a/drivers/leds/leds-lp55xx-common.c
> +++ b/drivers/leds/leds-lp55xx-common.c
> @@ -965,21 +965,14 @@ EXPORT_SYMBOL_GPL(lp55xx_update_bits);
>   bool lp55xx_is_extclk_used(struct lp55xx_chip *chip)
>   {
>   	struct clk *clk;
> -	int err;
>   
> -	clk = devm_clk_get(&chip->cl->dev, "32k_clk");
> +	clk = devm_clk_get_enabled(&chip->cl->dev, "32k_clk");
>   	if (IS_ERR(clk))
>   		goto use_internal_clk;
>   
> -	err = clk_prepare_enable(clk);
> -	if (err)
> +	if (clk_get_rate(clk) != LP55XX_CLK_32K)
>   		goto use_internal_clk;
>   
> -	if (clk_get_rate(clk) != LP55XX_CLK_32K) {
> -		clk_disable_unprepare(clk);
> -		goto use_internal_clk;
> -	}
> -
>   	dev_info(&chip->cl->dev, "%dHz external clock used\n",	LP55XX_CLK_32K);
>   
>   	chip->clk = clk;
> @@ -995,9 +988,6 @@ static void lp55xx_deinit_device(struct lp55xx_chip *chip)
>   {
>   	struct lp55xx_platform_data *pdata = chip->pdata;
>   
> -	if (chip->clk)
> -		clk_disable_unprepare(chip->clk);
> -
>   	if (pdata->enable_gpiod)
>   		gpiod_set_value(pdata->enable_gpiod, 0);
>   }


