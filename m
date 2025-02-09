Return-Path: <linux-leds+bounces-3901-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6350A2E03E
	for <lists+linux-leds@lfdr.de>; Sun,  9 Feb 2025 20:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBDC11885F06
	for <lists+linux-leds@lfdr.de>; Sun,  9 Feb 2025 19:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D61D1E231A;
	Sun,  9 Feb 2025 19:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W8+vf2tB"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDCA1DFE14
	for <linux-leds@vger.kernel.org>; Sun,  9 Feb 2025 19:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739129890; cv=none; b=INpV3W9j4Y4MFJW+4pRZHwfaZKE50lRuMNQhreXlFHPc0zjYMdEWU2ptXgEECSLkk8eDTA/ah2VACCjlhxqIz2Jj9lCFgV/1B5fSp1+iWtGEkx5xlFNKjIJlfMqkGJsk3CWJdEp19xJZXY/2bJlvgCwQZU4ktZBQpev6wL/mn3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739129890; c=relaxed/simple;
	bh=bakGvPthngL3gTQwUPSt/EUmVwDuJ8/w4DuyMlVWo/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AvX3h/xTCjG10vk4up/VGSWSvRg2na8LNx+FD+V2pwNFzDtMssAB9cRINcz5XZDhmfFB/x5t5xy7Bgfqvu5yoBsGTgdJ6rEcF/j/wkfyEjfFGBIksZCitBcyjgdxPHiJGcVwm2w2n3y3YQuvDXSKqyRPXp/XZc1dMNzIT3mWwp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W8+vf2tB; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5de427a1d12so548073a12.1
        for <linux-leds@vger.kernel.org>; Sun, 09 Feb 2025 11:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739129887; x=1739734687; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l9Ero5vcDcOepXZ2yFnMrKTNvfLViDvWS1bPisX99zU=;
        b=W8+vf2tBlCSDaBnp12F8FyMij7XzS/h6ZRDfEEkRAHKIXIC9NnIACIVTW3RnKhkP6g
         u0JdU3IZ1QhLvFF2DVpz9moJS0LGFynUoYNjqyfYIltTU3r+7PQvO83segdIj0sbdj9j
         JyasB6v8zUGL14Yas1hp5ZzQRdhjJg4C/JwOO9eEYceCT9Kc4ix+gHs0kIr4a2/XpXnL
         a7BiZnoj8flHvN2S459RyMUTJJGuW0HlqZxBcg2Y83AM7yjB7kurKnHQkKREcXz15oSN
         NEA2MHN3ZhGniFCF6HwfipRkh9J7sLyjLHN/MZgbyclAQoXYbB4n5nO3+6TKh1cuGB3L
         qx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739129887; x=1739734687;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l9Ero5vcDcOepXZ2yFnMrKTNvfLViDvWS1bPisX99zU=;
        b=lqrP2XfFpiFcFeZV1cLRnsVo7Tbkae7A3INiaXP9hOtw0ArfeQswM/GfjGGO2RMIO/
         oHi0DlJLeGseMH6V/mmFNoIeEexaNkesFYvIAdT2vgD5h4aHcL8fIuysmRgV5doH+9mi
         ffoRRaCzZ/FtRxfwCl6bfbRidCKjOhKgzM5FYWR/OF6fJHrkYOsAfI1aEc7/Yp0GMWF3
         1b9RNJ2KSztJsfbFtLSH2ebXcmchW1FHKQBBljNmyN3WNuiLxgeSGDvsr9NA/tbWMVSr
         3jGOcesrOHEOPNAbR+fuYOPaFYUOU46o4if5zWQYDBkWUmCvk3MzReqsY7Ca0xNfRitH
         QErQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVtBADodrpitTTQdqJqZPw6ySXZFJro2Gm+s9GGDMssV7ZR9zRrq2NORNPJbmw2l1pzX9RK3n96b/L@vger.kernel.org
X-Gm-Message-State: AOJu0Yy07QADgf0FNpxDM5TqdybWwNe52J7P0IwGl6utSzS2Wu1aIWqG
	UBgqWxwm7jGregv39mlqgVKDVZOQnEpjjxR+VfrG7gKo4BPSFIZN6095e/1/23k=
X-Gm-Gg: ASbGnct8FYK757127YMMtiIz6Di/Hsyo8GrVedtAMFCYiGb+pr5QZ5R6HtZRPwcqHRz
	MZrJuTwtVEE0qDAZwGdAGaAI+ZDyPV8Lutk+6CmuLsQsTZni9wzW1ELhhSsZRaHtMlaja8gyu9v
	eO28keLfNQMrpKgRP1uFTA3lnBYVfxQVHku1S1qt4WnExd5IvT9SbTV+jhUKFY1vGJ030K7Y0ao
	sedFu/g2HOp/2izfaXgLYN2WHndnx8bKoOQeuYjn9IbiqccEB/GZ2G2MxEteaFwpcYXxdZq9r2b
	ZvxvLlsJ4KyW+lSZ5r5mdcVLpf503BTw2w8=
X-Google-Smtp-Source: AGHT+IEJL5E8qZHI2wQRhsWzOfx3kHSAmyv/sAKbVBbstYeeqOih+ViYs1THV7h2OAlqRYYee6hngQ==
X-Received: by 2002:a05:6402:5290:b0:5dc:7fbe:72f1 with SMTP id 4fb4d7f45d1cf-5de4503fea6mr4713950a12.2.1739129887485;
        Sun, 09 Feb 2025 11:38:07 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab784d4aadbsm617189566b.113.2025.02.09.11.38.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 11:38:06 -0800 (PST)
Message-ID: <e67c0375-1024-483b-aabf-6a11339ab9af@linaro.org>
Date: Sun, 9 Feb 2025 20:38:04 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Patchset status - 'Add support for Maxim Integrated MAX77705
 PMIC'
To: Dzmitry Sankouski <dsankouski@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Hans de Goede <hdegoede@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
 Purism Kernel Team <kernel@puri.sm>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org
References: <CABTCjFBx-QpCKFWs5MPCgLAjJWT6ygrvS_A0nJk2BBxmWAxF+Q@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CABTCjFBx-QpCKFWs5MPCgLAjJWT6ygrvS_A0nJk2BBxmWAxF+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/02/2025 15:13, Dzmitry Sankouski wrote:
> For the patchset I sent 2 weeks ago, [patchwork][1] shows status
> 'Handled Elsewhere, archived'. Is anything blocking it?
> 
> [1]: https://patchwork.kernel.org/project/linux-pm/list/?series=927848&archive=both&state=*

That's PM patchwork, not necessarily power supply. But anyway, what does
the cover letter say? Who do you expect to merge it? Above link does not
provide cover letter, unfortunately.

Best regards,
Krzysztof

