Return-Path: <linux-leds+bounces-1502-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 103EE8A9569
	for <lists+linux-leds@lfdr.de>; Thu, 18 Apr 2024 10:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA679281B7A
	for <lists+linux-leds@lfdr.de>; Thu, 18 Apr 2024 08:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3489215AAC2;
	Thu, 18 Apr 2024 08:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hWAcdUwG"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADF215AAB5
	for <linux-leds@vger.kernel.org>; Thu, 18 Apr 2024 08:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713430529; cv=none; b=AtR8WTS/22PRTMsjWN1Yth/1QpYFKfb4Rjfk8EizUUk8TmXle3TXW+LR0gu/picgXg5wFcJCjt32pRGxXefcr0XF3Psj23IQS/OI08MkAAeQjYVnX7f2KBwlc5PlUXGgJbDh0zN1iJVZZHN1VEIqXLGRpU2XdJEdqV8G3MoyBkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713430529; c=relaxed/simple;
	bh=rg1Htv+lB6hxsvVaFwD5Nffj1OIzHqszQvu3GxaKkIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rrgS2eGzfbSwP2zo9nuf2NL6QBWkSAShXkdJM5Gk5LsSKS7qeagfaHkhf/HR8bLmUVWqd3DlxS6UZBXx8J1BsdPlXQaW2PtmnWYlomxc9+08SloTVRS1u+AchU/wCd2knuOkKcwUKbN5jPky7r+NabMxB6UKvRLgMTNxp/t+pJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hWAcdUwG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713430526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a3ijnHOr2lMizZp28dkk/a8tpj5sBpid4ALmXZbWPA8=;
	b=hWAcdUwG5KfDuu41xabzY+J2CbrUK/M/HO9BtcGh3Ow+4cD4QNPDxOLR5rJF0GmZSQeok1
	BTd8MDZG4mZdYtp71UcykwWxfUDdjugKhnpffmJxFJQ4nctb86HBDYKpDdLlkhgvUpkP0M
	OSSyVoOWxL6WkgSxouXLpR3hWCGKrbY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-eJ4-m-0mN4ikcznl87-_QA-1; Thu, 18 Apr 2024 04:55:24 -0400
X-MC-Unique: eJ4-m-0mN4ikcznl87-_QA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a556121c01aso32721966b.2
        for <linux-leds@vger.kernel.org>; Thu, 18 Apr 2024 01:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713430522; x=1714035322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a3ijnHOr2lMizZp28dkk/a8tpj5sBpid4ALmXZbWPA8=;
        b=WCv6HxNJcHlXfg4S5kbYT588QzZuNbif3LMU65/HPeLKXuCU4OnfAl/RwaoCMrmclQ
         VBicNxkSXCQxAsBv0pc4BrUcfd8dVivXqQQ01eSWHeWwLxmxp3+r3GBey+798xUDOiqh
         iO5mfvnvJeI3rAK/2Nf1NZPvg/Q9GqzgAJWxe0uG7ONQNLR7Cc5nsIgrNJ48D9ZOwOS0
         H5Q0Fydxj0SXvKYv2+mgLIOe3HR2Fi0Rdy0WZG+zha0k/OWqBO470JqfFBBPC6AgBa78
         Vnxb770JF5bgW4JTsRMsJRTCtvljBzb6eBx/QkkF/NpLwO/SpDKGX+FAbpyY9AVh2DMk
         4Y3w==
X-Forwarded-Encrypted: i=1; AJvYcCV9/HFcrPrHK90UiqEolpEXYWR6oNBd6wPFDDgpHtycWiexSL8QaOePXUUbHlV8EdasJJiNJNLjCYAMUb1VB1Ms/Hlb+wSEokStew==
X-Gm-Message-State: AOJu0YxfzQJS2X5JMVQ2OV33rjn5oAmmuzYRoCK1yrKA2wqMv5NfofxN
	Sv+9tYicfhsHytr2CaRT5Xkb2UMBrSfXQHUfoBmDSzLpxTiyv8RHO4aMLT59A27hHV5ipprl69A
	cf3gVdgZ5S936GUF4h2iMAdSC7VOAClI5fvtOJNjrJI7ugGExtVM31D9p8ik=
