Return-Path: <linux-leds+bounces-560-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0288283A5
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jan 2024 11:05:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C9C1284FC1
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jan 2024 10:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618C635EF9;
	Tue,  9 Jan 2024 10:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jdskEDML"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B715A35EEF;
	Tue,  9 Jan 2024 10:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a28f66dc7ffso659097266b.0;
        Tue, 09 Jan 2024 02:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704794731; x=1705399531; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/YY+KiQ6Rnr+mqmu+ea6o+blFY91Z8QK2WWdHGUhKqU=;
        b=jdskEDMLjR+PBiOZt5Da1XukqEvX7Xc0gksQFSO4plWfkCX+FS0lmYcUbYt5QxcAHQ
         WfqVC1JVweoxxdhRj43FGoz7nOuy7+u2ae27WZ3NQGc/zLENZSPD23oSincLpNxKjoXY
         gt85n0ToEd0aNQT6s7QeRXdUP44YZcAbKUlbmUrNkvOzSz3Ms/THNgkLLiFkaby224BM
         JIc+D46IemZcxLZ5e2ARHJQTbPm25KNuAFf/rHyBIyzeNFM+BCeZSV5QHNKVHzua/HQR
         co6X27d8tR8R2l4gEAjNA+MkXfV4tTvU3r+L0TalYewQpcdnACq4rfin16MKGW4N50RN
         p1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704794731; x=1705399531;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/YY+KiQ6Rnr+mqmu+ea6o+blFY91Z8QK2WWdHGUhKqU=;
        b=Pr1Ig5GfeGcerrooP1PdaVq27mzT7yLtISWoNYGKq20gT99rWIdP0t5Sj+ipbnsdPb
         kbRwdO6YsFibhsNK6xmiyE6NBADB2DkKjE2C2NUvgpX350EGbhShz4MfY5b/4sfl8dik
         TJ5zpgaehI7NEPnP0aK+yu0YaaSVe0HPABF7WfCnle7ayTP3hDm/BjCyZvUatra/W6er
         84Dhi6PZrUk1Xjbxq2MwhRmK86x+JuP5HKBeNGHDC+UYSYKXovNEPZt2+H5NgDbIpyu9
         xt4JMs00Yq9PWeh/8o+eK3Iq6Mp+5hzdSIrxDMCGiXTgzQIHXwdyNFWGfhFoL7g30ePv
         VO1A==
X-Gm-Message-State: AOJu0YxEtIkqYQFFH/4jm5N2ioMZI8W1nneYWpJs48Q1yvKGtRGwJO2d
	XkQon701lTLG0+/KPqNExz0=
X-Google-Smtp-Source: AGHT+IGmNrSo0dIqrM6KVhtDW7up8UvWx1jCAs/oJBrxn9fOQbZtwsdg6I3SbL7/h4Y0wVlBG8GDxA==
X-Received: by 2002:a17:906:73c9:b0:a2b:1e4a:e2e6 with SMTP id n9-20020a17090673c900b00a2b1e4ae2e6mr412024ejl.11.1704794730679;
        Tue, 09 Jan 2024 02:05:30 -0800 (PST)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id h19-20020a1709066d9300b00a26ac57b951sm852379ejt.23.2024.01.09.02.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 02:05:30 -0800 (PST)
Message-ID: <d39bac76-67c4-4154-8b43-782af1e34988@gmail.com>
Date: Tue, 9 Jan 2024 11:05:29 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 REBASED] dt-bindings: leds: add "usbport" trigger
Content-Language: en-US
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org,
 linux-leds@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20230316135546.9162-1-zajec5@gmail.com>
 <20230316153310.GI9667@google.com>
 <9fe9cf5b-c215-4538-b726-abe61ea01e4a@gmail.com>
 <20240109084252.GF7948@google.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20240109084252.GF7948@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9.01.2024 09:42, Lee Jones wrote:
> On Thu, 28 Dec 2023, Rafał Miłecki wrote:
>> On 16.03.2023 16:33, Lee Jones wrote:
>>> On Thu, 16 Mar 2023, Rafał Miłecki wrote:
>>>
>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>
>>>> Linux's "usbport" trigger is a bit specific one. It allows LED to follow
>>>> state of multiple USB ports which have to be selected additionally
>>>> (there isn't a single trigger for each port).
>>>>
>>>> Default list of USB ports to monitor can be specified using
>>>> "trigger-sources" DT property. Theoretically it should be possible for
>>>> Linux to deduce applicable trigger based on the references nodes in the
>>>> "trigger-sources". It hasn't been implemented however (probably due to
>>>> laziness).
>>>>
>>>> Milk spilled - we already have DT files specifying "usbport" manually -
>>>> allow that value in the binding. This fixes validation of in-kernel and
>>>> external DT files.
>>>>
>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>>> ---
>>>>    Documentation/devicetree/bindings/leds/common.yaml | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>
>>> Applied, thanks
>>
>> it seems this PATCH got lost somewhere. Can you check it, please?
> 
> What makes you think that?
> 
> https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/leds/common.yaml#L126

I have no idea. It seems all good. Sorry for the noise, brain fart.

-- 
Rafał Miłecki

