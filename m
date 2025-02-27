Return-Path: <linux-leds+bounces-4118-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA9DA48703
	for <lists+linux-leds@lfdr.de>; Thu, 27 Feb 2025 18:50:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A132F3A8757
	for <lists+linux-leds@lfdr.de>; Thu, 27 Feb 2025 17:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1FD1EB5DA;
	Thu, 27 Feb 2025 17:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NLtlNYj1"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBC81D6182;
	Thu, 27 Feb 2025 17:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740678638; cv=none; b=nkyBrJuP/GMxvccaPddqie83VrgUrq/96/MGxueNdGPjiISH6LKc5hDhMb/yXYK8sk3hXzCr0roq0uuJTcGQWmkmrCh5/a+k6mljUDGxLz2ni7VTPCDyXuwq3YlxKLQNmJYtPD5YucJzD/wPZ3UxihxMTu48EgO8bGbf3nr/qwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740678638; c=relaxed/simple;
	bh=pl3n5q+dUJ7OFTCDYuNcKxD9PmvXSqWrktdB02TglCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=guuHV2QlRklyvLDy5sa/4syV6Q7cCQan+yfYs1pvnCBLSuJ8wfa55rHtQd87K9Pyc50PsKbqS4ud8XJFxr9ykaJXEOopi5y8Ln8nQeaYq2OWigGVLqzxuXmyaAoF2Vp5sU7J3Bpw0ZXcmKM8u/lVTzEVrTaQEv5dUmO0j2vudVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NLtlNYj1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 916C4C4CEDD;
	Thu, 27 Feb 2025 17:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740678637;
	bh=pl3n5q+dUJ7OFTCDYuNcKxD9PmvXSqWrktdB02TglCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NLtlNYj1s86GTe/TOqjMpmhUooZZfQFza8ifCBwFaGJVss4Y40eyXP+R2EVMFdab8
	 0Tx58uPaLjmWAV7yuMNOh10gHOARwClh8Mq7IuqRyt7yG+opJp2duF+QrX4KV9CveT
	 PztnDefqlS0MIec8x83p164Q7RrhpiWnZpmfvAMJQ7yB3tU+fbIwyhd9FnlKU2WSs1
	 d8NDgBFmDVZ19s+ogcHZE6S/C6Ud4CXXJAs6dy7GQnEw11J6yprwGbtzJmSaWZkXtR
	 km/oNuMLFxgjNgfWQgCoieTbK2DkH7FBYh58+uCBCR/Yx69HM8v5OPlx+KyJuDLwjs
	 dqQiGWkgW4IvA==
Date: Thu, 27 Feb 2025 17:50:33 +0000
From: Lee Jones <lee@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Pavel Machek <pavel@kernel.org>,
	Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: st1202: Fix an error handling path in
 st1202_probe()
Message-ID: <20250227175033.GJ824852@google.com>
References: <4afa457713874729eb61eec533a4674a51d1d242.1739985599.git.christophe.jaillet@wanadoo.fr>
 <20250220155834.GA824852@google.com>
 <307b6cbe-6079-4995-b395-b63de69edb4b@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <307b6cbe-6079-4995-b395-b63de69edb4b@wanadoo.fr>

On Sun, 23 Feb 2025, Christophe JAILLET wrote:

> Le 20/02/2025 à 16:58, Lee Jones a écrit :
> > On Wed, 19 Feb 2025, Christophe JAILLET wrote:
> > 
> > > devm_mutex_init() may return -ENOMEM.
> > > So this error should be handled in st1202_probe().
> > 
> > The start of a new sentence shouldn't warrant a line break.
> > 
> > > Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > ---
> > >   drivers/leds/leds-st1202.c | 5 ++++-
> > >   1 file changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> > > index b691c4886993..4fc17d518292 100644
> > > --- a/drivers/leds/leds-st1202.c
> > > +++ b/drivers/leds/leds-st1202.c
> > > @@ -356,7 +356,10 @@ static int st1202_probe(struct i2c_client *client)
> > >   	if (!chip)
> > >   		return -ENOMEM;
> > > -	devm_mutex_init(&client->dev, &chip->lock);
> > > +	ret = devm_mutex_init(&client->dev, &chip->lock);
> > > +	if (ret < 0)
> > 
> > My assumption is that anything but 0 would be bad, thus:
> > 
> > 	if (ret)
> 
> Matter of taste. All other tests in this driver are "if (ret < 0)" or "if
> (ret != 0)".
> 
> What do you prefer: consistency or concision? (my own choice goes to
> consistency)
> 
> If you confirm concision, I'll send a v2 that also fix your other comment
> above.

Ah, I just attempted to apply the patch, but it looks like it's already
fixed in ("leds: st1202: Check for error code from devm_mutex_init()
call").

-- 
Lee Jones [李琼斯]

