Return-Path: <linux-leds+bounces-5365-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEF1B4009B
	for <lists+linux-leds@lfdr.de>; Tue,  2 Sep 2025 14:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3C835E2E83
	for <lists+linux-leds@lfdr.de>; Tue,  2 Sep 2025 12:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CED028750B;
	Tue,  2 Sep 2025 12:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aFEwkyub"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20832EE61D;
	Tue,  2 Sep 2025 12:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756815941; cv=none; b=m4oJV+GgqIZqWkDu6MRMOcmn1FC9qUXp6cUhl+Nqal/eRKXvXLyB4w9l37bw8lCnmvn17P4F3PlrOp+3eFeJkPG1KrGsmY/i8fnnqRQqjzic8xew/dhnH5JwnRaSq9M+4qpYJq8AR0AFVQFdws564WgggS6kW5RTlqIi65XZMlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756815941; c=relaxed/simple;
	bh=tOTGeZnjx47VyjcWDHmS3VXQ7wa/IfFBajWPok1nLyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZuNejhC5/EH2NGm9NoJB9XbNhNNrgKarkOKWH7pKWg1pMtzEz/DMR1aHyLNV3yjtNGe+KmbyKO3vsIRsQS5HuJ3RHP+Reqq9Vm8LqJzXAC84HL5FwXOFqveAdISIPaM4RiogeACQy9c2izyBSkYgsEZMzNcMdCj7IJn69WmjYeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aFEwkyub; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 360DFC4AF09;
	Tue,  2 Sep 2025 12:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756815941;
	bh=tOTGeZnjx47VyjcWDHmS3VXQ7wa/IfFBajWPok1nLyw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aFEwkyubPT/9oxZGfR7M4SHfY5Ch+0PNEJKtANHaDwc9Zjf/FNNAeWzER6JrxhxhT
	 dLEWZ/0spxUlX9WELfi7Ej7l8/mZuk28UbWJ6Ycj3xzmM8NhCWZ2Iuu5JUFuAGOkMr
	 FimmpWpLjzBeI27/eZQ/Z71HfZdAtpi7GJRntte0nd+ql5D0SgTyXDI65G/nEYkXtC
	 ugdc1iCZ+Kf8eprOTFpgAruyoe3E+3Hl4ICosJ/JBIkZq52Rl6VK18r9eeskKHNMzS
	 UPNVHYZiCP6CqKKxolCJ+y26mH+igvjwXEr4EheiNJooXrLDp2r/5i/Drh04Rg/AVV
	 5A+alTh4zUXWQ==
Message-ID: <8aa9dfc5-5e77-48af-b2f4-f1964d20d6d1@kernel.org>
Date: Tue, 2 Sep 2025 14:25:37 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] leds: led-class: Add devicetree support to led_get()
To: Aleksandrs Vinarskis <alex@vinarskis.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20250902-leds-v1-0-4a31e125276b@vinarskis.com>
 <010201990a1f6559-9e836a40-f534-4535-bd59-5e967d80559a-000000@eu-west-1.amazonses.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <010201990a1f6559-9e836a40-f534-4535-bd59-5e967d80559a-000000@eu-west-1.amazonses.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Aleksandrs,

Thank you for working on this.

On 2-Sep-25 1:10 PM, Aleksandrs Vinarskis wrote:
> From: Hans de Goede <hansg@kernel.org>
> 
> Turn of_led_get() into a more generic __of_led_get() helper function,
> which can lookup LEDs in devicetree by either name or index.
> 
> And use this new helper to add devicetree support to the generic
> (non devicetree specific) [devm_]led_get() function.
> 
> This uses the standard devicetree pattern of adding a -names string array
> to map names to the indexes for an array of resources.
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Lee Jones <lee@kernel.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Please update this to:

Reviewed-by: Hans de Goede <hansg@kernel.org>

to match the update of the author which you already did.

Also note that checkpatch should complain about the mismatch,
please ensure to run checkpatch before posting v2.

> Tested-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  drivers/leds/led-class.c | 38 +++++++++++++++++++++++++++++---------
>  1 file changed, 29 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 15633fbf3c166aa4f521774d245f6399a642bced..6f2ef4fa556b44ed3bf69dff556ae16fd2b7652b 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -248,19 +248,18 @@ static const struct class leds_class = {
>  	.pm = &leds_class_dev_pm_ops,
>  };
>  
> -/**
> - * of_led_get() - request a LED device via the LED framework
> - * @np: device node to get the LED device from
> - * @index: the index of the LED
> - *
> - * Returns the LED device parsed from the phandle specified in the "leds"
> - * property of a device tree node or a negative error-code on failure.
> - */
> -static struct led_classdev *of_led_get(struct device_node *np, int index)
> +static struct led_classdev *__of_led_get(struct device_node *np, int index,
> +					 const char *name)
>  {
>  	struct device *led_dev;
>  	struct device_node *led_node;
>  
> +	/*
> +	 * For named LEDs, first look up the name in the "led-names" property.
> +	 * If it cannot be found, then of_parse_phandle() will propagate the error.
> +	 */
> +	if (name)
> +		index = of_property_match_string(np, "led-names", name);
>  	led_node = of_parse_phandle(np, "leds", index);
>  	if (!led_node)
>  		return ERR_PTR(-ENOENT);
> @@ -271,6 +270,20 @@ static struct led_classdev *of_led_get(struct device_node *np, int index)
>  	return led_module_get(led_dev);
>  }
>  
> +/**
> + * of_led_get() - request a LED device via the LED framework
> + * @np: device node to get the LED device from
> + * @index: the index of the LED
> + *
> + * Returns the LED device parsed from the phandle specified in the "leds"
> + * property of a device tree node or a negative error-code on failure.
> + */
> +struct led_classdev *of_led_get(struct device_node *np, int index)
> +{
> +	return __of_led_get(np, index, NULL);
> +}
> +EXPORT_SYMBOL_GPL(of_led_get);

I probably did this myself, but since of_led_get() is private now
(I guess it was not private before?) and since we are moving away from
"of" specific functions to using generic dev_xxxx functions in the kernel
in general, I think this just should be a static helper.

Or probably even better: just add the name argument to of_led_get()
before without renaming it, update the existing callers to pass
an extra NULL arg and completely drop this wrapper.

Also notice that adding the EXPORT_SYMBOL_GPL() while there was
none before should go hand in hand with adding a prototype to
a relevant .h file. However please just keep this private and
drop the wrapper.

Regards,

Hans




> +
>  /**
>   * led_put() - release a LED device
>   * @led_cdev: LED device
> @@ -342,9 +355,16 @@ EXPORT_SYMBOL_GPL(devm_of_led_get);
>  struct led_classdev *led_get(struct device *dev, char *con_id)
>  {
>  	struct led_lookup_data *lookup;
> +	struct led_classdev *led_cdev;
>  	const char *provider = NULL;
>  	struct device *led_dev;
>  
> +	if (dev->of_node) {
> +		led_cdev = __of_led_get(dev->of_node, -1, con_id);
> +		if (!IS_ERR(led_cdev) || PTR_ERR(led_cdev) != -ENOENT)
> +			return led_cdev;
> +	}
> +
>  	mutex_lock(&leds_lookup_lock);
>  	list_for_each_entry(lookup, &leds_lookup_list, list) {
>  		if (!strcmp(lookup->dev_id, dev_name(dev)) &&
> 


