Return-Path: <linux-leds+bounces-5918-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 052B3C11DDF
	for <lists+linux-leds@lfdr.de>; Mon, 27 Oct 2025 23:48:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D023218934D5
	for <lists+linux-leds@lfdr.de>; Mon, 27 Oct 2025 22:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1F38331A54;
	Mon, 27 Oct 2025 22:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KZZdxYt0"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5039232E12D
	for <linux-leds@vger.kernel.org>; Mon, 27 Oct 2025 22:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604954; cv=none; b=RdvrcZ5Rud6ldipk9JtT+Kuii1kGZ7rEXDE5oPka7akR+w3Ba8E08rMr4Qbw/VIZDdaVN3gF5zOwPU5/hC8eA15qcFwBXWRnWJiwTTBG8zNirVERS7F9wRLw82mOKFpxiJDU8F14T1EY7BSZRHxkSV9aFOXpbRNKM3A78N15HQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604954; c=relaxed/simple;
	bh=mdMs/b0H8ZKYdk7N+cLM+Uj/aE/vejpLNMBlaSFUExo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PKOXYYX4mMq3VmmC6TNttCXzp66Fe+ktBgiekGvWVGJDoivJVqn+7OmEYU/mNYmJ9k/b2Q31ks8KZGlVuEMWkLfpBLtetE7oaFSGIDYD5i95SrNRYsZlUHi4vK8514rvY2EbQJ6mYtWwpmvOfeNdtYAbMJ3UuYxJr2aDnfBHUwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KZZdxYt0; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-781014f4e12so65409167b3.1
        for <linux-leds@vger.kernel.org>; Mon, 27 Oct 2025 15:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761604951; x=1762209751; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEbWuq+sA3qayyKc6Q0Zwp+mZTGvAg5r2iKjERsSY7s=;
        b=KZZdxYt0Z2WZKZuPgT5rRan52bxSrRh4T492YeoJIxeDY4LeXNDR+R3yOnRnZyzVb8
         KBlWPmFy+95MRsIPWWq05i/z4Vn8LC7vRp0/hibWv4bpyEPuRJpN8p04JKGNALA59BXB
         r3b3PPsDTPdzYTJGjWqbufP1y7+F4e3Z/hYN3mc3SqLZRCp6/byeKiquedgj54rR/WoW
         zQl9+qIucwctk7wZ2brLUUZ0eQi/1r9U9SISaTDla8dXL6QC8+0YkkCn12F12/lVVHm5
         EdDcsB2o5zlBZs5CEApaknmyKahuQv4I3nfHGGpBcs/xheH7rog0kOa5jFGtyALH4ZMW
         qI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761604951; x=1762209751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FEbWuq+sA3qayyKc6Q0Zwp+mZTGvAg5r2iKjERsSY7s=;
        b=Caw7pcxyySWLGbZg4NVvSR8T7qoR0yN5REG4HzecyI07muWjht4Grswc/+Mw8QmQL2
         3OmlTGYZseQKLZFjUqXD33lALfwcyTzIfpuaeb9lM8QuVI/XR93+vNO5AccWaarjgGvD
         EeSoP4mIfJ7JtXQvvbe4hbAbXFy7GKKWvYpSwfL8F9INZx7zYxjEUqpOhMZIrzzQFNSQ
         u//PcGPNzCxx8ve0xIjzmB4GNYJrV4ftEfBjjSzRaMCO1uckZAxjuJOa7/fqBzeLrmVA
         otR7Bqty6r4Fi0Ug5Pvii/wWW4shEJ2itSNOCES7+4ThHN/siv062DPLtzhialWnx9ZD
         ldWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnYUQD6I4uWM/o/yFL1eNCANdVL0Y3j4T3YawBQGrE7CS3cLH36pPcU1AO/GBbxaFzYHAfBFXP+mTA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7T2F1PGE8cCefpBlaX2O+RwJ5xwZP4tWy7gL2Isa7yMTHlJin
	DGf8ynARf/DbVy5Z6abAsWvM26KDhykHFMQwRmMl5e3m/pD0SmSpSgahA1B4lVnpW2DfoW0IRsS
	DEOMy0hF6o2iBAB5vBjqurTYf2de/3iL5m4Z4DPu76g==
X-Gm-Gg: ASbGncswXZrkHUV156szBxwlwX5qG5iQXjCvUd9VYsw2kWrWzJpgAvhVK2z1VGnXLgy
	DMhqbdKli6JuRTciaXNMTf/1m5W+H2CF+QNLRYe4sKiYkx2ByCqLKvwcIvlq+X/rbm+pE8Xi7HP
	YQ6b7sYbbwbkHe/Jbkh30A2+y3+mflMKU/6oDQJd0Wd7mGTDUd9YFZzNEJBxygV3bQNIHUzAX1E
	QRo2ZEfKvFSJ92rmTI1Js1agaeNhMSb/naZ68+IJkIJurFwUUGtxINPBoaJ
X-Google-Smtp-Source: AGHT+IFea0a7SdSezzmFvdSfx4jiKtpkMteXYqF7MqSlxI3OsRPCoABiY/0t3pyhk2zywEU29O2vl188K3Ur1ROhIiE=
X-Received: by 2002:a05:690c:3684:b0:783:697a:5daa with SMTP id
 00721157ae682-78617ed7dc7mr16221547b3.30.1761604951123; Mon, 27 Oct 2025
 15:42:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761564043.git.mazziesaccount@gmail.com> <a5957c4f83724d4f32527fb892fc340af4eeddde.1761564043.git.mazziesaccount@gmail.com>
In-Reply-To: <a5957c4f83724d4f32527fb892fc340af4eeddde.1761564043.git.mazziesaccount@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:42:18 +0100
X-Gm-Features: AWmQ_bnqjdOEx6PHBZRMUEpMuG3EOvSnhd1cnxA8WMLK3e2WMcsLHGdno_I3fzM
Message-ID: <CACRpkdYEUdJRvNPKhxx7orYHH3OE6BXXjrG9JVJo5MDHGKE88A@mail.gmail.com>
Subject: Re: [PATCH v2 04/15] dt-bindings: mfd: ROHM BD72720
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andreas Kemnade <andreas@kemnade.info>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matti,

thanks for your patch!

On Mon, Oct 27, 2025 at 12:45=E2=80=AFPM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:

> +  rohm,clkout-open-drain:
> +    description: clk32kout mode. Set to 1 for "open-drain" or 0 for "cmo=
s".
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 1

I think CMOS is the same as "push-pull" ( I could be wrong, but I think I'v=
e
seen that before) so I would probably try to use the pin config standard
names as strings here but I'm not sure.

rohm,clkout-bias-open-drain;
rohm,clkout-bias-push-pull;

Mutually exclusive.

Or maybe use the pattern from rohm,pin-dvs0
with string enumerators?

rohm,clkout-bias =3D "open-drain";
rohm,clkout-bias =3D "push-pull";

?

> +examples:

Maybe add some of the exotic string options into the example so
people will get it right?

Yours,
Linus Walleij

