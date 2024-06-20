Return-Path: <linux-leds+bounces-2074-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C389112CC
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 22:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED2551F230EC
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 20:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403F81BA07C;
	Thu, 20 Jun 2024 20:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v07k7aKO"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF391B47D7
	for <linux-leds@vger.kernel.org>; Thu, 20 Jun 2024 20:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718914430; cv=none; b=Tw36dA2gdtuhZskThxj8LBUkuJyp/9F2ucoh4f2BA9HdaHcmUAp7LnF4as/YcnkveWs7jzqTk0jqto4f0nGwvICuW/Gw0I8N2AktoXHQ6MxxwufhO32M1DkIqrc8J9rZRrZ00a1qP+VD/Ik4okDWq+ro1l4DtYjYnpN97Yc3zu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718914430; c=relaxed/simple;
	bh=6FnKxC2oNZkMYNiFsU+CMhRZU/2u+PXH2Xg0uEEq4BQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a88u90VMb5Isvqg5bkkiTymOqEIJTcUSq8MI5BEL5OjQ3u8v5x6Ef31KE2aCnRkn7GRVuIr9DvmaXa0zkhkX2QSwl4CFbeh9zDRQ8tK2DMSY+WtCgcSbDRwEOpwuwuqyviyZOi8jlocOScnBZsWM9/tkzrZrnsHvPauyLXi/Z7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v07k7aKO; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eaafda3b5cso14436061fa.3
        for <linux-leds@vger.kernel.org>; Thu, 20 Jun 2024 13:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718914426; x=1719519226; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gf88bxwZuTUs5YXwWPX6yadFRnjP9I8sFXH8/ud6MPc=;
        b=v07k7aKOFKW1LD4tidMaju2MCZrGuYlTNaXBmlccEh5lil7gRIiog25J8q7wDde/Yu
         dFLKtwwVimNMoQwz6mwKt1VAYalED0YsU9mxExVV6x6Xx+f+2oqmhDnr76jOLjdvxEtS
         oetI96YKomXF2TM0FjPdutYa/gZIXQYaZ1KKsSDfd1j0l5i6CQdoDL26unODSpuNqtDx
         WEdM7woVtlJOEogvD2nQxWIQnAtcBly5gVLY5wuq9URPA9A9JOPlSAPuInwyz3vqscCe
         RbtUKCRGF9d9B62fjsLhlleCEog3o+xNY3KiVhPonLh5wSJzRlFR11Yuh0Kozvm+YF3M
         grjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718914426; x=1719519226;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gf88bxwZuTUs5YXwWPX6yadFRnjP9I8sFXH8/ud6MPc=;
        b=VcxVkbZkxECP2MObJ3+8/hMjht9D5ZaAgXSa2Vz7gKvPqpNnrwAyi43vof7BpW6QYK
         OyjGkD4UpTj9WeynvJE1FW5mUZhUD1txlkSwUhTSdJww0LzUApzX36KM0qAUhRUDlrYL
         lcc6MWpNkiXxQAPTUHWsT3SS3oM4rfTChjgElG4X+mC1u2qPXvNI6CcnopCyvcmCvozK
         boCYKyuvZRs3TX079xkbAdlIEssEigZ06/klgY9rVuvEUFbvCa3uxr1SFIrsirygrGVA
         k24rStKlRJcy/8FnjHbxp+gmFADivlh/lTngYhDiKsKSwXQkaBRqantCM17RPsld+BmF
         6wJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhncYx1QtMZed/dQA8f4nFxULd9vw6Wdu6jwBWywmIRHMApkG7ZitMLOjfH93OtAj3GqkK5Um/DUaxYITBom40Js+BYF56ipg/WQ==
X-Gm-Message-State: AOJu0YxH+3gJXJgI87vWdAZOHQ5H1nH3rwxuSxrO81Tkh85c5b9SEH9d
	7TQjz+JinvlfjmhemZBGhzH594Xaev8Hroba4MQXkU3ZHvzOJbCM4SPkSBdcJY8=
X-Google-Smtp-Source: AGHT+IHmscm1ta08k7kKifcSjPxr0pk1YHMHeVkmRekDXSZgsUcQQz9WUuxqquxICdBXbipcg1QQvg==
X-Received: by 2002:a2e:9b0a:0:b0:2ec:2583:2ba5 with SMTP id 38308e7fff4ca-2ec3cfe8b1dmr40485741fa.36.1718914426346;
        Thu, 20 Jun 2024 13:13:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec4d757f9fsm104511fa.73.2024.06.20.13.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 13:13:45 -0700 (PDT)
Date: Thu, 20 Jun 2024 23:13:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Chanwoo Choi <cw00.choi@samsung.com>, phone-devel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 11/23] drm/panel: Add support for S6E3HA8 panel driver
Message-ID: <c4g235wj3yfdftnwqe3pbupifhy5ploo7chumdgfnl4skzuahf@ftuellx4zwsn>
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-11-e3f6662017ac@gmail.com>
 <pkmxbxoc4sno6mbjsftz6hp5lxefc6yhwxjlhiy2pd4wbkzpvl@as43z4t64mm6>
 <CABTCjFABEY0urmgrr5E3-oq9u_aNR8KcCTMpJpoGLOTPOfKAGg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABTCjFABEY0urmgrr5E3-oq9u_aNR8KcCTMpJpoGLOTPOfKAGg@mail.gmail.com>

On Wed, Jun 19, 2024 at 04:27:40PM GMT, Dzmitry Sankouski wrote:
> вт, 18 июн. 2024 г. в 21:39, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>:
> >
> > > +     ret = mipi_dsi_compression_mode(dsi, true);
> > > +     if (ret < 0) {
> > > +             dev_err(dev, "Failed to set compression mode: %d\n", ret);
> > > +             return ret;
> > > +     }
> >
> > Interesting, compression mode is being set before the PPS programming?
> >
> Yes, as per vendor kernel:
> https://github.com/klabit87/twrp_android_samsung_kernel_sdm845/blob/e8bb63039008e1704a2f1bde68d39ded9c16ea88/drivers/gpu/drm/msm/samsung/S6E3HA8_AMB577PX01/dsi_panel_S6E3HA8_AMB577PX01_wqhd_octa_cmd.dtsi#L5508

Ack

-- 
With best wishes
Dmitry

