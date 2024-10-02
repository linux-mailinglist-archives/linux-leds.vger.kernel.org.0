Return-Path: <linux-leds+bounces-2938-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AAB98E378
	for <lists+linux-leds@lfdr.de>; Wed,  2 Oct 2024 21:30:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3DAFB239A9
	for <lists+linux-leds@lfdr.de>; Wed,  2 Oct 2024 19:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0020485270;
	Wed,  2 Oct 2024 19:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Op1A23Tz"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F5A1FDA;
	Wed,  2 Oct 2024 19:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727897431; cv=none; b=MQXVid4CMeG4QFz1N2uwzQB22mM88L3YeCijdOUYdnCuO2PRopOeh+tKmxmqcVlaCC5Fi4BZynlH1D5j9gA6IMrBb+I3nbuzPIrzK3EK+dk+x3PyrGPxuKkFKT9gPshiQnf0OGmncKRiBTZPSLxd16MMsEB9G34RC0Ax/6yGYv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727897431; c=relaxed/simple;
	bh=NmF9PitW2EHxF6jxb93y7lRw8MeyFcy2/5EnWhYECmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G0nH1ZFvn2JzPiBHU01khFYGcOEfzYQ8pye80/A8nhi9jtuutxYbAwkOjggawpuFPdN+WTKpTcTl+lwTxCcgorszni1m/hHMTVwddCF8ctn4rSIiwRg/X77Pnf6O8E9+WoWTzhhrhxz6iJoQf0V1sG8T04yNLSL8hj4OhZb8gvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Op1A23Tz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A774C4CEC2;
	Wed,  2 Oct 2024 19:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727897431;
	bh=NmF9PitW2EHxF6jxb93y7lRw8MeyFcy2/5EnWhYECmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Op1A23TzgCp9nLI5b8lOkYq81ELApFJsE0217gXrNyoLHU3fFtVlEwlSuWJxZHqSV
	 ATVd5w7GI4iqblmEqoZKUTB9mcvW44D7AJ01ojnsVVrB9v/4yxPzVbHOtUmvrrJM87
	 F3DKgwicsJZloNkI17JS3LEbmHFcdIW8igYD4buEn7KseaFKmtKq234cX7g5zLMBLh
	 BqLWS9eAvBz/6cYkRK9+4U84QPmXMGi9iVZ6gcIJHpQLhbz+JbThFj8E/RlI3qc7dJ
	 Rq3Ietko+jvT+C4zgUQu6T5UXmkP+TwE9roGF77CNFy4C3cPgXnDcJxoGJ6yJWxsK1
	 bVGV04fAdTkEg==
Date: Wed, 2 Oct 2024 14:30:30 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: leds: bcm63138: Add shift register
 bits
Message-ID: <20241002193030.GA1195702-robh@kernel.org>
References: <20240928-bcm63138-leds-v2-0-f6aa4d4d6ef2@linaro.org>
 <20240928-bcm63138-leds-v2-1-f6aa4d4d6ef2@linaro.org>
 <fmuxz5w77tfkodvntaley2b6kv2c7acgcfb6ojk3plw7g6rbdd@sahgzglndrda>
 <CACRpkdYqR3N0EaS64gqSfRfezsrSueSKHPbMc4A0g3hHg3y6dw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYqR3N0EaS64gqSfRfezsrSueSKHPbMc4A0g3hHg3y6dw@mail.gmail.com>

On Tue, Oct 01, 2024 at 01:18:29PM +0200, Linus Walleij wrote:
> On Sat, Sep 28, 2024 at 10:05 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On Sat, Sep 28, 2024 at 12:29:47AM +0200, Linus Walleij wrote:
> > > +  brcm,serial-shift-bits:
> >
> > bits is an uint32-array, so you need to limit number of items, e.g.
> > items:
> >  - minimum: 1
> >    maximum: 32
> 
> OK this is what I do on the next lines:
> 
> > > +    minimum: 1
> > > +    maximum: 32
> 
> Am I doing something wrong here? I see you have a dash
>   - minimum in your comment but when I grep through the
> existing bindings for stuff ending with -bits it seems they
> do what I do.

All the unit suffixes started as single values, but then we found some 
cases with more than 1 (and even a matrix for opp-hz) and had to extend 
them. 

I think what you have here is fine. We can imply it's 1 entry given the 
scalar constraints.

> 
> > default: [0]? or something else?
> 
> Since we need to stay compatible with older device trees
> the default is whatever is in the hardware after boot :/
> 
> I guess I could write something about it in the description.
> 
> Yours,
> Linus Walleij

