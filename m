Return-Path: <linux-leds+bounces-5920-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A297FC13306
	for <lists+linux-leds@lfdr.de>; Tue, 28 Oct 2025 07:39:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53BD93BCEC2
	for <lists+linux-leds@lfdr.de>; Tue, 28 Oct 2025 06:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 903182C08A8;
	Tue, 28 Oct 2025 06:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+D/2g1Y"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779BF213E9F
	for <linux-leds@vger.kernel.org>; Tue, 28 Oct 2025 06:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761633561; cv=none; b=IVdkA+EqguJw+ZWNd2i/cVI2UE407WXC57wKYUnmy22PZ1Cr77iCy2qA2MHMqLhmr033/MD79if1f8T98+kccM+aDzYaNJim/rICc98nr6tRMtSEeqBXzLyDj2CB75An+A0G6ntXAHe0bBTrvD+CN57LP4mzK9xyMIOFHpTr2js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761633561; c=relaxed/simple;
	bh=oe8UGTsyZQU+Sb6o4knYJm/Nl+RnNUK56OH6fcAsM64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CZtzggoN01ig6bOjYWEeOZ+haYE0yCadJOnXf7vSeqR1q4MRQTCyjxPX0lum+1VddnaOsyWCEKKnjdG4VKU6buhLKnLvmBanNkiGfaHGQ+DorHHook/eqEnsfkbebfqR7qB8ZfCH/i6vh0eW5rm77RLCqw5Jexauh7iy2a3kPs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+D/2g1Y; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-37775ed97daso65483031fa.0
        for <linux-leds@vger.kernel.org>; Mon, 27 Oct 2025 23:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761633558; x=1762238358; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o2NHp9DtfBxd6wakLEvsBSL0E8nIoGL8qMdT+jYFy9w=;
        b=T+D/2g1YRWTe3hvcE6dzlW/v7H7zmsCuzU4PeToa71WdgD5U/gfl6VOqTMxwotTjow
         sCXyzAruCgyhUpxXWKp1rtFdo83yEFxedHO305txU/NYFxqfBqkCgc4aISU1QtjjKzf/
         H/ANG1sxpXpAtYR3rCJtXW8V1xMAvtI1BF3sNgW97zA4wHqIsOeuScWQkGFcEGG4U9Xa
         E7jEWWZyDAqQmxpxfh+t/8Ufp0nVLgE9RXnVuhiUvGKtK0Rn8kOxo++RufEezI+tDRBy
         RE/Rs0OA18VTS/KlBxm6gF8W92mwUpzogHFLtbaL/aFvAIyXx1asxi0vuBAOe+q3Zid0
         vG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761633558; x=1762238358;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o2NHp9DtfBxd6wakLEvsBSL0E8nIoGL8qMdT+jYFy9w=;
        b=EAe8ZQ/ZJYEc7TNKBV9fHopwSXk+PXb8ptE+3x738nmk+WWfZbX8a0d7ujluVHCeXC
         n//PwO6MLRU7+bbvHP+JMNzY7eLL3zMtnmOgAqFDpZ8jZ4ueW9uprmPsRLwGZohtmqbl
         YEqUaqdIXuNJRC7QRF2p1b9W0dtIdc4v80H3Swhra5uC3uyY4BmRcVq0vrLfYz6KcGgT
         YW35OwMdJPUli2EVLUnbtS7EdgUAaLdLiqmOXtKTtbMXqtGHdAN9dY19Tfjgz3heUU5S
         JbzWOAF04MJM5kFauDsEBaAQVUpcogJK3QF+LDW9QEMQFpfxFpbXHRBrCqoxmwz1agUU
         7n5A==
X-Forwarded-Encrypted: i=1; AJvYcCXiTHBYlBzN3xhWkS+WE8qhmjxMJoZ+qCySCLdZeb160maRBAN3VGr/niuns6asQism6OPonAAkAVqv@vger.kernel.org
X-Gm-Message-State: AOJu0YwS9NBEx/EogK0/1cUceLn3LzMsnmZVlA4hyrSTmNAXSpbfw+Mw
	hbyNrNQf8TLLRYsKXBYkFxeHSFBH0FFcbLGuPJQy9IbSb+qZbex5VP3E
