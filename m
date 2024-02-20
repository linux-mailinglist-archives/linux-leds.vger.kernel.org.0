Return-Path: <linux-leds+bounces-878-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA9085BE9B
	for <lists+linux-leds@lfdr.de>; Tue, 20 Feb 2024 15:20:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 182772831A2
	for <lists+linux-leds@lfdr.de>; Tue, 20 Feb 2024 14:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51796BB3C;
	Tue, 20 Feb 2024 14:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1bGl4ldL"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D18C6A034
	for <linux-leds@vger.kernel.org>; Tue, 20 Feb 2024 14:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708438811; cv=none; b=kQhCiCYyaM91Sg49trHFf+kG2wBrF2XfEYh+8lDAisUODvZSTJEfc3im4lr6J1tzFHfuwpT4C1Vgm+GdKKhoLdPHXLQISizBbs67fpt6JXYJ9AsD6PhvIamzlEuFWJWLhDIuks7mxK2g19OAAT/nP0OPU04r7kyBl5CExuo+lCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708438811; c=relaxed/simple;
	bh=48womPk9DGD0jZ8lhc8PlrjqWPDLdoKv+1RFlvmpOPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gTWCISEFNvfFqG6qnC0qi3Vju8jXPZNEGqgvm354RS7U2iyhrH9a3xltzoDJZvXcgwvk+6SuojKULMRUbeLJ0dGTL7gUWtQlvdeZA+HG5mo1jx2GnLl7S/fXaCXmJESnqoQt8cOYXvIeXtTH0Uur19DKVIYYiZhGcXkTTpnXXEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1bGl4ldL; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2185d368211so3304558fac.3
        for <linux-leds@vger.kernel.org>; Tue, 20 Feb 2024 06:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708438808; x=1709043608; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1k55yQJs+Dey36k/hxT0QeaBbeXBq2IfYIGNUVHLCfU=;
        b=1bGl4ldLAe3spnfpEOdNnc1ZKZNPWETkTqeLDkHo2E5/39v7W7OecYPU4pGJuQ1z28
         HS/NXVDOQb9jb+eDsaTie5d9fh9pzepLSjBzKsCAeWVKTfCJAva4Eew4e1fgFnfqmd8x
         4DZimRjpf+8jR8DaMWxv2pbOv4medEG64Bo/w548sIYn770NYZfZpTsdP4ChCUo6PONf
         /Yr/7j02JTAANis2JAuXtA4ITId4Xj/J4n7ox8ObdRR825c6dKOhcgKBKiKkppcc8FEr
         Yy767zbhx5zBCeEnpMmXy7OAgT0tp3hhTjQ29khw/9p9879pbwVpD6w4B/q4VdDlYxZ8
         aDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708438808; x=1709043608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1k55yQJs+Dey36k/hxT0QeaBbeXBq2IfYIGNUVHLCfU=;
        b=G2Blyh1cjR6+tOo82BVYNxRe+OIkoj85C7X2iwFU4YSZjoI8yI3LM5hy+VIPTqq4F/
         Q6NGfqtvE7/G2L8R3hKuvNCJHAqpuK4g3VUPAXfxpSwTzZk/ryQhnKjThzMDViy7s5va
         CzaBZdKrC9JXMuzqawALTyuIiLnlIRx3Iq2FBzyoqJvEt7iDBJbPjzLT487bOADXLzww
         /qba5RgJ4Xo8JI3GmckU2Y65w1asYT1bJe5QMQOPSdmkZ0KvZjrKPKRMm+Zyl80H4HWv
         LMXWjEtVhx4wFrgTcLyLZEiSx9s01jVEgOwegiRuEZBMZIDf70ifP/ADIvgzbxpMoxC8
         vPoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwvGnMTyk/P79+o+BI25QVFS1sDNlZS1kFNVRt5d13J3fiCFKP/Nxrci5OBQxH8tJXeE8POPJ9LXE5EYyhUGCBJD6lCBAKBbIBhg==
X-Gm-Message-State: AOJu0Yzr8WYt2S8DUdQp/ushch+IUMLhl6ChxeT8XeSwu6tAG2Y4WFPc
	EwvRhCbWVkMmk0J3dUKIEu+0GrrqXvx808E19mpHLYhrv1LSO3c2M3AzVq26LlzaQDhKnYZMjkD
	moEcXRySq6j0UHZARe86Uib8yQXBHyeX/GWNL/A==
X-Google-Smtp-Source: AGHT+IFMnXiKG47gNdHQm7RVwIso6YbTWdIs9HphpyCnoOP6Xb45mzpZFaUrVrOl7nB1Bxt7pQX6gzBpMMRlDVBrGho=
X-Received: by 2002:a05:6871:5b1d:b0:21e:aca4:883 with SMTP id
 op29-20020a0568715b1d00b0021eaca40883mr9346365oac.15.1708438808666; Tue, 20
 Feb 2024 06:20:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220133950.138452-1-herve.codina@bootlin.com>
In-Reply-To: <20240220133950.138452-1-herve.codina@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 20 Feb 2024 15:19:57 +0100
Message-ID: <CAMRc=MfWPEOHeNvAwra-JxHZBFMrQbP+273zbFLDZfxi7fx8Yg@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/2] leds: gpio: Add devlink between the leds-gpio
 device and the gpio used.
To: Herve Codina <herve.codina@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 2:39=E2=80=AFPM Herve Codina <herve.codina@bootlin.=
com> wrote:
>
> Hi,
>
> Note: Resent this series with Saravana added in Cc.
>
> When a gpio used by the leds-gpio device is removed, the leds-gpio
> device continues to use this gpio. Also, when the gpio is back, the
> leds-gpio still uses the old removed gpio.
>
> A consumer/supplier relationship is missing between the leds-gpio device
> (consumer) and the gpio used (supplier).
>
> This series adds an addionnal devlink between this two device.
> With this link when the gpio is removed, the leds-gpio device is also
> removed.
>
> Best regards,
> Herv=C3=A9 Codina
>
> Herve Codina (2):
>   gpiolib: Introduce gpiod_device_add_link()
>   leds: gpio: Add devlinks between the gpio consumed and the gpio leds
>     device
>
>  drivers/gpio/gpiolib.c        | 32 ++++++++++++++++++++++++++++++++
>  drivers/leds/leds-gpio.c      | 15 +++++++++++++++
>  include/linux/gpio/consumer.h |  5 +++++
>  3 files changed, 52 insertions(+)
>
> --
> 2.43.0
>

Can you add some more context here in the form of DT snippets that
lead to this being needed?

Bartosz

