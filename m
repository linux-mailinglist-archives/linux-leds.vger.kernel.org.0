Return-Path: <linux-leds+bounces-1784-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7058D6713
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 18:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F01EB2A4BD
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 16:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAEA2171E43;
	Fri, 31 May 2024 16:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IjkbaIIo"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E6916FF26;
	Fri, 31 May 2024 16:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717173850; cv=none; b=t/DwsC61Ettelwu9HTH+s0l7NN2yWLF9HqsuYWjdG7rF3LuzvH00Uayq19WSjVvhSxwq/Zq9A++S1y0uBCtApzwndjXgv1LLmtE6j99dS2ohOi+5vfysJ6MFR/HaNqhW0esM9+qW6Ah1SRVo589s1Ud9rZcM0S3Il2zoahj+wCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717173850; c=relaxed/simple;
	bh=gjNaygJxEmGVOCosMiMdTQrI3y7aaBzzVSVlr1yu1jQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QWwa3hAhbCvZILgejBCenmx5i4SueZi9b4Xf4nk1k2YQoBfZ1Wyggxd+DoI7X0DK75F5GGrPE9C6QALYushJYna/nMFk+ERsYQ/clX+BgvMICWxlSPfGoPuODNdQAL0UuMq0/7uHuMAdpqodOw9CUjjf5uK5mvlCKxECiXle4M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IjkbaIIo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35664C32786;
	Fri, 31 May 2024 16:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717173850;
	bh=gjNaygJxEmGVOCosMiMdTQrI3y7aaBzzVSVlr1yu1jQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IjkbaIIooYDH8y6nOdbyewI+UXwTb5Nfq4KqnfU2FPVRJA02NNCv0JdHkgXnq7tqK
	 X1lN4otqKMIhbjpgKtq5ftcAirF7PWO0e/isWzEN/+JC8R7EbgrVLmtdOiTsQhqzvJ
	 Yftmtcf4zFkQI8vkim1i+nYIIcGu+VlsP/XFBFRoSWfSb3dlDLshKKSbs80SRrm3fu
	 xmw3w0Vm43wBcT1pz9POYb1EYVAoH2Y/seEOrbFdJWJYdmMpc1jhygDB1YfdHaMlft
	 KOkHfQhuRRZ0NqBm1LqATpCTbjSGYhyhwmInq31JB81lASlrNH4uqTa1nEy1ee9C6t
	 ZCKqHyGtMwIoA==
Date: Fri, 31 May 2024 17:44:05 +0100
From: Lee Jones <lee@kernel.org>
To: MarileneGarcia <marilene.agarcia@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux-leds@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 linux-next] leds: powernv: replace of_node_put to
 __free
Message-ID: <20240531164405.GV1005600@google.com>
References: <20240529200233.1188228-1-marilene.agarcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240529200233.1188228-1-marilene.agarcia@gmail.com>

On Wed, 29 May 2024, MarileneGarcia wrote:

> Use __free for device_node values, and thus drop calls to
> of_node_put.
> 
> The variable attribute __free adds a scope based cleanup to
> the device node. The goal is to reduce memory management issues
> in the kernel code.
> 
> The of_node_put calls were removed, and the
> for_each_available_child_of_node was replaced to the equivalent
> for_each_available_child_of_node_scoped which use the __free.
> 
> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> Signed-off-by: MarileneGarcia <marilene.agarcia@gmail.com>
> ---
> Changes v2:
> It was missing a blank line.
> 
> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> Signed-off-by: MarileneGarcia <marilene.agarcia@gmail.com>
> ---
>  drivers/leds/leds-powernv.c | 28 +++++++++-------------------
>  1 file changed, 9 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/leds/leds-powernv.c b/drivers/leds/leds-powernv.c
> index 4f01acb75727..8f94d2efed9f 100644
> --- a/drivers/leds/leds-powernv.c
> +++ b/drivers/leds/leds-powernv.c
> @@ -246,29 +246,25 @@ static int powernv_led_classdev(struct platform_device *pdev,
>  	const char *cur = NULL;
>  	int rc = -1;
>  	struct property *p;
> -	struct device_node *np;
>  	struct powernv_led_data *powernv_led;
>  	struct device *dev = &pdev->dev;
>  
> -	for_each_available_child_of_node(led_node, np) {
> +	for_each_available_child_of_node_scoped(led_node, np) {
>  		p = of_find_property(np, "led-types", NULL);
>  
>  		while ((cur = of_prop_next_string(p, cur)) != NULL) {
>  			powernv_led = devm_kzalloc(dev, sizeof(*powernv_led),
>  						   GFP_KERNEL);
> -			if (!powernv_led) {
> -				of_node_put(np);
> +			if (!powernv_led)
>  				return -ENOMEM;
> -			}
>  
>  			powernv_led->common = powernv_led_common;
>  			powernv_led->loc_code = (char *)np->name;
>  
>  			rc = powernv_led_create(dev, powernv_led, cur);
> -			if (rc) {
> -				of_node_put(np);
> +			if (rc)
>  				return rc;
> -			}
> +
>  		} /* while end */
>  	}
>  
> @@ -278,12 +274,11 @@ static int powernv_led_classdev(struct platform_device *pdev,
>  /* Platform driver probe */
>  static int powernv_led_probe(struct platform_device *pdev)
>  {
> -	struct device_node *led_node;
>  	struct powernv_led_common *powernv_led_common;
>  	struct device *dev = &pdev->dev;
> -	int rc;
> +	struct device_node *led_node __free(device_node) =
> +							of_find_node_by_path("/ibm,opal/leds");

This is not a good line-break strategy.

	struct device_node *led_node
		__free(device_node) = of_find_node_by_path("/ibm,opal/leds");

	struct device_node *led_node __free(device_node) =
		of_find_node_by_path("/ibm,opal/leds");

Please choose one of these instead.

I suggest the top one might read a little easier.

> -	led_node = of_find_node_by_path("/ibm,opal/leds");

Does the __free() have to be combined with an allocation?

>  	if (!led_node) {
>  		dev_err(dev, "%s: LED parent device node not found\n",
>  			__func__);
> @@ -292,20 +287,15 @@ static int powernv_led_probe(struct platform_device *pdev)
>  
>  	powernv_led_common = devm_kzalloc(dev, sizeof(*powernv_led_common),
>  					  GFP_KERNEL);
> -	if (!powernv_led_common) {
> -		rc = -ENOMEM;
> -		goto out;
> -	}
> +	if (!powernv_led_common)
> +		return -ENOMEM;
>  
>  	mutex_init(&powernv_led_common->lock);
>  	powernv_led_common->max_led_type = cpu_to_be64(OPAL_SLOT_LED_TYPE_MAX);
>  
>  	platform_set_drvdata(pdev, powernv_led_common);
>  
> -	rc = powernv_led_classdev(pdev, led_node, powernv_led_common);
> -out:
> -	of_node_put(led_node);
> -	return rc;
> +	return powernv_led_classdev(pdev, led_node, powernv_led_common);
>  }
>  
>  /* Platform driver remove */
> -- 
> 2.34.1
> 

-- 
Lee Jones [李琼斯]