X-Gm-Gg: ASbGncuwNgplzomLBBumjtiRbvlphDkXVXJKRkN7K/ObzxuuZDtfGzXoljiM4DxCJ3I
	tRvssrFpIYwvz9+hsDJ4gcWF7ItMAYXqnjhad1RaWrd8hFYxQtRK567uBy0UDpVDwpZbTz6I8Qv
	A2BfXeD9vcguTz6u5aYDtyLAwkXU0cGNNGWX1nAbvH7t/8flfZF/+pxsdcXemT6CUo4i09tKVsC
	Q33uWHHdmo0MhoigP1z30jiqkzXirIuP7ul0rAVjA9ztXMFrbl+izgeNrw7qg5mPrkoGSnLUQrH
	6+ae6MO/nWrSVBI6QzK+unU3uZYEtcDfWv9Ta6A/BKMy8DFTqzO+JaJvUMUkGJSVYFDtphpyoPx
	MgSYNCloGOAAHZuerots9R13tuZAOEc+aBwrvpxCuRUdhG2oO9t4QVLasqt8PbNc6fzvRu5+nti
	AQtHV0InjBeJDXwXJ8fr2oPXjpLalXqX1aiNqBadBTDEaV0P/y+zkhOHw3/g==
X-Google-Smtp-Source: AGHT+IHynrA8gmQbmSsLhwg1ZIot0gtNKrvR9BYrLAUuDbg/4/iyYf4/D5eEEzFU8nZaoyRtB4Zbkg==
X-Received: by 2002:a05:651c:2228:b0:376:3933:1d89 with SMTP id 38308e7fff4ca-37907cbd1ecmr6519691fa.24.1761633557353;
        Mon, 27 Oct 2025 23:39:17 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee092282sm26491101fa.5.2025.10.27.23.39.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 23:39:16 -0700 (PDT)
Message-ID: <3cd3996a-a9da-494c-b92f-a03a73d403e5@gmail.com>
Date: Tue, 28 Oct 2025 08:39:15 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/15] Support ROHM BD72720 PMIC
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andreas Kemnade <andreas@kemnade.info>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1761564043.git.mazziesaccount@gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <cover.1761564043.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/10/2025 13:44, Matti Vaittinen wrote:
> The ROHM BD72720 is a new power management IC for portable, battery
> powered devices. It integrates 10 BUCKs and 11 LDOs, RTC, charger, LEDs,
> GPIOs and a clock gate. To me the BD72720 seems like a successor to the
> BD71828 and BD71815 PMICs.
> 
> This series depends on the series: "[PATCH v5 0/3] power: supply: add
> charger for BD71828":
> https://lore.kernel.org/all/20250918-bd71828-charger-v5-0-851164839c28@kemnade.info/
> sent by Andreas. The power-supplly and MAINTAINERs patches (2/3 and 3/3)
> from that serties aren't merged yet.
> 
> Revision history:
>    RFCv1 => v2:
>    - Drop RFC status
>    - Use stacked regmaps to hide secondary map from the sub-drivers
>    - Quite a few styling fixes and improvements as suggested by
>      reviewers. More accurate changelog in individual patches.
>    - Link to v1:
>      https://lore.kernel.org/all/cover.1759824376.git.mazziesaccount@gmail.com/

As Alexandre pointed out, the 07/15 (MFD) patch was missing from the 
series. For some reason, google's SMTP severs refused from sending it 
with the recipient list used for all other patches, with just: "Status: 
5.7.1". After several retries I had to give-up yesterday.

Today I managed to get it through, after I dropped every direct CC 
address, leaving only the lists. No idea what is happening :(

Anyways, it's in the lore for the interested:
https://lore.kernel.org/all/4c964cef46a396209052aa4194d08fc03f989647.1761564043.git.mazziesaccount@gmail.com/

I will in any case re-spin the series with suggested changes - so 
hopefully I can get the v3 sent correctly to all the recipients :/

Yours,
	-- Matti

