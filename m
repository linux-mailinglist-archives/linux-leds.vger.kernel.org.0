Return-Path: <linux-leds+bounces-655-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB88E836FBC
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jan 2024 19:22:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1895D1C26BF3
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jan 2024 18:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7809F4CE01;
	Mon, 22 Jan 2024 17:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F3SK6Tjl"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DCB4C3CC
	for <linux-leds@vger.kernel.org>; Mon, 22 Jan 2024 17:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705945837; cv=none; b=kfRDEGlbIIMIpTdFdzXj379pf1gxeCpusyg0h77zSNKOkmF4VvwTvxs+Ok2tlYutk5jimWyP3xYy0+KcqXRMJIiTxOp47+3z1KcgVCDdt8gMd3mTQBxY0vgVMhYygxU9Kqq3phbslClpAiMn06s+844IxY5npg+5fatG++r8oJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705945837; c=relaxed/simple;
	bh=xLPMMOi9U5aA2QOUyNYRwdev7zD4A+KnUqD+T4+EA/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K4B589bBKi5jJz4OnS0cpIayZ77SyGxsnL3D3MUkTWc1z7sXywTuR4MPyHnZzXO5nmweq/0+zC+S7QjOZQG6Ln/lmlocNAonEcsoJXcP6IP/otCopF3dHrnGSuGylOhH1i5VpO0KJ7pGEwb87PqZOinkpcfiARC9xMeXhOA9kWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F3SK6Tjl; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3367a304091so3816840f8f.3
        for <linux-leds@vger.kernel.org>; Mon, 22 Jan 2024 09:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705945834; x=1706550634; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sYGuiuUN/VCPpW9oWOQ4p73+grZOykVwihNpjjDuv0Q=;
        b=F3SK6TjlNfQnBS4iXAAc0b9u8u04WFz0BR17agbw8LPd7czINCOtAvlubBLCcdN8SN
         Iptkxj8v2kLA1hD8xExxhw//T+icNkTpoyiLV3tbzGANVQY8vtzflRJ4r49vQ/iL+d/C
         T2e6K3UOUeJl3D94hie4a2pHfJb0Lp+CWygjk7wPIWElGw2A0AZMOntSoFSLLEXc9IVc
         LPDmA5F2W5g9kOfjmr+DYpXc9hKbpTnEN5jQ649bqx64YApBYnLYKZBdI/3OFrstB2jA
         HJgRegE0xklM7YWjyHkSVYILVlofiME+Pzn1sqc4YipxIbM57oRgigJtixgInp/J21m4
         vVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705945834; x=1706550634;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sYGuiuUN/VCPpW9oWOQ4p73+grZOykVwihNpjjDuv0Q=;
        b=I0/R1vGUi/rLnU3Aaz1vSzt81HvYfzpbhDTCKEItDZXQYevzhMTej7e1s8eIbvjkTE
         nyMpkD4nlNC8cGQal66cFyRT1Eb+mIzPFaaBi0Ub3pzOffAcyVZCDUCr2LkAl6+wDjVT
         cDJi/1aBLf1giubESC47383QqM/qAJcoI4pH5mJpGpdtSpwViQaExPy4xnHZlV1q7STT
         TGDoQGAYOsZwXmap4X0d/qrddkZsG9+vBwmbgG5gQn2/4LY0PC+uACkl0II8J6rEILrc
         3ttyJyJEwnGZEKs1QOv8UuvLsORgd2G0Yehh1y5kJQbh9JJ35owhELtfll7Dhqi8i+uO
         RNvg==
X-Gm-Message-State: AOJu0YybTCl5yk5AuWUVjKrr1NuHKKgMHfcJug8drDVMmhLu+mQbCwEo
	/WpeoKOqUyvm46OxMWhVzrhTebIIVUy9kZsK8kOskt5JzPQzEmseBc3UNJ6DL8U=
X-Google-Smtp-Source: AGHT+IGMKjXfBPPqRjfBziR7QI5pQ0EzWnQZly3+fsLmJWUOsG/MDJPaYvuxqQs8u+NniIHlytAXNQ==
X-Received: by 2002:adf:a199:0:b0:337:bdf2:26fe with SMTP id u25-20020adfa199000000b00337bdf226femr2086857wru.161.1705945834114;
        Mon, 22 Jan 2024 09:50:34 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id s15-20020a5d6a8f000000b00336898daceasm11996072wru.96.2024.01.22.09.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 09:50:33 -0800 (PST)
Date: Mon, 22 Jan 2024 17:50:31 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Karel Balej <balejk@matfyz.cz>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 1/3] leds: ktd2692: move ExpressWire code to library
Message-ID: <20240122175031.GC8815@aspen.lan>
References: <20240120-ktd2801-v3-0-fe2cbafffb21@skole.hr>
 <20240122165011.GA8815@aspen.lan>
 <23373359.6Emhk5qWAg@radijator>
 <3603320.R56niFO833@radijator>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3603320.R56niFO833@radijator>

On Mon, Jan 22, 2024 at 06:26:04PM +0100, Duje Mihanović wrote:
> On Monday, January 22, 2024 5:57:53 PM CET Duje Mihanović wrote:
> > On Monday, January 22, 2024 5:50:11 PM CET Daniel Thompson wrote:
> > > AFAICT nothing will inhibit setting GPIOLIB so allyes- and allmodconfig
> > > builds will always end up with GPIOLIB enabled. If we are happy to
> > > select it then I think that is enough!
> >
> > In that case I guess I'll just make it select GPIOLIB.
>
> Nevermind that, it'll have to be 'depends on' after all:
>
> drivers/gpio/Kconfig:6:error: recursive dependency detected!
> drivers/gpio/Kconfig:6: symbol GPIOLIB is selected by LEDS_EXPRESSWIRE
> drivers/leds/Kconfig:184:       symbol LEDS_EXPRESSWIRE depends on NEW_LEDS

Can this dependency could be broken by declaring LEDS_EXPRESSWIRE at
the top (or bottom) of the KConfig file (it's an option without a UI
and does not need to be within the if NEW_LEDS block).

I'm aware this kind of change could provoke an argument about which
sub-system the expresswire code should live in... but I think it's
a worthwhile change anyway! We shouldn't need NEW_LEDS for this.


Daniel.

