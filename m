Return-Path: <linux-leds+bounces-8376-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAuINNaLGWosxggAu9opvQ
	(envelope-from <linux-leds+bounces-8376-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 14:51:34 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E196027BE
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 14:51:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F3023025A68
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 12:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A6C248881;
	Fri, 29 May 2026 12:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yU8MOVZw"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AF326B0A9
	for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 12:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780059047; cv=none; b=ek/R/egVFZLpI782zSjcRnoG67+cguR48UHuT5COslZbx6J1QstJQG+MT/WV3rWxOxQNfa4vCovk5YZvymOFLF+el3MG5EcjUgRxqn0xt+fnjuxdReZtcQTD7dByLdWPJHZLNeNwlEuji0KoPtY9pQ2Ev7TYIFDZdNeEvBgZoug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780059047; c=relaxed/simple;
	bh=kjmAeA0WIYxplZf0lI6NSpHtYD/nF1xj0SWbgmpaoTo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=igQS/bwPDpta3hTvFKZnd9Ydr+W7A6i00h3x9nv3FTO123DhPbNIEWjrUW+c4FK5P+Vlq1rEZw82ECFttpD4v/rhqthp65KzJead/CNtzteTRcuPr4MtawdhaOFwNkvV61Rx7BtJpf7RJmYR8moIaHSY9DmxLkwNgovo0LWV1N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yU8MOVZw; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45ef1629ff4so522314f8f.0
        for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 05:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780059045; x=1780663845; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gsdtKyBNIze1lqIATJulyFXg8jvRauNrlgVPkVHHWJU=;
        b=yU8MOVZwMaziJbTMGR6wkbcLLdAU+qRbrZGUUUAu23VSVV6JSNt+iZRrkeHuY1jkqu
         /NZQQt7hTAf3L8om0YINQGKroGR8TAhxuSFeEdpa3TRgswYyN0g45DdtcwPIULa/rlkd
         sDpfQzj1Wy7aPBzoVvOysiB15y2xY+Z/w3U4NFx+5lFVI6If3jQactlEvz8+dGnVdpne
         gMRVQdgstt+jfZUc7us5MjHgLgGYFc7f9vPQMGIbytYsPykAneNeN/6hPysl0BE4yGOS
         WC/o5nNzq4i+NXN8bdEEBMrn/ScQi9cQni6IOix70WneLyvLTbGCpDlKMh1CbNuxbhG9
         2dPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780059045; x=1780663845;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsdtKyBNIze1lqIATJulyFXg8jvRauNrlgVPkVHHWJU=;
        b=XrCsWLaiDiYb0JkrZ7LUh2LWvQaTNdvjSAlkau01QDAd1juJEd/5CjfFxMl6UIJ4Yp
         RnGw+ekp759XR6PHomtZBVIY8wWEdkOyzMPHTiUnx3iKiQ7vCfVHueCx1e8JY/AWG3//
         gLHk4WkjrJ9obpNP6SPb6R7PIsCpNPngRZQsfNGWrpdSzXJp/3m6Tkzv/I/xWQejAHIe
         owC4/w36+DDtQnSyw26H+Z4pB4xYwX/5Mco1xHfR+EeAPkniWKTpHkGgWHuEKvLpcmCz
         QZdKmpgZpYIJbXsHaaa0oBDWcJ9j4pB3nmQbkZmFTL/G32rYhi6m7AguZnxLspoa5TDC
         R6aQ==
X-Forwarded-Encrypted: i=1; AFNElJ8hM7W46Hvn/d379civ+twYxAW0bpO6DBXOd1+2pvFQtCgRQYbY7+CPJ3Mvf1kTRPQW8/Y039o053kg@vger.kernel.org
X-Gm-Message-State: AOJu0YyUJMa3dQ+tzWuusaRxnpBO0Emk6msRV90HU9q5X45mAGtdLmQx
	0MMf9zPoJVW0QQN5PwNZU2T37xP/gzp4DmRr9Icmts/3oMpwWwvJyGeXJ7vccPlsATE=
X-Gm-Gg: Acq92OFBBdyKuW5DVDJ7uwVgiEnKCXWlrENQw4spuhr1H0ox2P0FwSK2EIeLHVC3FuP
	3ioX2N5W2WzqNp6LTmEagjJJW42TBKy3BtJcrYeuqpuJCf1sIjhk3u1sWR7PUe00NX34NFxKeRc
	gmXr/tYCJPqn8DU56aUtUvp1e8Ze0sW470hPu/28E8Gc+np5q//XZmSbYwfliT9Zoi2AREcF4Ah
	x47wF5Y9Fm8q9JxwH4aVrzK3tEql3hd1RVawgE/1+mlImzm22lR4mbTY07+6t5my0sa4b4KhPRO
	cYpa9vQzdaGbKTEMvyAiTSvg8aDenSy+SS1nQqJtJksoVZyq2e0aM7xbh7CHxsfZWpwml8wuw8u
	ANLJtAk0J9clNyB+P9EcN3J+m1BmNIWH9ir2A7OUdAgONtPuTB5G1vXJPUcCSxe51c5c0yMI9Yy
	wVYrlV+zEULCYxZkpa9k3uG0Sx1/Z84ZJKUf42p/AApagbNu4tH4q92fhFhSNDlhDrO5XfwGtfr
	kgjkS0Hkeib9Jh5Vf0+XXcZ6DpG
X-Received: by 2002:a5d:5d0c:0:b0:45e:e1a4:c4c3 with SMTP id ffacd0b85a97d-45ef1403b76mr5200312f8f.15.1780059044315;
        Fri, 29 May 2026 05:50:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:b6d0:a628:be51:f552? ([2a01:e0a:106d:1080:b6d0:a628:be51:f552])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354b5bdsm3169110f8f.21.2026.05.29.05.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 05:50:43 -0700 (PDT)
Message-ID: <4001cf6a-b7de-4933-96bc-c9b4ccb53e4d@linaro.org>
Date: Fri, 29 May 2026 14:50:43 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: backlight: document the SY7758
 6-channel High Efficiency LED Driver
To: Daniel Thompson <danielt@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, KancyJoe <kancy2333@outlook.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260519-topic-sm8650-ayaneo-pocket-s2-sy7758-v3-0-ec8194bbc885@linaro.org>
 <20260519-topic-sm8650-ayaneo-pocket-s2-sy7758-v3-1-ec8194bbc885@linaro.org>
 <ahllT_HVTAJ5MbkS@aspen.lan>
 <e3c99fe3-9279-4dfa-af69-d9366ab06837@linaro.org>
 <ahlr5PnX5O0tEd6G@aspen.lan>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <ahlr5PnX5O0tEd6G@aspen.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gmx.de,lists.freedesktop.org,vger.kernel.org,outlook.com,oss.qualcomm.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8376-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:replyto,linaro.org:email,linaro.org:mid,linaro.org:dkim,devicetree.org:url];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 51E196027BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/29/26 12:35, Daniel Thompson wrote:
