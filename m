Return-Path: <linux-leds+bounces-1619-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B68CD8BDB2B
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2024 08:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7317D282D84
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2024 06:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6BEC6F505;
	Tue,  7 May 2024 06:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I6Sgo6Oi"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09606EB64
	for <linux-leds@vger.kernel.org>; Tue,  7 May 2024 06:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715062229; cv=none; b=iBBBLkZwrtbT0K2RExs9RsURDc0d9KZKiDlUimdYadRqaKX9xRuDn0Yq0da5OQpknv/f3OhXR+j9em2B/gmZY67P/dnLgma/lrwK7ouqAM4qko6fqXm+/E1qL1oqlaTBXB2ZpcBlyE1XX4qmLjWmfLkWmH2U+0fWG19e89MP8D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715062229; c=relaxed/simple;
	bh=NN37t59EsYaWpOfY6mIxVvawgYy1WxwgD7Dv5L4ULOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uzmU7ksDJTmGSr9qEk1ik7TEYyobBfmglNvfjXFFNqiwUAH8mYeLw5Bk6/oT7I0oxALIQb2PHN1c3Tu091VeVWFuSq64iAHGC1EeCrFz5ibYNV73MZLKUC9+8Sa/WpEp9+syXxLDjQw1EUouPY7cNYX4a5kqQlP7dk46dLon4tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I6Sgo6Oi; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a59a64db066so660831966b.3
        for <linux-leds@vger.kernel.org>; Mon, 06 May 2024 23:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715062225; x=1715667025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MXjJi9Id2sTcJOhILmN1ky4B/45ar4n3Y4h1sMFH2gA=;
        b=I6Sgo6Oi0tI1e1OvwJe607Twd2qVWLBld45zSG6wvw6c8Ro0TNuC4Uem7+WlXULGo6
         Wln68zxocPZ/PguVTjDF/SiFOMWvj2CRjNeBnDEOb0p945mIQEb96plHqtOFEW9ao6dV
         Izp9Q6pZzlN7ON8AxXFIIBoxRJYkXYNHw7BXkk3B3dyiOg7Hx5aqNErff0JZGc1uQkEL
         L22Q/7YLEQeT07q7yO3jv8kb9/dcGoU3+zoJOKlX9tfMY7t+DqU490UNSpPBJU/fcqnD
         xks3V/30ZVtnHYOzKvJcvCzzy9D9B8zgt7EY8Ki2pe0TUmcuj1NU3ZDDwOPdx9qzG5re
         zfiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715062225; x=1715667025;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MXjJi9Id2sTcJOhILmN1ky4B/45ar4n3Y4h1sMFH2gA=;
        b=AT8HEybBz+ikp3XesZdV2PKAmAV4IbCn3eOVNZCUXRVcQdEAiCTD8cPick0PDuFzwW
         G/sc8q1mnkY+gY7XK6Lmw6uuyVIPHeWhjIT8rVApHUf8+UVIWbhcNymwFHJ26AT2q3nh
         kjPbvjynbBGrDx4BJr5MdVLjsgi2utX4B7f3dqDlAbAD4pJeW+C5miv3LkZajO8OsFw7
         3o/5zzgc5nJVfbtrZ88pEudloJPLExKAxuoBCp2XCEUnA3HcvNJX62Na4cmBIMsZizqh
         xabHpP4CvdRdnPMnTinfIAmW9zn/SQRxRBtZGd+tEnOnADTc9WbRsfy7jkX/DTnyva3U
         bHMg==
X-Forwarded-Encrypted: i=1; AJvYcCXvJvzmQZJaSccZ159heH8mX6kecX/4eKFqgxb1a3tR7AVFp27z5TUe3MCyvWFQ/MrOunwYt52+ulAbCP+Rtrkr31fzIRllKmZA/A==
X-Gm-Message-State: AOJu0Yyt8B2L9KduHcrze8OZNTESQTYuH+DAI8cpkO1Gz3e3hDuIzkOV
	BvXMr0RmmBt/Yx5/gfn6PRpnByJ7EpzKMgJ7Ulm9XaUtdM2SBOxz14vIZg6psa8=
