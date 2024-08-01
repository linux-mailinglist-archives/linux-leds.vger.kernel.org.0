Return-Path: <linux-leds+bounces-2376-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C7A944BB9
	for <lists+linux-leds@lfdr.de>; Thu,  1 Aug 2024 14:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B24781C22677
	for <lists+linux-leds@lfdr.de>; Thu,  1 Aug 2024 12:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6987919EEC6;
	Thu,  1 Aug 2024 12:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LP97E20l"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3A6194125;
	Thu,  1 Aug 2024 12:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722516794; cv=none; b=HE/N7A4CEL+tdOwzd9WESg3tCI7QEBXxHG6NNUtL8hI1rKWnlU1fz4Lfa3Vob4XYTbLLS5PcB5ooPpt1QHj0C0TNBe5WKQQRUuRc7NpSi3b8gtgW2jCgnFpRUm+oXbNulh/r0EqY6kdkDptfo4n3iFP8+EqzX6qy2EktX8fmcho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722516794; c=relaxed/simple;
	bh=4TSGYMtxMTPV4JTDRQx/tcJV5tOMAGSkL6U8Y04AVi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ogf0M19FCjmpJoi1ZYIIBFB11F96qonhhwkGGSo9Z5Nx3Jkv+ibx5i0kGHycjqxLacSxJ7aWqMeQfb0GHYE6Z/RaB+7+1IBO7wJlyfC+jhpiYdoFr6SPVrciwJF2f6cI1lQPhIm7WMg6HntupFZR0wyW6FUQYIaWMqqQDZ1L8eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LP97E20l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0692C4AF0A;
	Thu,  1 Aug 2024 12:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722516794;
	bh=4TSGYMtxMTPV4JTDRQx/tcJV5tOMAGSkL6U8Y04AVi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LP97E20lR6NcNAe6P/Dv9uh+QWgkTfAk5Y6509n6NgEQH8IrvVx3tHg+qHNLk4UZ4
	 AbGXV2uJlsQD1Xqu47yBFXPrZsKNZSCcruaDBONavWDFNE8rxO3I9PvznpepBrSUH/
	 EfKr0+Dye1EfCu7B17NOa1Bq1nk9PTYbJiDVoMU0OcjuQGQpp6fGLsY6S18IGNa/O8
	 TE1fyMRAFpx6BpamWJBZHjOu3zGADP7LJ9YX1OkPnwRJko0eTWx1AIKeDBO06hqGyS
	 vTM4FRDmUSJapX9nmwjCI4ysw5bq7GTg9rpsAhxwp5KlugmT3fY27DQTJsLT20OpQ7
	 2nGpXI3BYe9xw==
Date: Thu, 1 Aug 2024 13:53:09 +0100
From: Lee Jones <lee@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: leds: Document "netdev" trigger
Message-ID: <20240801125309.GE6756@google.com>
References: <20240708114653.18566-1-marex@denx.de>
 <20240725085042.GC501857@google.com>
 <3c8bf807-8a8e-4704-a90a-d77ad3293b57@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3c8bf807-8a8e-4704-a90a-d77ad3293b57@lunn.ch>

On Thu, 25 Jul 2024, Andrew Lunn wrote:

> > > diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> > > index 8a3c2398b10ce..bf9a101e4d420 100644
> > > --- a/Documentation/devicetree/bindings/leds/common.yaml
> > > +++ b/Documentation/devicetree/bindings/leds/common.yaml
> > > @@ -113,6 +113,8 @@ properties:
> > >              # LED indicates NAND memory activity (deprecated),
> > >              # in new implementations use "mtd"
> > >            - nand-disk
> > > +            # LED indicates network activity
> > > +          - netdev
> > 
> > netdev is the description of the network development ML/repo, right?
> > 
> > Seems like an odd name for an OS agnostic property?
> 
> I agree that one meaning is the network development community within
> Linux.
> 
> But it also means a network device, which is OS agnostic. I don't
> really see it be any different to a memory technology device, mtd.

MTD is an acronym.

The only dodgy one I see in there is 'kbd-capslock'.

How about, now go with me here: 'network'?

I'd even suffer 'network-device' or 'net-device' if we really have to shorten.

Although, I'm not really sure the 'device' part needs to come into play'?

-- 
Lee Jones [李琼斯]

