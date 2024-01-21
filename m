Return-Path: <linux-leds+bounces-644-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E30AA83561E
	for <lists+linux-leds@lfdr.de>; Sun, 21 Jan 2024 15:36:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49F2D28222E
	for <lists+linux-leds@lfdr.de>; Sun, 21 Jan 2024 14:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D49374E3;
	Sun, 21 Jan 2024 14:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tZXCaw6p"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5998914F7F
	for <linux-leds@vger.kernel.org>; Sun, 21 Jan 2024 14:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705847760; cv=none; b=jW813b3BL7vTdgNsq9VBHTzxuroshjUQdO3ZWRKWrRXa6Mo7jsU2KW0Xr6W1aYfSMI4ojlXJwyUMzDSPQjdM+j2SiTED+ToXpJLbXthuFTrP2FdLdLIRoEsKv+U+4Y3lzqd2p7Sm2kpTnxPl5SSblff3qfXo8jl97Caf47rwArA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705847760; c=relaxed/simple;
	bh=872rfjy39rwVRPIkk3ndSS0WStZElYm0Qg/+47Tr7M4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gdta44yp3i0sIK35ut7nr9OPiSmESNDXu19wGW3YgYZLUOyANNFS0j/b4Pf7RU6TKnt5JNL7lyz9SBTsjGUDtVx+rbvMCBGOn0WCHhYXHGQeWvWRnGUK42ApGAyC3fBsohtNsDgMaph+LQa3bMP1aTEDjwlQ99QSE3FIOMHnp1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tZXCaw6p; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5ffd5620247so2904597b3.0
        for <linux-leds@vger.kernel.org>; Sun, 21 Jan 2024 06:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705847757; x=1706452557; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=872rfjy39rwVRPIkk3ndSS0WStZElYm0Qg/+47Tr7M4=;
        b=tZXCaw6pMVa+X8oQTbA5GeBwbEEniZAqVwpANtGp2WRTt4H1BmEHGPW9h8XI8fVaj2
         QPkS7gx7yqMPVzupWMlfUTaSFiHeOKZjh5aK9HzyB/LdcghER1Z0ibSnzC4x5JQAJipg
         Fg/DaoywD/98zdtutlIXAiBMcXYq65Hvzi8XE7/jZrm+hZM/Gdckl9czCxf8pOXZtjk4
         RbF6bEksWScllJR8VcUVrohzLBdcZbJaVRxVUKXlLd9WVagSUE+IowLH4ye+eHolTfYT
         TlUd5HrcW/FUPirKZ2wljOI/LiFt1SQfLgh0ccFhZD9rFaPU7ftGM5xZugw27Qnpv0+5
         faqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705847757; x=1706452557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=872rfjy39rwVRPIkk3ndSS0WStZElYm0Qg/+47Tr7M4=;
        b=T59dwT096LRsXHoD7m5db7UGwj7wALj/y8VrClfE+2HnLfpdH/9njYBqjuebuWw/Q/
         R+wYcR5twpttXQiVjPrPuH8hGXEDHCdYLnOD8jELveK30osYA/azoab6YSvNYBCikTnZ
         4MG9MBmZ1qxbP2S5tR+ivDuy+BXFB88zav85TkmSWKkpMRiSGHw1T1/IhJ3xQSMjONus
         CD1QhWBnOQWLaheFAc6ypTHi5iPlR4xIR8XaUl99LBu2C16RBHNE71byfI5T6X952aDw
         vxYs9NHy18tdck2oO1KAWQSezspLzIJ57CROSEwdUrWsOdSw5mLcbwd8Q+qxau0EzHkO
         6O6Q==
X-Gm-Message-State: AOJu0YyGKTzuEF0rL4K4/Z05ZuonxoWbur3Xb03antE9oUrElEoVKyXU
	uHKdckC3s9xEPyCPXjqn0L5r8Rx+D3SIWd6Gf4x0yFhwbQF+S0S/TcLfiCmx/UlNVB72fxxmKZ+
	SdwYFECE5k4G/oKGh8G0fTwiTTMmhLrG8bDwokQ==
X-Google-Smtp-Source: AGHT+IGJ2DYegRgTTs8ZHsk79g8rkAhLXrTgdRS3BTZclQzp+PaNFA6RmnfZAQEkPgtQz0pMrsua29Q2IC4VA5JrGXc=
X-Received: by 2002:a81:9c52:0:b0:5ff:96b8:f0b9 with SMTP id
 n18-20020a819c52000000b005ff96b8f0b9mr2720698ywa.90.1705847757431; Sun, 21
 Jan 2024 06:35:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240120-ktd2801-v3-0-fe2cbafffb21@skole.hr> <20240120-ktd2801-v3-1-fe2cbafffb21@skole.hr>
In-Reply-To: <20240120-ktd2801-v3-1-fe2cbafffb21@skole.hr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 21 Jan 2024 15:35:46 +0100
Message-ID: <CACRpkdZJyY9oYMt3TvDEGthN-Wvz3t_40t9P-VsgTKCJQaD=pw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] leds: ktd2692: move ExpressWire code to library
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Helge Deller <deller@gmx.de>, Karel Balej <balejk@matfyz.cz>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 20, 2024 at 10:27=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovi=
c@skole.hr> wrote:

> The ExpressWire protocol is shared between at least KTD2692 and KTD2801
> with slight differences such as timings and the former not having a
> defined set of pulses for enabling the protocol (possibly because it
> does not support PWM unlike KTD2801). Despite these differences the
> ExpressWire handling code can be shared between the two, so move it into
> a library in preparation for adding KTD2801 support.
>
> Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>

This is great stuff.
I looked at my KTD253 driver but AFAICT it uses a different method:
instead of transferring a numeral, it increases/decreases a counter, so
it can't use the library.

> +extern void expresswire_power_off(struct expresswire_common_props *props=
);
> +extern void expresswire_enable(struct expresswire_common_props *props);
> +extern void expresswire_start(struct expresswire_common_props *props);
> +extern void expresswire_end(struct expresswire_common_props *props);
> +extern void expresswire_set_bit(struct expresswire_common_props *props, =
bool bit);

I would skip the keyword "extern" since it is default I think even
checkpatch complains about it these days?

Anyway, no big deal:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

