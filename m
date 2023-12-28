Return-Path: <linux-leds+bounces-493-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EC681F587
	for <lists+linux-leds@lfdr.de>; Thu, 28 Dec 2023 08:33:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31D711C21B3C
	for <lists+linux-leds@lfdr.de>; Thu, 28 Dec 2023 07:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26193FDD;
	Thu, 28 Dec 2023 07:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gOuxOWd9"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3BE3D62;
	Thu, 28 Dec 2023 07:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5553f768149so1669783a12.3;
        Wed, 27 Dec 2023 23:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703748782; x=1704353582; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tijB2F94Sd67aRHd1P0gy2sAArOKGItI5gkyM8+RCZo=;
        b=gOuxOWd9h7ZBi6xkTu/UffWZqIMjFd0QdBItzRB+aH4ZRMeog585o6p/esii4h8lao
         X3xFGYHgQtCCTBiTS5a8MfCzL8epU0sR3f4ij3LXMF52ewnD86NvIAZpcNAD0fjQtshq
         5nJdVdbYixMKiSkbHd2GNHa9Nk3syXCaXCZrwMbAQ0fdMvzivbBWoNy0oAMWTL8J/u6Q
         UVuxbe5QktWTNKKtzIYaPkwRjxBH/0e5aJ3hPVCH6EtvyxM/c8PE7DtyTlM86p6umffr
         m3X1g0u10yVT+ICY2kYVQAnvJs2dnSeKoL3Nf/twqHvWIssNQSqPfdRm+1Z9iMDMAgnr
         HsUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703748782; x=1704353582;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tijB2F94Sd67aRHd1P0gy2sAArOKGItI5gkyM8+RCZo=;
        b=u06zb8NiB1SabF1nKi6q1SN+4kQnyJrRtMadil+ml5AIU6rb0IjSVGkdpK7734N069
         PXYb0WwZVl85l0OdrdVCEd2EKxk/kQG+mrLG2x+WzwiF1Y/RRIFRC7YEZzabXaFf/4ie
         1S+75twCglFXcCad5xk0KKv3299rvNVh7OGR+oSr7F65+MpJhBj3cBfzkx43FoJXYJab
         TmzgcK3+OBUDrIjW7e0vgz+1JwYArqEiMq0m7cfM7JtRoIW+bTjoLH0G9Zu9EhbNqVbk
         yT11rVwARWJIARERoWpvl17APmnVisLeje0ATzKEfSMmImRbg/rAoEU/BLR4/D5lPq8M
         3lgQ==
X-Gm-Message-State: AOJu0YxV1wTIy7GpFqQCZhb6eNYrhEtUh6lp7ItzKD91u/cpZsLYGkVI
	9JkuQdyG6axPwcqnW/qHfUxTgbpdHD8=
X-Google-Smtp-Source: AGHT+IEqEpHYdQjRNWox18FIj7A2RhwU1tVaVXuBh1KaupvRVFvz/n8BeS17KdVm9Q1RWeRiOlHfKA==
X-Received: by 2002:a50:9b5e:0:b0:554:489a:2a55 with SMTP id a30-20020a509b5e000000b00554489a2a55mr6811576edj.10.1703748782012;
        Wed, 27 Dec 2023 23:33:02 -0800 (PST)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id r25-20020a056402019900b00553a9cd22ebsm9541421edv.78.2023.12.27.23.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Dec 2023 23:33:01 -0800 (PST)
Message-ID: <9fe9cf5b-c215-4538-b726-abe61ea01e4a@gmail.com>
Date: Thu, 28 Dec 2023 08:33:00 +0100
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
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20230316153310.GI9667@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Lee,

On 16.03.2023 16:33, Lee Jones wrote:
> On Thu, 16 Mar 2023, Rafał Miłecki wrote:
> 
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> Linux's "usbport" trigger is a bit specific one. It allows LED to follow
>> state of multiple USB ports which have to be selected additionally
>> (there isn't a single trigger for each port).
>>
>> Default list of USB ports to monitor can be specified using
>> "trigger-sources" DT property. Theoretically it should be possible for
>> Linux to deduce applicable trigger based on the references nodes in the
>> "trigger-sources". It hasn't been implemented however (probably due to
>> laziness).
>>
>> Milk spilled - we already have DT files specifying "usbport" manually -
>> allow that value in the binding. This fixes validation of in-kernel and
>> external DT files.
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>>   Documentation/devicetree/bindings/leds/common.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
> 
> Applied, thanks

it seems this PATCH got lost somewhere. Can you check it, please?

-- 
Rafał Miłecki

