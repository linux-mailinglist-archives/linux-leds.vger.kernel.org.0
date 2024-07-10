Return-Path: <linux-leds+bounces-2244-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 665CB92D6F2
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 18:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 970D31C20A63
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 16:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E6D1922DC;
	Wed, 10 Jul 2024 16:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XOsyJWT5"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDB5BE4E;
	Wed, 10 Jul 2024 16:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720630532; cv=none; b=s4NX2Gk1/laZso28vwkUOi+PReSeu2ucc6lTHlzfgbh4sE3I0J+p7uKRDfXUWYhu9vVlcIvYkTu/XwC2Rk1johLJJrKpPxp3RxukTE9jSuCDGYLj9rKWbKTMS7Zk+99W7OkynjADDn1mS/m/FeRPbdcrwpi+ZbpkD2t6+NxVfbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720630532; c=relaxed/simple;
	bh=SDs3j2sklTtNUCbJwD83rxAJOvkFImU2+Cn4RzDgmgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWe4uuUWXfh2/g1ki0RJkhR6TQ/T2ZkWrxWeBaVd9WVhrRGwUgP56yTEpplx2SOiw8oKjibNAikZaWBhgiUf0jGvz7WQIV5L/zaPUvG8fxsBMhFOawn/6Y646usQguA1FHKaW++LFXd1dUhi6Q5SAVb2M0wuSZ+riaVfSm/So6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XOsyJWT5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03F6AC32786;
	Wed, 10 Jul 2024 16:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720630532;
	bh=SDs3j2sklTtNUCbJwD83rxAJOvkFImU2+Cn4RzDgmgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XOsyJWT5sPKShJnVtfphKAnjDBUc+TESAsSVM2ZBxvbAcr92h9aONUF2IzHttuWEA
	 ono7roGyjPXpv0JLvneBbNMt2RXq81FBk7hPlByJiF4BX0Xo66jxvc/uGt8MQoOG2Z
	 R3xOzPPPkvWZWV8yiIgCs6uGimh86NQW1e+4uzPImfMEtMnzT5rv23Xb9lbfc0Bsd7
	 MZXFTWgiq9RtJPX8F4ZMyLGTT6WX0d4/eUwtZX227qa5f4I0LdqOvfxT/zTLlthxTe
	 kfnXzjNrlrd/GaH4+FkE60NWrSq+1R3NueO7Ku4lQYzursOAt9Fex2aoH0zYqFgcpt
	 5hVJ0gxrGu+4A==
Date: Wed, 10 Jul 2024 17:55:28 +0100
From: Lee Jones <lee@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Christian Marangi <ansuelsmth@gmail.com>, linux-leds@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 3/3] leds: leds-lp55xx: Convert mutex lock/unlock to
 guard API
Message-ID: <20240710165528.GH501857@google.com>
References: <20240626221520.2846-1-ansuelsmth@gmail.com>
 <20240626221520.2846-3-ansuelsmth@gmail.com>
 <493f3160-90be-4c02-a0d8-bedb630e5f1c@web.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <493f3160-90be-4c02-a0d8-bedb630e5f1c@web.de>

On Wed, 10 Jul 2024, Markus Elfring wrote:

> …
> > +++ b/drivers/leds/leds-lp5521.c
> …
> > @@ -185,9 +186,9 @@ static ssize_t lp5521_selftest(struct device *dev,
> >  	struct lp55xx_chip *chip = led->chip;
> >  	int ret;
> >
> > -	mutex_lock(&chip->lock);
> > +	guard(mutex, &chip->lock);
> 
> How did you come to the conclusion to try such a syntax variant out?
> 
> Would the following statement (with additional parentheses) be more appropriate?
> 
> 	guard(mutex)(&chip->lock);

Yes, that's the fix.

I'm more concerned with how untested patches came to being submitted.

-- 
Lee Jones [李琼斯]