X-Received: by 2002:a17:907:76a9:b0:a55:59e8:b780 with SMTP id jw9-20020a17090776a900b00a5559e8b780mr1277603ejc.4.1713430522283;
        Thu, 18 Apr 2024 01:55:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKfvYq8xxFx0WBymZMPuQA2LKlM895k5PHfbu+ObgkMs+Rqx5cC1+8yukvqXz4+PJX9lUPTw==
X-Received: by 2002:a17:907:76a9:b0:a55:59e8:b780 with SMTP id jw9-20020a17090776a900b00a5559e8b780mr1277588ejc.4.1713430521889;
        Thu, 18 Apr 2024 01:55:21 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id t7-20020a1709066bc700b00a5556cd0fd5sm598453ejs.183.2024.04.18.01.55.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 01:55:21 -0700 (PDT)
Message-ID: <218ad508-88bf-451a-a4cc-8246c3d02535@redhat.com>
Date: Thu, 18 Apr 2024 10:55:20 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] platform: x86-android-tablets: other: Add swnode
 for Xiaomi pad2 indicator LED
To: Kate Hsuan <hpa@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org
References: <20240416053909.256319-1-hpa@redhat.com>
 <20240416053909.256319-2-hpa@redhat.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240416053909.256319-2-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Kate,

On 4/16/24 7:39 AM, Kate Hsuan wrote:
> KTD2026 LED controller manages the indicator LED for Xiaomi pad2. The ACPI
> for it is not properly made so the kernel can't get a correct description.
> 
> This work adds a description for this RGB LED controller and also sets a
> trigger to indicate the changing event (bq27520-0-charging). When it is
> charging, the indicator LED will be turned on.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>

Since this patch is more or less done and since which fwnodes there should
be and with which contents is prescribed by the existing devicetree
bindings which are not being changes I have already merged this patch
into pdx86/for-next:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=for-next&id=fcc6220ddc7e54d8442287273d0cb8c415ada022

So there is no reason to resend this. Please drop this patch from v7
of the patch-set.

Regards,

Hans




