Return-Path: <linux-leds+bounces-2033-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD2590DBF8
	for <lists+linux-leds@lfdr.de>; Tue, 18 Jun 2024 20:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6AB2CB22334
	for <lists+linux-leds@lfdr.de>; Tue, 18 Jun 2024 18:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32AAF15ECEE;
	Tue, 18 Jun 2024 18:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GeRU7INo"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B68015ECD5
	for <linux-leds@vger.kernel.org>; Tue, 18 Jun 2024 18:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718736962; cv=none; b=lZOkKlaWcdFwb1+1Glf1YSc8vyOO8iCxYuvTkcwYzkI/6x7ku7l/vkWJ7XVLiAcR1dLOaR01UAIjzF197aGhT7X2UMPZnXAi0ZnhHOCKPYRdDuMZSdcSai+0oaEFddCpnl8yThtQnAfBeJyYCMsfxf3IfwAMQNFA9zDy+oShuS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718736962; c=relaxed/simple;
	bh=GZ8cNz7HxzJEA3fctUo9rko9xv2fpo9Fak4LOEr1XU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WjABf9Epc0ofnNnS8G5i1bct++gvM/q/oshEtSDq7sniBz/Sor9thw7vgaGurG67LjQSUfoHRqy9BI71on+3xT+dDdQoVb+39WRxaaRs5c/oDghUpdt4JSTTTBruXYSeZIgx5nhnDxKxLf0/x9Qw23IY+aF3EeAV4nKZNcEk+CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GeRU7INo; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ebe3bac675so1115861fa.1
        for <linux-leds@vger.kernel.org>; Tue, 18 Jun 2024 11:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718736958; x=1719341758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YzQHQlKHxgZaRZfXLT1ynkXMYrdCKCTUr57+vqG9rY0=;
        b=GeRU7INomSFeMNtL8EVDnQzIoAcfn6UJYd5inJkPB/uTioDG3tZY+aL9ES/3jONXhQ
         M2RgMsLS9L6v9zVuxPtjDo2uwnUvN6acbIaAmgnyL9vMNO9Yv7Ec+a7HSdisdyCo6Hw8
         ek/T0XJ0VuSDm+O31+Sy7ltYOeJYPFGs7908IhiBw96qdYtaDtMnXVgtDJZxXSy5ssZR
         ZIrc1jO3QP3Asb1rIDCW5W5MQP629lz19+618mYuqgLBxVRaX7bv5rZpTo45pU8RWqii
         6C5Sg749OFNPe4BxTDVWKonOE/7HBYSyEbGvfaueQEtwi5ORNuvowcBV7LvQb+39C8Yz
         TJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718736958; x=1719341758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YzQHQlKHxgZaRZfXLT1ynkXMYrdCKCTUr57+vqG9rY0=;
        b=iKj/T4FHTsyYbcJpr3OrzFaxcwXhLJ177xIdx5t3UccQHSvfnBxllkF1j6dCH4ohQZ
         a7NLr1mtBbRA0+mPKu0eIpqwIbVoyLPtJWpcB0yFZjgoxWXZL7JQUlrb3LtZnwzrUSwY
         XpyInV9/ydh+JeMxAuGVkwV6sbFq6daJ0ocBgTcRodPL7cJkz4f15jCfQQb4OPIMwoCD
         YMJAHZMeXH84gondgLpiMEHzTWu355ArkrANrPd3tXfNqOwOsI97XkcBU/W7lcRlY88c
         rFFQLg3fZHBsUMrhyuiBKCxCKjMmTF/yUuUJxv2vXSZnXI7gHurCFTre56UFUznh+xhc
         eTVg==
X-Forwarded-Encrypted: i=1; AJvYcCVvZnDfxoQWw8UeUvto2HRzo6xc0JFeB434hhCWSr9LvSGmdIcaHuGvANVa4F6UPOSdDCTwYeaxofzXTChxSGAAsfEqFq2yJs2mmw==
X-Gm-Message-State: AOJu0YwKb0d8SIVnQrr9kP743uidv8Dl3hv/CB2V1OSlPkmUZu1dNGge
	m/defe1gukqeBPB2NB9KiVa7+FAFwv/+ojt0MdZmgp0HYvbZUZf/YQSSd5VIdLo=
X-Google-Smtp-Source: AGHT+IGC5OJR3gZ0AgVkD1dpAKYbvhHSigXJJVNaqgqzU/pJEsxEJFZWPzPeEkSJ7Z7mUZbZszMNQQ==
X-Received: by 2002:a2e:9257:0:b0:2eb:fcea:2f18 with SMTP id 38308e7fff4ca-2ec3ce7dfdbmr2013211fa.2.1718736958673;
        Tue, 18 Jun 2024 11:55:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec07126057sm17344181fa.59.2024.06.18.11.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 11:55:58 -0700 (PDT)
Date: Tue, 18 Jun 2024 21:55:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Dzmitry Sankouski <dsankouski@gmail.com>, 
	Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
	phone-devel@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 02/23] gcc-sdm845: Add rates to the GP clocks
Message-ID: <lwrz4rvn6ogseea5v6j7plc3yi3xnzo76dvrsl3muat3iswlkb@zmwa3xo3xgw4>
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-2-e3f6662017ac@gmail.com>
 <wnf3mfgdm4p4f5wrxdtlx4wccnizdvohc7iiyu5t22eeb67r57@xun3r73hksrg>
 <ad04e203-4244-4cd3-9c9a-fae002962990@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad04e203-4244-4cd3-9c9a-fae002962990@linaro.org>

On Tue, Jun 18, 2024 at 08:50:52PM GMT, Konrad Dybcio wrote:
> 
> 
> On 6/18/24 19:50, Dmitry Baryshkov wrote:
> > On Tue, Jun 18, 2024 at 04:59:36PM GMT, Dzmitry Sankouski wrote:
> > > sdm845 has "General Purpose" clocks that can be muxed to
> > > SoC pins.
> > > 
> > > Those clocks may be used as e.g. PWM sources for external peripherals.
> > > Add more frequencies to the table for those clocks so it's possible
> > > for arbitrary peripherals to make use of them.
> > > 
> > > See also: bf8bb8eaccf(clk: qcom: gcc-msm8916: Add rates to the GP clocks)
> > 
> > Each time I look at the table attached to the GP CLK, I feel that it's
> > plain wrong. In the end the GPCLK can in theory have arbitrary value
> > depending on the usecase.
> > 
> > Bjorn, Konrad, maybe we should add special clk_ops for GP CLK which
> > allow more flexibility than a default clk_rcg2_ops?
> 
> If we can somehow get max m/n/d values for all possible parents, sure

Calculate them at runtime?


-- 
With best wishes
Dmitry

