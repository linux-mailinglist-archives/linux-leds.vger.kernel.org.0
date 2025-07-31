Return-Path: <linux-leds+bounces-5182-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1CBB17236
	for <lists+linux-leds@lfdr.de>; Thu, 31 Jul 2025 15:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F34F01C220CA
	for <lists+linux-leds@lfdr.de>; Thu, 31 Jul 2025 13:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C16E52D0C89;
	Thu, 31 Jul 2025 13:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dnjrmyyp"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954A72367AB;
	Thu, 31 Jul 2025 13:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753969157; cv=none; b=XKAAN8MLvcp/TRvKTc+k+XxIHeZyChqm/frZt5rg7ax4vdKsQ9SwpG8u3bmcmfyTfwG3vhaTkqIqzmEiAH7b123mPuelhR6yaKxtipyKVIQJDDzvD7inUaGSmfuJ7K33FKMJorg01SAVnVnr6OJtHK2bUiEX4gnpLtL1X7cdIRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753969157; c=relaxed/simple;
	bh=edRNYc4d0aQUpwqpCavkiGv/eXpN4MA3kBq4O1DAsGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ue9O5o/CeuGQj4TgnwK5UbaQ7ORoOJHNoPISEvZt7ewRSv8ryJlbsoPHKaEqzsZN981CaKdhL+XDa/FSHfJLQHzBNu207XEY6Fkocgh+x+Izx7SqhFfO1dOZF1Envp2A81SvyDLXk1PQp3zBSrbmWBp3EFIUY5Wy+5G1ghrXL1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dnjrmyyp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B18EC4CEEF;
	Thu, 31 Jul 2025 13:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753969157;
	bh=edRNYc4d0aQUpwqpCavkiGv/eXpN4MA3kBq4O1DAsGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dnjrmyypeLOiHl+nJOBhDuZoIckD4IFMjlWNEfZdt1CkgvYQJqSSuF+3pqLdZsOsv
	 lw2+UOZtskOZlMYM+bUICP8AfQsuJ5qncxoDF+axegYHGEwzNlIXqOZY39cBdZ3ja+
	 bnHpMDMn3YXJ5GLI6hPY7Kf1577DYcK2SEftK18/yQbA9EOjciYACgQTk1yJlaSoMJ
	 z2n3UgWb4Ju5WJOZSnGCNlKJHo/Sxe0yXuUrIjWncByuctQuNg9/ff+wpOyw+PbyC3
	 5fmGXshFhjlJV8fIk9237f0adgoqUXY9/uIgF6Z8una0bOr/gFj+A01c8NHuGGNTBN
	 uGWudKTOOyj8w==
Date: Thu, 31 Jul 2025 14:39:13 +0100
From: Lee Jones <lee@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: pavel@kernel.org, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: qnap-mcu: add support for the red and green status
 leds
Message-ID: <20250731133913.GH1049189@google.com>
References: <20250730170507.1869905-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250730170507.1869905-1-heiko@sntech.de>

Subject: s/led/LED/

> There is one more set of two LEDs on the qnap devices to indicate status.
> 
> One LED is green, the other is red and while they occupy the same space
> on the front panel, they cannot be enabled at the same time.
> 
> But they can interact via blink functions, the MCU can flash them
> alternately, going red -> green -> red -> ... either in 500ms or
> 1s intervals. They can of course also blink individually.
> 
> Add specific led functions for them and register them on probe.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/leds/leds-qnap-mcu.c | 156 +++++++++++++++++++++++++++++++++++
>  1 file changed, 156 insertions(+)
> 
> diff --git a/drivers/leds/leds-qnap-mcu.c b/drivers/leds/leds-qnap-mcu.c
> index 4e4709456261..b7747b47c604 100644
> --- a/drivers/leds/leds-qnap-mcu.c
> +++ b/drivers/leds/leds-qnap-mcu.c
> @@ -190,6 +190,157 @@ static int qnap_mcu_register_usb_led(struct device *dev, struct qnap_mcu *mcu)
>  	return qnap_mcu_usb_led_set(&usb_led->cdev, 0);
>  }
>  
> +enum qnap_mcu_status_led_mode {
> +	QNAP_MCU_STATUS_LED_OFF = 0,
> +	QNAP_MCU_STATUS_LED_ON = 1,
> +	QNAP_MCU_STATUS_LED_BLINK_FAST = 2, /* 500ms / 500ms */
> +	QNAP_MCU_STATUS_LED_BLINK_SLOW = 3, /* 1s / 1s */
> +};
> +
> +struct qnap_mcu_status;

Forward declarations are a warning flag.

How do all of the other drivers handle this?

> +struct qnap_mcu_status_led {
> +	struct qnap_mcu_status *base;
> +	struct led_classdev cdev;
> +	u8 mode;
> +};
> +
> +struct qnap_mcu_status {
> +	struct qnap_mcu *mcu;
> +	struct qnap_mcu_status_led red;
> +	struct qnap_mcu_status_led green;
> +};
> 
> +static inline struct qnap_mcu_status_led *
> +		cdev_to_qnap_mcu_status_led(struct led_classdev *led_cdev)

This is a strange place to break.

