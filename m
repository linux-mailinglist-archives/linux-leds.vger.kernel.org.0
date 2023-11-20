Return-Path: <linux-leds+bounces-39-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6FB7F0F7E
	for <lists+linux-leds@lfdr.de>; Mon, 20 Nov 2023 10:54:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC5D2B20E82
	for <lists+linux-leds@lfdr.de>; Mon, 20 Nov 2023 09:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4185125A3;
	Mon, 20 Nov 2023 09:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DCJJT29/"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5210E8F;
	Mon, 20 Nov 2023 01:54:23 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5437d60fb7aso6035033a12.3;
        Mon, 20 Nov 2023 01:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700474062; x=1701078862; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jnKZPVZkihbfdrjYZZkQUUXQViuJYGgLH4ey0uofMfs=;
        b=DCJJT29/fTSYe6ukRFjhEZVxuRmTKOGtAYbTAIJGzK2QXBZ79tl1YF5Hwl55ZiMAdZ
         N0oHzGGYM62T5mkVHnc/aAzJEH0KcLyQgkwF2PDuHxenFQbU4XQWTHlS6h/tamhVHZ5S
         jZj6r6rVOoTnb82FBJqribsaEVerTnbfAgs+H8SF5bnfRJHm24Q00hzhJNxLiDrfTL+T
         exhI10gdSxZkyYBg/6QlSnSoaI840OajI5fHhorzoIEIthw0mt0K98GyGv41lvZABEm7
         UpRZcZNFZ9rabC3ncyIletasUIbAsOjFcTADXU1GehKSwOgfWMV8Jv3Q7z8yJAD/9OXu
         cAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700474062; x=1701078862;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jnKZPVZkihbfdrjYZZkQUUXQViuJYGgLH4ey0uofMfs=;
        b=WEJEANTnsnG4cwtXmSpa4Ey8NTY7qjHPqGS9Sk4Uptsb/Tf4n+GIOcyppGfzjFVwwS
         HafbVB2wQGfSgRFXVEN7kz2YOdbt7o0R/YcHOq7+MPfcQsMSkRd0AxLFs3v5Mvx6nQcL
         lGLLDbbN/plOeg9vXNYSz/wdN0TZwMo+31P3E+AElOcg8Y74LEWP3ksoaHH1tr+pSmM5
         xoKsX8V/vikhEdGCIMhu0QMfAxKfIxOadf1xyoaRYfz0Nl6cqRPGnsQYL+11zv/CrSun
         dwX5NGTaCt5XqOQ0nq8jFB855+Ole6Rqc0d4jBPdQnIiwEyB2pU4IgcY45hloURTQwla
         hXYA==
X-Gm-Message-State: AOJu0Yx1++GV3fQIDK5ZwlkOYDhYpduHwSVFO4QrugNEpQ8XNPA1v1r4
	6nmQJ92dmySIDz9oHvPeB8ZR9xQgnVo=
X-Google-Smtp-Source: AGHT+IGw02Iq9CEHeeW39wXYFzPVHOLvpJrRVA9VxXKbm9YiceFQvoV7g4qdsoyG3n5moEiXuNySaA==
X-Received: by 2002:a05:6402:1650:b0:544:57c8:ccc3 with SMTP id s16-20020a056402165000b0054457c8ccc3mr6203584edx.1.1700474061571;
        Mon, 20 Nov 2023 01:54:21 -0800 (PST)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id w14-20020aa7dcce000000b0053e2a64b5f8sm3402136edu.14.2023.11.20.01.54.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 01:54:20 -0800 (PST)
Message-ID: <ee912a89-4fd7-43c3-a79b-16659a035fe1@gmail.com>
Date: Mon, 20 Nov 2023 10:54:19 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Cc: "openwrt-devel@lists.openwrt.org" <openwrt-devel@lists.openwrt.org>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Describing LEDs roles in device tree?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi!

Our current binding Documentation/devicetree/bindings/leds/common.yaml
allows describing some generic LED parameters. Most common are color and
function.

Now, many systems will want further & more specialized description of
LEDs. Most common roles I can think of:
1. System is booting
2. System is running
3. System's failure

For kernel usage role we actually have a "panic-indicator" property.

Are those extra roles something we could put in DT?

Please note that "function" on its own is not sufficient as multiple
LEDs my share the same function name but its meaning may vary depending
on color.

OpenWrt developers started (ab?)using aliases in downstream/modified DT
files for such purposes. Example:

aliases {
	led-boot = &led_status_blue;
	led-running = &led_status_green;
	led-failsafe = &led_status_red;
};

Above could work with some adjustments but I'm not sure if it's
acceptable for upstream binding. Also what if OpenWrt wants to define
different roles than another project? Prefixes?

With Linux a problem is also a lack of mapping between
/proc/device-tree/leds/*
and
/sys/class/leds/*
With "label" present its simple but some guessing logic is needed for
function + color properties (it's actually missing in OpenWrt right now)

Any suggestions for DT-based solution?

-- 
Rafał Miłecki

