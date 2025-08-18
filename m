Return-Path: <linux-leds+bounces-5235-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A44B2ACEF
	for <lists+linux-leds@lfdr.de>; Mon, 18 Aug 2025 17:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89F845E7781
	for <lists+linux-leds@lfdr.de>; Mon, 18 Aug 2025 15:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD6025A630;
	Mon, 18 Aug 2025 15:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tu1frsJp"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D77325F98B
	for <linux-leds@vger.kernel.org>; Mon, 18 Aug 2025 15:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755531443; cv=none; b=I5W/qkRZ7wjdicEIo5A3yTxTae9vlO3tRgCWYk6dF7O2iR8RZ4PwSwAPmGE9dOpRcBgvetoED4zVeDrbUbVAhVpGw9RYCnhiXeGhhjieAUFyF+1Xp7FCTM7El05pLf4R+nKPPFJaVf6NfZ/zFMt1ul74dKbDWrWhBAQGuGAiw4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755531443; c=relaxed/simple;
	bh=zUAzaEIJ5VMfDRyaLBauOj1IcucT6KEg1btGJxZi1MA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZtHNwYYeQdqmiS62iwzEvlcsDMC5lu3LpIXvwKPdlKRV0l232V2NdFz33EdkANaeEQX587gruyJlpRTjltEJlwaJU0krZZJQ7uug7yOef1CiGX7DBSnl/aTNluqBKL3fbUZ2NCrNS6QNuFfr0WfscojqED1JUsQCAYC5MCeUXc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tu1frsJp; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-333f9160c21so32823391fa.2
        for <linux-leds@vger.kernel.org>; Mon, 18 Aug 2025 08:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755531440; x=1756136240; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUAzaEIJ5VMfDRyaLBauOj1IcucT6KEg1btGJxZi1MA=;
        b=Tu1frsJpFKIuD2HBPbWhMEcBedXII/ApZ3TmPnE0BcG5ACP0VmvGkaSu864s/MLxuC
         S+dNANnCZGRgFBY0H/GLTamBYCzuxLui2B4VW9ygUzb8bwN5Vinvn0RZX5Fyt2Mc9fzs
         3UY8m3tT9A5cDx9OlzkZxyuJuH8zQn4v3hJtTGDhW1p2w9P14q9qe+H4G6pUE8BKvcvG
         0iVtTzj/3fTMvP9S6LzgBWaSt7im54nvWMSBrmIew+FardCLSiXeKyE6xLg8Tu7zkKaG
         aJWSTNtz2ulEHNwTkxDLKSwWJUtRS3hyZmSDN4rbUfTL5sx8bFWXQl47RbV9lqb1ffH5
         Ghig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755531440; x=1756136240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zUAzaEIJ5VMfDRyaLBauOj1IcucT6KEg1btGJxZi1MA=;
        b=IHSGYgaMCnYrX7jeNPUeEZc7//aEK/2P8hds+BXQytz0IpaN5ZNpkR/z0IC5NrcHkP
         oNGjgD7ymPoJPodOldw8P5VhMT/joe04ZtoNcfP19qofQBI/XCtQDItIAvaltIrmbYsX
         kUKFZ4/oHN8//mfQgpO3mrQnMvdFYd9A4CMcbDIGKU4CCYLZbg66e2juWE5/Gdy/QYAd
         lm85scaQik4LEwqOgRzNq+ShHPGGkLwgPhRG6g4wahdi0x+vDHugIWBDrywZ6JfzX7fK
         xrEwLzC5KBJv6O3cPGeeGN3JzPLx06WTUXZW7+YXaii0X00gAZrRa76S9k82ZYx898ZQ
         lGdw==
X-Forwarded-Encrypted: i=1; AJvYcCWfXlW6ZiLfa9HYFVvDccxGP9l3uJsZp7ZukA6oyUo9YLB146PhmlIuIxPvB1qyCLpDKx/jS64fmo6n@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8bveTiUmrBn7K3jJ4bP/bKGGXpbm/ffrXWzNw4yzLjsHX3Gy6
	u+7k0FWvmmhGo8Yw93djfJDdDN2kKpmtUp+LPFp53xXZouzo+8kWal0OxTf1vwWHY5MiYJ8t/Xb
	XEbhU8wFjkci6clHLGOJtp/xwcKJzZNo07kvlLZ5FHA==
X-Gm-Gg: ASbGncvfizuH+pL/b8NTWd096q6VPPud+LiJAdX8GtzpGE7kZw+rmYIY0KNHvYBQ82P
	n+x0n0ZWoK0UV4VVmOJ07WrwCddF3gLFWznz5T9+mtG2JCslveIL4vMobXKImwNPJRGlxUX05t8
	d/HLqL+jnaAxZzrn2EPx6Hygc7CNlWW26oWEcZmE+R38alzzYQkagsxL0kZCEY9Ba+M9Pf0ysV5
	hqR7lM=
X-Google-Smtp-Source: AGHT+IG+GVJK4tzT6ecV7Ro8lqSck4UpyGZZpSEzRFsmZpSpnYahkHkhTdkt4MWZBGxnnEyxsT/xMtxcYazU23WLelg=
X-Received: by 2002:a05:651c:1503:b0:332:1c24:d33a with SMTP id
 38308e7fff4ca-33412b8af4amr28525231fa.3.1755531440277; Mon, 18 Aug 2025
 08:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250808151822.536879-1-arnd@kernel.org> <20250808151822.536879-11-arnd@kernel.org>
In-Reply-To: <20250808151822.536879-11-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Aug 2025 17:37:08 +0200
X-Gm-Features: Ac12FXyuxmUcXP36pNiGdk8Vf7slpD6KEC6V4qN7-65Nz5kxvlVVKGMXuopzvk0
Message-ID: <CACRpkdZS1uOMsT3h-kyNQVrVW0R+1mmmOB=EAmqcHQSpo4qAYQ@mail.gmail.com>
Subject: Re: [PATCH 10/21] leds: gpio: make legacy gpiolib interface optional
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Kees Cook <kees@kernel.org>, Anish Kumar <yesanishhere@gmail.com>, 
	Mukesh Ojha <quic_mojha@quicinc.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Dmitry Rokosov <ddrokosov@salutedevices.com>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 8, 2025 at 5:22=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:

> From: Arnd Bergmann <arnd@arndb.de>
>
> There are still a handful of ancient mips/armv5/sh boards that use the
> gpio_led:gpio member to pass an old-style gpio number, but all modern
> users have been converted to gpio descriptors.
>
> Make the code that deals with this optional so the legacy interfaces
> can be left out for all normal builds.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I like this, it cleans up things for current systems so they do not need
to carry around so much legacy.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

