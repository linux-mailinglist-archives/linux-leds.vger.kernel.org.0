Return-Path: <linux-leds+bounces-5854-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6A8BFAB26
	for <lists+linux-leds@lfdr.de>; Wed, 22 Oct 2025 09:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50C0819C3DE0
	for <lists+linux-leds@lfdr.de>; Wed, 22 Oct 2025 07:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662002FDC47;
	Wed, 22 Oct 2025 07:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ABypplDr"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45162FD7AC
	for <linux-leds@vger.kernel.org>; Wed, 22 Oct 2025 07:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761119560; cv=none; b=LFX77jHBYqVljqnCckikhdGyso8ziczUh5cfaR5bnOQv8vDPZq/wzDrJvOs+68yW83AtQefw0sVMaqqiiCscc6ftBjbEAVqmw2FWuy4KgR/vQXuztTsvWrnb0zG5zSyVDHHf4wynTzQFFvRbum2KITqgdpkHR6qVoN87SnQhL7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761119560; c=relaxed/simple;
	bh=A854G8Q+az7SMF928a56CKf41JBBm3BPM7QWQ64soKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OcAD/5CTtc/S8ZUaSlJ2QH99NZhp/c1iTkf6/gg1COpog7eZos+wCHSNxOtnSx1NuiShAi1baor5gMXTAAZJbN3nD+zk+GqAzupZ4cWbx6+jaipIrNoOHPbQImxVHgFDIjWr9TD7c9UZtgfVOSUBW77CuWCRVibavGFy10A3OAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ABypplDr; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-71d6014810fso64390847b3.0
        for <linux-leds@vger.kernel.org>; Wed, 22 Oct 2025 00:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761119558; x=1761724358; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5SQfEz/e2hOwh+iWueKx4wWRyZ4LmWDiG7JhS1t4UW0=;
        b=ABypplDrXNLD4T/kKJ8lfRsP5bAAtauYUpcOOjCU4U3BaAiZ48Ob/t0wWVC7nYxEqn
         iO3duOiuHQEF319w8UeJEZq1xDYgqXT9br+tNIMGrE8Tga8g472DY7QJxLbRD7B4v1SU
         oQIaIAtfPyzCkFpqqg2iUvqNk/H8ul9rN8XyMG/C68CxTwiwpLnXxIsayJidKNrtEonr
         Zcgd6d8LiJGfXl4kcyDR6bup4+G2WIfhnOUaKzewBr2XXA+isVqLHN6aXbFtEaipwaGS
         fswA7EXWHRQm4e0MWaLN8oivQjea9CRMHOdz/AqyIxgEBpDj0gkQ2T11DjxEI3jGsm8O
         bqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761119558; x=1761724358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5SQfEz/e2hOwh+iWueKx4wWRyZ4LmWDiG7JhS1t4UW0=;
        b=Klek9hfcx5/piWAqRUFVzMkq1dM3b4ME4Q4T4Bt18Bj0cisD/6eEpixM0WrrHILZxJ
         yIAsrzNf44EHwsbsvdGr5Cfp9uQeHkNkCHeWy32Il1X4p2m8VYKyYKvw5TiwmtZvnZgI
         /YDGKHGZq5RjNs0gSi/wgzHr8sTE0WdcMlZAfcjzA2qw+rpVlJ11in/EHghlfClwBzU/
         U9B97wioPAIuMURQ/Q7Fxvl8eCDNYpE0Z0UzArzZu9or4KLby6+cJxwFZHiKhKOCqLLY
         hMi4sqre1pVDZF8M0bplFuoWyEnmPphB9lmcmL3EEsmFsA8+aSdybpotjPMWQ6F+nR+x
         1OXg==
X-Forwarded-Encrypted: i=1; AJvYcCVtWZokkSMndaD+H9rmeIob35w2Oiektp1vqKafWMXAbFbsElu4mobhUvPSjaYcZGaROX73Guv6nz65@vger.kernel.org
X-Gm-Message-State: AOJu0YwTqTyNiIdUva6LYHQ5gp9xd87mt3httmsTyxJ10A2JMP7PMzvd
	jj1Aw8r4WrYZrkj6OI8NJCz6BCoC5TIt7rQXqFcyNurZF55BNpj+soGIdYIn8LcCYfbDHJjMp/Z
	gk0fDf2/sUmkZBR/+/LDKjK+tZDURjfzX/014dRIcxg==
X-Gm-Gg: ASbGncs5BBnZN6U2n65mzqUyiGVY4WXafxa65J43ZOViEOKi+SaoCSc9R1IjG5qauKH
	wqTIJ+Su2nnc8V6vnK2IMZEgOyEPbK+g11/X7aLJnZnmBFaYxxLuKQq5tMyvea9U6d1nVpQzkma
	J4H4VVXjJqNM267buil8rkaevx+q5Vf9r3P3PF3JteEf1lWfD/8udAmWvmVENjK0CVxeX5lKcno
	ydz0L862/+cLz0VPeGWP1hMBsq6HVBIQGYBbWgALOXIyDNDxKjLgm6PkoL2Hm1M0LPjpkI=
X-Google-Smtp-Source: AGHT+IGOnPQWJDBN6sjrOxFjPZZTij/Niq/8Rg21Q+EknYQnuJrFX6ATSFspu4lRM1YW7AwwhMSNREKhsGRl4TKmTgw=
X-Received: by 2002:a05:690e:4008:b0:63e:1ee2:eb0a with SMTP id
 956f58d0204a3-63e1ee2ecb5mr12241395d50.26.1761119557691; Wed, 22 Oct 2025
 00:52:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021142407.307753-1-sander@svanheule.net> <20251021142407.307753-7-sander@svanheule.net>
 <CACRpkdYde+=85f6Zfz40bMwOxSE-bszHzvBhQwC+G-E2CZr3Lg@mail.gmail.com>
In-Reply-To: <CACRpkdYde+=85f6Zfz40bMwOxSE-bszHzvBhQwC+G-E2CZr3Lg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 22 Oct 2025 09:52:25 +0200
X-Gm-Features: AS18NWChHJVKsQEprXAlHgw_Y74ygS-pAN-Cj80aJrWmlHy4f-JX2hUVSzNGAmI
Message-ID: <CACRpkdazC7KC7HUZTkN-QqjuWXaJKLQrXfC30=GKUOymfpVJTQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] pinctrl: Add RTL8231 pin control and GPIO support
To: Sander Vanheule <sander@svanheule.net>
Cc: Michael Walle <mwalle@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Replying to self:

On Wed, Oct 22, 2025 at 9:42=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:

> >  drivers/pinctrl/pinctrl-rtl8231.c | 538 ++++++++++++++++++++++++++++++
>
> Should we put the driver in
> drivers/pinctrl/realtek/*?

This is because these are SoC drivers and this is an MFD
expander, right. Keep it where it is!

Sorry for the noise.

This driver is finished.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