> ---
>  .../platform/x86/x86-android-tablets/other.c  | 82 +++++++++++++++++++
>  .../x86/x86-android-tablets/shared-psy-info.h |  2 +
>  2 files changed, 84 insertions(+)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
> index bc6bbf7ec6ea..c77d56454f2d 100644
> --- a/drivers/platform/x86/x86-android-tablets/other.c
> +++ b/drivers/platform/x86/x86-android-tablets/other.c
> @@ -13,6 +13,8 @@
>  #include <linux/input.h>
>  #include <linux/platform_device.h>
>  
> +#include <dt-bindings/leds/common.h>
> +
>  #include "shared-psy-info.h"
>  #include "x86-android-tablets.h"
>  
> @@ -593,6 +595,83 @@ const struct x86_dev_info whitelabel_tm800a550l_info __initconst = {
>  	.gpiod_lookup_tables = whitelabel_tm800a550l_gpios,
>  };
>  
> +/*
> + * The fwnode for ktd2026 on Xaomi pad2. It composed of a RGB LED node
> + * with three subnodes for each color. The RGB LED node is named
> + * "multi-led" to align with the name in the device tree.
> + */
> +
> +/* main fwnode for ktd2026 */
> +static const struct software_node ktd2026_node = {
> +	.name = "ktd2026"
> +};
> +
> +static const struct property_entry ktd2026_rgb_led_props[] = {
> +	PROPERTY_ENTRY_U32("reg", 0),
> +	PROPERTY_ENTRY_U32("color", LED_COLOR_ID_RGB),
> +	PROPERTY_ENTRY_STRING("function", "indicator"),
> +	PROPERTY_ENTRY_STRING("linux,default-trigger", "bq27520-0-charging"),
> +	{ }
> +};
> +
> +static const struct software_node ktd2026_rgb_led_node = {
> +	.name = "multi-led",
> +	.properties = ktd2026_rgb_led_props,
> +	.parent = &ktd2026_node,
> +};
> +
> +static const struct property_entry ktd2026_blue_led_props[] = {
> +	PROPERTY_ENTRY_U32("reg", 0),
> +	PROPERTY_ENTRY_U32("color", LED_COLOR_ID_BLUE),
> +	{ }
> +};
> +
> +static const struct software_node ktd2026_blue_led_node = {
> +	.properties = ktd2026_blue_led_props,
> +	.parent = &ktd2026_rgb_led_node,
> +};
> +
> +static const struct property_entry ktd2026_green_led_props[] = {
> +	PROPERTY_ENTRY_U32("reg", 1),
> +	PROPERTY_ENTRY_U32("color", LED_COLOR_ID_GREEN),
> +	{ }
> +};
> +
> +static const struct software_node ktd2026_green_led_node = {
> +	.properties = ktd2026_green_led_props,
> +	.parent = &ktd2026_rgb_led_node,
> +};
> +
> +static const struct property_entry ktd2026_red_led_props[] = {
> +	PROPERTY_ENTRY_U32("reg", 2),
> +	PROPERTY_ENTRY_U32("color", LED_COLOR_ID_RED),
> +	{ }
> +};
> +
> +static const struct software_node ktd2026_red_led_node = {
> +	.properties = ktd2026_red_led_props,
> +	.parent = &ktd2026_rgb_led_node,
> +};
> +
> +static const struct software_node *ktd2026_node_group[] = {
> +	&ktd2026_node,
> +	&ktd2026_rgb_led_node,
> +	&ktd2026_green_led_node,
> +	&ktd2026_blue_led_node,
> +	&ktd2026_red_led_node,
> +	NULL
> +};
> +
> +static int __init xiaomi_mipad2_init(void)
> +{
> +	return software_node_register_node_group(ktd2026_node_group);
> +}
> +
> +static void xiaomi_mipad2_exit(void)
> +{
> +	software_node_unregister_node_group(ktd2026_node_group);
> +}
> +
>  /*
>   * If the EFI bootloader is not Xiaomi's own signed Android loader, then the
>   * Xiaomi Mi Pad 2 X86 tablet sets OSID in the DSDT to 1 (Windows), causing
> @@ -616,6 +695,7 @@ static const struct x86_i2c_client_info xiaomi_mipad2_i2c_clients[] __initconst
>  			.type = "ktd2026",
>  			.addr = 0x30,
>  			.dev_name = "ktd2026",
> +			.swnode = &ktd2026_node,
>  		},
>  		.adapter_path = "\\_SB_.PCI0.I2C3",
>  	},
> @@ -624,4 +704,6 @@ static const struct x86_i2c_client_info xiaomi_mipad2_i2c_clients[] __initconst
>  const struct x86_dev_info xiaomi_mipad2_info __initconst = {
>  	.i2c_client_info = xiaomi_mipad2_i2c_clients,
>  	.i2c_client_count = ARRAY_SIZE(xiaomi_mipad2_i2c_clients),
> +	.init = xiaomi_mipad2_init,
> +	.exit = xiaomi_mipad2_exit,
>  };
> diff --git a/drivers/platform/x86/x86-android-tablets/shared-psy-info.h b/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
> index c2d2968cddc2..8c33ec47ee12 100644
> --- a/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
> +++ b/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
> @@ -29,4 +29,6 @@ extern const char * const bq24190_modules[];
>  extern const struct platform_device_info int3496_pdevs[];
>  extern struct gpiod_lookup_table int3496_reference_gpios;
>  
> +extern const struct software_node ktd2026_leds_node;
> +
>  #endif


