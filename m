Return-Path: <linux-leds+bounces-6067-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 88491C49B21
	for <lists+linux-leds@lfdr.de>; Tue, 11 Nov 2025 00:04:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7771A4E7DEE
	for <lists+linux-leds@lfdr.de>; Mon, 10 Nov 2025 23:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D042FF648;
	Mon, 10 Nov 2025 23:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UhQ1D1Km"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735032F691B
	for <linux-leds@vger.kernel.org>; Mon, 10 Nov 2025 23:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762815867; cv=none; b=YFEVfGq2b4e4QT1wC0UyfpJzmM0VwbEi26GfcBWLFZnEPjGENxAZlmTO6sMbz0sCGis1sIePnxKc+65PzphFy5IEu/WyK0ps28Z43BpY+ahLaewCiNBiuc/76c/LXFwc/pXXGX8jnBoVuqTmulzwguoGjee/YnQJFmKDb/T03Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762815867; c=relaxed/simple;
	bh=iJtkiZUOo775Ftb6cLEsbpL0tmdErWFS9CRdvdq4yBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WLssv6GrEzAKtiu9tQVfH9xSw6L07mgdFHc9xNHOXdcusGYU+R6mUWhWWHePEbdfLEJLvrCDfppNp53l7BVQ3lEkWzi6Yy6osj/4Y7fVguc0MuFyJMzRQXfWV0rq01y63zZqwx0etfoRiNzjhgYHvpARjFtvJ4UABq93YMtUg7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UhQ1D1Km; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-71d71bcab69so30951387b3.0
        for <linux-leds@vger.kernel.org>; Mon, 10 Nov 2025 15:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762815864; x=1763420664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJtkiZUOo775Ftb6cLEsbpL0tmdErWFS9CRdvdq4yBY=;
        b=UhQ1D1KmPSyna4F/76ZCUiG8KhIv95nF4dhc49qrIM3p2GzZR8fl4PtKw6Yk5uaenr
         Jxo6B1MPDizlQu/eAzhlHvAjPysa3NgZUqffrBat8sUZCey95AmWJHKnSMiP9zRpfVwn
         yDf7hD9zPMNJY5K/TDMfIBp874x/FBBHi88+dxfp8g2/um8X8UHQj372t+OGfbo82eR1
         O1hbOAThw5oCk4Sy/TkWbTHXa+HDjeRny+D/HCyIsPlxXxKrnhIkL79zMZOuophqGxN7
         HEm1Hqzly5dxGv5sdqIOUUxBQAtVaiVswEfsuQw5gUpO4MhmxEB5Nma4Cgn7+HcHKITN
         65kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762815864; x=1763420664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iJtkiZUOo775Ftb6cLEsbpL0tmdErWFS9CRdvdq4yBY=;
        b=sKom15LvYBQDj566R/s4azx5Ty5bJM8lHy7MQheVq3wdtBs/I8+Peqk3OwdZrEoLVI
         6gqCejgU1YpA8dySFywnQhaUoiM7kLvHGt6Dp7CBK/dGe1F/20EbTrbvSysEsfMQd2Vo
         XB324/6eHEvGaDHOYuAOPv2Wlpu1mJNN0T+J6mUdP3lmbrPtzBhskljHgrLbX05GmkAO
         61jWhLUdeQPiQjxCyvQ77NIYKjxGy7AnMdTF4DF40uKk9C9hTQay/aKp66CI9U7nmqH6
         HKWnisQpmmLhMz+MaoXe93atNfEJJIiWpRW6NI1imbqmbSDtRYD9WP10A4VX9c2f3D+Y
         xHfg==
X-Forwarded-Encrypted: i=1; AJvYcCUtXbnTkgjl9+kFyyeZ0WWXPf8YtDmdHuY9D/vG+uF7U1OTk18F087TshI8GsX5086hutDEtdRLTXOh@vger.kernel.org
X-Gm-Message-State: AOJu0YxvhwSS0RV2YMA/OYyr9Z1r7TfrQ+TwFDI45nF0Pl+hvFP6Bk9F
	qivmeB+Lc2EICIBRlVnv/3RVYVlMOuSEObyon0Pgs3nsOpN4B1101BRFlnKMsJShWIPV94cCB+W
	cKZNiUvT022tS0WM3JYCsbuRt9InJHSP1aknUun7hlA==
X-Gm-Gg: ASbGncsgR2xYI9FWq3R7zWaI2clwySfSyvOaPq9IwRftr/b0tgi7SwQQfgPxsvZ3veu
	vl8ai+Fmie+HiHOm2ziyomJOk7M3aebmAFww2/UNAo/vdiX8iL8zSmyLjFt2SS9+eTRWtwzK449
	w4GtPKut82GwCBmQUgAbForEz7rnyFbev4tqVjz+FlQ2TGzhH08B5Mk0bZ7pXIvA1eJpLlbktcu
	OzGNX5viY6s21yF2C3+mA/3hX6pN941IQ6xAu+LYWxCItcpX2NcAWArLV7AfE0pU/XmlDk=
X-Google-Smtp-Source: AGHT+IHoC/R8TGWkSsRmVYTrTznpjr4STw1JDCmsU2sbR9qoad5PnTy6Rrlwiey4S9ikwN3xlZNQtXBlBuI95lMoqZY=
X-Received: by 2002:a05:690c:6385:b0:786:4fd5:e5cb with SMTP id
 00721157ae682-787d541b7f3mr90568307b3.35.1762815864323; Mon, 10 Nov 2025
 15:04:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1762327887.git.mazziesaccount@gmail.com> <742fcdcc8b6dcb5989418e8c1cf5a7d7ba5434a5.1762327887.git.mazziesaccount@gmail.com>
In-Reply-To: <742fcdcc8b6dcb5989418e8c1cf5a7d7ba5434a5.1762327887.git.mazziesaccount@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 00:04:09 +0100
X-Gm-Features: AWmQ_blNtjThswk7W8THjiE7tdsgu2zFtwGMw_ARgVxMcfWy78tjHu1U0YBhMO0
Message-ID: <CACRpkdbP-GZXtj_-AuZ=q8zUKwt0qWQ1L6v7WsoQ50JwTs6JUA@mail.gmail.com>
Subject: Re: [PATCH v3 02/16] dt-bindings: battery: Clarify trickle-charge
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-rtc@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 5, 2025 at 8:36=E2=80=AFAM Matti Vaittinen
<matti.vaittinen@linux.dev> wrote:

> From: Matti Vaittinen <mazziesaccount@gmail.com>
>
> The term 'trickle-charging' is used to describe a very slow charging
> phase, where electrons "trickle-in" the battery.
>
> There are two different use-cases for this type of charging. At least
> some Li-Ion batteries can benefit from very slow, constant current,
> pre-pre phase 'trickle-charging', if a battery is very empty.
>
> Some other batteries use top-off phase 'trickle-charging', which is
> different from the above case.
>
> The battery bindings use the term 'trickle-charge' without specifying
> which of the use-cases properties are addressing. This has already
> caused some confusion.
>
> Clarify that the 'trickle-charge-current-microamp' refers to the first
> one, the "pre-pre" -charging use-case.
>
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

