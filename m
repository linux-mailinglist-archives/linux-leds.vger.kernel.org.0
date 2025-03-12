Return-Path: <linux-leds+bounces-4241-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 008ABA5E4A0
	for <lists+linux-leds@lfdr.de>; Wed, 12 Mar 2025 20:40:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAB911898A3C
	for <lists+linux-leds@lfdr.de>; Wed, 12 Mar 2025 19:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39BE92571A4;
	Wed, 12 Mar 2025 19:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LeV7OZCQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2B71E8353
	for <linux-leds@vger.kernel.org>; Wed, 12 Mar 2025 19:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741808443; cv=none; b=aug8UM6VDOpLz2TCpKitGq5ckVX9Ec7PZPz5a2/EoYksAqfNh2pfyQfs/1AGTOFSJYWnz6bWgIUJTfDhV2tSY9qQjFqUE06IOgWy2dquUn4785To70ewcfKVdCYyqiBb4KtlgbuEYQp7XnmqkAJD7bOi0wFFQQpoS5t94TnUs+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741808443; c=relaxed/simple;
	bh=jFvT1ZNraTaBWiyEOX5Goa7CmEPuO/l9AMGMEG1kRCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JJZoqaYFMB0yrf7TUjuKFPNotyBcC5aYqAKS2FvAS9HFMLknpF6KS90IFHGRQsIRn34kD/Ep+5rJuZq9b3oVKCPChS540Cworz1Rgc9o6g3mCSDyvz6NtMpaHJt66Hlr1CDsE/662OeJGNoUB44jGgSvwWlqf7CiS4owodhzHyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LeV7OZCQ; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e5e7fd051bso201742a12.0
        for <linux-leds@vger.kernel.org>; Wed, 12 Mar 2025 12:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741808438; x=1742413238; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pqlExC3chzoryxcLHVCJ2t65bQfhESdCNW8dB3gLDlc=;
        b=LeV7OZCQtdq8t7UyjSWc5AFDNxAkaJHMxoRR1yXFX4N9bUiYkc6zuZHqw5cK7KJ2Je
         lOsnPGQrIe8xCTCFXmFO02a1aNFVGbydd2ENxdNq4D1FiLAWZH39qxs6QbHE1vpnNBFN
         2Uq9xBFHK51B+vik4BD7uPhq7Pu+PF+o6kHFJ23ChaziYwN+K3O8CqhQtA11yYX+9nxh
         lpIcOaUyiGCpWhllJwtLhAKjm9IKKJA2jxUX2zaHLDZWCZmyx+ge3+BOkQF5NfnQhNah
         /+89lXyeld1KaHZjTBOUBIC7ru6oGghNmVQ+sunfsEUTbyt+xltqw6IYfRB3XJrUxzP2
         BxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741808438; x=1742413238;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pqlExC3chzoryxcLHVCJ2t65bQfhESdCNW8dB3gLDlc=;
        b=eBh/pdOE3KVO8YqV6kURQIJ0aFQQkLT7euWBPUcKSzsg7FMFQ5pg8RzbHtYLwzB6V5
         QeKGnVIEMYV0+9oOO2fJFcjt9fwd+cTcPgpdM5p4zcz/EFKuMABCx762FRqC/1EZyTmW
         DpR/GwC5nwSpNSnSMmGWWUBFxZCbVFLXgZB9yUnhzdZovUmIPlfqPZ2o1KXm/wUnCb7H
         5s4b/8PqbRLiN2yYc0qv6wzOsDjTMH1WEcbs8XY1AI4buAZ437oHf/ovlM3BPH7QqBgW
         fpKnBRNPn+Ph0NiK8Oec5XwrjuaoRFu35k9HAMLDehxp82bD+bWbcRzhylrg1XDXo2dH
         u/zw==
X-Forwarded-Encrypted: i=1; AJvYcCXdTy9U+5w67hUrl7Ys8rJ+05RrUJiil/MWcR6UW0iia63GcjkvZpBSGfrhQ7nINfcA0PoP5T0V+myF@vger.kernel.org
X-Gm-Message-State: AOJu0YwC19wTzx8tDdx0fkhJhq9xg3Otnx34Tomn3wKgo7khj69BckrJ
	R9252IuEoRNbxYf0WiyzzGA6jmDQF7anhHtxxwIfHDqAmO5Q9D8Z
X-Gm-Gg: ASbGnctlsYqGM5Q8v/e5fX2KJaFHnb7Tvfm7rsfTj0ahPXAxDPU944CJSoj9FnNXxmy
	X4R2yvZeR8P9wwUYjA312ezFLi/AZDW5Oz/kGfyoIuhIdGFDh0g8YG+ZkkHTJ8czXxtfNT3ughX
	XqUv06npf+geM5EeEcB7r6bWRzBPCYXXbjMjvx3hcrVSvZRzvLC7DQsYVeWHRG1zafPS/EpdU97
	xlbmQrKMZeIeQosTxLMRYp0zf9Ws6JmqFB07HnxRiHSuh9bWa1uMKWjUT2haMlHJZ1ed13I7TrR
	7UUHLNs0nOmJb0eaMRXSKRqVVmZXktR1sSYBhlwNblmFInpj1D0fdWd1jg==
