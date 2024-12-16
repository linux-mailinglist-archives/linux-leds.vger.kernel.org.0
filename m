Return-Path: <linux-leds+bounces-3613-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 749E49F2D55
	for <lists+linux-leds@lfdr.de>; Mon, 16 Dec 2024 10:50:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F0151886041
	for <lists+linux-leds@lfdr.de>; Mon, 16 Dec 2024 09:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1FF202C21;
	Mon, 16 Dec 2024 09:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qn9ZX0LI"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8457B1FFC60;
	Mon, 16 Dec 2024 09:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734342588; cv=none; b=VzwiLna0ShMDncqO7VA4cwQpOIeVBX6i1bX6cHxgugvTtiqZK4igkZEr5qvIQxZdPAnPgaWldViuyaBmpBCZTlnCWRb531Lfb7EQpRwn/fU2m6aPjlLusmSvSzNDRW4AO2RMJ0xjfD5DAP8KnRx4HhPoV0DHbMeBEeuOILmQHxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734342588; c=relaxed/simple;
	bh=5zUbiawPtOv8GK8M6GJMQMoFppSm38F60LOkOuxh+h0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iw5ky+BFE6wvI1z5ywg0+4TadPLy7kYw5Yhhj31FdZ3HG8EE2g/7u6fLTpn4wImaao93vAtFpkclciH2+vpYaG26XKtfONGmQTbyavxQCLWuiyVNDUQEb+MfHRTcwndaAt2wdA8EMsTv4VdHaLXeHvmPmZFcxPHteFuYC/eOef8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qn9ZX0LI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67EDAC4CED0;
	Mon, 16 Dec 2024 09:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734342588;
	bh=5zUbiawPtOv8GK8M6GJMQMoFppSm38F60LOkOuxh+h0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qn9ZX0LIBs70rH1XKkLnM02o6g5ZA7LlGkN6T3wjf7ftvX57Bd69PMmCQ5foyYSrE
	 PaokxoRqsQf2v/Pyguk83LmeXtKJhLrTYpDYkQr3Pj/N3+1XoWrLLil+7OJNuO8HhP
	 jNKMrvC8FDvZd71RKLBTxkGPsbZMQUKrX/wFmwtrWsH3nqfK2PnVxACMURUi0pPSfD
	 oesxxEQrplk0oPTZhbqyv9M9lbVcE9t/uinUaEtym++iuLCLkA5FnxB0XMgwrVCdR0
	 4BQj+LKlxyViOiQkjTbaL5gUuHc8VfWd6lqjuQu7zaTdLzcJel4uI8bXvyyaXRwuwK
	 E+llaDldNrj1A==
Date: Mon, 16 Dec 2024 09:49:43 +0000
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jakob Riepler <jakob+lkml@paranoidlabs.org>,
	Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
	Jakob Riepler <jakob+lkml@chaosfield.at>
Subject: Re: [PATCH v3] leds: pwm-multicolor: Disable PWM when going to
 suspend
Message-ID: <20241216094943.GH2418536@google.com>
References: <d7d930bc-4c82-4272-b2c6-88f7cac5a3e1@chaosfield.at>
 <50bbd767-b0e0-4788-975b-f5d9598208e5@chaosfield.at>
 <20241212174356.GJ7139@google.com>
 <d021d011-d5d4-4692-973a-f5a45be8db94@chaosfield.at>
 <20241213163445.GA2418536@google.com>
 <20241213191039.181169-3-jakob+lkml@paranoidlabs.org>
 <2wirsrr37nwo54k3fqh4xejzjidjclc5jvw6fjl657ytmfquof@ygqsovx23h3p>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2wirsrr37nwo54k3fqh4xejzjidjclc5jvw6fjl657ytmfquof@ygqsovx23h3p>

On Sat, 14 Dec 2024, Uwe Kleine-König wrote:

> Hello Jakob,
> 
> On Fri, Dec 13, 2024 at 08:10:41PM +0100, Jakob Riepler wrote:
> > This fixes suspend on platforms like stm32mp1xx, where the PWM consumer
> > has to be disabled for the PWM to enter suspend.
> > Another positive side effect is that active-low LEDs now properly
> > turn off instead of going back to full brightness when they are set to 0.
> > 
> > Link: https://lore.kernel.org/all/20240417153846.271751-2-u.kleine-koenig@pengutronix.de/
> > Signed-off-by: Jakob Riepler <jakob+lkml@chaosfield.at>
> > ---
> > Changes in v2:
> >  - fix wrong line-breaks in patch
> > Changes in v3:
> >  - use git send-email
> 
> Applies fine for me now.
> 
> I already gave my Ack for v2, repeating it here to make it easy to pick
> up:
> 
> Acked-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> 
> Please add this to your v4 if you have to send a new version. I don't
> know how picky Lee is, but the email address of the sender doesn't match
> the S-o-b line ...

Very picky!  Please resend.

Also, please send subsequent versions as a new thread.

-- 
Lee Jones [李琼斯]

