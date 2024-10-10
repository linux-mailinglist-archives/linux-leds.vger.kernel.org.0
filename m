Return-Path: <linux-leds+bounces-3057-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9AD998F29
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 20:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AF9E28B0AE
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 18:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8441C9ECD;
	Thu, 10 Oct 2024 17:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="hVI8tjVW"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED4C1CDA3C
	for <linux-leds@vger.kernel.org>; Thu, 10 Oct 2024 17:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728583183; cv=none; b=k59rGcIPypW+03+aCBVWgL4nK4iHVhJfyfGBQljTkhPK/U/3zETSCiL2oVjjWrnPMSsuig7R6mE5ByxIOmJr++NiImVFdU5xoXoKytVQJo3jEHidulliI8vzXiKPrn9opSrm3aVfi/ynetiCV4/QO4NwbZzq3Qe1M2lUtZmoaAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728583183; c=relaxed/simple;
	bh=yUQHIhd2iZl7f2tKz1HRriOXS1yzjT7bP23GtigXKGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DKObopviHb4wAmdv186HfuEYvXXiT545gXhe1bI58tms1s1rhQnpdPk+Szowx721P6YCqqAp5SvyTUgCBshK0mu/cqKTZN43k+FJLnRcAzLXVzKUl70TB8+URVykee4pllN4bqxBTX/ml0hqTXNH2zZmbjkQG9UwQzWXmwLsO4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=hVI8tjVW; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6cbcc2bd800so11074716d6.0
        for <linux-leds@vger.kernel.org>; Thu, 10 Oct 2024 10:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1728583181; x=1729187981; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bX+ybLPvAPiBSABP9/2JgJ4RnR6od2nj8brQfZJQ3zY=;
        b=hVI8tjVWHkiMl8nvDQnlhqXqBPlQYRIWkrhF4ko7PxgX0bZ1OyjydxB8fp3AEdE5UX
         QMqY+WuopuD31evYDUSUoR3Go9rzOkJ5DGFS9yERKCX8t+xYVCdUaZeH0T4kPpwC2Dbx
         lIiLYTMob9kQX6jbTS7DNtRbmHf2xxydbCiGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728583181; x=1729187981;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bX+ybLPvAPiBSABP9/2JgJ4RnR6od2nj8brQfZJQ3zY=;
        b=rPa1fUxYpDDMyHRdCtVSZY5wdZR2WOsTOpWDZJSaUdUjPhTM2x+apBg4Lx5Id7TDkv
         EExBFz1xKbubH87c8RX4Z++4vzE9bl9G9/TxHj20YI1+a3gpyCHTK724AYzPXFY19JgD
         F/b9qo42yWtN8jP5tmrbcwRf3SeLTAotEJQIn0SN3VLLS3s2LVkfGAUyUIbqdzvtQDhh
         yBhjTrXcrvWHN+VKfRnIe46iKQSxgWfpYKkmyG0P5WhAG1sKIDb+mCU7NBkWpeh95TWp
         01fQ3hUSfbWNYOTbwFnrRoibju/fiAD0sh3HC3ww2gEwvIzfJwOcqaLtML3OqsOrfsD+
         UVYw==
X-Gm-Message-State: AOJu0Yz0/RFaqygWT00ehBSWwLeS4JDh1Qot95Q/q8sunN1OY7FEkwRY
	JEfNE/REfUc5CLGaqnLl62A41JoDWPwl7IBfZQzJBxSXz1enwhBgzqWw8gUpjQ==
X-Google-Smtp-Source: AGHT+IFWoGdQ90iMOEj8r+PU8EOmXYMS//DEbNCz3FjlvMbzPpfspvrsJmrmXbS2McNlYkzZj9NvUw==
X-Received: by 2002:a05:6214:2c12:b0:6c5:944f:ea5a with SMTP id 6a1803df08f44-6cbefabadd8mr185646d6.13.1728583181069;
        Thu, 10 Oct 2024 10:59:41 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cbe8608f79sm7482696d6.75.2024.10.10.10.59.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 10:59:39 -0700 (PDT)
Message-ID: <a2f57c26-c668-42d4-8355-f92d535a7123@broadcom.com>
Date: Thu, 10 Oct 2024 10:59:37 -0700
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: leds: bcm63138: Add shift register
 bits
To: Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, William Zhang <william.zhang@broadcom.com>,
 Anand Gore <anand.gore@broadcom.com>, Kursad Oney
 <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org
References: <20241010-bcm63138-leds-v4-0-cdb80780a555@linaro.org>
 <20241010-bcm63138-leds-v4-1-cdb80780a555@linaro.org>
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
In-Reply-To: <20241010-bcm63138-leds-v4-1-cdb80780a555@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/24 07:10, Linus Walleij wrote:
> The BCM63138 family of serial LED controllers has a register
> where we can set up bits for the shift registers. These are
> the number of rounds the bits need to be shifted before all
> bits have been shifted through the external shift registers.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

