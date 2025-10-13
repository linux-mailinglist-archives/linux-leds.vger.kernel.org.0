Return-Path: <linux-leds+bounces-5760-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FBDBD31D3
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 14:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 132783A41DE
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 12:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A493269D06;
	Mon, 13 Oct 2025 12:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PcScEYLT"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D0D26AA94
	for <linux-leds@vger.kernel.org>; Mon, 13 Oct 2025 12:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760360324; cv=none; b=aweffUqzPPWt3VYxeZ58mrvATr1CSxnQ7ck1KAVeITaSjAbsrIc8DBt3cXenNWGZXBvtx5CZ1fjsx392oBI/P137Rt/fXf30OS5M+uXu18JqEBNdiFQITR6ud9fcRhWwYFlBIcpoKjBLobfz8+YGGF2ZbCvRxEFJt5oP51737Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760360324; c=relaxed/simple;
	bh=+6DOi+zFDcSixxAiCDvNV19cTvKji5N4xXay/KDy6tw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LTNNKMm1TX8ssDjdlH6RqZcfPpOYdBGmJIs7X2XpvBueJZRu9nOHVY1b3yVfq+wMNpCtsXQY8duFvGqgEKT3TPVGVdasQ3HNhBhYOXPxTwpzS4F3BABfC0D4E40RUlnhpBv/MNWzFYz07222321QL6CUrVLYtR91XALBgnpPwA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PcScEYLT; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-368348d30e0so35289411fa.1
        for <linux-leds@vger.kernel.org>; Mon, 13 Oct 2025 05:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760360321; x=1760965121; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Ht5/EMJSIYJ4/8VE7OBxc2V6zKOUNS2Eq3oer2OJVc=;
        b=PcScEYLT58MFeR4j2VmdBnQ+dVIb1gkRCReMkRUDr+BNSxT7yx9km3MBDi0NfAVMOJ
         kgpqBxXwWU1FDNNy0ZnIW0WNtkjtpe+hohNtsiR1tEVhhwko0trpJMN+mcVWk5RtI68A
         l8RHFHpe+ZLPwbE5RD7+kw/TgTyJ2raBy0xBysTKJs0IJTaIDyPIuS6EJphfRj9vQ8GA
         tsti1YsJv7Lb8FP/fsJQgX+N35SuQ4fjV31bwVM+69b4ruuEi+7ezTQOtsQPRT77yCSJ
         QZiyrbtnRoAF/8NiyuDEb76gsOmZxaxqJiRLOyJ6OHuASTXS524Szaxdq/McFlpSXa+h
         L2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760360321; x=1760965121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Ht5/EMJSIYJ4/8VE7OBxc2V6zKOUNS2Eq3oer2OJVc=;
        b=RdSLbNYtT0VsDzuy+CYZ1cedqGG/HIUAGfBYY0WMvFDL7VePzbZfOYMSkw3RS8+uIX
         /LAbjI07VBN5fw8fIeC5O98Q08G+CQKD7fg5YxoPenhJRdkU1SjLONKySaFMVh7VTfED
         /UbqSOxJ3M53RYqjyRSO1UVKWcymgvIuhZ3bOtPTb5MvGbrDrghwAO+D37/zQWnVpBPG
         OGVY9QUIFUqOxfhvZCoPvjvGwRMNCY1msMNbbP9KXvbz2zdBDv+Yv3ulEzgyJJ596J3T
         isyTMiRl8040UZD/4GtENNGjwUPd0X+tlwWn2VLFjCvoDbTnotsUh03IBZhGss2hjWUG
         xTGg==
