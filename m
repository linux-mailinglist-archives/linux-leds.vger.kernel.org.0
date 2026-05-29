Return-Path: <linux-leds+bounces-8380-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6C39KBzoGWpazwgAu9opvQ
	(envelope-from <linux-leds+bounces-8380-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 21:25:16 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D99607D03
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 21:25:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDC923040C82
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 19:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B304A383300;
	Fri, 29 May 2026 19:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AceMiFDd"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CBC3264D8
	for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 19:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780082233; cv=none; b=e7jZBoVnjekziqkONvOx+dG6Yp9FpJlkzrOFIay4RAO8VIRMo9KT+qU/spcRFT/OAVYeX8LbZs2k0NX+qeoCNCVdLh6N9wBABb/2u7ne4xsWSaUykVlRcGgFtOEKcPLvBVnchN+Yqgy0RNp1LyO8wcnCnHMi6Cw228zeOIZsjgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780082233; c=relaxed/simple;
	bh=/GWYGsOqRd4VNyMQmBMTGP86z2EMutGKlNutUKk2H3I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=DRBFfGxKu6Ii7UPmsHn6DVa4Lvc4FOrIn2s4l+rxz49uo2/83KZfYX3MHCPwHeVl/avA8HRBPA2CZGiVL1MdA3Xf6QIWJozZ0+R01nI70y8AndnKUoqipNwlRChrJfAYhizuWIMBIjGiZCTIzfvIgIskZz3T24pwodKWNXyDFrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AceMiFDd; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45eedcdaeaaso1357530f8f.3
        for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 12:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780082231; x=1780687031; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2foRsWJ0lba68yU2GxP5AU7MU0MvJx9Tate1Ll6nIZs=;
        b=AceMiFDdvjPwskUV8V/wO4Kn2CyH2tPSw+E+hPsoaN09K09aA3xZhFm8lkdleIvlwF
         ldtegWf+d5jb2t2MtSCmmn3CocJMmNMWH3YQu8GjEL7kKlZeuUJFpUtYXBEuqEse7Nnt
         WChcaeX1O9k2DEBzm6/qjkgj7zdvltTQ+4Hds/0AfK9bMEsTURL6L0w48JJ4k65v8a47
         SY1g/bx3rtWk6WzzBsiMDQ9hiLLPxWi4OwTKdmVe5Lq9aV4ePN0qxkFBlTb7ayo0+h1/
         0THOYmi5Yj3am9/O+zokj9duoEjYCY4JHdNpWWx6Dg4/PrFar/GlXqVT5NR8D1X0tCuP
         YMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780082231; x=1780687031;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2foRsWJ0lba68yU2GxP5AU7MU0MvJx9Tate1Ll6nIZs=;
        b=nbcVUSstlkyNsIx71ekoYBpl3bG0yMQJzIigQ6TNEHct3jk8zTdpVM80UYq3Y2Cgnv
         81nO4us8CIoqf4oMGj0SsiPIQZIBAQ7mmDB9nrXlThqTkvHHvTXRWTiGmUq0BOBotKGj
         02QlmKtl4Qd55Bq4zFg3CmYTX4i+yfa62Prlw/8TzrgygAqT8irkWFMUfs6+ZxcCiFFf
         jm0MvC/irPz98pBMYbp92u8eTd95Fe2D3xu7/iGL/n5FIaJbezLtyf52eqc6wCIJQM8n
         XLHkfO+mF5fffdZUp7g0LN91FWwcHJdzVj235mnY/MKBf6ELGrUZuk/BsT+jkgNsS09R
         ffXg==
X-Forwarded-Encrypted: i=1; AFNElJ8Pg0Dt4jMl2y0QCzHPX/1rKQOGW2HkVaWTRffvMEx2ZHcBi5OllqIBm2WvT15JEJ4p6OaDuPcY586Y@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe/i+6WlvwOqOOY1XT0FvenMN2Gkym7J2Ka/H4cYqSTlxEKFDH
	gmnB6n58T1eu/93v4yF5zoO8E+5hYflYICNZj+ir24+YldqNru1UYgfEWlLQnGXJuLQ=
X-Gm-Gg: Acq92OHCd8eUPOil+Yx7pOZqNUxIVlcNWBXwxPdzTZIafRBGlZTMtVqbHwmHKRVkZQG
	uh/xEWIzkSmnougQd3rzeKdTAA1pT9/w11cuUP83HewVRFh1aE06+FwxUXxGk7ZF5n9teFpASkD
	ueEgAmMYMEf71B/zls3TaJOvGzpvDl0X97SL34EOveKWCqIWLg202SRqFOzDsulP20x7i29t12B
	pDrv5ve16bpkgD7dC6v9dLUBA2n+5njyQeNbLc7novqmDn6Jj4hTkLTXMLMZ4dUo57mchDp7P3L
	Pk7126uMuFg4jedZLV+I57FCFo+cYOb+Dr4m85bVEun2wCy4BeUsRZA7f3ET/WjK1ujW0sNEd20
	Ckr2td01OrEtzJXXjhXzYYFzrUOlqtGUuq1++Q5t01hCAs1LSgh7z1jAujzWp+lKGAs+fElCppv
	RiBcMAi86nBrsM5D6OrpIRsWTtB25ghBfl00ipDPyOr+rlLfQewWklu3Jkzm6iG+QlY7LYKuDa8
	i3JHdffnHZ/pNhISG+Wj9TsW7ew
X-Received: by 2002:adf:fad1:0:b0:45e:f5bf:6c25 with SMTP id ffacd0b85a97d-45ef6b6c555mr1668157f8f.32.1780082230243;
        Fri, 29 May 2026 12:17:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:b6d0:a628:be51:f552? ([2a01:e0a:106d:1080:b6d0:a628:be51:f552])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cd87sm5174852f8f.24.2026.05.29.12.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 12:17:09 -0700 (PDT)
Message-ID: <ddf8ea10-b0e7-49be-ab9e-bdfad1b34327@linaro.org>
Date: Fri, 29 May 2026 21:17:08 +0200
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
To: Daniel Thompson <daniel@riscstar.com>
Cc: Daniel Thompson <danielt@kernel.org>, Lee Jones <lee@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, KancyJoe <kancy2333@outlook.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260519-topic-sm8650-ayaneo-pocket-s2-sy7758-v3-0-ec8194bbc885@linaro.org>
 <20260519-topic-sm8650-ayaneo-pocket-s2-sy7758-v3-1-ec8194bbc885@linaro.org>
 <ahllT_HVTAJ5MbkS@aspen.lan>
 <e3c99fe3-9279-4dfa-af69-d9366ab06837@linaro.org>
 <ahlr5PnX5O0tEd6G@aspen.lan>
 <4001cf6a-b7de-4933-96bc-c9b4ccb53e4d@linaro.org>
 <ahmfZ0tdxbVfD_y4@aspen.lan> <ahmkirIuOYhd1rkM@aspen.lan>
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
In-Reply-To: <ahmkirIuOYhd1rkM@aspen.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gmx.de,lists.freedesktop.org,vger.kernel.org,outlook.com,oss.qualcomm.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8380-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:replyto,linaro.org:mid,linaro.org:dkim];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 23D99607D03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/29/26 16:36, Daniel Thompson wrote:
> On Fri, May 29, 2026 at 03:15:03PM +0100, Daniel Thompson wrote:
>> On Fri, May 29, 2026 at 02:50:43PM +0200, Neil Armstrong wrote:
>>> On 5/29/26 12:35, Daniel Thompson wrote:
>>>> On Fri, May 29, 2026 at 12:16:07PM +0200, Neil Armstrong wrote:
>>> So it's not really 2 regulators, and having regulators means the enable
>>> signal can be shared and would have regulator characteristics which it hasn't.
>>
>> Agreed. If the EN pin is merely use as an enable and voltage reference
>> then it are not two regulators.
>>
>> However, it is also *not* vddio-supply and enable-gpios. We don't need
>> the board design to check this. The pinout diagram in the datasheet
>> should be sufficient!
>>
>> If you have to activate vddio-supply for the backlight to work on the
>> board are you sure you don't just have a misnamed vdd-supply that needs
>> to be taken care of? That would make much more sense given the datasheet.
> 
> After posting this I figured there is another possibility.
> 
> If the host GPIO pin is not capable of delivering the 1mA requires by
> the chip then the board designer would have to add a buffer and that
> buffer would need a power supply... and that power supply could, in
> pinciple, be switchable.
> 
> However if that were the case then I don't think the power supply for
> the buffer would belong in the bindings for the sy7758 so I'm afraid
> whichever way I turn it I can't make vddio-supply make sense.

Yeah seems you're probably right, I'll move it to vdd instead and make it optional.

Thanks,
Neil

> 
> Daniel.


