Return-Path: <linux-leds+bounces-3675-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D6B9F7736
	for <lists+linux-leds@lfdr.de>; Thu, 19 Dec 2024 09:25:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62588164A55
	for <lists+linux-leds@lfdr.de>; Thu, 19 Dec 2024 08:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2913921C9F7;
	Thu, 19 Dec 2024 08:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mD7RmLgW"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37CD21D00A;
	Thu, 19 Dec 2024 08:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734596709; cv=none; b=L02lzD8+1svh0Mq5QMdN+GZTTFJalI9Nuj3z1wNmmLqYQSjf0mTS/5QeqOGLCZK3Kp21jXfIwXJdEg+N5unJm0Du23QCqVJeruDo+C7zAf4VkLKASOgY5FOkQyH8i8lVnoRNqSPksln1qEUBVSrBo5x38uwEITRyC4w4xqhibNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734596709; c=relaxed/simple;
	bh=jFi+JUs7vX7oVh80CtBZwQO6XjGEpjpq0xQ+EXlGqiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nXbuJur32w+bDyKMV3l9vjeLQxWeZNhwXkEpB9hBsh1RUsM/ZJL63S7QnNqW7SDpSuuVbQDJL49W1dc/3lUqzHxIjgCH8sOGfeHQDTYtgziOz80ENCwOZ2Gc50QzFWvro8UEYRqfpco0c+UC9rCb8uW6aNI9zlVU+WTR9rkTk2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mD7RmLgW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510D2C4CECE;
	Thu, 19 Dec 2024 08:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734596708;
	bh=jFi+JUs7vX7oVh80CtBZwQO6XjGEpjpq0xQ+EXlGqiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mD7RmLgWd7BjhiNjv6I6y3ASrva3lMhbwe8QFXD5hVbIAeJpsk3/O81878i09nFuv
	 c1tYUxhEaXgo6qcYxTiCCzzngxHaDS+gvXMe5jTEB/EsK3GRL7QyV2kHrpFw+S/319
	 N0jSO9rmnBAW48cIhTd8vzcrjsXMsAbqvZllJPtq/UHrIg7A4XbZsM25AcH0ulqq60
	 ylKP5PoPy2mpkKJ8i/pgbuoAbQbJ2GUVEerAw3rkHjnEE2j0ZX+M8fsyOJofupuxiT
	 ewJHw2SoPTMWdW1+vsbJPECoo3WOIv0qw2Od2wC0hpx3AKOCWQWbuSwSxWorgCMtO4
	 3UNCVq+Q3gKlw==
Date: Thu, 19 Dec 2024 08:25:04 +0000
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Pavel Machek <pavel@ucw.cz>,
	Jakob Riepler <jakob+lkml@paranoidlabs.org>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4] leds: pwm-multicolor: Disable PWM when going
 to suspend
Message-ID: <20241219082504.GM2418536@google.com>
References: <20241216213754.18374-2-jakob+lkml@paranoidlabs.org>
 <173444790659.1886613.13367326556110236101.b4-ty@kernel.org>
 <kfkfwwv3ytv3jdcfg5xle6xjks7mjk6ziqe75lrhq4tqfgi6pk@borrphl7vatz>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <kfkfwwv3ytv3jdcfg5xle6xjks7mjk6ziqe75lrhq4tqfgi6pk@borrphl7vatz>

On Thu, 19 Dec 2024, Uwe Kleine-König wrote:

> Hello Lee,
> 
> On Tue, Dec 17, 2024 at 03:05:06PM +0000, Lee Jones wrote:
> > On Mon, 16 Dec 2024 22:37:55 +0100, Jakob Riepler wrote:
> > > This fixes suspend on platforms like stm32mp1xx, where the PWM consumer
> > > has to be disabled for the PWM to enter suspend.
> > > Another positive side effect is that active-low LEDs now properly
> > > turn off instead of going back to full brightness when they are set to 0.
> > > 
> > > 
> > 
> > Applied, thanks!
> > 
> > [1/1] leds: pwm-multicolor: Disable PWM when going to suspend
> >       commit: 29df7025cff00dd9fa7cacbec979ede97ee775eb
> 
> Where is this applied? I checked today's next and even after
> 
> 	for b in for-leds-next for-leds-next-next leds-fixes master; do git fetch git://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git refs/heads/$b; done
> 
> I don't have the above commit object and these branches don't seem to
> contain the commit with a different commit id either.

Check again tomorrow. :)

-- 
Lee Jones [李琼斯]

