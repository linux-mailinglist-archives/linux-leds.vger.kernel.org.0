Return-Path: <linux-leds+bounces-1339-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC0A88A9F8
	for <lists+linux-leds@lfdr.de>; Mon, 25 Mar 2024 17:48:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 205422C5935
	for <lists+linux-leds@lfdr.de>; Mon, 25 Mar 2024 16:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B25953DABE0;
	Mon, 25 Mar 2024 15:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D73VHD12"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16FE524B1
	for <linux-leds@vger.kernel.org>; Mon, 25 Mar 2024 15:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711378980; cv=none; b=JnFgUfyDJyKSFnMwgi6vhTwP15hCIqa8aIqE4bledoz6USvBwquLLDe8OPCLzXs29tAbgEptfk1bBzLwzaeCmqVMLIgrTxX3LBZS5mi35PVUpwkihsDAAZ2HbiG2YnyYHVAjdp4tV+OnUsEr87BaLIKqVD2cq9fs7JRSKgtWPdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711378980; c=relaxed/simple;
	bh=3dXPudPDiikRoCmhjxwcnF2sBV5x9RGjFXzLDmPO4wQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NlhsjnjA9RYc0Ohlm9GTHQdJSdzJvJfReYNEP99XtfWjqjQXEskOz8z/ZViI51lpbTsr/lbknmJEdN6cYi2cWdUmVMEYaJ2xLOptAN+SONf2P0rmZ1lVsEcBVJTgMz+cZpnHgeC/w03L2cpMX+tlzss0mBAQpDPWdlsl+hebV4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D73VHD12; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711378977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ymuBJTSOSA/JwVj1Mt7QO1lgQl0vxdz5zB3wolFGHyo=;
	b=D73VHD12gMT7sMrMUHC3Em/pzGttDhqbvXLIMQ7k0wi7Y1PJK7CGFZ3qXPeP2W4ntf/15s
	kCfjm9lfejom8n2ikfWeL14g9VZcXr1kusT5pAUIiTP8oLudCH1DNO2q6X/+gIZ6zW4yck
	xGvnebGi/hnI+9tTK0IyNX9mA0osbzw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-eT6DA1WjNoe1QQXfkc3eYA-1; Mon, 25 Mar 2024 11:02:56 -0400
X-MC-Unique: eT6DA1WjNoe1QQXfkc3eYA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a469d3547c7so422425866b.0
        for <linux-leds@vger.kernel.org>; Mon, 25 Mar 2024 08:02:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711378975; x=1711983775;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ymuBJTSOSA/JwVj1Mt7QO1lgQl0vxdz5zB3wolFGHyo=;
        b=UI4/oW8SFo4rInROc/8PzasYX5NE2oedhzZARlS+yn+pjdxwYAuxMJA0DXSoO5MrUP
         cj3coPCyTSWft6kD1CciZJgAizFVOQKVGrR2FkJswI5svDlplf7yhhCjsUdJnXFMFS4E
         cIuYYHdLSOjKgxCEvnHX95xuH3bqAvV5ZcU7BucEsAGpkKSYg61koBQGY6EuP9SAgHO/
         TGC93zDo400CxSFqYULHupX1DTDJUm3ZiAqJdw3bdBhcGsmpg1vu21iatSmtVDGC8BBz
         S/oUSH2wdT+Pk37uv74/D+RsNovB3Rt4S3I0jdNkP1rBX9OpIVuXDhbEPg+8kRI2aajh
         QaHg==
X-Forwarded-Encrypted: i=1; AJvYcCXVx+MId+8UHYbuLS3vOu0FIG8nUUclKln3fPDMIFzFH0G3sz7dlp7OzrwNvj0pcLqk84h9aIZ6piyF59Z78d9oHwr4K1jJHRE+bg==
X-Gm-Message-State: AOJu0Yxjpc1OLmeY8EBvETuoiNufuuY8elbdj0D44/C4LkYKYAj/kQml
	rYxobHB2i3IEvildI19AJW1jNI4YU54uxnuUww+NDfHYZKpT2v8ymyn+qJN9+IXeQbAKPBwtUZY
	SAQPQZ7kRcWgFyOFp4EI6rX/smRB3ieGa6D3bVa+KNyBsVsDkRrksVBYl5Qg=
X-Received: by 2002:a17:906:6b83:b0:a46:9be4:6037 with SMTP id l3-20020a1709066b8300b00a469be46037mr5199797ejr.30.1711378975237;
        Mon, 25 Mar 2024 08:02:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRliyMh0OVVZZMKE0TcTP2JC+IOgLryOmuAHHv4q8iPu/gRjj/ho94j8IwW1MhFqK5TMgD7g==
X-Received: by 2002:a17:906:6b83:b0:a46:9be4:6037 with SMTP id l3-20020a1709066b8300b00a469be46037mr5199776ejr.30.1711378974884;
        Mon, 25 Mar 2024 08:02:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id i8-20020a17090671c800b00a46d4e26301sm3117038ejk.27.2024.03.25.08.02.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 08:02:54 -0700 (PDT)
Message-ID: <bb7536be-9bed-4557-b111-6409ebfe48f4@redhat.com>
Date: Mon, 25 Mar 2024 16:02:54 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] platform: x86-android-tablets: other: Add swnode
 for Xiaomi pad2 indicator LED
Content-Language: en-US, nl
To: Kate Hsuan <hpa@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 linux-pm@vger.kernel.org
References: <20240322033736.9344-1-hpa@redhat.com>
 <20240322033736.9344-2-hpa@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240322033736.9344-2-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Kate,

On 3/22/24 4:37 AM, Kate Hsuan wrote:
> There is a KTD2026 LED controller to manage the indicator LED for Xiaomi
> pad2. The ACPI for it is not properly made so the kernel can't get
> a correct description of it.
> 
> This work add a description for this RGB LED controller and also set a
> trigger to indicate the chaging event (bq27520-0-charging). When it is
> charging, the indicator LED will be turn on.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I will also merge [PATCH v5 6/6] platform: x86-android-tablets:
others: Set the LED trigger to charging_red_full_green for Xiaomi pad2"

Once the new power_supply trigger patch this relies on has been
accepted.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
>  .../platform/x86/x86-android-tablets/other.c  | 82 +++++++++++++++++++
>  .../x86/x86-android-tablets/shared-psy-info.h |  2 +
>  2 files changed, 84 insertions(+)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
> index bc6bbf7ec6ea..1012a158f7b7 100644
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
> + * with three subnodes for each color (B/G/R). The RGB LED node is named
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


