Return-Path: <linux-leds+bounces-5703-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F078BBC97DC
	for <lists+linux-leds@lfdr.de>; Thu, 09 Oct 2025 16:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA97F420F2A
	for <lists+linux-leds@lfdr.de>; Thu,  9 Oct 2025 14:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C092EA48E;
	Thu,  9 Oct 2025 14:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JtCVhsBD"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9723D2E92B2;
	Thu,  9 Oct 2025 14:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760019919; cv=none; b=UybGlIdbgJA9CNwHtGYLRL2P4yM6Awwreey3tktd/TUEs4KU85lnflM1DLXyoTtyRdiu9H6Hau7UKUnkIMTGz5rpu5zX3qaDtrJy5yuI+UFITBC4Wry6aotn48uihAM5HkfPVXrbHpIF+AB/AYSn+OtB3mMbDncCy8NPG6SPeqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760019919; c=relaxed/simple;
	bh=6wXkYwA9yN780412G6qSb0+U1yzHmlLYGrXboghpMvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qVEn/2BaTjAjzvm7vaZ9hewI/EruCvf0EiMsfg6s8n/Dq4Q1nSi5yIvPn2h/cTMIYC7pRh/80MfcFqxyLABXXp4vcAgULGWtvHFyHRJYbG7biNo8veX3k7ABkSrfnbGJBEQsGhp8orTjQ4QDEhSyFixTEDH59rlw+abSfx5bUsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JtCVhsBD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C11C4CEE7;
	Thu,  9 Oct 2025 14:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760019919;
	bh=6wXkYwA9yN780412G6qSb0+U1yzHmlLYGrXboghpMvY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JtCVhsBDEZUTNiJRf0sEjWXEYGGv3Eh7AT85Jy0q8jLWkLgRJlsBJ37H2iMuZBQN+
	 7lBuTqu53Y2z1fxcNEiAUIaO6vm9tQZTTcyn686//qJhcaNmTvCh6JMZsfl/NApcBe
	 2kUv09wPhi24p9eq7+SYnaBXU4JxTuJLHYqHBwHk8BVt1ZuCUDEZnKK6cYM9Fn3LVQ
	 LS1I12OTuJkYWW0OaF6zlLvDUpwbFBxz72PISx1BhcUvyuaZ41r4EpMlyKCAI3K1PO
	 WmFzenoxgNm3BV8Lwl0bkCKFFiE10JmlLMLksdu6z/+hvhcR52PwSlmAwKGCc4Qjxt
	 czm80B6Fc80tw==
Message-ID: <c1d2b2f5-1755-48f3-ac02-952bda718193@kernel.org>
Date: Thu, 9 Oct 2025 23:25:11 +0900
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] leds: Add Virtual Color LED Group driver
To: Jonathan Brophy <professorjonny98@gmail.com>, lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>,
 Jonathan Brophy <professor_jonny@hotmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org
References: <20251009084339.1586319-1-professorjonny98@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251009084339.1586319-1-professorjonny98@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/10/2025 17:43, Jonathan Brophy wrote:
> From: Jonathan Brophy <professor_jonny@hotmail.com>
> 
> This commit introduces a new driver that implements virtual LED groups


Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94

> by aggregating multiple monochromatic LEDs. The driver provides
> priority-based control to manage concurrent LED activation requests,



