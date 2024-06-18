Return-Path: <linux-leds+bounces-2023-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E12190D51A
	for <lists+linux-leds@lfdr.de>; Tue, 18 Jun 2024 16:32:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E7EF1C24753
	for <lists+linux-leds@lfdr.de>; Tue, 18 Jun 2024 14:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434C6158DBC;
	Tue, 18 Jun 2024 14:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MyGyVX0K"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9EF13CF9C
	for <linux-leds@vger.kernel.org>; Tue, 18 Jun 2024 14:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718719689; cv=none; b=HUvxBgb/eSc8R/gA4igTbmZ0xvFMDwCJV2KQ45dqy3UsfjrhZ5n7EYFo7lWC7wT7KwQzU50COviVh40QD9WBLc6mF07WmvJhgnYSY0QnZHhd+GZqfwuFR0D4U091oVoAk/DMX3/imEn1ExrLzBMAyFP0stOE+xRJrNttyJ3aIV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718719689; c=relaxed/simple;
	bh=n+QilORxP3RK1yVnaHzKUmNkVSKNJe6tBhnWisHRmlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DPYk0cGOepBqo1xIdDYFS6iWHgX/szRsNmTkixFi2tshDp7r21PKkY1V2X/SGDlqbEleYCUEKF/uzs7DCqBa6+K5y1C1KtYhhuCbRDE02FOQO4GJB8YxOo0XdI7ZHzkuy6nUgs4sl+ug7/3V+XLkoTGsUkfH2q3WsIzcKktHVdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MyGyVX0K; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52c85a7f834so7030578e87.0
        for <linux-leds@vger.kernel.org>; Tue, 18 Jun 2024 07:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718719685; x=1719324485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EPYowminOVvr+nmoaSaS+pLCI6yVw569Zh9cdjJsE7M=;
        b=MyGyVX0KL2B1uTed/G7P+E58qdzbpV+ZiM4cp2Fd/GzqbTTWJXIKfQBldd/YEmYOL2
         0UNBV3ZkNIAr/JRnUI27SPV/OQJo/Eq1QOFzY8ebgfxVn3cjoNBLebWtKuSCT+ogdfJn
         x+CZyxLTnF9tE3Tj7LYi+QlthpetvcVgtJX2fjjDyPiBMIbqGazw8T4OmY71mRHhz/1C
         Rc/nuJM0QHXgMgTR+m3v9rvYdY6gFlClpi8HKguMEBdMVrdISbXm3oOr2gF8zjQMMb5v
         2pnB8eH3uPq+XpeSz2M0W6IwQc3R/u/SqXwUUG0AJbyrgOzbSICdZJwzqfA6++RMfcuH
         6fAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718719685; x=1719324485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EPYowminOVvr+nmoaSaS+pLCI6yVw569Zh9cdjJsE7M=;
        b=SIMaJ7PAbF82+yKfqRNAVdWvUva6fW1j94CyG5RoUe5RAemAetjKjB/xHb0zlNOWMc
         op+239CMU9cpwWGUkjMCBJk1iggm2JkNYSHFlJHE52Y3bY9UGGOjyFcdmIX9+m4r9BKb
         H8T7VvZbBJjdkEleHskWFT/ncWJhX0AyaVgbb1kldeo1rG0QarUtA+06etEfUUpnfxRu
         qZrLrROG+F3dqx/gPgMTD5Qn9JbIOd/c9MIRxt92tatlcqrYuD0qga4QdvuAuUI46DSU
         Ls9DHpgi6IpUwId+Svc/c+P+4UxcI9cwGPSwfQmeoEK3NpgwSDA1bGdaNJBJAvkSGY9U
         u7iQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaCkamhJxHO0HHSvss3qyf3ev3kmlNvnctKN9ouGifgUrVcx2LskQY2JqPa8smTp7wKrvaGgq0bkzpXaY0clMs6V6d0hU3XZeK5Q==
X-Gm-Message-State: AOJu0YzNPY2E955mMLv9badT8KAhmEjA9WHqN+XLQMJIpThvhCLbGgdt
	QcFAt4BWoEHwOuSulYv02qc3wszJX74b6EpCZNxjqEoE6QqrnPTXQlpj//n2POY=
X-Google-Smtp-Source: AGHT+IFjNs+7IdOYMMPvNdFNexxA9RGwd73g79/svh7QWdlywyc8T5oNxWK+VByqXQUr181S1dbiZQ==
X-Received: by 2002:a19:8c5a:0:b0:52c:88d6:891d with SMTP id 2adb3069b0e04-52ca6e5637emr7805302e87.9.1718719685041;
        Tue, 18 Jun 2024 07:08:05 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283? ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca282581csm1520479e87.37.2024.06.18.07.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 07:08:04 -0700 (PDT)
Message-ID: <e6a81932-0609-4476-82b6-43ee30b7de43@linaro.org>
Date: Tue, 18 Jun 2024 16:07:55 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 22/23] arm64: dts: qcom: starqltechn: fix usb regulator
 mistake
To: Dzmitry Sankouski <dsankouski@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 phone-devel@vger.kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-22-e3f6662017ac@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-22-e3f6662017ac@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/18/24 15:59, Dzmitry Sankouski wrote:
> Usb regulator was wrongly pointed to vreg_l1a_0p875.
> However, on starqltechn it's powered from vreg_l5a_0p8.
> 
> Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---

How did you confirm that?

Konrad

