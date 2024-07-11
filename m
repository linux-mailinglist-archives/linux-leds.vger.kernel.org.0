Return-Path: <linux-leds+bounces-2252-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DEA92E178
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 10:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05A6C283480
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 08:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A11C14B96C;
	Thu, 11 Jul 2024 08:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ft7R8Y9V"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A3251004;
	Thu, 11 Jul 2024 08:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720685162; cv=none; b=JWVawMvd5V3DG/RXm5aT8YLTxN2pdCuJZBwSzxcneYnSQ9AJU+7HyAIgHvyKUSZsk5wz88q5K4U0EUGxWjNKjAJXWnYLU7StlhEsKj0JaPIadVd8WzOf2bhLeqmhf1sGq96MFRkQeyStTui9O5bJLV1zaXmx8CKoqi6hLiVN260=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720685162; c=relaxed/simple;
	bh=xa2dw5oq+UcYX5auIrlzuR26j6QiqCgReadooWyVlOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uNzkiEWIfjM62vtuz1y1nQUsjxIVwIhLbHGVsG+6uO6947Uyl+7IJEySWGXL1sHyUok557hSSZhQZMRO6ws2rKhwBeUJnkdoT0+3MXqLan0hF5Q3LndUxTw7yAy0umrlaeQjk8VDvZo6j8nz2qwmNuvbVyv38oCvISSlUZIgGBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ft7R8Y9V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC72C116B1;
	Thu, 11 Jul 2024 08:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720685161;
	bh=xa2dw5oq+UcYX5auIrlzuR26j6QiqCgReadooWyVlOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ft7R8Y9Vd9LdfsYcBvQ3PKg5ij0NFeVvAGXkTBt1+/tdDCIDfH/H1oMBO1Mn8QgKF
	 LNMNA/859u6+3TH4rd1XXUnH+nr5+DmUJweLHVGAsxAnJKL8sjZnoO4vw5Y/dC2jOj
	 kaGBoQKvd+xpI38c0MjNk5dlYE7H5FiqKGz8Xtw8MslH1vCT/7co70EVg8HFJIUG36
	 1Kqnrd185TO79kxww/tEc+dYm6iOuKEoHJa63xaoCICaBMIsStYO1d8+cBpyFXZ54Q
	 KDy7xpqnbXPF4JSz85I0vH2oHE/n6hu5EvRySLRM768iQs9X2aVwQr9cJivojIXANR
	 ff4rcGcNss8jg==
Date: Thu, 11 Jul 2024 09:05:57 +0100
From: Lee Jones <lee@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-leds@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 3/3] leds: leds-lp55xx: Convert mutex lock/unlock to
 guard API
Message-ID: <20240711080557.GI501857@google.com>
References: <20240626221520.2846-1-ansuelsmth@gmail.com>
 <20240626221520.2846-3-ansuelsmth@gmail.com>
 <493f3160-90be-4c02-a0d8-bedb630e5f1c@web.de>
 <20240710165528.GH501857@google.com>
 <668ebf50.050a0220.4aa0d.31b3@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <668ebf50.050a0220.4aa0d.31b3@mx.google.com>

On Wed, 10 Jul 2024, Christian Marangi wrote:

> On Wed, Jul 10, 2024 at 05:55:28PM +0100, Lee Jones wrote:
> > On Wed, 10 Jul 2024, Markus Elfring wrote:
> > 
> > > …
> > > > +++ b/drivers/leds/leds-lp5521.c
> > > …
> > > > @@ -185,9 +186,9 @@ static ssize_t lp5521_selftest(struct device *dev,
> > > >  	struct lp55xx_chip *chip = led->chip;
> > > >  	int ret;
> > > >
> > > > -	mutex_lock(&chip->lock);
> > > > +	guard(mutex, &chip->lock);
> > > 
> > > How did you come to the conclusion to try such a syntax variant out?
> > > 
> > > Would the following statement (with additional parentheses) be more appropriate?
> > > 
> > > 	guard(mutex)(&chip->lock);
> > 
> > Yes, that's the fix.
> > 
> > I'm more concerned with how untested patches came to being submitted.
> >
> 
> Hi Lee,
> profoundly sorry for the happening... Obviusly something went wrong in
> me changing branch and the driver wasn't actually compiled in the
> test... 
> 
> Also with the comments from Markus I tought this needed more changes and
> I leaved out for a bit, so again I'm really sorry that this manage to
> reach next.

No worries.

> What is the next step? Any way I can pose a fix on this and apologize for
> the situation?

I'll fix it up and test it.

-- 
Lee Jones [李琼斯]

