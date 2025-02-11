Return-Path: <linux-leds+bounces-3923-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4427A30D12
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 14:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F1DC188BDBA
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 13:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14FC8220693;
	Tue, 11 Feb 2025 13:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oBYjomBb"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D564121CA11;
	Tue, 11 Feb 2025 13:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739280874; cv=none; b=OsnebFXjgd7UFXnLM+/clJ0DOnpjGMfsQcF34cGvuWqolUCILScjKbSowUsTHVx6W9CLd6HJrau0kat+P1RAX+e/WFLuk69z3EgS5AoxksFYw/22BV/THOaNXlJErqnHRn/GTOCpk4ff3O8Q6khNRxn7fq9/ilyhiepQ7X4VBXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739280874; c=relaxed/simple;
	bh=6uFr4TEEuOuodhf3oFnR391DwkPMiTazsKy65s3UKdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOQfvAEdK/RlU1Vhaa7BrKieJp5Nw2J5XdKh7rvOzPFpLRehTtkJ30cNwMULbnmzkag/7CXDxNDKE5k3Kv5IgOgFV1k91usmKaIyYGMkUu8e3j7777QyrQuGBdyn5ust+Sf2tpSpjArZ0d9l3wM1AG6aqF79N5aYzF9HP2xCkLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oBYjomBb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5FE0C4CEDD;
	Tue, 11 Feb 2025 13:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739280873;
	bh=6uFr4TEEuOuodhf3oFnR391DwkPMiTazsKy65s3UKdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oBYjomBbc5daO3C/6Ela/8aPN44Sx/D8p4jjCnOlCOUuU5qg98Tk0kFb9HaImmJ0Q
	 uSjWRewYrTBG5gNkoBqhpgJK5fG+jOaAD1wKbHa2OSumUSUNKCmrnntvui8IZ71DwL
	 c5v3IkvaODh9d7vcb2sTVPb7TdnwQgaWB1kNH4jo5i5DJA4dQmv28uYHGz+6hcGt0a
	 ZJ46xYHB/7u3LbEjIGT2Lm08L6rGRhzyJTYrbsAVGf/7zlJBO9gxBMcLTKr6E0vPib
	 ajVBL4U1wSHzHCApa6zCzMPoH4gUWROuq1YVpg5RxDJlNPeE4ar6LwKsJ5AlU/BUbI
	 J1s86WpuNqFQg==
Date: Tue, 11 Feb 2025 13:34:29 +0000
From: Lee Jones <lee@kernel.org>
To: Manuel Fombuena <fombuena@outlook.com>
Cc: pavel@ucw.cz, corbet@lwn.net, linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 1/5] leds: leds-st1202: fix NULL pointer access on
 race condition
Message-ID: <20250211133429.GQ1868108@google.com>
References: <CWLP123MB5473933B9B97137828ACC6A6C5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
 <CWLP123MB547377D20905AF224E682BFBC5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CWLP123MB547377D20905AF224E682BFBC5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>

On Sat, 01 Feb 2025, Manuel Fombuena wrote:

> st1202_dt_init() calls devm_led_classdev_register_ext() before the
> internal data structures are properly setup, so the leds become visible

Always "LEDs".

> to user space while being partially initialized, leading to a window
> where trying to access them causes a NULL pointer access.
> 
> This change moves devm_led_classdev_register_ext() to the last thing to
> happen during initialization to eliminate it.
> 
> Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
> ---
>  drivers/leds/leds-st1202.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index b691c4886993..e894b3f9a0f4 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
> @@ -261,8 +261,6 @@ static int st1202_dt_init(struct st1202_chip *chip)
>  	int err, reg;
>  
>  	for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
> -		struct led_init_data init_data = {};
> -
>  		err = of_property_read_u32(child, "reg", &reg);
>  		if (err)
>  			return dev_err_probe(dev, err, "Invalid register\n");
> @@ -276,15 +274,6 @@ static int st1202_dt_init(struct st1202_chip *chip)
>  		led->led_cdev.pattern_set = st1202_led_pattern_set;
>  		led->led_cdev.pattern_clear = st1202_led_pattern_clear;
>  		led->led_cdev.default_trigger = "pattern";
> -
> -		init_data.fwnode = led->fwnode;
> -		init_data.devicename = "st1202";
> -		init_data.default_label = ":";
> -
> -		err = devm_led_classdev_register_ext(dev, &led->led_cdev, &init_data);
> -		if (err < 0)
> -			return dev_err_probe(dev, err, "Failed to register LED class device\n");
> -
>  		led->led_cdev.brightness_set = st1202_brightness_set;
>  		led->led_cdev.brightness_get = st1202_brightness_get;
>  	}
> @@ -368,6 +357,7 @@ static int st1202_probe(struct i2c_client *client)
>  		return ret;
>  
>  	for (int i = 0; i < ST1202_MAX_LEDS; i++) {
> +		struct led_init_data init_data = {};
>  		led = &chip->leds[i];
>  		led->chip = chip;
>  		led->led_num = i;
> @@ -384,6 +374,15 @@ static int st1202_probe(struct i2c_client *client)
>  		if (ret < 0)
>  			return dev_err_probe(&client->dev, ret,
>  					"Failed to clear LED pattern\n");
> +
> +		init_data.fwnode = led->fwnode;
> +		init_data.devicename = "st1202";
> +		init_data.default_label = ":";
> +
> +		ret = devm_led_classdev_register_ext(&client->dev, &led->led_cdev, &init_data);
> +		if (ret < 0)
> +			return dev_err_probe(&client->dev, ret,
> +					"Failed to register LED class device\n");
>  	}
>  
>  	return 0;
> -- 
> 2.48.1
> 

-- 
Lee Jones [李琼斯]