> On Fri, May 29, 2026 at 12:16:07PM +0200, Neil Armstrong wrote:
>> On 5/29/26 12:07, Daniel Thompson wrote:
>>> On Tue, May 19, 2026 at 10:43:38AM +0200, Neil Armstrong wrote:
>>>> Document the Silergy SY7758 6-channel High Efficiency LED Driver
>>>> used for backlight brightness control.
>>>>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>>    .../bindings/leds/backlight/silergy,sy7758.yaml    | 53 ++++++++++++++++++++++
>>>>    1 file changed, 53 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/leds/backlight/silergy,sy7758.yaml b/Documentation/devicetree/bindings/leds/backlight/silergy,sy7758.yaml
>>>> new file mode 100644
>>>> index 000000000000..80e978d691c2
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/leds/backlight/silergy,sy7758.yaml
>>>> @@ -0,0 +1,53 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/leds/backlight/silergy,sy7758.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Silergy SY7758 6-channel High Efficiency LED Driver
>>>> +
>>>> +maintainers:
>>>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>>>> +
>>>> +description:
>>>> +  Silergy SY7758 is a high efficiency 6-channels LED backlight
>>>> +  driver with I2C brightness control.
>>>> +
>>>> +allOf:
>>>> +  - $ref: common.yaml#
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: silergy,sy7758
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  vddio-supply: true
>>>> +
>>>> +  enable-gpios:
>>>> +    maxItems: 1
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - vddio-supply
>>>
>>> Sorry for missing this in v2 but is vddio-supply really a required
>>> property?
>>>
>>> It's unusual for supplies to be mandatory (and the it is not mandatory
>>> in the driver implementation).
>>
>> This device is a little bit special, the VDDIO regulator is used to provide
>> power for the I/O via the enable input, so basically the enable gpio power
>> level is provided by VDDIO.
> 
> I don't follow. The EN pin acts as both VDDIO and as an enable but it's
> still effectively a power rail isn't it (albeit one with very low current
> draw).

Here's the datasheet description:
```
Dual-purpose pin serving both as a chip enable and as a power supply
reference for PWM, SDA, and SCL inputs.
```

The VDD input is directly provided by the panel, so Linux has no control
of it so I haven't added it.

> 
> It looked to me like the correct way to model to two power rails
> going into the chip is vdd-supply (main power supply) and vddio-supply
> (EN/VDDIO) I don't understand why a single pin needs both a regulator
> *and* a GPIO in the DT bindings?

I don't have a the schematics of the board, but as I understood one gpio is
actually enabling an regulator which provides power to the IC (vddio) and
a second gpio will either drive the EN signal to GND or VDDIO to provide a
clean rising edge on the EN pin.

So it's not really 2 regulators, and having regulators means the enable
signal can be shared and would have regulator characteristics which it hasn't.

> 
>> This is the recommended way from the datasheet, and I assume it will be used
>> like that on other platforms (if it exists...)
>>
>> This is why it's mandatory and enabled first before setting the enable pin.
> 
> It's not mandatory for the C implementation. devm_regulator_get_enable()
> will provide a dummy regulator if the property is omitted.

So yeah if you prefer I'll re-spin with the vddio regulator as optional
because between both, the VDDIO is the only which could be shared with
other devices or always-on.

Neil

> 
> 
> Daniel.