X-Google-Smtp-Source: AGHT+IFu8eR50FD/Gd28rJu3Vx/lNXa5WeyJ9YlaXosgaZ3mAvfhxHhCWRy7RjhvEshV0yDHDcXhhw==
X-Received: by 2002:a50:bb0b:0:b0:56e:63d3:cb3e with SMTP id y11-20020a50bb0b000000b0056e63d3cb3emr7637147ede.41.1715062225320;
        Mon, 06 May 2024 23:10:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id q11-20020a056402248b00b005726b83071esm6060147eda.4.2024.05.06.23.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 23:10:24 -0700 (PDT)
Message-ID: <d88e6d38-e7fd-4d06-8c54-e89948d568fd@linaro.org>
Date: Tue, 7 May 2024 08:10:22 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Aw: Re: [RFC v1 1/5] dt-bindings: leds: add led trigger netdev
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Eric Woudstra <ericwouds@gmail.com>, Tianling Shen <cnsztl@immortalwrt.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240505164549.65644-1-linux@fw-web.de>
 <20240505164549.65644-2-linux@fw-web.de>
 <8e9fd4c9-f537-4413-b8c8-988b001b64c0@linaro.org>
 <trinity-c7cd6e30-cb34-4405-9527-6e183179c302-1715015402906@3c-app-gmx-bap23>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <trinity-c7cd6e30-cb34-4405-9527-6e183179c302-1715015402906@3c-app-gmx-bap23>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/05/2024 19:10, Frank Wunderlich wrote:
> Hi
> 
>> Gesendet: Montag, 06. Mai 2024 um 10:18 Uhr
>> Von: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
>> An: "Frank Wunderlich" <linux@fw-web.de>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Pavel Machek" <pavel@ucw.cz>, "Lee Jones" <lee@kernel.org>, "David S. Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
>> Cc: "Frank Wunderlich" <frank-w@public-files.de>, "Eric Woudstra" <ericwouds@gmail.com>, "Tianling Shen" <cnsztl@immortalwrt.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-leds@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
>> Betreff: Re: [RFC v1 1/5] dt-bindings: leds: add led trigger netdev
>>
>> On 05/05/2024 18:45, Frank Wunderlich wrote:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> Add led trigger implemented with config-symbol LEDS_TRIGGER_NETDEV to
>>> binding.
>>>
>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>> ---
>>>  Documentation/devicetree/bindings/leds/common.yaml | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
>>> index 8a3c2398b10c..bf9a101e4d42 100644
>>> --- a/Documentation/devicetree/bindings/leds/common.yaml
>>> +++ b/Documentation/devicetree/bindings/leds/common.yaml
>>> @@ -113,6 +113,8 @@ properties:
>>>              # LED indicates NAND memory activity (deprecated),
>>>              # in new implementations use "mtd"
>>>            - nand-disk
>>> +            # LED indicates network activity
>>> +          - netdev
>>
>> "dev" is redundant (there is no flash-dev or usb-host-dev). Two network
>> interfaces are already provided, so your commit msg must provide
>> rationale why this is not enough and why this is useful/needed.
> 
> i only see 1 network binding...and this is labeled/described with wlan and phy
> 
>         # LED is triggered by WLAN activity
>       - pattern: "^phy[0-9]+tx$"
> 
> which second do you mean?
> 
> btw. usb + disk has 3 trigger and "netdev" is already used in some dts, so i thought adding the binding is a good idea
> 
> arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts:107:			 * linux,default-trigger = "netdev";
> arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts:52:			linux,default-trigger = "netdev";
> arch/arm/boot/dts/intel/ixp/intel-ixp42x-dlink-dsm-g600.dts:51:			linux,default-trigger = "netdev";
> arch/arm/boot/dts/intel/ixp/intel-ixp42x-iomega-nas100d.dts:39:			linux,default-trigger = "netdev";
> arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts:138:			linux,default-trigger = "netdev";
> arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dts:27:			linux,default-trigger = "netdev";
> arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts:107:			linux,default-trigger = "netdev";
> arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts:113:			linux,default-trigger = "netdev";
> 

Then please check previous discussions:
https://lore.kernel.org/all/20230217230346.GA2217008-robh@kernel.org/

Best regards,
Krzysztof


