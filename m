Return-Path: <linux-leds+bounces-3218-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 381569B7CE9
	for <lists+linux-leds@lfdr.de>; Thu, 31 Oct 2024 15:33:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2D241F21617
	for <lists+linux-leds@lfdr.de>; Thu, 31 Oct 2024 14:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2681A070D;
	Thu, 31 Oct 2024 14:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BadDpcVD"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0300319C57F;
	Thu, 31 Oct 2024 14:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730385176; cv=none; b=LiLykRb/tsyV8VjSx/0yDDJOx8gtxnoBUiz2G4KoggL66w1ywABQ8VS51qO0HGITD+iG7Q4+lWheY1wzpeAEeEliNJ5mMyHdbGJ8ZulL6OiowDvPYDGFY7DwMMoFj5m980RH9FbVHE1UhtD+vOKgCSG6UxQ01wpu+3CXzjSKvJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730385176; c=relaxed/simple;
	bh=GdvBqgA9us7PRKsGay4ZUGodHWRvXjW1Th8o7CsH9Os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADmedCp2LZieohTMBvBKUZTjSNhnUZe2S4bBWrJxD1a5nM2wTu+AFg2LAo2PY/Gjfd0gXTLOJJ0W63aEdvmjOj1EsNbfMEIPfHHaRW5TH+H8RHgPQZEg/fXQcfAHKXIzUlRFUrG53RdP0Rr7QD6HXoeVz+Tqs5uQqWq/nxCpzX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BadDpcVD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A89C4CED0;
	Thu, 31 Oct 2024 14:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730385175;
	bh=GdvBqgA9us7PRKsGay4ZUGodHWRvXjW1Th8o7CsH9Os=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BadDpcVDHkEHKOItwoeeX8Vwio08SysKCwRsexowF/sLGr5NgYb3Wt13+/J5/H8YX
	 k8eIg/tL99B+Ebxwff1lUqB2s/bKZNmaKaIRMexERMw6JALpoOzLdE2LYC7yP3+mZ1
	 Bz06UaS4wualVrZ5PFA1fh6N2O/Q3hhuVH6XCSqnvlPOGP1f8ZYhs7BCdhta3y1Ym+
	 Uu6uMPUoBOreDh7N8nF8Hru3QmDR3DlZaQWiPUXDdhlGn8+yDolVlXhVkenIYuWXaH
	 fyTWL72AG9e9Fp5sFwdGhswxEpnP0mr84oU87v0Op37ZRaMrb2eBOiPMcHM7GKqjVi
	 1ioujHHYsgjwA==
Date: Thu, 31 Oct 2024 14:32:50 +0000
From: Lee Jones <lee@kernel.org>
To: George Stark <gnstark@salutedevices.com>
Cc: pavel@ucw.cz, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@salutedevices.com
Subject: Re: [PATCH 2/2] leds: pwm: Add optional DT property
 default-brightness
Message-ID: <20241031143250.GH10824@google.com>
References: <20241015151410.2158102-1-gnstark@salutedevices.com>
 <20241015151410.2158102-3-gnstark@salutedevices.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241015151410.2158102-3-gnstark@salutedevices.com>

On Tue, 15 Oct 2024, George Stark wrote:

> When probing if default LED state is on then default brightness will be
> applied instead of max brightness.
> 
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> ---
>  drivers/leds/leds-pwm.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> index 7961dca0db2f..514fc8ca3e80 100644
> --- a/drivers/leds/leds-pwm.c
> +++ b/drivers/leds/leds-pwm.c
> @@ -65,7 +65,8 @@ static int led_pwm_set(struct led_classdev *led_cdev,
>  
>  __attribute__((nonnull))
>  static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
> -		       struct led_pwm *led, struct fwnode_handle *fwnode)
> +		       struct led_pwm *led, struct fwnode_handle *fwnode,
> +		       unsigned int default_brightness)
>  {
>  	struct led_pwm_data *led_data = &priv->leds[priv->num_leds];
>  	struct led_init_data init_data = { .fwnode = fwnode };
> @@ -104,7 +105,7 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
>  	/* set brightness */
>  	switch (led->default_state) {
>  	case LEDS_DEFSTATE_ON:
> -		led_data->cdev.brightness = led->max_brightness;
> +		led_data->cdev.brightness = default_brightness;
>  		break;
>  	case LEDS_DEFSTATE_KEEP:
>  		{
> @@ -141,6 +142,7 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
>  static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv *priv)
>  {
>  	struct led_pwm led;
> +	unsigned int default_brightness;
>  	int ret;
>  
>  	device_for_each_child_node_scoped(dev, fwnode) {
> @@ -160,7 +162,12 @@ static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv *priv)
>  
>  		led.default_state = led_init_default_state_get(fwnode);
>  
> -		ret = led_pwm_add(dev, priv, &led, fwnode);
> +		ret = fwnode_property_read_u32(fwnode, "default-brightness",
> +					       &default_brightness);
> +		if (ret < 0 || default_brightness > led.max_brightness)
> +			default_brightness = led.max_brightness;
> +
> +		ret = led_pwm_add(dev, priv, &led, fwnode, default_brightness);

This creates a lot more hopping around than is necessary.

Since led_pwm_add() already has access to the fwnode, why not look up
the property in there instead, thus massively simplifying things.


>  		if (ret)
>  			return ret;
>  	}
> -- 
> 2.25.1
> 

-- 
Lee Jones [李琼斯]

