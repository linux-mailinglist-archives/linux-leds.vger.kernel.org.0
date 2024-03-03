Return-Path: <linux-leds+bounces-1099-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 466B386F6D8
	for <lists+linux-leds@lfdr.de>; Sun,  3 Mar 2024 20:41:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF5DE1F210FF
	for <lists+linux-leds@lfdr.de>; Sun,  3 Mar 2024 19:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5EB1EB37;
	Sun,  3 Mar 2024 19:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pDabq1Fo"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7261A1E508
	for <linux-leds@vger.kernel.org>; Sun,  3 Mar 2024 19:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709494899; cv=none; b=U5dAHskGXGp5euRGkG6oO+PRlXl1qSeMIIdexYTSagmkrbBJfmYSG2PUbzjcX9uiSX0evl5RvuuL+eCJue+YGH7fvs7AaCkrr6gsf+3QKRjhqgwxRggo/fFjaTS7Smd8+jrmu6XA+vwyFls8a9TkDeNrAQAE7hSKan2pqItL6w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709494899; c=relaxed/simple;
	bh=yH8Iyl/clwz7ah3TSa82CMm2zdGUdQJuFN+sjwh1jTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o5AH4AWcVo8YfzxvLMN6NZ+6mY/7ExhURbRaMNiV9a+IzkOt9aTBRFvKE4acZ/f91KgrIFITErIs7q4VPH+nNr93bmi6TDHQ/lW5FK4LLBJMy7+P+m6TLbRUeOj/rI39Sogkelq2skSi7+d97kWHwqtGKT6OSNu2YOzJIeIMGng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pDabq1Fo; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dcc84ae94c1so3542652276.1
        for <linux-leds@vger.kernel.org>; Sun, 03 Mar 2024 11:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709494896; x=1710099696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yH8Iyl/clwz7ah3TSa82CMm2zdGUdQJuFN+sjwh1jTU=;
        b=pDabq1Fo/E/uxjkEV8Ab4n1p8htShtGbdpCEQpAZ4qWBViqsPV4MLX4pa5O5WwEzPj
         UntQzmeeJRL0ZidY/8TjHrrSHK61norratjQHq7pFdSN+4ZkEZaKZ5vuAEBaVXMbQreP
         tZrY5xrxymzDdUUiDk40Z4NAmLo4ftk82iz5I7qlIa3E3K9QtbcPu+Lpb18uoQVFAO8J
         IHJ7ZTogFFjFQgBRwPKSsSmQmrOjUdACHEL22mtbOKgSVHvd4EGpPnROhqYN71+6Sapz
         7pHRHs4j8+rHIgHrocvKl/PZ4cwN1eYpyPITfk6auMTznadsej7bb03FuQzOzTfLynDM
         Jr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709494896; x=1710099696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yH8Iyl/clwz7ah3TSa82CMm2zdGUdQJuFN+sjwh1jTU=;
        b=akAlH8n+chzzccAH6IF419p8c1/SaDuPKbaUNMd153F6s13FuY4/nKOOqkyWyDxcY5
         dkwZrrSS9InZfaKaYZOJsDvyVvKW/qe1Az3lzvejWW3kE+pb5FDeopmNTGY5dO34r1Br
         8qwJl7/U3gbDEj6Dlum7LKVKgplq3lve2mTfxymVZaCgaLF7Xt+zu794SfUDmmyo8Bba
         X1LIRVKht9YHqrEFKnqFL5RY2MinF8NAoGU6zZGEZTg4ymkK6VKtzNtQWjL2rUbslO7+
         qS8ko+x6WKbGtgiO0FfoWEGInTJ05i2/CaBYHhEByz088pAgwosKmh+vgy0JuMlH1SAN
         2AcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcq6xvmh0qSykywwKez61ut43VdosLeMm+WGzEoBKs2MecC8HxEY0GurPHJRF8TyeYG2yqgambBvWEbtxec3CtxBeP3OOQatktoA==
X-Gm-Message-State: AOJu0Yw6vcrnxGmh/tKtbNHwlFuJRYOdf66nTrqMOmxKkej7g5R/kf9u
	tWHmtX14RGvwjs/hrK7Fv8MQfU+HBqE/UgaWL3fKx49t/iCVgDeXxnSdqEPAF8DC9QosHQrpviG
	XtNKNgM9LaJMRMZqC47UIdifLprERDyLnVfaCcg==
X-Google-Smtp-Source: AGHT+IHW0/nslv9u7HI0yXnFPSD2Ds4CD4VUyxbU3QrHmEzNEYwVNoNeNJMBdXZvU06WqbJKs8wj2rVhJ6JRSfpVQwA=
X-Received: by 2002:a25:824a:0:b0:d80:68d1:b826 with SMTP id
 d10-20020a25824a000000b00d8068d1b826mr4576752ybn.6.1709494896554; Sun, 03 Mar
 2024 11:41:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223112223.1368-1-zajec5@gmail.com>
In-Reply-To: <20240223112223.1368-1-zajec5@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 3 Mar 2024 20:41:25 +0100
Message-ID: <CACRpkdbAjJQbAnB3E5HYkd-Bmb3NhBR_p5K=BHtRy+DhRFa6Pw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: leds: Add LED_FUNCTION_WAN_ONLINE for
 Internet access
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 12:22=E2=80=AFPM Rafa=C5=82 Mi=C5=82ecki <zajec5@gm=
ail.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> It's common for routers to have LED indicating link on the WAN port.
>
> Some devices however have an extra LED that's meant to be used if WAN
> connection is actually "online" (there is Internet access available).
>
> It was suggested to add #define for such use case.
>
> Link: https://lore.kernel.org/linux-devicetree/80e92209-5578-44e7-bd4b-60=
3a29053ddf@collabora.com/T/#u
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

That looks helpful.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

