Return-Path: <linux-leds+bounces-901-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD4C85FBF5
	for <lists+linux-leds@lfdr.de>; Thu, 22 Feb 2024 16:11:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C486B1F284BD
	for <lists+linux-leds@lfdr.de>; Thu, 22 Feb 2024 15:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD28714AD2C;
	Thu, 22 Feb 2024 15:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UwkIsLyk"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628D614A094
	for <linux-leds@vger.kernel.org>; Thu, 22 Feb 2024 15:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708614688; cv=none; b=YV3dNEHeoxtN9p1e71T5JFBNUEVQR4tpnJL+gCoky5xT8uao4MHAKVjheXLEI3EGCpnrOjTjeNeAGqgjZYVbpFy1WrNicElL1sAvPPSaLscs4VT6eKdEKpkrv/I24wgySG0PXDQhj2jbTH9ZfzQ9S1wAkQQmnQCecGDgmcY4Mu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708614688; c=relaxed/simple;
	bh=E0AvIIn162mSDyZwPDTo2b1xyRz7jAaOfrYbNUsD19s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dhY8dLnfwAJvQLtedxUgAnuv5vShZXeYTBVJS0ZG8A7bO95tTP7JKIjDp4xGqFRSvyoWmZWMZmkzcH7GCE6Igt8lwt8KAMYhjMuH/a08KmaoERIDtrCBm4c1gGxFEC9bobC6ZeHiSvh7+se28kZ9i8d/KrQhSIvfOpHaOwxd+fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UwkIsLyk; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d204e102a9so101390771fa.0
        for <linux-leds@vger.kernel.org>; Thu, 22 Feb 2024 07:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708614684; x=1709219484; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1MyTAa9W6rwmrz4X17WTkjYYC8wuvxkD+qfkCmD8gA=;
        b=UwkIsLykfJRFNvIHoHGBPHMNOiHcdcQuVYCHaWoS5aYxT5Ka5iGYvLPTlpAaP+ej2l
         LkSANWN1ECg+wxpZc13XRS2NPCmfmdUMvRLiA3BV6HEdlghd1rdFyBB9kG3FgENyu2l/
         s2QvMk5J6v6XoSo9GqdOHWlQdTP/C8L3G6CQ2CKe2UVU1Lp8B5PacI1vk4kwZjZcgpnm
         ofl2c4aUnIHqRT6ifeTSNvRL1QmW+os+Fku/Nz33UOl8QJBgkr+rn2oI8K/hKqFQpmoq
         gKuDgoTMhWmU1ZnRh2GxW1UVcfpmHgexdkEe5WeeSEejr9sClJ5ibqIctcgrIy+95J+u
         C4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708614684; x=1709219484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1MyTAa9W6rwmrz4X17WTkjYYC8wuvxkD+qfkCmD8gA=;
        b=rKKzj1LZkS4ElWXQwZQt3FAzp0O3isB8EE0C0Xm/aCQAybYBdjg6oqq7uQvJSllYiW
         X/z1q6u1OkppXcEvEugBjRUNo5qOIegHG+bsS4QkxNETeS7rHcfLLFWIiifZDpyNwTke
         Y7P8bKiIWiaK17FYzdO2Iszhebgxko1bVXw73s2kvN3K1z2dU0gsa6UIg/QKrROtCnqG
         zwBMHnsZaogzGJE/6cM2OUb/yiJX/nTkDt264vJyFjEVrBDNCgwiaj6z7Z/rZXevjhY2
         muZIjyoc5VEefg/Go+DfjugkocoFhbU6XaSEJUSSqoWoq3Bj/SZI2Z4+aFI3iplGXuYn
         mLCg==
X-Forwarded-Encrypted: i=1; AJvYcCVwsbXdpPULEHQwemaNSTkJ+TzX9U+pnnfyEYWrsXvK/8FEXPQAuQc7zYlXazvIIazLvwD4+Xu31PYVBVdaoIMJx54+0NDYfNchrQ==
X-Gm-Message-State: AOJu0YzgmQOM5pKzDkjcx4Tu1BwZpwvu20gpYJ62fhLrWMA4S1eh3GPq
	yE31GNDHaBeINNphvHgAkFZZ0f4imhAwGghjw0H3f3151++3ngK+lnClEzoD1Vf5M6XVToVm6Vi
	DUhzdE0IrWM+9qyBIgWbY/Lh9SJnG9Ruy4b7LzQ==
X-Google-Smtp-Source: AGHT+IGw3hbqPWYN/3vfhhQBFzrTvi1PbeoR9WvH0886TzS1KyGrr602I8E8lLCB6pIuc8bHxZF8tDM1xPYr0gG8zd8=
X-Received: by 2002:a2e:b166:0:b0:2d2:6002:c239 with SMTP id
 a6-20020a2eb166000000b002d26002c239mr1510902ljm.3.1708614684451; Thu, 22 Feb
 2024 07:11:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240222145838.12916-1-kabel@kernel.org>
In-Reply-To: <20240222145838.12916-1-kabel@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 22 Feb 2024 16:11:11 +0100
Message-ID: <CAMRc=McWhC0ZdR55TMkkdVov=dwT0=H-4_c4J-bq0quRpvyoBw@mail.gmail.com>
Subject: Re: [PATCH 1/2] devm-helpers: Add resource managed version of mutex init
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Aleksandr Mezin <mezin.alexander@gmail.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-hwmon@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 3:58=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> A few drivers are doing resource-managed mutex initialization by
> implementing ad-hoc one-liner mutex dropping functions and using them
> with devm_add_action_or_reset(). Help drivers avoid these repeated
> one-liners by adding managed version of mutex initialization.
>
> Use the new function devm_mutex_init() in the following drivers:
>   drivers/gpio/gpio-pisosr.c
>   drivers/gpio/gpio-sim.c

Yes, please!

For GPIO part:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

