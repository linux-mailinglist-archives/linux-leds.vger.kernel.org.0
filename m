Return-Path: <linux-leds+bounces-7897-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDb9ArPJ8Wn+kQEAu9opvQ
	(envelope-from <linux-leds+bounces-7897-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 11:04:51 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 651E34917F2
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 11:04:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18FC6303D738
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 09:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D7263B6BF2;
	Wed, 29 Apr 2026 09:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WHsQlU8f"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CC33932CE
	for <linux-leds@vger.kernel.org>; Wed, 29 Apr 2026 09:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777453434; cv=none; b=WdSLA4okG7lkrFx9bYztLGbfxV/iIWo0VDjkezOd7xPEI2E/wUhfpioH+8Ea/YBkgV+dX71lOIRE8JVwqo8Sl/ymUPgFonbjYo0cibOSJKmru45IL4K8oW7ah/cBQ9Fdh4xp8zhGzEfSx/vM5EEmtDSOss+sXdAO0pbyXxp2AWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777453434; c=relaxed/simple;
	bh=HMbidjnXWQ7dqAUl70UddiBL/hKnsrslsSh+V6/N6Xc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Hbp7eo0EmTfuijhjQcVXoM8je7gElQxWuyF3Xw26guN/jcqthlRs/0Bt+my8p5XcoUCuqzmeHDbEVB3RVJET+3nl8DGbHTnw5ZhtvJVlrIReSUeajUtvCeEkVLTjZ7GqEiHIXbTdM5gWsOgfDkJiL6iEbBX3hO8dD4KDlDE0bXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WHsQlU8f; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d77f6092eso8557115f8f.2
        for <linux-leds@vger.kernel.org>; Wed, 29 Apr 2026 02:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777453431; x=1778058231; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RSpsznma6FPd297vSkEgjiyMuhjrOLr3Zucu2Me0roU=;
        b=WHsQlU8foQ+rzkhUOSJTTx2gyC9NjYHFKsqO3zg/q7Nj23wX3qJP7EZ9jGdN0iiGCB
         peyYnog+3C9YbqDd/PVLomDIAHviw9blPFmAHOYsznzK08+jZjN9bcElTBDFYkJ8JqQ/
         lM+HJGaQGpmi9AfAoVVpZWK8JzTHnOUFdNQiOS/PATO74t2dEeK8J98oZyI5ZsFjHVtf
         rYL7GxDVzodOMYZRaDuGTXFd1ldLBm7fWfNoyHHUDb47ZN7J1PGwXuQiRmCE0Bth6Ryv
         8Obb0CrTtYeUFa5r2eL/XhmLl8d9JMP64mB4BdIzEorGsY8guXP2LuaEoCChzPzPLCJ5
         xDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777453431; x=1778058231;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSpsznma6FPd297vSkEgjiyMuhjrOLr3Zucu2Me0roU=;
        b=B0Xr/j6MBg/Sy+6TdOFm//rB2weu2ixo4hmL2CQx73/1Wa9clj7sKlgjboUOZsZG/6
         tBckgn3+svuy0W4rSdKNc1gSbtm/tCCn7m2mlSt0TR/VhK6dHMBmugqcKLWJ8QdR29EK
         LjxbcabIuRNUpvyYdoUCeP8zHkJmaHZr/e2AKrzLrKoIqMmReUdJFeG3m9d8O9nRTfYc
         M8TxakKBgpgexgxTmGDikltTOqfiu1wQZmwXwhaLaGW0qfZmsygJTDFFGi4Mnx/iQGsO
         Tdq/5Xk7gJtddEAC/QgDM56NdF/vPetlmkWBLTmu1aIwHoLwbWX4yqB26Qt9qFaAjkr/
         sUMQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xP1KpLbIuDGSPtlYaUistcTI8zPXCC0Oc/k4QRSL61GlHxwGYm4hlb9ZaQ4v9rYWw5ejBYU7J3QEV@vger.kernel.org
X-Gm-Message-State: AOJu0YwI5XTqJXQb3iNgB1UH0CVH313OHSYw6f9ud49ebbj7w5ZvVJpY
	WhJKrfabPeRAfOeYWXVsYbslJv9Jww2oD5hnBgz2xnqdb70w+QbiaKveo71g6pnld+w=
X-Gm-Gg: AeBDiesBw1ov90GR5qQEpMhpzfJjZ7nqYjLVNqWxiQG4Hq0umkZGkPfA4Chg2qwqkCy
	AQn68L4eSnk3HxJ3+92ndQCjRtU8YAdVhBc/FA+baiHX5LQBq/SsTGNKgiXuYxY4bot0ywcPgIO
	yTzB+ebPeqwUGR8rUxZB1gXnSG99fLKeJX5wFDQfqkcxVhlYE6Rvalak0zNG/ONoEzrcGN3VkOI
	bCKe380jEp/AlqdetbSdtodhRsJOcwsI9uhd9+YBQTiXp7wo4vBRH+FJVFzA/2hkUFj6+Gk//cN
	apfgTWQuJMxnHE33SvPnZuBatxx9KciHP4kVRKsv5TLFncnawJisNwcQVfLfDjVrUmlzzMv4P2g
	AOzd4+tCAhR9qOETCW3eo7w8iXPb+XPyx3h81/UvnNVMt8Lk1aj8cpA0UlIA+95xxlZiA+Iz21A
	7iR7bWyooyhh7pxlOLkamDub53KI+NDsmwXtFjimns9wItpldVlmH5L8hEYuW1mi6ZxFHeZ3KgN
	SqcedbaXqiQ8YxrVg==
X-Received: by 2002:a05:6000:2dc2:b0:43d:7403:4b65 with SMTP id ffacd0b85a97d-44648f28e88mr11536798f8f.6.1777453431182;
        Wed, 29 Apr 2026 02:03:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:b679:2e1c:a552:545b? ([2a01:e0a:106d:1080:b679:2e1c:a552:545b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5bf2sm4322188f8f.27.2026.04.29.02.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:03:50 -0700 (PDT)
Message-ID: <bac23b70-758f-4944-b040-753fc40a53c5@linaro.org>
Date: Wed, 29 Apr 2026 11:03:49 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] backlight: Add SY7758 6-channel High Efficiency LED
 Driver support
To: Gyeyoung Baek <gye976@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, KancyJoe <kancy2333@outlook.com>
References: <20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-v1-0-0caade5fdb32@linaro.org>
 <20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-v1-2-0caade5fdb32@linaro.org>
 <CAKbEznvPAYFUt-ykH7rCQwMFUq6N68B9x7Dd97WRDm3Mvj34fw@mail.gmail.com>
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
In-Reply-To: <CAKbEznvPAYFUt-ykH7rCQwMFUq6N68B9x7Dd97WRDm3Mvj34fw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 651E34917F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gmx.de,lists.freedesktop.org,vger.kernel.org,outlook.com];
	TAGGED_FROM(0.00)[bounces-7897-lists,linux-leds=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]

On 4/29/26 01:35, Gyeyoung Baek wrote:
> Hi,
> 
>> +
>> +static int sy7758_probe(struct i2c_client *client)
>> +{
> 
>> +
>> +       /* try read and check device id */
>> +       ret = regmap_read(sydev->regmap, REG_DEV_ID, &dev_id);
>> +       if (ret < 0)
>> +               return dev_err_probe(dev, -EPROBE_DEFER,
>> +                                    "failed to read device id\n");
> 
> regmap_read() seems it can return errors other than -EPROBE_DEFER
> (like -EINVAL,), and hardcoding -EPROBE_DEFER here might drop the
> actual error.
> And maybe would keep retrying probe forever

I forgot to change it, initially the powering was clunky and we had a read error
in the first probe, but now it's solved so I'll remove it.

Neil

> 
> How about this?
>> +               return dev_err_probe(dev, ret, "failed to read device id\n");
> 
> 


