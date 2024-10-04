Return-Path: <linux-leds+bounces-2960-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6EF990910
	for <lists+linux-leds@lfdr.de>; Fri,  4 Oct 2024 18:24:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFE081F26026
	for <lists+linux-leds@lfdr.de>; Fri,  4 Oct 2024 16:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E2B1C7605;
	Fri,  4 Oct 2024 16:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="QoHYM4gE"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDF61C75E7
	for <linux-leds@vger.kernel.org>; Fri,  4 Oct 2024 16:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728059052; cv=none; b=QnBjHLKaICKrWRorDiEKHoU1cgx7Ke0nxQv3Lr67VmcK1sydanbj9AxCRg6sMnZNsCOPXjN7qFUvFMBsAPjG3JzpR1GgyMgIcBEdvBLSmm//dbdvXHybK+TJKKH6+Db01/SlTmnN9mzMsuBhJLL2TFVNOuuMwOu+NDbi4PYzXj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728059052; c=relaxed/simple;
	bh=U89XKKhWNLceS92IzuDm96eSA+99ZZSx1p4clLScQ6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l/E1UcMDSRK/P4VH7336otu5wqMC5KoQscmqhmtN0atcBaL1M76oZ9AwvRtMpURJtEW5ABHdG+tYvY9N5yL9LRqRbgKwIxalg05m7WtD/zIWjmbT9yR2vMQmTcH58WFiELBY7/8QTk3uOkT4pN9KXil1QE0e0Cyb2AteBUsJarg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=QoHYM4gE; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7d4f85766f0so1864386a12.2
        for <linux-leds@vger.kernel.org>; Fri, 04 Oct 2024 09:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1728059050; x=1728663850; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jIMwjEJw/ikpK9ZVyaPZ5E0H8VxfdwxYvC2pAveMl2A=;
        b=QoHYM4gEfyCPnZUWWLQlrTk1q5aj1GRssKHjxAM1NfARlCZ1hQ+7CZBHLDOn9Mkx/L
         vM55pTY0bJ0L6UWXxh/CvBpYNd4nwW9PUp0yJgGupOdMIFwi1GUCWVi8YxI29bXp6u+l
         QofGDeYmjiybtkFb4RVaCWsRuBWQwFd3udoyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728059050; x=1728663850;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIMwjEJw/ikpK9ZVyaPZ5E0H8VxfdwxYvC2pAveMl2A=;
        b=rV14RwHgppvqNXLgAOPhjZeloQGrTQqeJQ24xwsgrBNbNK5o7pgKxQOSaRu0ytolsU
         ZBm1Gi1E05t9S41Ag2N9SNb/3XMN2KwTZ3JJQ4AIFGlShQ2z81mSSTEqC5Zk6O8HuID6
         djiQwL3e7+7YuJ0wEFhwEMvS5du4h2XXEAk2vI41fGyCok3JsVrtxsFdR+64+uYXvlPk
         nssTuyPT9FYbpWuaY9seRiTmiCV9T0q0BWz9qh+h1Uixy6TjCYu9aUr6731R+koxwTY4
         KixC8lO6yMxEp39tcrD7pFccj2M5GkOZaGWmpSSCgj9ai3df9W5Mr4m3PV6sjoo6FgwD
         +gZQ==
X-Gm-Message-State: AOJu0YwO+dhvX6QZFxNDO0oATrbYRjpsFBTH2T34jU7a8EnJrdcOHTfv
	t30wN3JKU6a7wcw2MRU9YecmOu+ij1Dlzdu53cktKxfIoLj8pFQvoFtilfmJaw==
X-Google-Smtp-Source: AGHT+IGOOMkk8236W0K5/KrlTGeauIop1R5SOTFpNXvObWJPqjq8+lFH+3rAs/q2GOQM0y3YlvsYJA==
X-Received: by 2002:a05:6a21:1584:b0:1cf:6c64:fb00 with SMTP id adf61e73a8af0-1d6dfa41704mr5171703637.19.1728059049884;
        Fri, 04 Oct 2024 09:24:09 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0cd1503sm41678b3a.54.2024.10.04.09.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 09:24:09 -0700 (PDT)
Message-ID: <81b382d9-c290-40b9-be3a-916970a5797f@broadcom.com>
Date: Fri, 4 Oct 2024 09:24:07 -0700
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] leds: bcm63138: Add some register defines
To: Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, William Zhang <william.zhang@broadcom.com>,
 Anand Gore <anand.gore@broadcom.com>, Kursad Oney
 <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org
References: <20241004-bcm63138-leds-v3-0-ba99a8e464b9@linaro.org>
 <20241004-bcm63138-leds-v3-4-ba99a8e464b9@linaro.org>
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
In-Reply-To: <20241004-bcm63138-leds-v3-4-ba99a8e464b9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/4/24 00:59, Linus Walleij wrote:
> The Power LUT (Look-up Table) register base was missing, also
> add the bit define for sending serial LED data in reverse order,
> and use the BIT() macro to define the bits in the control
> register.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   drivers/leds/blink/leds-bcm63138.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/blink/leds-bcm63138.c b/drivers/leds/blink/leds-bcm63138.c
> index 9fe1af156c80..190d9774164b 100644
> --- a/drivers/leds/blink/leds-bcm63138.c
> +++ b/drivers/leds/blink/leds-bcm63138.c
> @@ -21,8 +21,9 @@
>   #define BCM63138_LEDS_PER_REG				(32 / BCM63138_LED_BITS)	/* 8 */
>   
>   #define BCM63138_GLB_CTRL				0x00
> -#define  BCM63138_GLB_CTRL_SERIAL_LED_DATA_PPOL		0x00000002
> -#define  BCM63138_GLB_CTRL_SERIAL_LED_EN_POL		0x00000008
> +#define  BCM63138_GLB_CTRL_SERIAL_LED_DATA_PPOL		BIT(1)

Want to add:

#define BCM63138_GLB_CTRL_SERIAL_LED_CLK_POL	BIT(2)

while at it?

> +#define  BCM63138_GLB_CTRL_SERIAL_LED_EN_POL		BIT(3)
> +#define  BCM63138_GLB_CTRL_SERIAL_LED_MSB_FIRST		BIT(4)
>   #define BCM63138_MASK					0x04
>   #define BCM63138_HW_LED_EN				0x08
>   #define BCM63138_SERIAL_LED_SHIFT_SEL			0x0c
> @@ -35,6 +36,7 @@
>   #define BCM63138_BRIGHT_CTRL3				0x28
>   #define BCM63138_BRIGHT_CTRL4				0x2c
>   #define BCM63138_POWER_LED_CFG				0x30
> +#define BCM63138_POWER_LUT				0x34 /* -> b0 */

Maybe BCM63138_POWER_LUT_BASE0, because it is an array on some chips, 
like 63138 and at offset 0x74 we have BCM63138_POWER_LUT_BASE1.
-- 
Florian