X-Forwarded-Encrypted: i=1; AJvYcCW0LvOZipiJdDgh7gZGRb/mrj27Rd6SFNkKOz4eiXI22xNIFICFw6m4Lje8SWCgqhIu3UMoJlKaw1HE@vger.kernel.org
X-Gm-Message-State: AOJu0YyutSqjdU5J4MPqlIBNAMTV88okG4Hb1ahnLHGyHuu3YWjlwZnD
	Ic83VQRoJ06EvYKpPOc2Nxe6w7cXtJEBUAqVaNjPQ3I9d5PevYxuJRt0zrBRy0XKuDtIJE2BPKl
	Vl8aoxaCavZuuN1zxWHUJkfEtl8h/YLJ2q101q1dJXg==
X-Gm-Gg: ASbGncsIwmkEPBcGatwkw2h7Hhbp9lGf0xh74PBqJ7R9LlqFPhYoF5Xuk0g9PqfaI8V
	BzWHdhOrTrymSybLqmgLNSJuE/Pfta6I+iIOKsawUt3vL65GtC8yOq9cylxEml9HUcxN2o+xpDd
	TI55sI3CySbfG3vsn/ilyA7HyeG01dNj+eAOPqcdaUnmYZKnXVHMliuEx3oL65UMDXFns5i2WEP
	T5i8iGrPWTzVFVweNBQPqB97XnJ59MMhaeXYQkz
X-Google-Smtp-Source: AGHT+IGmJcna4P1VxV3V0jOZ0m71QIrApGlSi2MBhjX9FcOguThuom65noGE6ae3tVCG0FCkFDEalP3RVaBolboPqdE=
X-Received: by 2002:a2e:bea6:0:b0:372:96c1:b276 with SMTP id
 38308e7fff4ca-37609f4d946mr54391151fa.45.1760360320778; Mon, 13 Oct 2025
 05:58:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1759824376.git.mazziesaccount@gmail.com> <fe1f4a0947c864496f4eeec8eef806afcf6094a4.1759824376.git.mazziesaccount@gmail.com>
In-Reply-To: <fe1f4a0947c864496f4eeec8eef806afcf6094a4.1759824376.git.mazziesaccount@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 14:58:29 +0200
X-Gm-Features: AS18NWAGQ68Wo4eF3C0qjr38optVh4QvaXrsoq6Y2fimhDOSTIOXcNl51Lg8PsM
Message-ID: <CACRpkdZnoMvYBXN7b6dw+uPs=f1WXr9wX-0VF1c1qd-rq+17LQ@mail.gmail.com>
Subject: Re: [RFC PATCH 04/13] dt-bindings: mfd: ROHM BD72720
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andreas Kemnade <andreas@kemnade.info>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matti,

thanks for your patch!

On Tue, Oct 7, 2025 at 10:33=E2=80=AFAM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:

> +  rohm,pin-dvs0:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      BD72720 has 4 different OTP options to determine the use of dvs0-p=
in.
> +      OTP0 - regulator RUN state control.
> +      OTP1 - GPI.
> +      OTP2 - GPO.
> +      OTP3 - Power sequencer output.
> +      This property specifies the use of the pin.
> +    enum:
> +      - dvs-input
> +      - gpi
> +      - gpo
> +
> +  rohm,pin-dvs1:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      see rohm,pin-dvs0
> +    enum:
> +      - dvs-input
> +      - gpi
> +      - gpo
> +
> +  rohm,pin-exten0:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: BD72720 has an OTP option to use exten0-pin for differe=
nt
> +      purposes. Set this property accrdingly.

accordingly?

> +    const: gpo
> +
> +  rohm,pin-exten1:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: BD72720 has an OTP option to use exten1-pin for differe=
nt
> +      purposes. Set this property accrdingly.

accordingly?

> +    const: gpo
> +
> +  rohm,pin-fault_b:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: BD72720 has an OTP option to use fault_b-pin for differ=
ent
> +      purposes. Set this property accrdingly.

accordingly?

> +    const: gpo

These are a bit idiomatic, not using the actual framework for such
things (pin control) BUT: they are on the other hand crystal
clear for an integrator working with this device tree, and only
four pins so why over-engineer it. I am fine
with them if the DT people are.

Yours,
Linus Walleij