> +
> +static int leds_virtualcolor_init_vled(struct device *dev, struct device_node *child,
> +				       struct virtual_led *vled, struct leds_virtualcolor *vc_data)
> +{
> +	struct fwnode_handle *child_fwnode = of_fwnode_handle(child);
> +	struct led_init_data init_data = {};
> +	u32 blink_interval;
> +	u32 phandle_count;
> +	u32 max_brightness;
> +	int ret, i;
> +
> +	ret = of_property_read_u32(child, "priority", &vled->priority);
> +	if (ret)
> +		vled->priority = 0;
> +
> +	ret = of_property_read_u32(child, "blink", &blink_interval);


Where is this ABI documented? I do not see.

> +	if (!ret) {
> +		vled->blink_delay_on = blink_interval;
> +		vled->blink_delay_off = blink_interval;
> +	}
> +
> +	phandle_count = fwnode_property_count_u32(child_fwnode, "leds");


No, don't mix OF and fwnode.

> +	if (phandle_count <= 0) {
> +		dev_err(dev, "No monochromatic LEDs specified for virtual LED %s\n",
> +			vled->cdev.name);
> +		return -EINVAL;
> +	}
> +
> +	vled->num_monochromatics = phandle_count;
> +	vled->monochromatics = devm_kcalloc(dev, vled->num_monochromatics,
> +					    sizeof(*vled->monochromatics), GFP_KERNEL);
> +	if (!vled->monochromatics)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < vled->num_monochromatics; i++) {
> +		struct led_classdev *led_cdev;
> +
> +		led_cdev = devm_of_led_get_optional(dev, i);
> +		if (IS_ERR(led_cdev)) {
> +			/*
> +			 * If the LED is not available yet, defer the probe.
> +			 * The probe will be retried when it becomes available.
> +			 */
> +			if (PTR_ERR(led_cdev) == -EPROBE_DEFER)
> +				return -EPROBE_DEFER;


Pointless...

> +
> +			ret = PTR_ERR(led_cdev);
> +			dev_err(dev, "Failed to get monochromatic LED for %s, error %d\n",
> +				vled->cdev.name, ret);
> +			return ret;


...just return dev_err_probe

> +		}
> +
> +		vled->monochromatics[i] = led_cdev;
> +	}
> +
> +	ret = of_property_read_u32(child, "max-brightness", &max_brightness);
> +	if (ret)
> +		vled->cdev.max_brightness = LED_FULL;
> +	else
> +		vled->cdev.max_brightness = max_brightness;
> +
> +	vled->cdev.brightness_set_blocking = virtual_led_brightness_set;
> +	vled->cdev.max_brightness = LED_FULL;
> +	vled->cdev.flags = LED_CORE_SUSPENDRESUME;
> +
> +	init_data.fwnode = child_fwnode;
> +	ret = devm_led_classdev_register_ext(dev, &vled->cdev, &init_data);
> +	if (ret) {
> +		dev_err(dev, "Failed to register virtual LED %s\n", vled->cdev.name);
> +		return ret;
> +	}
> +
> +	ret = device_create_file(vled->cdev.dev, &dev_attr_priority);
> +	if (ret) {
> +		dev_err(dev, "Failed to create sysfs attribute for priority\n");
> +		return ret;
> +	}
> +
> +	ret = device_create_file(vled->cdev.dev, &dev_attr_blink_delay_on);
> +	if (ret) {
> +		dev_err(dev, "Failed to create sysfs attribute for blink_delay_on\n");
> +		return ret;
> +	}
> +
> +	ret = device_create_file(vled->cdev.dev, &dev_attr_blink_delay_off);
> +	if (ret) {
> +		dev_err(dev, "Failed to create sysfs attribute for blink_delay_off\n");
> +		return ret;
> +	}
> +
> +	vled->vc_data = vc_data;
> +
> +	return 0;
> +}
> +
> +static int leds_virtualcolor_disable_sysfs_access(struct device *dev, struct virtual_led *vled)
> +{
> +	int i;
> +
> +	for (i = 0; i < vled->num_monochromatics; i++) {
> +		struct led_classdev *led_cdev = vled->monochromatics[i];
> +
> +		mutex_lock(&led_cdev->led_access);
> +		led_sysfs_disable(led_cdev);
> +		mutex_unlock(&led_cdev->led_access);
> +
> +		devm_add_action_or_reset(dev, restore_sysfs_write_access, led_cdev);
> +	}
> +
> +	return 0;
> +}
> +
> +static int leds_virtualcolor_probe(struct platform_device *pdev)
> +{
> +	struct leds_virtualcolor *vc_data;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *child;
> +	int count = 0;
> +	int ret;
> +
> +	vc_data = devm_kzalloc(dev, sizeof(*vc_data), GFP_KERNEL);
> +	if (!vc_data)
> +		return -ENOMEM;
> +
> +	mutex_init(&vc_data->lock);
> +	INIT_LIST_HEAD(&vc_data->active_leds);
> +
> +	vc_data->num_vleds = of_get_child_count(dev->of_node);
> +	if (vc_data->num_vleds == 0) {
> +		dev_err(dev, "No virtual LEDs defined in device tree\n");
> +		ret = -EINVAL;
> +		goto err_mutex_destroy;
> +	}
> +
> +	vc_data->vleds = devm_kcalloc(dev, vc_data->num_vleds, sizeof(*vc_data->vleds), GFP_KERNEL);
> +	if (!vc_data->vleds) {
> +		ret = -ENOMEM;
> +		goto err_mutex_destroy;
> +	}
> +
> +	for_each_child_of_node(dev->of_node, child) {
> +		struct virtual_led *vled = &vc_data->vleds[count];
> +
> +		ret = leds_virtualcolor_init_vled(dev, child, vled, vc_data);
> +		if (ret) {
> +			if (ret != -EPROBE_DEFER)
> +				dev_err(dev, "Failed to initialize virtual LED %d\n", count);
> +
> +			of_node_put(child);


Just use scoped loop.

> +			goto err_node_put;
> +		}
> +
> +		count++;
> +	}
> +
> +	platform_set_drvdata(pdev, vc_data);
> +
> +	if (of_property_read_bool(dev->of_node, "monochromatics-ro")) {
> +		int i;
> +
> +		for (i = 0; i < count; i++) {
> +			struct virtual_led *vled = &vc_data->vleds[i];
> +
> +			ret = leds_virtualcolor_disable_sysfs_access(dev, vled);
> +			if (ret)
> +				goto err_node_put;
> +		}
> +	}
> +
> +	return 0;
> +
> +err_node_put:
> +	of_node_put(child);


Double of node release or your code is just confusing. Each functions
cleans up only pieces it allocates, not some other function resources.

> +err_mutex_destroy:
> +	mutex_destroy(&vc_data->lock);
> +
> +	return ret;
> +}
> +
> +static void leds_virtualcolor_remove(struct platform_device *pdev)
> +{
> +	struct leds_virtualcolor *vc_data = platform_get_drvdata(pdev);
> +	int i;
> +
> +	for (i = 0; i < vc_data->num_vleds; i++) {
> +		struct virtual_led *vled = &vc_data->vleds[i];
> +		int j;
> +
> +		device_remove_file(vled->cdev.dev, &dev_attr_priority);
> +		device_remove_file(vled->cdev.dev, &dev_attr_blink_delay_on);
> +		device_remove_file(vled->cdev.dev, &dev_attr_blink_delay_off);
> +
> +		for (j = 0; j < vled->num_monochromatics; j++) {
> +			if (vled->monochromatics[j]) {
> +				led_put(vled->monochromatics[j]);
> +				vled->monochromatics[j] = NULL;
> +			}
> +		}
> +	}
> +
> +	mutex_destroy(&vc_data->lock);
> +}
> +
> +static const struct of_device_id leds_virtualcolor_of_match[] = {
> +	{ .compatible = "leds-group-virtualcolor" },


Please organize the patch documenting compatible (DT bindings) before
their user.
See also:
https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46

> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, leds_virtualcolor_of_match);
> +
> +static struct platform_driver leds_virtualcolor_driver = {
> +	.probe  = leds_virtualcolor_probe,
> +	.remove = leds_virtualcolor_remove,
> +	.driver = {
> +		.name           = "leds_virtualcolor",
> +		.of_match_table = leds_virtualcolor_of_match,
> +	},
> +};
> +
> +module_platform_driver(leds_virtualcolor_driver);
> +
> +MODULE_AUTHOR("Radoslav Tsvetkov <rtsvetkov@gradotech.eu>");
> +MODULE_DESCRIPTION("LEDs Virtual Color Driver with Priority Handling");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:leds-group-virtualcolor");


You should not need MODULE_ALIAS() in normal cases. If you need it,
usually it means your device ID table is wrong (e.g. misses either
entries or MODULE_DEVICE_TABLE()). MODULE_ALIAS() is not a substitute
for incomplete ID table.




Best regards,
Krzysztof