> +{
> +	return container_of(led_cdev, struct qnap_mcu_status_led, cdev);
> +}
> +
> +static u8 qnap_mcu_status_led_encode(struct qnap_mcu_status *status)
> +{
> +	if (status->red.mode == QNAP_MCU_STATUS_LED_OFF) {
> +		switch (status->green.mode) {
> +		case QNAP_MCU_STATUS_LED_OFF:
> +			return '9';
> +		case QNAP_MCU_STATUS_LED_ON:
> +			return '6';
> +		case QNAP_MCU_STATUS_LED_BLINK_FAST:
> +			return '5';
> +		case QNAP_MCU_STATUS_LED_BLINK_SLOW:
> +			return 'A';
> +		}
> +	} else if (status->green.mode == QNAP_MCU_STATUS_LED_OFF) {
> +		switch (status->red.mode) {
> +		case QNAP_MCU_STATUS_LED_OFF:
> +			return '9';
> +		case QNAP_MCU_STATUS_LED_ON:
> +			return '7';
> +		case QNAP_MCU_STATUS_LED_BLINK_FAST:
> +			return '4';
> +		case QNAP_MCU_STATUS_LED_BLINK_SLOW:
> +			return 'B';
> +		}
> +	} else if (status->green.mode == QNAP_MCU_STATUS_LED_BLINK_SLOW &&
> +		   status->red.mode == QNAP_MCU_STATUS_LED_BLINK_SLOW) {
> +		return 'C';
> +	}
> +
> +	/*
> +	 * At this point, both LEDs are on in some fashion, but both
> +	 * cannot be on at the same time, so just use the fast blink
> +	 */
> +	return '8';
> +}
> +
> +static int qnap_mcu_status_led_update(struct qnap_mcu *mcu,
> +				      struct qnap_mcu_status *status)
> +{
> +	u8 cmd[] = { '@', 'C', 0 };
> +
> +	cmd[2] = qnap_mcu_status_led_encode(status);
> +
> +	return qnap_mcu_exec_with_ack(mcu, cmd, sizeof(cmd));
> +}
> +
> +static int qnap_mcu_status_led_set(struct led_classdev *led_cdev,
> +				   enum led_brightness brightness)
> +{
> +	struct qnap_mcu_status_led *status_led = cdev_to_qnap_mcu_status_led(led_cdev);
> +
> +	/* Don't disturb a possible set blink-mode if LED stays on */
> +	if (brightness != 0 &&

Use up to 100-chars to make these more readable.

> +	    status_led->mode >= QNAP_MCU_STATUS_LED_BLINK_FAST)
> +		return 0;
> +
> +	status_led->mode = brightness ? QNAP_MCU_STATUS_LED_ON :
> +					QNAP_MCU_STATUS_LED_OFF;
> +
> +	return qnap_mcu_status_led_update(status_led->base->mcu,
> +					  status_led->base);
> +}
> +
> +static int qnap_mcu_status_led_blink_set(struct led_classdev *led_cdev,
> +					 unsigned long *delay_on,
> +					 unsigned long *delay_off)
> +{
> +	struct qnap_mcu_status_led *status_led = cdev_to_qnap_mcu_status_led(led_cdev);
> +
> +	/* LED is off, nothing to do */

I think this is implied by the quality nomenclature.

> +	if (status_led->mode == QNAP_MCU_STATUS_LED_OFF)
> +		return 0;
> +
> +	if (*delay_on <= 500) {
> +		*delay_on = 500;
> +		*delay_off = 500;
> +		status_led->mode = QNAP_MCU_STATUS_LED_BLINK_FAST;
> +	} else {
> +		*delay_on = 1000;
> +		*delay_off = 1000;
> +		status_led->mode = QNAP_MCU_STATUS_LED_BLINK_SLOW;
> +	}
> +
> +	return qnap_mcu_status_led_update(status_led->base->mcu,
> +					  status_led->base);
> +}
> +
> +static int qnap_mcu_register_status_leds(struct device *dev, struct qnap_mcu *mcu)
> +{
> +	struct qnap_mcu_status *status;
> +	int ret;
> +
> +	status = devm_kzalloc(dev, sizeof(*status), GFP_KERNEL);
> +	if (!status)
> +		return -ENOMEM;
> +
> +	status->mcu = mcu;
> +	status->red.base = status;
> +	status->green.base = status;
> +
> +	status->red.mode = QNAP_MCU_STATUS_LED_OFF;
> +	status->red.cdev.name = "red:status";
> +	status->red.cdev.brightness_set_blocking = qnap_mcu_status_led_set;
> +	status->red.cdev.blink_set = qnap_mcu_status_led_blink_set;
> +	status->red.cdev.brightness = 0;
> +	status->red.cdev.max_brightness = 1;
> +
> +	status->green.mode = QNAP_MCU_STATUS_LED_OFF;
> +	status->green.cdev.name = "green:status";
> +	status->green.cdev.brightness_set_blocking = qnap_mcu_status_led_set;
> +	status->green.cdev.blink_set = qnap_mcu_status_led_blink_set;
> +	status->green.cdev.brightness = 0;
> +	status->green.cdev.max_brightness = 1;
> +
> +	ret = devm_led_classdev_register(dev, &status->red.cdev);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_led_classdev_register(dev, &status->green.cdev);
> +	if (ret)
> +		return ret;
> +
> +	return qnap_mcu_status_led_update(status->mcu, status);
> +}
> +
>  static int qnap_mcu_leds_probe(struct platform_device *pdev)
>  {
>  	struct qnap_mcu *mcu = dev_get_drvdata(pdev->dev.parent);
> @@ -210,6 +361,11 @@ static int qnap_mcu_leds_probe(struct platform_device *pdev)
>  					"failed to register USB LED\n");
>  	}
>  
> +	ret = qnap_mcu_register_status_leds(&pdev->dev, mcu);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to register status LED\n");
> +
>  	return 0;
>  }
>  
> -- 
> 2.47.2
> 

-- 
Lee Jones [李琼斯]

