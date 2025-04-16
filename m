Return-Path: <linux-leds+bounces-4491-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B4EA8B6A6
	for <lists+linux-leds@lfdr.de>; Wed, 16 Apr 2025 12:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E0253AA3CE
	for <lists+linux-leds@lfdr.de>; Wed, 16 Apr 2025 10:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9291E2459EA;
	Wed, 16 Apr 2025 10:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aHtvcH58"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B43221567;
	Wed, 16 Apr 2025 10:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744798881; cv=none; b=dFw619/hj9tGmwL0RiyBPELfZP5koW0FwalJWcjXsfaZ2yR2x1COU6yVD249/rze+E4wqiNGb+7RtcfUrP9ixgZIRR6rt9sRpeIa3ffoHktg04HOW8DlLdhCpAi1bM+iaWV/06G6gRm37Xn5zkUwOeJ3Wmaexp7nOgSSxWQtorA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744798881; c=relaxed/simple;
	bh=yK74k5RUMx7O8nw5wi5mKDUdSdxQ1r0xVixydioGZCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XWjpbNwMRDbMIObDXLEA8S3PSfqEQGXz2vRhTdDYXChqheUJbKeWNC4wIQ5lsA7+S1mvYMt3T7MmVLWwh/Eg2BV4zNhf1BY7+uul3+8eH9BpkKAfWVSFI/nHyxPhVQewj7uU6vV565yLtCiF3tEa4xKzu/csxSR8kG/8QrROS7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aHtvcH58; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2156BC4CEE2;
	Wed, 16 Apr 2025 10:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744798879;
	bh=yK74k5RUMx7O8nw5wi5mKDUdSdxQ1r0xVixydioGZCQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aHtvcH58Fvm8PkQ8fZU4apWjR5AVGQSBBXdXMXJtEgELsLWu61qJK1Y9HLCDcMrHg
	 iYfgBDcFhDPxearM+xDc1qSbr0FvIErArMw1RztS35lMF1Xa3tfPwqDqIUO0Zop0a6
	 GjBzM8YNG7xrLI9M1RKQztW+eWX0HCKVDUYddF4laxMRGhWufZRU1bUc7zsIT5JKyI
	 LfIMIT+W7IDeN074gXxmWDcNYRf9CNjNZHCu9ScB4uoZQE3QjOtHTd/4HmXZY8AEhQ
	 Gjd5RunpMUSdFfA8g/F5JtC+f8UngVo6ZVwa7dFeHa58zv82LqG0w6Cwz0HqJcBjmN
	 HaLaeqUWdb5sA==
Message-ID: <74ce031c-dcae-4fcb-9598-73ce37e3ee99@kernel.org>
Date: Wed, 16 Apr 2025 12:21:14 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: leds: add binding for WL-ICLED
To: Ante Knezic <ante.knezic@helmholz.de>
Cc: conor+dt@kernel.org, corbet@lwn.net, devicetree@vger.kernel.org,
 knezic@helmholz.com, krzk+dt@kernel.org, lee@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, pavel@kernel.org, robh@kernel.org
References: <20250415-dashing-impartial-baboon-70d086@shite>
 <20250416090645.11123-1-ante.knezic@helmholz.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250416090645.11123-1-ante.knezic@helmholz.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/04/2025 11:06, Ante Knezic wrote:
> On Tue, Apr 15, 2025 Krzysztof Kozlowski wrote:
>>>  1 file changed, 88 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-wl-icled.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/leds-wl-icled.yaml b/Documentation/devicetree/bindings/leds/leds-wl-icled.yaml
>>> new file mode 100644
>>> index 000000000000..bf79c7a1719b
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/leds/leds-wl-icled.yaml
>>> @@ -0,0 +1,88 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/leds/leds-wl-icled.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: LED driver for WL-ICLEDs from Wurth Elektronik.
>>
>> driver as Linux driver? Then drop and describe hardware.
> Sorry, I am not sure I quite understand what you mean here? Add "linux LED driver" to
> title?

I am asking to drop it and instead describe the hardware.

> 
>> Also drop full stop
> Ok, understood.
> 
>>> +
>>> +maintainers:
>>> +  - Ante Knezic <ante.knezic@helmholz.de>
>>> +
>>> +description: |
>>> +  The WL-ICLEDs are RGB LEDs with integrated controller that can be
>>> +  daisy-chained to arbitrary number of LEDs. Communication with LEDs is
>>> +  via SPI interface and can be single or two wire, depending on the model.
>>> +  For more product information please see the link below:
>>> +  https://www.we-online.com/en/components/products/WL-ICLED
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - we,1315x246
>>> +      - we,1315x002
>>> +      - we,131x000
>>> +      - we,131161x
>>> +      - we,131212x
>>
>> Is that a wildcard in each compatible?
> Unfortunatelly, yes. Exact model names are quite elaborate, yet similar enough:
> 1315050930246   --> we,1315x246
> 1315050930002   --> we,1315x002
> 1313210530000   --> we,131x000
> 1312020030000       we,131x000
> 1311610030140   --> we,131161x
> 1312121320437   --> we,131212x
> 
> This seemed easier than writing complete model number... You want compatible
> expanded to full number anyway?

Yes, otherwise git grep for model won't work.


Best regards,
Krzysztof