X-Google-Smtp-Source: AGHT+IFGBQNn+EF7zvz5Y+zlTD+6mi+yllCbRriALoOlhsTDhpDKNdS9PP+jtPsJzZ8S6/SoA1DutQ==
X-Received: by 2002:a05:6402:4489:b0:5e7:8848:f567 with SMTP id 4fb4d7f45d1cf-5e78848f991mr10005751a12.20.1741808438267;
        Wed, 12 Mar 2025 12:40:38 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c74a960esm10212650a12.45.2025.03.12.12.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 12:40:37 -0700 (PDT)
Message-ID: <982cd574-d0ca-4ce9-851c-f85d86a9b886@gmail.com>
Date: Wed, 12 Mar 2025 20:40:35 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] leds: led-triggers: Improvements for default trigger
To: Craig McQueen <craig@mcqueen.au>, linux-leds@vger.kernel.org
References: <20250312011136.380647-1-craig@mcqueen.au>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20250312011136.380647-1-craig@mcqueen.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Craig,

Thanks for the update.

On 3/12/25 02:11, Craig McQueen wrote:
> Accept "default" written to sysfs trigger attr.
> If the text "default" is written to the LED's sysfs 'trigger' attr, then
> call led_trigger_set_default() to set the LED to its default trigger.
> 
> If the default trigger is set to "none", then led_trigger_set_default()
> will remove a trigger. This is in contrast to the default trigger being
> unset, in which case led_trigger_set_default() does nothing.
> ---
>   Documentation/ABI/testing/sysfs-class-led |  6 ++++++
>   drivers/leds/led-triggers.c               | 26 ++++++++++++++++++++++-
>   2 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
> index 2e24ac3bd7ef..0313b82644f2 100644
> --- a/Documentation/ABI/testing/sysfs-class-led
> +++ b/Documentation/ABI/testing/sysfs-class-led
> @@ -72,6 +72,12 @@ Description:
>   		/sys/class/leds/<led> once a given trigger is selected. For
>   		their documentation see `sysfs-class-led-trigger-*`.
>   
> +		Writing "none" removes the trigger for this LED.
> +
> +		Writing "default" sets the trigger to the LED's default trigger
> +		(which would often be configured in the device tree for the
> +		hardware).
> +
>   What:		/sys/class/leds/<led>/inverted
>   Date:		January 2011
>   KernelVersion:	2.6.38
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index b2d40f87a5ff..00c898af9969 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -49,11 +49,21 @@ ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
>   		goto unlock;
>   	}
>   
> +	/* Empty string. Do nothing. */
> +	if (sysfs_streq(buf, "")) {
> +		goto unlock;
> +	}
> +

Do we need this? It seems to be the same case as any other arbitrary
string, for which we obviously don't have special handling.

>   	if (sysfs_streq(buf, "none")) {
>   		led_trigger_remove(led_cdev);
>   		goto unlock;
>   	}
>   
> +	if (sysfs_streq(buf, "default")) {
> +		led_trigger_set_default(led_cdev);
> +		goto unlock;
> +	}
> +
>   	down_read(&triggers_list_lock);
>   	list_for_each_entry(trig, &trigger_list, next_trig) {
>   		if (sysfs_streq(buf, trig->name) && trigger_relevant(led_cdev, trig)) {
> @@ -98,6 +108,9 @@ static int led_trigger_format(char *buf, size_t size,
>   	int len = led_trigger_snprintf(buf, size, "%s",
>   				       led_cdev->trigger ? "none" : "[none]");
>   
> +	if (led_cdev->default_trigger && led_cdev->default_trigger[0])
> +		len += led_trigger_snprintf(buf + len, size - len, " default");
> +
>   	list_for_each_entry(trig, &trigger_list, next_trig) {
>   		bool hit;
>   
> @@ -278,9 +291,20 @@ void led_trigger_set_default(struct led_classdev *led_cdev)
>   	struct led_trigger *trig;
>   	bool found = false;
>   
> -	if (!led_cdev->default_trigger)
> +	/* NULL pointer or empty string. Do nothing. */
> +	if (!led_cdev->default_trigger || !led_cdev->default_trigger[0])
>   		return;
>   
> +	/* This case isn't sensible. Do nothing. */
> +	if (!strcmp(led_cdev->default_trigger, "default"))
> +		return;

This is rather validation of the default trigger name obtained from DT,
which, if at all, should be done after parsing DT property in
led_classdev_register_ext(). I'd skip it anyway.

> +	/* Remove trigger. */
> +	if (!strcmp(led_cdev->default_trigger, "none")) {
> +		led_trigger_remove(led_cdev);

This will be handled be led_trigger_set() called from
led_match_default_trigger() below.

> +		return;
> +	}
> +
>   	down_read(&triggers_list_lock);
>   	down_write(&led_cdev->trigger_lock);
>   	list_for_each_entry(trig, &trigger_list, next_trig) {

-- 
Best regards,
Jacek Anaszewski


