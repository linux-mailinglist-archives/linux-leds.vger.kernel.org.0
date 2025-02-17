Return-Path: <linux-leds+bounces-3991-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5BDA3807B
	for <lists+linux-leds@lfdr.de>; Mon, 17 Feb 2025 11:45:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 986E0188D6F0
	for <lists+linux-leds@lfdr.de>; Mon, 17 Feb 2025 10:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9367217716;
	Mon, 17 Feb 2025 10:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gqnefQHw"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F66216E20
	for <linux-leds@vger.kernel.org>; Mon, 17 Feb 2025 10:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739789060; cv=none; b=SAVkJ8NQsqnRT3Fc6b8uAeHuJV0DhQG5zJJAq0BB0BWj9Y9FSGz7As+lLjjHDN4Q5ktgACks4YZxfCuwG5j4cXIN7T1Jx/R2Tf3UUJqJ0UEQ3CA1jcGtI941XFqrDx+jpihYJIR9NJtD4VRwo3wtJ8M+FvEv7LfezNiiNQtPX68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739789060; c=relaxed/simple;
	bh=uQ8LmxvfpYhFeZGPSSIszHgvVvDG6OuDw4JIDrK+H50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RwWriA87asGzLEbIdmyQmuGV8JLHHuIrOAJMxEaTNzjnnRWYED4afGdT/wUTn48Aw2eR8E1tMAWfgB3ZNtzSG8dp9FgBnZSxt+u9E3NejzsNvDE89aGJXLyKYxQVcurwHKuvUa17tSxTsMtbKgp6nrYBOSRlsfKoD2PncOBjobA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gqnefQHw; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-543cc81ddebso4543858e87.1
        for <linux-leds@vger.kernel.org>; Mon, 17 Feb 2025 02:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739789057; x=1740393857; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yt+oE3wM3YFlQ1Z57+Zha3HANGstrZZPpE/lwoni22w=;
        b=gqnefQHw/p1Lzp9YgOSNM+D/KD0P971LjlG/wSam0i4UqPKDUTKvy299i1YD7oMmsG
         oyyNC6QM1wt9/tu8vN0K0jrg2euoMoma45b6axtx27rYrrVVDO7LINDmBReA1lARsPOY
         1mrM6THSQLnD8/x5+J0IXoBfdvDqYgD53tpuZTW7Z/dAvgielD7gRJHP7MGXHdru3B53
         7VWtfWe6aHPrEn/65oBGltkklF8N+NM47IzxQju+SPQ+Fgha2C0kTGIGFjvdbAqAlJOQ
         RdQvnpNtZx8jI/IIl0F40+Ba+Lg0IIxn+McNpyrMaclf38wjB+Zptv0JvKwu/e+dz4eE
         vmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739789057; x=1740393857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yt+oE3wM3YFlQ1Z57+Zha3HANGstrZZPpE/lwoni22w=;
        b=Nu/h1Tg7n95VxE332SX4j5KHNQVL/SqQhgg1gd0N7A5rZx1vhpPZm1wp7lJoEIWnUi
         SMOxsB5NuPpDRUuxW301c3ujNi1KEUJeqeyjKb8xjImp8pYKiBPTGZm+OjwvifFyfmxX
         mzDXSMOMvG4AcC4D3xF9UCXtmhNBCttpzF2QOOv9E1/JM4hYQ3AYeu0iKGnHw6QRn1Lk
         YxyZtKmysM6hG8icwLiFMXcteF4uho6JBkBK1Nzk1tj2806jyoEpAAMfF15vwh7WPsGJ
         KhAt20TUSyZJuBW2WfCaCox3m4HjO/w9aPSzUnrUA+RA2j4Now2amlK97znjonFXSe/E
         3uJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnS/hC3zqxKky/HydlZLEbU4QCUg+aedSHjTrxuZ3138b4oWsYMU8I5f7ZHLadVrUqyosyqFP67Y5c@vger.kernel.org
X-Gm-Message-State: AOJu0Yyev7hHd7uusI41E5sn8Zb7rTb48QEApRgi2YqmphuuCyg7Dk7T
	QS4LWh7+Ede3NcJfwzyZNCaTyBKpneKUKd+3s6Fvl4iWYFBjQVjOhHWR6IgPWc/glPitrGXv83D
	EgyrlMxcXN76Y4DguteMY1BTCsuvFZZM5VqmGBw==
