Return-Path: <linux-leds+bounces-3943-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAAFA321A8
	for <lists+linux-leds@lfdr.de>; Wed, 12 Feb 2025 10:02:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46E441889752
	for <lists+linux-leds@lfdr.de>; Wed, 12 Feb 2025 09:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A672205ABE;
	Wed, 12 Feb 2025 09:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FLGNpVa1"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA7E1F8ADB
	for <linux-leds@vger.kernel.org>; Wed, 12 Feb 2025 09:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739350969; cv=none; b=hs3Ifo+YiA2BJczv0D2KrOWrVVV8GO6ySGaHM58jpesobUpzqW5HoauhPnRxMphCBV/C7soJ0K5v2aMjO4i/RnDPc+U9p/WqDg4kIJ0+p7fJ3r8rfhQs9Qj+5YaTwTYZmyU4wcqcbBgar/n6xZ2vOYMyTT2Jm9gysh2fRYcFLxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739350969; c=relaxed/simple;
	bh=bjupXERTNnxWN8Rzu7+1ntmtPDezv/on4BH1aBU3yKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lJC1c4UWUhtIO1zZZDrQf65D+Sk8z9LmIhIrXMrwk0opH2wd0mmLm6e45/lrsaAhXBCX4A/0J1VdxkrD7DjUvuPVco3m8g5ptgllZq7Ir81dhGkgSXI3FndJbbdWvI3rA2woug0CGTqGdHcmEB9lSEKKE4lahDHYFdwEZRPWokE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FLGNpVa1; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-308f71d5efcso23347381fa.3
        for <linux-leds@vger.kernel.org>; Wed, 12 Feb 2025 01:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739350965; x=1739955765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f16dueEN6EAXOszY3Uq+eQwKmeyE3XKAbudGP1w2udw=;
        b=FLGNpVa13HDBv29M1vUNoNVtLFEFJ3UPNDazvM7rY6Pcwlqnox+wZNoLSgH161KY+c
         bYi1mvo7adK2M+bgYeamAJsuv5b3qSWQpIGTHt7LksV6P4IWL3QojOJPWQP/hLFttV0w
         ztPFNq/ksFnbHQ0VMqmt/on3IRSUco/L2PKl8Sljt63U2QBnaO6cTxzSSTXb5rTTs+0F
         +k8LlHhhcKhanK+BceCduEEN9EJ5AyT+/N8rZq4bJEsGcD4r7RwLRBiy9JRSk8V6XUa4
         wW/GQollHOqcW5gmR9Z2Lkda7i24ozDgkbBbJjtrOnYHaKzt49urk3xXn6BCNtl8aash
         78xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739350965; x=1739955765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f16dueEN6EAXOszY3Uq+eQwKmeyE3XKAbudGP1w2udw=;
        b=PRBBHQa6s+Cxg/+Dqp02RbEbbyEVkPLlb7GLjHlFApeeNkf+uAYIXueyQFDll3keb4
         KewMTE+j66fqmh3bsgfszMSTKSQAckj1Yj0KU8p+xNX/mORwtDBQ1j+Kwpqv06LL/fcJ
         MGDR44pqHkz72xbLcchanp7RTCRltC9Q/6KI/ENpST8F3vjnSgJ8dDZHjNvj/WZQFYgv
         M5hsShO4cUr4HUX1PO5qAd/gm7umEDn8kPhbXO7pVAWHWCtVGZBTAw7OlMZhKOxZeOrK
         jgXkVZH6h/0zgFJH8oDvaAt9gAVgbbHjnvUVqz651NFYcSKEkxyeFlJ8M6qI/GIMxWmy
         YQlg==
X-Gm-Message-State: AOJu0Yz6q7Hkn2yCZwpcKZ7wWdpnRkdEwocMtFpSPHykRttI6lu36nPa
	MgBpBD1D9aLj3yAq0RZ2YFAbm3rSDvK1g3dEsTmwBm6/31ycIKJ/mPQ5AvAHevMT4/E4U96TYtF
	TDgpjBHnGaY0GY8S/LGCuJsCKiLfwp7YDTGWZmQ==
X-Gm-Gg: ASbGncshJ3nYrmmqFL1gY030+vzcEuV/xsedgl9evt+eTm7yKeUAL9N+98M0XY8w2+s
	oMKOrNAvQ7guIpzRJRmZrxl2h0m7vxIppkHN3a7uF0iHhTKSiWqqMvZboYWfVid4rn9A4aSA4Zw
	BAo8pRiOQCsY6peltTGqQ2YpegGdhk
X-Google-Smtp-Source: AGHT+IGyt9LAYXtY0vl7YRuakFNZNHFEFcX3+aygjTndiNf8GdUnYyRJTUcNhdM3AW4HKXb8eBW/OlEvBJQgal4A5ok=
X-Received: by 2002:a2e:b887:0:b0:2ff:d49f:dd4b with SMTP id
 38308e7fff4ca-309037c13c9mr8178331fa.15.1739350964874; Wed, 12 Feb 2025
 01:02:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250212085918.6902-1-brgl@bgdev.pl>
In-Reply-To: <20250212085918.6902-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 12 Feb 2025 10:02:33 +0100
X-Gm-Features: AWEUYZk42gdDxUmeHlnhGyrIolknPsut41eqkbz6n5Iee392aw8-WxpqAAXVDIo
Message-ID: <CAMRc=MdFwe2onYhwY__n-kAOSrXKKDWJ38hpbYb0711Nx60DHw@mail.gmail.com>
Subject: Re: [PATCH] leds: aw200xx: don't use return with gpiod_set_value() variants
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 9:59=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> While it now returns void, it will soon be converted to return an
> integer instead. Don't do `return gpiod_set...`.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202502121512.CmoMg9Q7-lkp@i=
ntel.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/leds/leds-aw200xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/leds/leds-aw200xx.c b/drivers/leds/leds-aw200xx.c
> index 08cca128458c..fe223d363a5d 100644
> --- a/drivers/leds/leds-aw200xx.c
> +++ b/drivers/leds/leds-aw200xx.c
> @@ -379,7 +379,7 @@ static void aw200xx_enable(const struct aw200xx *cons=
t chip)
>
>  static void aw200xx_disable(const struct aw200xx *const chip)
>  {
> -       return gpiod_set_value_cansleep(chip->hwen, 0);
> +       gpiod_set_value_cansleep(chip->hwen, 0);
>  }
>
>  static int aw200xx_probe_get_display_rows(struct device *dev,
> --
> 2.45.2
>

Lee, Pavel:

If this is OK for you, can you please provide me with an immutable
branch so that I can pull it into the GPIO tree? It seems it's the
only such use-case in the tree apart from the gpio.h header that I can
fix locally. Alternatively you can just Ack this and let me take it
through the GPIO tree.

Bartosz

