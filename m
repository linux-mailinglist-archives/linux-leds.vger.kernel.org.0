Return-Path: <linux-leds+bounces-2161-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8ABF91A009
	for <lists+linux-leds@lfdr.de>; Thu, 27 Jun 2024 09:08:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 523821F235A5
	for <lists+linux-leds@lfdr.de>; Thu, 27 Jun 2024 07:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D692B9B6;
	Thu, 27 Jun 2024 07:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kk5elsn5"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA4A33C9;
	Thu, 27 Jun 2024 07:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719472118; cv=none; b=UCYyYtQJww3uCuWkPinTu2lMf+LDiqIY3a/zF62hSAxowtGq+mD6cT59UowAM7m1MdVVzauPP0MITbtjiiWv9RdLcGsCHmrASHdofV02oNtOTthX8s81eRowCdlrTkVENxplZZtLZZl4elp7Cq6FWol23daMkTeqc5BJagcd0Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719472118; c=relaxed/simple;
	bh=DypgcVuK7+dsUZCKqutrKmC/rFZeFkmZ3box/phwHsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+7QcyYxuIPMoIW+9hWu5FcoQQo1PnAAt1KfwLrwEQRF683Tlfa76vgRbfRMw0ITK+1pMz3J0zYJfTydk+Yltgi1brV1cfZ6ukEBJEbQzpr3t5Js8ZzzpD3fh7z4sYi4pC1s7U2dQrU6p5jj5E9rGLJH4ToSL4TWXQ4F3VArOiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kk5elsn5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 345C6C2BBFC;
	Thu, 27 Jun 2024 07:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719472118;
	bh=DypgcVuK7+dsUZCKqutrKmC/rFZeFkmZ3box/phwHsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kk5elsn5T8V7S9InH8TJdhsVanWmYy34kU5vEZVaX/ARifmsdpsNQ/v9WVRROreIQ
	 3Tcys2WUcKGXxM/ZG5jYSoz97nax/bc9dXuOSVUNCUt/WFAiQgbJu3P9kqOVrLqBj5
	 gCENNZFSVcMZtnN7QPXsFDQ+KkHL3Jm0sMbV8YnkadHuP7kxBvm/zU9TjXDpxG22jL
	 MXp4n0gkup1mZlOwl/u67D1SiWcyATZwtupcva6O+CpNw65KUO9eANZ/q2TfcYMDSe
	 Dk7Cs3EFb+aZ6/th0g2CPnCS73IQ8IznP9FEegcBphZ/TVsxG5PIwJ8PtVZtTDIM8k
	 9xTog6JSEN7Fg==
Date: Thu, 27 Jun 2024 08:08:34 +0100
From: Lee Jones <lee@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Christian Marangi <ansuelsmth@gmail.com>, linux-leds@vger.kernel.org,
	Pavel Machek <pavel@ucw.cz>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] leds: leds-lp55xx: Convert mutex lock/unlock to
 guard API
Message-ID: <20240627070834.GC2532839@google.com>
References: <20240626221520.2846-1-ansuelsmth@gmail.com>
 <20240626221520.2846-3-ansuelsmth@gmail.com>
 <fa53fa80-4c0e-44d1-a62d-da219831526c@web.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa53fa80-4c0e-44d1-a62d-da219831526c@web.de>

On Thu, 27 Jun 2024, Markus Elfring wrote:

> > Convert any entry of mutex lock/unlock to guard API and simplify code.
> 
> Thanks that you would like to support another bit of collateral evolution.
> 
> * Would you get into the mood to benefit any more from applications
>   of scope-based resource management?
> 
> * Will development interests accordingly grow to adjust further source code places
>   according to known pairs of function calls?
> 
> 
> > With the use of guard API, handling for selttest functions can be
> 
>                                           selftest?
> 
> 
> > greatly simplified.
> 
> I find cover letters helpful for patch series.
> 
> 
> …
> > +++ b/drivers/leds/leds-lp5521.c
> > @@ -9,6 +9,7 @@
> >   *          Milo(Woogyom) Kim <milo.kim@ti.com>
> >   */
> >
> > +#include <linux/cleanup.h>
> >  #include <linux/delay.h>
> >  #include <linux/firmware.h>
> …
> 
> I guess that this proposed addition is not directly needed here (and related places)
> because the header file is included for the macro call “DEFINE_GUARD(mutex, …)” already.
> https://elixir.bootlin.com/linux/v6.10-rc5/source/include/linux/mutex.h#L22
> 
> 
> …
> > @@ -185,9 +186,9 @@ static ssize_t lp5521_selftest(struct device *dev,
> >  	struct lp55xx_chip *chip = led->chip;
> >  	int ret;
> >
> > -	mutex_lock(&chip->lock);
> > +	guard(mutex, &chip->lock);
> > +
> >  	ret = lp5521_run_selftest(chip, buf);
> > -	mutex_unlock(&chip->lock);
> >
> >  	return sysfs_emit(buf, "%s\n", ret ? "FAIL" : "OK");
> >  }
> …
> 
> How do you think about to omit any blank lines (also at similar places)?

Please do not omit the blank lines.

-- 
Lee Jones [李琼斯]