X-Gm-Gg: ASbGnctJPGdvGfI4VI0dlRQ+14kWfEFVV3DrvZb7OOXXHs4yNQWOoGNibTfuy4IoA4W
	PNm6eWHTgEmwju53H7XfaW+aL6abGSwUipWRxQmYsDrBFVlL+PS8Ar3pnGSqbRFDmV5o/+RiL7W
	tcg7WbGUj4SnIdBdciuLi8JcMsSw==
X-Google-Smtp-Source: AGHT+IEI62f9UnsAynh4esWgzwohOE4sUhXWxtq04rEtJUZH4Mqg9mRbapKQMak9tdDKZrC7n7AB8cELUFuTE56te7A=
X-Received: by 2002:a05:6512:ba6:b0:545:532:fd2f with SMTP id
 2adb3069b0e04-5452fe3659bmr2985562e87.12.1739789057229; Mon, 17 Feb 2025
 02:44:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250212085918.6902-1-brgl@bgdev.pl> <CAMRc=MdFwe2onYhwY__n-kAOSrXKKDWJ38hpbYb0711Nx60DHw@mail.gmail.com>
 <20250212155512.GE2274105@google.com> <CAMRc=Met68e5c16ShiJ1mHQM-GSvautN_whVMGh53g3mx7OQSg@mail.gmail.com>
In-Reply-To: <CAMRc=Met68e5c16ShiJ1mHQM-GSvautN_whVMGh53g3mx7OQSg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 17 Feb 2025 11:44:05 +0100
X-Gm-Features: AWEUYZk49jy-1w_HUmYZg1lf98RZBZpWb5ihSxJcd1tcR0YWBhgjwZ0Wbzi5FwQ
Message-ID: <CAMRc=MfRW9ZxjoRunjqgz1xkFWRS1KyDJeTy7zrRGhoAC63dVA@mail.gmail.com>
Subject: Re: [PATCH] leds: aw200xx: don't use return with gpiod_set_value() variants
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 5:39=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Wed, Feb 12, 2025 at 4:55=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
> >
> > On Wed, 12 Feb 2025, Bartosz Golaszewski wrote:
> >
> > > On Wed, Feb 12, 2025 at 9:59=E2=80=AFAM Bartosz Golaszewski <brgl@bgd=
ev.pl> wrote:
> > > >
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > While it now returns void, it will soon be converted to return an
> > > > integer instead. Don't do `return gpiod_set...`.
> > > >
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Closes: https://lore.kernel.org/oe-kbuild-all/202502121512.CmoMg9Q7=
-lkp@intel.com/
> > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > ---
> > > >  drivers/leds/leds-aw200xx.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/leds/leds-aw200xx.c b/drivers/leds/leds-aw200x=
x.c
> > > > index 08cca128458c..fe223d363a5d 100644
> > > > --- a/drivers/leds/leds-aw200xx.c
> > > > +++ b/drivers/leds/leds-aw200xx.c
> > > > @@ -379,7 +379,7 @@ static void aw200xx_enable(const struct aw200xx=
 *const chip)
> > > >
> > > >  static void aw200xx_disable(const struct aw200xx *const chip)
> > > >  {
> > > > -       return gpiod_set_value_cansleep(chip->hwen, 0);
> > > > +       gpiod_set_value_cansleep(chip->hwen, 0);
> > > >  }
> > > >
> > > >  static int aw200xx_probe_get_display_rows(struct device *dev,
> > > > --
> > > > 2.45.2
> > > >
> > >
> > > Lee, Pavel:
> > >
> > > If this is OK for you, can you please provide me with an immutable
> > > branch so that I can pull it into the GPIO tree? It seems it's the
> > > only such use-case in the tree apart from the gpio.h header that I ca=
n
> > > fix locally. Alternatively you can just Ack this and let me take it
> > > through the GPIO tree.
> >
> > I'm okay with it, but why do you need it?
> >
>
> For historical reasons gpiod_set_value() and its variants don't have a
> return value. However, we now support all kinds of hardware that can
> fail to set a line value: I2C, SPI, USB (hot-unpluggable chips), etc.
> I want to rework the GPIO subsystem to make these functions return int
> and become able to indicate failures. Build-bot complained about my
> series[1] and pointed at this driver after the interface for
> gpiod_set_value_cansleep() changed in patch 1. This is why I want to
> fix it, get it into my tree and then pick up the series.
>
> Sorry for not explaining it in detail earlier.
>
> Bart
>
> [1] https://lore.kernel.org/linux-gpio/20250211-gpio-set-retval-v1-0-52d3=
d613d7d3@linaro.org/

Is it fine for you if I take it through the GPIO tree? Could you
please leave your Ack under the patch if so?

Thanks in advance,
Bartosz

