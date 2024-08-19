Return-Path: <linux-leds+bounces-2473-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D591B956891
	for <lists+linux-leds@lfdr.de>; Mon, 19 Aug 2024 12:31:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73D8EB21D20
	for <lists+linux-leds@lfdr.de>; Mon, 19 Aug 2024 10:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC4716130B;
	Mon, 19 Aug 2024 10:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hzEd9VHc"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539A4142E77;
	Mon, 19 Aug 2024 10:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724063457; cv=none; b=g67LzgzLC1lisyQUgWs0d5IE2UkKdHVScItxJ379wqfZz3+Bam/A14MvAWbKMVxzh7kbMP2ctnVGWUizF2N/2NY8odS0+x/TAC7MCLtl00ch8Qxo4c4PQaD5KUyFZFHq5DA+l/8rU/2HTyK6yTHbKhbuRFAXowm8P8pUwA+U8aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724063457; c=relaxed/simple;
	bh=HBIKWG6jwrr6gqe7BImTmvWVfskIYRFLauZN/B8GRG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8YxjLlMjVyk+3+dpNrzwfXep8mnCbSNtMPUkhe63BRyCRKtEC6Eu9BsZ6Fxxfqim2k9X5H5gx9IPqNXrw3dzlmi6N45mnji+goSbGL9SrVAsaBW6MjacD05UTxBfIsXWG4b0p88U+gOKeS2tTbHzAKd7ePLiOg2o7EnmJpYP6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hzEd9VHc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C92C32782;
	Mon, 19 Aug 2024 10:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724063456;
	bh=HBIKWG6jwrr6gqe7BImTmvWVfskIYRFLauZN/B8GRG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hzEd9VHcHNtSkwfXSik9ABC3aPjkQ2QBXzcrkaHSUcxJo9eYKA/LLH9fnQNA7Ayqa
	 mHCShD1AYWY2xCQHBKkJysUYWQRQ+q7EQbsfAZmwYk8ghsF/kpRdhgTnQc0jplq144
	 axyfNuklrdtdcN0HyvJIZbV66Q3T9Q8gKqb9CF/ychlazid166Gc22mPTDE4QOUiNl
	 g/IFxQfX0XA23TwZCxwG94Gf3HgAn34VTodJ5SoGk9qdrRm4xCNXFmuqFuET5KOU9/
	 6ygG5URP4xMWXwEel5h+RQLb7XIcAQLyVuvVY/CukIiegO/+wEQC5MKrEaCMzA36w1
	 96tCuvSRwXcSQ==
Date: Mon, 19 Aug 2024 12:30:51 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Riku Voipio <riku.voipio@iki.fi>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 16/17] leds: turris-omnia: Simplify with scoped for each
 OF child loop
Message-ID: <4ht5cirpwz3pax5qm72hrjqy6oocsd2jctcwliwc65idijjcjt@fthzfoljm3ys>
References: <20240816-cleanup-h-of-node-put-var-v1-0-1d0292802470@linaro.org>
 <20240816-cleanup-h-of-node-put-var-v1-16-1d0292802470@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240816-cleanup-h-of-node-put-var-v1-16-1d0292802470@linaro.org>

Reviewed-by: Marek Behún <kabel@kernel.org>

On Fri, Aug 16, 2024 at 05:31:48PM +0200, Krzysztof Kozlowski wrote:
> Use scoped for_each_available_child_of_node_scoped() when iterating over
> device nodes to make code a bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/leds/leds-turris-omnia.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
> index 39f740be058f..1ef942b5cefa 100644
> --- a/drivers/leds/leds-turris-omnia.c
> +++ b/drivers/leds/leds-turris-omnia.c
> @@ -452,7 +452,7 @@ static int omnia_mcu_get_features(const struct i2c_client *client)
>  static int omnia_leds_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
> -	struct device_node *np = dev_of_node(dev), *child;
> +	struct device_node *np = dev_of_node(dev);
>  	struct omnia_leds *leds;
>  	struct omnia_led *led;
>  	int ret, count;
> @@ -497,12 +497,10 @@ static int omnia_leds_probe(struct i2c_client *client)
>  	}
>  
>  	led = &leds->leds[0];
> -	for_each_available_child_of_node(np, child) {
> +	for_each_available_child_of_node_scoped(np, child) {
>  		ret = omnia_led_register(client, led, child);
> -		if (ret < 0) {
> -			of_node_put(child);
> +		if (ret < 0)
>  			return ret;
> -		}
>  
>  		led += ret;
>  	}
> 
> -- 
> 2.43.0
> 

