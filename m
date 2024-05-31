Return-Path: <linux-leds+bounces-1773-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2472D8D65F7
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 17:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3F9E28F81B
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 15:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153B0130AFC;
	Fri, 31 May 2024 15:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvWsP3HR"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95EC770FC;
	Fri, 31 May 2024 15:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717170187; cv=none; b=V47wndxpjFsesgKfQxGWpt68Y+14Jl4ceGyTIbHYhw3gawUNZ6yY7e3xeXugQ16VTT7lnx1ROGMkj/y8I+Ik1FIFLAvKyDDAPzYKo08BlXDEK6HJ3opPNVJCSmlWbHf8V7wgDJppKIozhJFkJNabpY7nI+3KslwZmEXXshC8t6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717170187; c=relaxed/simple;
	bh=zBfKRiTb3thRIUaH1yDSHFpa2a0pLOSkK6tnaNaFnEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h0BQkf4PucrAAsgLcQAXpvDHStj0DTebZxuNeyItV5CPiBbe8mwyEoBRFnHNjmqTcNfzHRmLFBS2TwXY+uF04MXbXqdM9fuQPIUzEd6BpBQVU2lhbQvY/wISGzPk0eiUwATEDXi53JT+gXY/V4vNoVv8+7jcHWzbewKH+cv4nvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvWsP3HR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62583C116B1;
	Fri, 31 May 2024 15:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717170186;
	bh=zBfKRiTb3thRIUaH1yDSHFpa2a0pLOSkK6tnaNaFnEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JvWsP3HR0PibCNkuVtCawazRSehMxHOIGbRVal2Mxwuh5BYBxtNdwpJTeRg7HVKbm
	 JDWYJv7I1ZMX0w/N302ejbzZrEu08uxM6BMTrpWMLTcImtXkeVMIrLGLavlXvaFxXb
	 lNsPj4Ys6zKqrzM4idZMQGhn2mKGRecsrGC0Rs3hnLBBl1Ez93jNTTZk+Qsieez7xs
	 MjjuBvXtXKQmkf870igfsgLBApstdRjUi3cKoiJ1+vPKLueCNMETXG2hT40zZWgdZg
	 4aOcrd0QxhnWMEDkNvizVkMAZDuuaIeQz+cibd1MKE8L/GZhYK9DR5NVXMKcxk5Y70
	 3m9rlW+QiHMzw==
Date: Fri, 31 May 2024 16:42:42 +0100
From: Lee Jones <lee@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Pavel Machek <pavel@ucw.cz>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	Dustin Howett <dustin@howett.net>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH 1/5] leds: introduce led_color_name function
Message-ID: <20240531154242.GQ1005600@google.com>
References: <20240520-cros_ec-led-v1-0-4068fc5c051a@weissschuh.net>
 <20240520-cros_ec-led-v1-1-4068fc5c051a@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240520-cros_ec-led-v1-1-4068fc5c051a@weissschuh.net>

It would save me a lot of work if you could follow the conventions of
the subsystem when drafting subjects.

`git log --online -- <subsystem>` is your friend.

> This is similar to the existing led_colors array but is safer to use and
> usable by everyone.

Place spaces between paragraphs or don't line-break at all please.

> Getting string representations of color ids is useful for drivers

"IDs"

> which are handling color ids anyways, for example for the multicolor API.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
>  drivers/leds/led-core.c |  9 +++++++++
>  include/linux/leds.h    | 10 ++++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index 89c9806cc97f..04a49958458e 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -534,6 +534,15 @@ int led_compose_name(struct device *dev, struct led_init_data *init_data,
>  }
>  EXPORT_SYMBOL_GPL(led_compose_name);
>  
> +const char *led_color_name(u8 color_id)

led_get_color_name()

> +{
> +	if (color_id >= ARRAY_SIZE(led_colors))
> +		return NULL;
> +
> +	return led_colors[color_id];
> +}
> +EXPORT_SYMBOL_GPL(led_color_name);
> +
>  enum led_default_state led_init_default_state_get(struct fwnode_handle *fwnode)
>  {
>  	const char *state = NULL;
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index db6b114bb3d9..0f1b955fa3f7 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -427,6 +427,16 @@ void led_sysfs_enable(struct led_classdev *led_cdev);
>  int led_compose_name(struct device *dev, struct led_init_data *init_data,
>  		     char *led_classdev_name);
>  
> +/**
> + * led_color_name - get string representation of color id
> + * @color_id: The LED_COLOR_ID_* constant
> + *
> + * Get the string name of a LED_COLOR_ID_* constant.
> + *
> + * Returns: A string constant or NULL on an invalid ID.
> + */
> +const char *led_color_name(u8 color_id);


>  /**
>   * led_sysfs_is_disabled - check if LED sysfs interface is disabled
>   * @led_cdev: the LED to query
> 
> -- 
> 2.45.1
> 
> 

-- 
Lee Jones [李琼斯]

