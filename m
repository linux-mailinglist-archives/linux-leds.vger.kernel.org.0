Return-Path: <linux-leds+bounces-2117-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A36509160A3
	for <lists+linux-leds@lfdr.de>; Tue, 25 Jun 2024 10:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2776FB20B40
	for <lists+linux-leds@lfdr.de>; Tue, 25 Jun 2024 08:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0502D145B3F;
	Tue, 25 Jun 2024 08:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KlsJRfHj"
X-Original-To: linux-leds@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C577344F;
	Tue, 25 Jun 2024 08:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719302835; cv=none; b=olvpI3EGwpWZ4t/noO/pywt7bssjSTCF2E9IdiM6ARCY8bQqCWwEAvc2ShglHNXaEponUC8GG+j8cd5wzrqT1FuMrNM2GcQ28wmM+9o0sRYfi6tgVznnMCa8uOgMzZY+dlpxmh6GlN0GpRyNwIHZuGx4SO67/0Ty48HjpIAOCGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719302835; c=relaxed/simple;
	bh=EWcHZHxdczRKkpLlxO28cite0TBupjdNg5fYLFMJKdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rKliv0jUh3xI8GvTW+zG0ZO4rJtQ0uO9xjt5H/k01bPK+nx5W2wdIx236v8CAp9bHp/6+V0HS2OaoCzedcNaIJ1/2NS6LKJaiZVyDuTOhm5H2Z2cuyCoFTAFAi2RkCbgVVhk2WvPPMgol+7FuNRuBenCOMTfwM166uwfSWJr5r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KlsJRfHj; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 10938FF817;
	Tue, 25 Jun 2024 08:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719302831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n6rqwF5Fh2k8cSQWI4fb28hAkzw4LZpZEQHuVtdSso8=;
	b=KlsJRfHjSeiNm8tb2S4Irrhi0KAR6zXIu/gf5LI7hgn271V9R0yBIi67nMR9f1Li+zPsxQ
	KgeCryjoRpMbWo18EsuehglWCd0Y84T3r4nqsV/Fn/iFkcGFJqfFLu8GDIMxPMHoWOWAPC
	PNohWETcmuMEmeU+087LMCz+SObI17uaAwzK4Qv6LvFdriizDaJxCCLJBbh+WmuhKH196t
	WSO3DniXwQAkUOEOIoIocL05yXunXmgOE9xn/TQMh6EcN7PLuOSuNjjSnKondPEi/44nmb
	GMG2yr/ztFPXjNtJuSIxjiizw8jPAhS3eGIiTLhfAksHNgh7v9FVrScMg8VqRw==
Date: Tue, 25 Jun 2024 10:07:09 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Miaoqian Lin
 <linmq006@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "leds: led-core: Fix refcount leak in
 of_led_get()"
Message-ID: <20240625100709.307568fd@bootlin.com>
In-Reply-To: <20240625-led-class-device-leak-v1-1-9eb4436310c2@bootlin.com>
References: <20240625-led-class-device-leak-v1-1-9eb4436310c2@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com

Hi Luca,

On Tue, 25 Jun 2024 09:26:52 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> This reverts commit da1afe8e6099980fe1e2fd7436dca284af9d3f29.
> 
> Commit 699a8c7c4bd3 ("leds: Add of_led_get() and led_put()"), introduced in
> 5.5, added of_led_get() and led_put() but missed a put_device() in
> led_put(), thus creating a leak in case the consumer device is removed.
> 
> Arguably device removal was not very popular, so this went apparently
> unnoticed until 2022. In January 2023 two different patches got merged to
> fix the same bug:
> 
>  - commit da1afe8e6099 ("leds: led-core: Fix refcount leak in of_led_get()")
>  - commit 445110941eb9 ("leds: led-class: Add missing put_device() to led_put()")
> 
> They fix the bug in two different ways, which creates no patch conflicts,
> and both were merged in v6.2. The result is that now there is one more
> put_device() than get_device()s, instead of one less.
> 
> Arguably device removal is not very popular yet, so this apparently hasn't
> been noticed as well up to now. But it blew up here while I'm working with
> device tree overlay insertion and removal. The symptom is an apparently
> unrelated list of oopses on device removal, with reasons:
> 
>   kernfs: can not remove 'uevent', no directory
>   kernfs: can not remove 'brightness', no directory
>   kernfs: can not remove 'max_brightness', no directory
>   ...
> 
> Here sysfs fails removing attribute files, which is because the device name
> changed and so the sysfs path. This is because the device name string got
> corrupted, which is because it got freed too early and its memory reused.
> 
> Different symptoms could appear in different use cases.
> 
> Fix by removing one of the two fixes.
> 
> The choice was to remove commit da1afe8e6099 because:
> 
>  * it is calling put_device() inside of_led_get() just after getting the
>    device, thus it is basically not refcounting the LED device at all
>    during its entire lifetime
>  * it does not add a corresponding put_device() in led_get(), so it fixes
>    only the OF case
> 
> The other fix (445110941eb9) is adding the put_device() in led_put() so it
> covers the entire lifetime, and it works even in the non-DT case.
> 
> Fixes: da1afe8e6099 ("leds: led-core: Fix refcount leak in of_led_get()")
> Co-developed-by: Hervé Codina <herve.codina@bootlin.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

As there is a Co-developer, you have to add his/her Signed-off-by:
https://elixir.bootlin.com/linux/v6.10-rc5/source/Documentation/process/submitting-patches.rst#L494

So feel free to:
  a) Add Signed-off-by: Hervé Codina <herve.codina@bootlin.com>
or
  b) Remove Co-developed-by: Hervé Codina <herve.codina@bootlin.com>

Even if I participate in that fix, I will not be upset if you remove the
Co-developed-by :)

Best regards,
Hervé

