Return-Path: <linux-leds+bounces-5757-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C239CBD2F92
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 14:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 899FB189DD94
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 12:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF32D189BB0;
	Mon, 13 Oct 2025 12:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xBMizyL0"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98562749ED
	for <linux-leds@vger.kernel.org>; Mon, 13 Oct 2025 12:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760358685; cv=none; b=qIvCIjBoFOeZqtjwPlNChvnWyTpxPobHN9lDuyc1lijTIoN7QLyBpWm0YR9ZNxAaxXnqnmC+OonEVEmqRE7YYje0sM9K846qMS4OKlJps1Brq0rs/UmOIy+Wg5OmoA2dUJbiL5jmzxrfA4RaDO1JL+6+rPrlAPXed5gmEmKI968=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760358685; c=relaxed/simple;
	bh=2ym5gY9xA9byPvmYe/LAnl2zuqmEeBpK22V+iVpRSl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rRq54lEAhhaNn4tkNQ2dHoospFyRByxJxIXZEtqWGRsnR3JzZ+kGW/aZ2dlh2CC6WiA4QuiLAiyJBmEanJZ0P1Q/figKSPJm8AqtSKo/0X/N3igQXOQWY1FOV9pxC3wMNcD3c32N8f7jF+y3ZaYYY2yWvv1MNekel5+jx87bHEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xBMizyL0; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37634d352dfso28582451fa.3
        for <linux-leds@vger.kernel.org>; Mon, 13 Oct 2025 05:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760358682; x=1760963482; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ym5gY9xA9byPvmYe/LAnl2zuqmEeBpK22V+iVpRSl8=;
        b=xBMizyL0Yx4d+8V+t9wiLgRPf4qBDuLUoSk7nAy7nMVbSgvUM5u6sVw6tdW+UOA0uK
         WTIaGuK/YSQkX5xE1xkspf5Xa8gbM1P603nTohLUMWTaU0PMp/DgUZhus22CfaPt2+cq
         MaKmkZjnlRhLwtqsnNMi4HYh65DKMhL2kdvMkZWR5+8nM2R43uU4zYwwP7QDgPtgaCZt
         V4c37OkRydHs1F+K5HSRt+HJ1Vy+0DzwIHxwv52ibtuVYlnQYN/npAviapyFAIy9L5fO
         UUOcOoLkdBzTFAHTy41/cG6VBDJzAkrOAI3lAnyueZY64p90rNQa/8q80sH8i4GYdrWa
         CB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760358682; x=1760963482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ym5gY9xA9byPvmYe/LAnl2zuqmEeBpK22V+iVpRSl8=;
        b=DU3l6mlmQiEeKtEqRhxDdb2p9B1KSHW6c6TwTjWKw6jgRrPncKwprYNFFsVVFPST9a
         OQLUESPjk7Zl5ZJGL0AvQ1owlHrAr/TBdreox52P2+F7RkWTRpS8rI+OiFSj/Pr8EBH2
         iXZVAqIg7dh42YqoSTKACRauZ6FOsFmrQDE4t3EtRWM1EItQbPzRmccKxi8ehNEEx9pE
         lK4UJfWKxxsdYCkUJ3zukYI726k2zjH3F7dTXOF14XaNRCX9i5CxY6TOza3csDlL+Ute
         LjhB7C1Vb5Q20YKKU6xiK8cQ4n/ibWO2ONq1nnY7fc4OP/MpM79o8mgLufzv1E9l9gdf
         UQdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbuw7sx2uuhbEbTHoz0Tz5ov/NuOzoc5AaroglvbrVhWvWNYg1KbwycelW5zH5AQ2ZYq88keVJStEW@vger.kernel.org
X-Gm-Message-State: AOJu0YzpBqif+9hw9NaigRppTMmKdkcQomYEielCM6IzXEkePtc85ltd
	HW/DPI1PLfu1GWp9oEqJgMYtiVA3MBraaNcR3K38i1N8vxR5PXLMHtfWONucQjukNa/INZQQmXS
	+6SwnE5UsY3kjdLtMwqKSGjemtkv2g3R0h/lbI+iGMg==
X-Gm-Gg: ASbGncu8uNZVUpY9H/vFZ9cWVL60UCPS6SbF5Z/O9jOxcMW1Pyf2RcY6uXRoUwD0gm5
	zrW1SZ7RVpCeDb/Pefq2ckTcT7tOotemyfPC/YNdPxVeaDmmmKPWsIAONiofG/6x8XyOjBjZrzv
	l16GH3WjserH1ktsRjmGMhRuecbnrsGLAyS/B3qu/XT/LbeFfTemcBeFkDm8fiAVkhG+Vp0Xykr
	u6bJ+hUhGj4WaTcsow3YMYhECZG5w==
X-Google-Smtp-Source: AGHT+IFhwWUPdXGLE0UdPh1E3Z3kooNDTKBbQ5Xa5NjbLWLHkeWPvOb7Esb2TwKqbW3L7KgA6OggyzZuCUYLfacZ1yE=
X-Received: by 2002:a05:651c:4394:20b0:376:45a3:27c4 with SMTP id
 38308e7fff4ca-37645a32d2dmr19358931fa.5.1760358681978; Mon, 13 Oct 2025
 05:31:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1759824376.git.mazziesaccount@gmail.com> <072180743039027b8476525bfb3d04b3dd044be1.1759824376.git.mazziesaccount@gmail.com>
In-Reply-To: <072180743039027b8476525bfb3d04b3dd044be1.1759824376.git.mazziesaccount@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 14:31:10 +0200
X-Gm-Features: AS18NWDff60qRd91QHkSir_vcs0VB7YoMwPxzCmgcXZWdg7IkB5T6vF1_imU3OI
Message-ID: <CACRpkdYZ_jdKZWEBbb5muJZkUfd=nh=j4ffQQEoDJuEjoGzLgw@mail.gmail.com>
Subject: Re: [RFC PATCH 02/13] dt-bindings: Add trickle-charge upper limit
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

On Tue, Oct 7, 2025 at 10:33=E2=80=AFAM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:

> Some of the chargers for lithium-ion batteries use a trickle-charging as
> a first charging phase for very empty batteries, to "wake-up" the battery=
.
> Trickle-charging is a low current, constant current phase. After the
> voltage of the very empty battery has reached an upper limit for
> trickle charging, the pre-charge phase is started with a higher current.
>
> Allow defining the upper limit for trickle charging voltage, after which
> the charging should be changed to the pre-charging.
>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

This is good stuff.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

