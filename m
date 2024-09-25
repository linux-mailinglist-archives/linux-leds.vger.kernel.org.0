Return-Path: <linux-leds+bounces-2807-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7C09865E8
	for <lists+linux-leds@lfdr.de>; Wed, 25 Sep 2024 19:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4590FB20FB5
	for <lists+linux-leds@lfdr.de>; Wed, 25 Sep 2024 17:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A22E54962B;
	Wed, 25 Sep 2024 17:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="iBWy2gQ0"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08568208CA
	for <linux-leds@vger.kernel.org>; Wed, 25 Sep 2024 17:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727286391; cv=none; b=f6Ho1x4PbmdsJJiiznKVy7l4KAfvJYw8kxPY09vK2YxRvLCjJp6lZm7VmEm5ZomdambTCaatetvwMWkfV0KUaen6TyzbHlr5F0YjeDGXGkZhBlca4hZ0i8eghUlUeMWKoyl9ItBzUb8Zatlg04z4aaMpLG7kzHVeXXpHlxCIVNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727286391; c=relaxed/simple;
	bh=gMEl6pzrfSp8jdlDkNXOpbbAFlsFDAEvsowOZVPdYhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g1uTBcyuVFsp0/Vn111sw09dDBCON0rMs6eALcC/9XMofBSiLrWwJ8X0HEgG1Ste+gQkyQpF880tFGOVxqu4H6njWFxEAsOHcQtTYADYqQXoR8F3Rhj6Rdxgo/hQeHydMXwfFl5/gIxwhuuLJIiK9BqTfPz9Dm5E5z85+bRFuTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=iBWy2gQ0; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7a9ab8e5f96so8897485a.1
        for <linux-leds@vger.kernel.org>; Wed, 25 Sep 2024 10:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1727286389; x=1727891189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JJuGncUKRZJkjHqAsChwHvRwF41TEs9tsShUnDpkD1Q=;
        b=iBWy2gQ0DpMpzoAprkzVGxY+MC7mLKFoHahDyA+WXV5jJx6gI1B04Y1fYdAkfcv8Vb
         BrFwuZ8UY8/qXzOMzdOJh552Nf47UBLdp4F7AePwECziXQl0wV5c4bBUnWHm4pS/X86p
         qMkOmvC9/RS/QlZ7jaTYrFK5OnGd30UpzOhyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727286389; x=1727891189;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJuGncUKRZJkjHqAsChwHvRwF41TEs9tsShUnDpkD1Q=;
        b=bOvKZHttn9zeOSh95KHV2/6wCyPz4ssxzAHQCvyEc9QUgnMOZC0TRtntI/hV9TbIRY
         PRs1xulwoUmIdZRXAYHQTBMOsfPmvZWA5wOV0BbGAcpcs3glxyZ4JY0C0MslmOKv7A4a
         wnPSD8fSG1roBOWw5o7/vCzAH0/dfhb71uVrh7mXdpMj+xhZfi4hgx4/UI22KEZ4T/yi
         7JQp6ePtVN/6xd4DhKUe8OdvsF6Hwh6YO4ZGDT5xSCTfQkFuAiEmAcxhdMqtzh+YrDqB
         OMeusloUHau/fSG2wHmc64+/BhW4RIHBhHhUHecmM/t+iPcdl9oPgWtTSbHe2fKX+6Sx
         QFsw==
X-Gm-Message-State: AOJu0YxBxxWakGsNzm8ymKATKPLojnnN3PybmheFpIcfEf+3+nML1bsZ
	2Pa/uxCPK00QDwXUbLjFOExFAA1EE0UaZa0WkYTau7WSz0Qq1zlbTmlnHdppmQ==
X-Google-Smtp-Source: AGHT+IHox+VvpBePbD2s+aflgBVXVX+hvpsnwocRl3v6DXU+QlF2x0zZUTBA0C/nhUWnQZzJ7hMKGw==
X-Received: by 2002:ac8:5914:0:b0:458:fb8:9dc3 with SMTP id d75a77b69052e-45b5def1dadmr41209861cf.25.1727286388749;
        Wed, 25 Sep 2024 10:46:28 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b5268af96sm17977171cf.83.2024.09.25.10.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2024 10:46:27 -0700 (PDT)
Message-ID: <b622c4ec-53ca-4d40-bb1a-01346fb9e44a@broadcom.com>
Date: Wed, 25 Sep 2024 10:46:24 -0700
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] leds: bcm63128: Handle shift register config
To: Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, William Zhang <william.zhang@broadcom.com>,
 Anand Gore <anand.gore@broadcom.com>, Kursad Oney
 <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org
References: <20240920-bcm63138-leds-v1-0-c150871324a0@linaro.org>
 <20240920-bcm63138-leds-v1-3-c150871324a0@linaro.org>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20240920-bcm63138-leds-v1-3-c150871324a0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/20/24 14:59, Linus Walleij wrote:
> This adds code to optionally read the width of the shift register
> chain from the device tree and use it to set up the register
> controlling the shifter hardware.
> 
> If the property is not present, the boot-time default is used so
> existing device trees keep working as this is what they assume.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   drivers/leds/blink/leds-bcm63138.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/leds/blink/leds-bcm63138.c b/drivers/leds/blink/leds-bcm63138.c
> index 374f68f4f277..bf170a5bb12a 100644
> --- a/drivers/leds/blink/leds-bcm63138.c
> +++ b/drivers/leds/blink/leds-bcm63138.c
> @@ -2,6 +2,7 @@
>   /*
>    * Copyright (C) 2021 Rafał Miłecki <rafal@milecki.pl>
>    */
> +#include <linux/bits.h>
>   #include <linux/cleanup.h>
>   #include <linux/delay.h>
>   #include <linux/io.h>
> @@ -254,6 +255,7 @@ static int bcm63138_leds_probe(struct platform_device *pdev)
>   	struct device_node *np = dev_of_node(&pdev->dev);
>   	struct device *dev = &pdev->dev;
>   	struct bcm63138_leds *leds;
> +	u32 shift_bits;
>   
>   	leds = devm_kzalloc(dev, sizeof(*leds), GFP_KERNEL);
>   	if (!leds)
> @@ -267,6 +269,12 @@ static int bcm63138_leds_probe(struct platform_device *pdev)
>   
>   	spin_lock_init(&leds->lock);
>   
> +	/* If this property is not present, we use boot defaults */
> +	if (!of_property_read_u32(np, "brcm,serial-shift-bits", &shift_bits)) {
> +		bcm63138_leds_write(leds, BCM63138_SERIAL_LED_SHIFT_SEL,
> +				    GENMASK(32 - shift_bits - 1, 0));

In the binding you allow a value of up to 32 for that property, but that 
would lead to 32 - 32 - 1, which would be undefined?
-- 
Florian

