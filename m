Return-Path: <linux-leds+bounces-3363-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 366469C2DB0
	for <lists+linux-leds@lfdr.de>; Sat,  9 Nov 2024 14:56:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 667311C211DB
	for <lists+linux-leds@lfdr.de>; Sat,  9 Nov 2024 13:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705C2197A72;
	Sat,  9 Nov 2024 13:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="i8RgDA+R"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54931953BA
	for <linux-leds@vger.kernel.org>; Sat,  9 Nov 2024 13:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731160572; cv=none; b=G0bmUu5U6dN9L/JzUeQY4Xu6ooX2IWtYgzqxpoUIoNWgHq6GwgCS1e/2//5LAc4EwdRBkcSR+2xakEpRgIigv2MQQtNMG+REEnnUAFstDrO64uxJtZy04L5HK9uuJ/MrvWd/tWPUCmnaRmtK8SDlQmEWHchpVwTWkhVWGUFW2Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731160572; c=relaxed/simple;
	bh=6tMOEZ4hYeIaERsoiWpF63YtRH/4HelSxe57Ej6i2fs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=phjkXm6+Lb8JCADPxzFcNCXhb/DVV1dti/J1so8tfG+qtjnweSE9NiAVsfnQGgRzIGnFZV8updgoDfy2jVZcdrAHIxcoWMd0/cjBYn92r++KlzfaBJo/OBKhEPL9wc2qPyfCn4Z9voA/PQ4XYuE9MhXBLUsJZuI05fQ+Rk/cohY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=i8RgDA+R; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d6ff1cbe1so2277431f8f.3
        for <linux-leds@vger.kernel.org>; Sat, 09 Nov 2024 05:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731160569; x=1731765369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+Kc0rzleBniDws42taDJiRijBO7TNIofluEdMhVLBw=;
        b=i8RgDA+RwNTUcYFVoXTTBi5tKRLJdcQYHhkF2m4E6IsH3rvwLc/IqT3Uu7KT1A5EsB
         Z5sTBiXFWkXrliwc2JWgk0vPtvzdf7KW4qjUiwh9lpdnboLjSDzjN08ZnPxePDuaQ+Xi
         jIu+Gj9BBtyWwFHEiooN9pnN/F9WmaUqu3qAnT1iJ1c7lFL4h5gMlo5sroxmq+ql4PD9
         lYQc6kefHnldblWrz3FdtuuPQqnYx4e+SElm5xCVyASrt5OgJe87kXjgeEnV4zDJQ0Gt
         8tSfnRdJMi8UKc+94Cl69/kZx62QbU8xWRmZlDRmQ8cpYFNAXnd2mfptNEBQNxge+5th
         yf8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731160569; x=1731765369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+Kc0rzleBniDws42taDJiRijBO7TNIofluEdMhVLBw=;
        b=rtoHBkXHxeyrUgtz4qO1ZBWPOjyFnHeVcZK2ddq2/9GYXRdt+XfRkLuUvE4AmadVgT
         gHgHEAY9iQ7n9SI6KoJedxSdWfr+miUOY0FkLTezy319cdxGa7r6NxeXVxq7eVGUyhpT
         QMmmZiN3MQmyw0y+73o156i4RcZGdGeOMI082ot+NIXCtREv26G8R21SVW+a5/woot1l
         YeIGz/nbioNCc3c6lbQYkeuviMrZIgjJytluP9xoNQ10jU2CaCJZil+QdozxT8r5moJR
         kPFFhUdTPVtOzzA6bf323h9cpd8RET2X+YUd9jE3VXDJ//9FdPYKAYVgoM1IBinPdIA7
         7GpA==
X-Forwarded-Encrypted: i=1; AJvYcCUhkTGAJwLHOnvyh9T4VZe+iT6iT4qktu404IMtpmQQv0E9Fbt/0Uv8nj7zuyAOJ+IiuGUetnhjAN4g@vger.kernel.org
X-Gm-Message-State: AOJu0YwzdOeO0vKCPhGSsjuf8M8GwRU8bW6wmie2y1qZ7NT9kghmKyBj
	vjDxIf05dmsRa2jJeo6PBfVjI0DTMno3ixNNUsB6UMVotlFHdAIOeu5wpqmvj9U=
X-Google-Smtp-Source: AGHT+IFsS2LMq6BH18aGRCC9suSXqIwBnIqgdOjirnJVxP9+m+h71xqEBknv7upPJ7jntZEG8ZeeBg==
X-Received: by 2002:a05:6000:385:b0:381:e702:af15 with SMTP id ffacd0b85a97d-381f182fc64mr5833268f8f.37.1731160568840;
        Sat, 09 Nov 2024 05:56:08 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3194:2330:43bb:8a9b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b05c18e0sm109576935e9.28.2024.11.09.05.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 05:56:08 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Lee Jones <lee@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pavel Machek <pavel@ucw.cz>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 0/6] gpio: Get rid of deprecated GPIOF_ACTIVE_LOW
Date: Sat,  9 Nov 2024 14:56:06 +0100
Message-ID: <173116056404.6855.877058419163067768.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 04 Nov 2024 11:34:18 +0200, Andy Shevchenko wrote:
> This series targets the deprecated GPIOF_ACTIVE_LOW as only a few users
> left. Convert those users to call modern APIs and drop this legacy piece
> from the source tree.
> 
> The idea is to route this via GPIO tree, please Ack.
> 
> Andy Shevchenko (6):
>   Input: gpio_keys - avoid using GPIOF_ACTIVE_LOW
>   Input: gpio_keys_polled - avoid using GPIOF_ACTIVE_LOW
>   leds: gpio: Avoid using GPIOF_ACTIVE_LOW
>   pcmcia: soc_common: Avoid using GPIOF_ACTIVE_LOW
>   USB: gadget: pxa27x_udc: Avoid using GPIOF_ACTIVE_LOW
>   gpio: Get rid of GPIOF_ACTIVE_LOW
> 
> [...]

Applied, thanks!

[1/6] Input: gpio_keys - avoid using GPIOF_ACTIVE_LOW
      commit: a04abf25fb1ac47dd2bf1e1b7ca24ca78688b175
[2/6] Input: gpio_keys_polled - avoid using GPIOF_ACTIVE_LOW
      commit: 081aaf2dfcfa10fa5cb5444b77b154cce4355708
[3/6] leds: gpio: Avoid using GPIOF_ACTIVE_LOW
      commit: e6a2f0ea519fd2478920d02ce3de07a14fe36b2f
[4/6] pcmcia: soc_common: Avoid using GPIOF_ACTIVE_LOW
      commit: 15998583b19749e63c5cd0431a2517f524352762
[5/6] USB: gadget: pxa27x_udc: Avoid using GPIOF_ACTIVE_LOW
      commit: 62d2a940f29e6aa5a1d844a90820ca6240a99b34
[6/6] gpio: Get rid of GPIOF_ACTIVE_LOW
      commit: fffb9fff12250018a6f4d3e411f9d289210da329

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

