Return-Path: <linux-leds+bounces-5864-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A46C00FB9
	for <lists+linux-leds@lfdr.de>; Thu, 23 Oct 2025 14:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4DD2150363A
	for <lists+linux-leds@lfdr.de>; Thu, 23 Oct 2025 12:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C29F130F800;
	Thu, 23 Oct 2025 12:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uyG+8FMJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7035F2C2363
	for <linux-leds@vger.kernel.org>; Thu, 23 Oct 2025 12:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761221154; cv=none; b=in6YouDbt4hLZ74eYMj5/q+Y2uKPPiGZCZ11a8tSSgHks0USNQ4OsEa13n0VyBRntcOQnfFxQ0xdF/zV61e+3431B+dDuUtqZ2VmM7RL2LdOqEmtXAL/qVFVRIp4wDuxPeMA9vCuSY6jzeOdFTzpXWwfn+bdr8FoGfKdZPmk0i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761221154; c=relaxed/simple;
	bh=Iw/i/voACEOEUB0dl8Hwa2eGsgmSTL3oU67E/m1QVYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P2RAi1qGxEBthr41I2M6i3l1c4bURbAkYE8+BHVe4xcS6PZrVqoPYCet6XfCoBkFKsXkHaxpMbqDEjVc9/F2gg9dxDglAV4I80uCUb1Ums/YbrFerceUDe+nmXL1ZBsZV9eKvleD23IU2ub6A+R307PRc1P32pn0Nf/eJ2CxvYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uyG+8FMJ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso714661f8f.2
        for <linux-leds@vger.kernel.org>; Thu, 23 Oct 2025 05:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761221150; x=1761825950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+knHP+hH8wtFXL9FrX8Adjy6J9Lu8uJnSEg3TGlm3I=;
        b=uyG+8FMJ0sbkNL3nSa3XQOzVI9s2QM7VyNyk9i5TN/UqebVdXbkmHmklYMIX3eodcS
         XBSO1VX/OK+f4qVrfG8kWhp1OaiLxPQ3tNtH0Of5rSk97HhQHfI7LUGoXsXr0OOYABxD
         Y1IePlPMCdWYddBRTEIzxzfyttWk5KNnBeUDrelBeopSGRQ0O29PV+qxrGSgqvRH1rdA
         Qe4GD8ofcIfS3+7PTbQfNzTnsAuqpKJR60NsgDuBuloKnl+3McuZP52DONiXIBux8Vfj
         /27dJ9qYsIkS2fxxLtrORNpy7X5iL4CQbYOOxvKZLV0kUTSs2ZSyK9D42ytpjKLHVqU0
         qrqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761221150; x=1761825950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+knHP+hH8wtFXL9FrX8Adjy6J9Lu8uJnSEg3TGlm3I=;
        b=fywhyNmsi3GsD5bNjDKz07nRahxRDH7jJ/SBORK9EDQFT616xpWREzJ8sR+55fCcXG
         SRaEA/zbxLmkua9mbJ0awUhLkGyy+9cemsdCnEcMuRKsKOjg4ZVXVqhkJoCMUUcJNpn4
         EJW8U6ztI2jf2lg/RFxcVh5WYBL+c24z3dn4hi/CplFn21dLpAm+XzCptwgzOya7um9x
         bk0oq02sadmRpCWDYNZK8Yff/2SrtlkBvI9UhK+FxTXLI5krNAruNPKSUQ2JmY8FHBJS
         EGL6uLIUOfAMKD967KkqvkpFO7fnPYlMPukdtzemVVb55OAkIw7SRjQsjUZ9K7/MSlPi
         HNaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCCO7xsvRAnV3ai1+2bsglN0+FM1Hdz4rQs0d10aXiyAhdmwZJ8gmRNZGzoZ3+wojhOQeq2Q5r9sr4@vger.kernel.org
X-Gm-Message-State: AOJu0Yzoj4bl/q709gv/n/WsBGzslJHbE8EIqDwVcDy/G5c6IZLtmnUx
	Cc/Aro9X28SGEqEvfTyg9ZNwk11Gyd0tZ77PzRFyFiDS1blYQ84MLobzqCKSh6VniaE=
X-Gm-Gg: ASbGncveuL7kOV7AEkzMiFwhN9sAhIII3f2s60+u3mpCxmjgIToLxwlBqxloXBdkgFq
	eSsIWa8y8Z2robYLv31hLjazp+vwz1P8eYBpaj5LQXYVTyHMHRslwrctqYTbvaXsAd1tuGtpgNH
	i1Tytok1fid5jrvGmQMuAIcm95aVtEQ9Ycq7WZY/Xk9dPEklJdB05f4LYcil5x39KANz7NgCFWc
	k9hHGLBKtLAbWNsY9XnF9q/DnhAvnngstCnlU23z+exgAnWicVWeUtxYAxLsRgwNBN1ncpgpvlB
	R/c+rj2fN6eZ3IhcUej2cFM2v725VFpxSmeYFYTZRd37FwRpGj6w+f2PlFvk9sWEgYPdR3l5cHz
	0CHuF8uhsc8mfWU+xC8+KLkshQcUyAmM8V1H8oOtFBOOvYeslKETf7Z2StIRBZMCvAzEqQUE8Tt
	d2PJarx+kJFlPUJRXANqdIKw==
X-Google-Smtp-Source: AGHT+IHwJs8vP+ZphKLVg8Qnj866Tn55HPAEvE8rihx7f3rOB0WHPIdkAlWdTCpxtTyY9j9MwN+iRA==
X-Received: by 2002:a5d:5d10:0:b0:427:7ac:5287 with SMTP id ffacd0b85a97d-42707ac52e1mr14432699f8f.34.1761221149595;
        Thu, 23 Oct 2025 05:05:49 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:1b4:e02e:c538:6feb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897e763csm3719949f8f.6.2025.10.23.05.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 05:05:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v6 0/8] RTL8231 GPIO expander support
Date: Thu, 23 Oct 2025 14:05:47 +0200
Message-ID: <176122114012.40841.4682534085501812836.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251021142407.307753-1-sander@svanheule.net>
References: <20251021142407.307753-1-sander@svanheule.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 21 Oct 2025 16:23:55 +0200, Sander Vanheule wrote:
> The RTL8231 GPIO and LED expander can be configured for use as an MDIO
> or SMI bus device. Currently only the MDIO mode is supported, although
> SMI mode support should be fairly straightforward, once an SMI bus
> driver is available.
> 
> Provided features by the RTL8231:
>   - Up to 37 GPIOs
>     - Configurable drive strength: 8mA or 4mA (currently unsupported)
>     - Input debouncing on GPIOs 31-36
>   - Up to 88 LEDs in multiple scan matrix groups
>     - On, off, or one of six toggling intervals
>     - "single-color mode": 2×36 single color LEDs + 8 bi-color LEDs
>     - "bi-color mode": (12 + 2×6) bi-color LEDs + 24 single color LEDs
>   - Up to one PWM output (currently unsupported)
>     - Fixed duty cycle, 8 selectable frequencies (1.2kHz - 4.8kHz)
> 
> [...]

Applied, thanks!

[1/8] gpio: regmap: Force writes for aliased data regs
      https://git.kernel.org/brgl/linux/c/ed2bd02d24947e36c9438bee1449d9bf87671b16
[2/8] gpio: regmap: Bypass cache for aliased inputs
      https://git.kernel.org/brgl/linux/c/3233741c0be59dd224e797deb2dd1621695ac95c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

