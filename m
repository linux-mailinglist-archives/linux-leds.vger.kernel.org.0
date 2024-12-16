Return-Path: <linux-leds+bounces-3611-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0269F2CBC
	for <lists+linux-leds@lfdr.de>; Mon, 16 Dec 2024 10:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03A67188AEE5
	for <lists+linux-leds@lfdr.de>; Mon, 16 Dec 2024 09:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BC11200BB9;
	Mon, 16 Dec 2024 09:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JnWP9Zl2"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0E2200BB8
	for <linux-leds@vger.kernel.org>; Mon, 16 Dec 2024 09:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734340657; cv=none; b=OmQ+rF3JBiLDiwOlq7mCpo1leHZiRteb0xruxVt+jZFNl2dNVgnzFpKaWfy/ALPCN3Y7Zg0LukHDiSqJySs8RO0b1TPKX4qZznsHjORnlG0JIUGnxRZJfGqXMSd+CBxGrbscferfxhnZzupaC+chZiUrBEljifjWpwu14YOgjJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734340657; c=relaxed/simple;
	bh=1qR5+1H3fLvBgI1LotDXtcQetIxOlpQF0+huH0Qt/4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uqB35N9VvuUsX8zMXClRWHr1sYSv9/5UUknewINcJNG9dS5xJW37qBbOpLQt9LadnSOk84ovGbbiovxB8UQ4drC3GEMNWJ5o/Sw/wdBE/qnnGQo5XLfhfE59oRgbrvBbP2MY7iy28YJSibgW7d8NF5TjAVrGkAubuNwSXBwxsNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JnWP9Zl2; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30229d5b1caso38982051fa.2
        for <linux-leds@vger.kernel.org>; Mon, 16 Dec 2024 01:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734340654; x=1734945454; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1qR5+1H3fLvBgI1LotDXtcQetIxOlpQF0+huH0Qt/4E=;
        b=JnWP9Zl2prbWhXhYSp3bdNi3H4yHDKDKTwK4gXw4cvejsv5XoACLnDpISJub6hYulP
         GIZ+3aWl3tj/9OTB6n1rhrAV7hwAAbFU6dpWhwB2h25CG+NcS9irBEXJ9AXkYmX97CUP
         ZJikAotjjdRhvBobpxbhrADNVC+qqtIwMOZ33rhltHd0PNk95jyJ0qFjyVXx+DAIixi7
         h47Tl2nJvbY9ki+h2FRmZLKnmITYVrv3wRA6pvj3mGLbZM8R2zDUX/gNPbfdfmzU+juS
         bmRuDVSssi6PYLDugrh/LSUmSFpU6IX5o4kFS54I4GXDZkgzf6Nu4NG67Z1t2IgRCsHJ
         jiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734340654; x=1734945454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1qR5+1H3fLvBgI1LotDXtcQetIxOlpQF0+huH0Qt/4E=;
        b=rO98untj4+hSHoj/b690lNSiUgEQrZ4KjNtFLRFt6UMexBF6jXXQCQHcuQ4bGfuAtF
         pUzk0HoBFnrTKIC8SDxCuotiwLmh9GoksCN/zkyxRNk8tjAJvLy6imK7htx5kowH4LQu
         tTZ5jkfMTXj6c/sngXdXUnbOIQVAf2Eu3cn5u2ZKvor+gDhCiiWrxS6YA67StzZysqps
         2u/jwylINlhEhH4q72qFbulVCzLcioxfCuFwxspooqGWdvJDX2aqxqNVTRp2EniXSn3w
         H//FTPpx1uHcIKks1FGV1moq9P+rObCxVYlsCycxtT25w0DBvn4tlLF3DPd59hxekV4A
         HQrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfaCfKR8rFIlGbBuX6GGaVrEnsFOs0LCDTMu0P7MtyaD0cH8kboUPlnnjfrDNwc1SAG6hT+1cp3oeI@vger.kernel.org
X-Gm-Message-State: AOJu0YwHJXpOcNaZGcuRpt+aCjz22lWlQJdRcaghmvM536V5IhNpL1ZN
	vx1YqzR1mBqEDdiVHeB7PfKZArV9YcC7+eVJ/i/V4n9TMkBeo7FurvCRm1inDQY3rixJCwjMsdk
	bBMQqroFBSCN/YEEov4CISyyexTvoB7I2zMU+Fw==
X-Gm-Gg: ASbGnctNgX8X8ZKkIBNPRSjOeQ5TuaT8G4zK7KM6qsX//AEf/yxxbNYsFNhtOzro1ZB
	dlpMh1fToBZrKnqRO0oG0OtAIXp9xvLoALdJJJGmR4Xlwd0FZDRePZm6+O5e/w3rhOocHuA==
X-Google-Smtp-Source: AGHT+IEOwduo8usaj8ZRTiMKvnDvI/sKvG+uXPsesp8eVxzp1U/WEzzEulhhST+phRCarmJrvrroOrMmTlHcWhwZgzA=
X-Received: by 2002:a2e:bc09:0:b0:302:2bd8:2687 with SMTP id
 38308e7fff4ca-30254530bc4mr33805791fa.12.1734340654051; Mon, 16 Dec 2024
 01:17:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211-aaeon-up-board-pinctrl-support-v1-0-24719be27631@bootlin.com>
 <20241211-aaeon-up-board-pinctrl-support-v1-3-24719be27631@bootlin.com>
In-Reply-To: <20241211-aaeon-up-board-pinctrl-support-v1-3-24719be27631@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Dec 2024 10:17:23 +0100
Message-ID: <CAMRc=MfUDGaW1cBrsLzAZ6GORFFv5fAjEKXu7esO44v4XckheQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] gpiolib: add gpiochip_add_pinlist_range() function
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@ucw.cz>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 5:27=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> Add gpiochip_add_pinlist_range() function to add a range for GPIO <-> pin
> mapping, using a list of non consecutive pins.
> Previously, it was only possible to add range of consecutive pins using
> gpiochip_add_pin_range().
>
> The struct pinctrl_gpio_range has a 'pins' member which allows to set a
> list of pins (which can be non consecutive). gpiochip_add_pinlist_range()
> is identical to gpiochip_add_pin_range(), except it set 'pins' member
> instead of 'pin_base' member.
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---

I don't have anything against this change so in any case:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

But may I suggest the name to be changed to
gpiochip_add_pin_range_sparse() for a better indication of its
purpose?

Bart

