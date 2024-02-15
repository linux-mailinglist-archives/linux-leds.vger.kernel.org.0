Return-Path: <linux-leds+bounces-836-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0243385646B
	for <lists+linux-leds@lfdr.de>; Thu, 15 Feb 2024 14:31:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 953B61F23798
	for <lists+linux-leds@lfdr.de>; Thu, 15 Feb 2024 13:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F12B130AD3;
	Thu, 15 Feb 2024 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BqGCzj/G"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C720612BF1E
	for <linux-leds@vger.kernel.org>; Thu, 15 Feb 2024 13:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708003911; cv=none; b=B8tnOgmuAOQSKaVOWoRY2ENUE6f0rJqUrR4/9Zr79+IGXo8886WDvVsg+gF8ZDFkr3vLYkb1ur/dK5zCrzu5cJI4WfXgw/cgH20XLggvHcDAXL4nd+9pIlD36iz0/AwwldJ9aFGrTx7hjpEjLiRwNIBPPg8GMycRI/pgSzE5rpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708003911; c=relaxed/simple;
	bh=lUl0Pib7si2dQHCXFrZb+InEVOkZVwOiAw43kh+jhak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dhCB6t2bezkuT8Rs3vHAWhw6Or8wJzqwqi9utx5sKDexguU9N92WXCzpP7geD8OGiQPc5+Xp/quRGOzscDmT4jBH62IPiLXccJGA2cWQkdNvwEv6Cj5BnpQDykQLOrrXtmMOC004ptvc6oFwpvGzubX3PNdeSB4lV9wrBgt3CJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BqGCzj/G; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-607bfa4c913so8327987b3.3
        for <linux-leds@vger.kernel.org>; Thu, 15 Feb 2024 05:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708003909; x=1708608709; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGh//nbX6ksAbjoH86pu+1OoxjeTYU/3tdUOfH2WwY4=;
        b=BqGCzj/G9jhFSsh2Za755/LzU6uyT+nqeNHXOXWrVvZpkLqcH6kmzgf4tPtVkwkEU0
         wyf4WLzEQMX1M5SRb9clyi+Wdlay+Rj3eHfkjDTKRJCeBQ5oJAaHdR739mCMQ0siELsY
         pMJ4k9VWaGRJ5KWxpNJKYgc2ezLDBvP27pFM9/oAuXmwlEVFp9qUZnpYcCWRIHkcj3AB
         vZ2lGqYF2zsUly9WRW5AgoT6GXIqqR4cK0IiLdb30LSDU5k9ul21dtva44MEhEtMEhsa
         4JFzDwH3I9iI/ebxA/XSbuogUGtrJJo0jsA7Qcel1rqwY+WfQASMKFs9+z71WRRioqem
         0bXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708003909; x=1708608709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yGh//nbX6ksAbjoH86pu+1OoxjeTYU/3tdUOfH2WwY4=;
        b=gnm5TldMMBi2dCj4EfihFFrFv9P+EmbhKNaRbgZfum10CBSlbCxMTy0+KzAJphlN7R
         E7gXYUEPU4QBcOnJOdSW8aoWe3Vr6Ny3OQ/EN17PCEv7QDVXcZl4I9/VwKX8q2YRfkTE
         bkg6zUEbfUwEeJyvo5q++8X8cdX3Ylmp632+fQ5G2JeTXyB0yXl9THGMnFHAWnMTLxpZ
         CmM0hRC95NO3YzH+OFpE2nSyFOkSnEZCm1oQJaGOywFjWqrXjIzXeOoPWBGnlQ/cS2fr
         5Sn7u7+Y2LDHqXk3C5dQNRPHH8U7FrxfNWYbLQU2m34m2KNfS4JLI1Hars9tV8YfaEaQ
         Wi3A==
X-Forwarded-Encrypted: i=1; AJvYcCW6z42W73vnj8Q+U2n/06Ba+B8GXYpXO/83sanXYiutobTuFovZ/Y6b36uqDU867+gY+ytfblEzd0+9gMiEbRtzLEruHYb8DsGYqg==
X-Gm-Message-State: AOJu0YyibJYfqZicV+HgDD0yGNmSneLpkQJTm2mI2D9WPan48QEjO8Xl
	846hVY/c/KmEWYO2lHcZv91y17T3HOe2yow5/UrqmiGE8e+nfJRFKYL6PVqSf6zVGD7vujjIvpv
	X+dDGyLhNIWoQybyRqjQ9KfCf8TplqLQma4yOlQ==
X-Google-Smtp-Source: AGHT+IHl3qgWvQCqRJMe39KHtu2wuTpCX4Lckf3lqFQQ+kVziMGrJ7Juv/tfm7isqbWZN8sE5IWX6zuYqEnZ+zYcRZE=
X-Received: by 2002:a25:b949:0:b0:dcb:b41c:77ef with SMTP id
 s9-20020a25b949000000b00dcbb41c77efmr1387473ybm.24.1708003908799; Thu, 15 Feb
 2024 05:31:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240213-ktd2801-deps-v1-1-7feb5385eb9a@skole.hr>
In-Reply-To: <20240213-ktd2801-deps-v1-1-7feb5385eb9a@skole.hr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 Feb 2024 14:31:37 +0100
Message-ID: <CACRpkdYm0dNZZvzAZ-VQ+MaHeL7NmGCmCVw42WMx6BFf4Lw0Pw@mail.gmail.com>
Subject: Re: [PATCH] backlight: ktd2801: depend on GPIOLIB
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, Arnd Bergmann <arnd@kernel.org>, 
	Karel Balej <balejk@matfyz.cz>, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 7:13=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic=
@skole.hr> wrote:

> LEDS_EXPRESSWIRE depends on GPIOLIB, and so must anything selecting it:
>
> WARNING: unmet direct dependencies detected for LEDS_EXPRESSWIRE
>   Depends on [n]: NEW_LEDS [=3Dy] && GPIOLIB [=3Dn]
>   Selected by [m]:
>   - BACKLIGHT_KTD2801 [=3Dm] && HAS_IOMEM [=3Dy] && BACKLIGHT_CLASS_DEVIC=
E [=3Dm]
>
> Fixes: 66c76c1cd984 ("backlight: Add Kinetic KTD2801 backlight support")
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Technically you can also select GPIOLIB, because it is available on
all platforms, so it may be easier for users, but then you never know
which GPIOs you get in practice.

Yours,
Linus Walleij

