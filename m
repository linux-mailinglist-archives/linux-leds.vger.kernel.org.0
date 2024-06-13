Return-Path: <linux-leds+bounces-1920-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE72907D7A
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 22:30:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 295001C2243B
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 20:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03F01139D09;
	Thu, 13 Jun 2024 20:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="FHFGdOAZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-29.smtpout.orange.fr [80.12.242.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8777E792;
	Thu, 13 Jun 2024 20:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718310611; cv=none; b=uKc0sKrzk8opIGDOve1nn6HZHeYY0ZpTu+cxqcsxhrrcaInU0SkcD+n0M9qLHuLaTjeS7DDuVqDlqJT0N5N8e/hB8B0YmT70OsrIVrfVHoevAXALCMhM7pmeOftys0u3uv7p7QAjTakyItB8fXK/GM3nEtv9SDz429nOIikZi0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718310611; c=relaxed/simple;
	bh=QrBsUJFDwXgr2oTLr1tPPtq2pOnEJFa7jiSZ4K1UKcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JzpKp82UT1CVHTDU5KB9GihJPFAT+Oxehec7MkLXo6IjsYP8Z511YPK/AJaQFbQ1bDWfKgWTmkou6r5Lh94pxWsIiFfqhV/fp9gaZy8wUi+MEoijo/rhx/FSM60Ob2AO/rVi2ATuvaxpAA5/5oxYGfafC9PlE6wknpSYaZawNqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=FHFGdOAZ; arc=none smtp.client-ip=80.12.242.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([86.243.222.230])
	by smtp.orange.fr with ESMTPA
	id Hr3ssyaDBqq3iHr3tscaLZ; Thu, 13 Jun 2024 22:28:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1718310535;
	bh=dvPKzROSaeaXbCnPlFCMNaupzO6K/7nRVKWKr+wqnlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=FHFGdOAZ2xuuvt+Sm4tn6hKliAlJILkNtKNIfihUVrEJgN3TriF12nvtu/3Zx+S+w
	 6JOBezgAKxEGmCwr931lBvD5SnMxIrjKs+VX53aaksOQXX8ee1kx/t+pdvYWK43aoM
	 8ejYnF50EIK5phWiwFwtZZshbWMD6OuZD2G+uRtK5UixHwwz1x/pxRffsL0G97ByFW
	 QmJ8ch7D8S3WfvdGNtREPVv1UlMAfF0z7odhN4dSDqukMQA5ed4/1Xt51jiQUPcXgi
	 bG62AfPDqFJTLoV6pGgniRmaaTIedyYUdHgWWGdhuNe+22cdjgrQqhZXykdQ5LgD2l
	 D4vrp9zVmoJMw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 13 Jun 2024 22:28:55 +0200
X-ME-IP: 86.243.222.230
Message-ID: <2c05eb25-a21a-40f5-a573-09f9ddd4c578@wanadoo.fr>
Date: Thu, 13 Jun 2024 22:28:44 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] leds: sy7802: Add support for Silergy SY7802 flash
 LED controller
To: git@apitzsch.eu, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Trilok Soni <quic_tsoni@quicinc.com>, Kees Cook <kees@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20240612-sy7802-v3-0-1e9cc1c79b79@apitzsch.eu>
 <20240612-sy7802-v3-2-1e9cc1c79b79@apitzsch.eu>
Content-Language: en-MW, en-GB
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240612-sy7802-v3-2-1e9cc1c79b79@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 12/06/2024 à 23:01, André Apitzsch via B4 Relay a écrit :
> From: André Apitzsch <git@apitzsch.eu>
> 
> The SY7802 is a current-regulated charge pump which can regulate two
> current levels for Flash and Torch modes.
> 
> It is a high-current synchronous boost converter with 2-channel high
> side current sources. Each channel is able to deliver 900mA current.
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
>   drivers/leds/flash/Kconfig       |  11 +
>   drivers/leds/flash/Makefile      |   1 +
>   drivers/leds/flash/leds-sy7802.c | 546 +++++++++++++++++++++++++++++++++++++++
>   3 files changed, 558 insertions(+)
> 

Hi,

...

> +static int sy7802_probe_dt(struct sy7802 *chip)
> +{
> +	struct device_node *np = dev_of_node(chip->dev);
> +	struct device_node *child;
> +	int child_num;
> +	int ret;
> +
> +	regmap_write(chip->regmap, SY7802_REG_ENABLE, SY7802_MODE_OFF);
> +	regmap_write(chip->regmap, SY7802_REG_TORCH_BRIGHTNESS, LED_OFF);
> +
> +	child_num = 0;
> +	for_each_available_child_of_node(np, child) {

Using for_each_available_child_of_node_scoped() would slightly simplify 
the code below.

> +		struct sy7802_led *led = chip->leds + child_num;
> +
> +		led->chip = chip;
> +		led->led_id = child_num;
> +
> +		ret = sy7802_init_flash_properties(chip->dev, led, child);
> +		if (ret) {
> +			of_node_put(child);
> +			return ret;
> +		}
> +
> +		ret = sy7802_led_register(chip->dev, led, child);
> +		if (ret) {
> +			of_node_put(child);
> +			return ret;
> +		}
> +
> +		child_num++;
> +	}
> +	return 0;
> +}

...

> +static int sy7802_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct sy7802 *chip;
> +	size_t count;
> +	int ret;
> +
> +	count = device_get_child_node_count(dev);
> +	if (!count || count > SY7802_MAX_LEDS)
> +		return dev_err_probe(dev, -EINVAL, "Invalid amount of LED nodes %zu\n", count);
> +
> +	chip = devm_kzalloc(dev, struct_size(chip, leds, count), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	chip->num_leds = count;
> +
> +	chip->dev = dev;
> +	i2c_set_clientdata(client, chip);
> +
> +	chip->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
> +	ret = PTR_ERR_OR_ZERO(chip->enable_gpio);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to request enable gpio\n");
> +
> +	chip->vin_regulator = devm_regulator_get(dev, "vin");
> +	ret = PTR_ERR_OR_ZERO(chip->vin_regulator);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to request regulator\n");
> +
> +	ret = regulator_enable(chip->vin_regulator);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable regulator\n");
> +
> +	ret = devm_mutex_init(dev, &chip->mutex);
> +	if (ret)
> +		return ret;

The regulator_enable() above is not balanced if we return here.

> +
> +	mutex_lock(&chip->mutex);
> +
> +	chip->regmap = devm_regmap_init_i2c(client, &sy7802_regmap_config);
> +	if (IS_ERR(chip->regmap)) {
> +		ret = PTR_ERR(chip->regmap);
> +		dev_err(dev, "Failed to allocate register map: %d\n", ret);

dev_err_probe() to be consistent with the code above?

> +		goto error;
> +	}
> +
> +	ret = devm_add_action(dev, sy7802_chip_disable_action, chip);

I think that having 2 devm_add_action_or_reset() each at a logical 
location, 1 for regulator_disable() and 1 for sy7802_disable() would help.

> +	if (ret)
> +		goto error;
> +
> +	ret = sy7802_probe_dt(chip);
> +	if (ret < 0)
> +		goto error;
> +
> +	sy7802_enable(chip);
> +
> +	ret = sy7802_chip_check(chip);
> +	if (ret) {
> +		sy7802_disable(chip);
> +		goto error;
> +	}
> +
> +	mutex_unlock(&chip->mutex);
> +
> +	return 0;
> +
> +error:
> +	regulator_disable(chip->vin_regulator);
> +	mutex_unlock(&chip->mutex);
> +	return ret;
> +}

CJ

...


