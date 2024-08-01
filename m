Return-Path: <linux-leds+bounces-2377-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B39944CC0
	for <lists+linux-leds@lfdr.de>; Thu,  1 Aug 2024 15:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D54EE1C22198
	for <lists+linux-leds@lfdr.de>; Thu,  1 Aug 2024 13:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F301A99D1;
	Thu,  1 Aug 2024 13:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ruqq/X+W"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831271A99C0;
	Thu,  1 Aug 2024 13:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722517442; cv=none; b=hlhhtfOOn/BFaMQ416zW2ZH9osyD73frv+X0LXfOETFY1MmZ2zLsKe/z7XRf7Jglrh1fjOqn/Ki+g4el2Akr40Hep9YfrCb4KFB923yHGFkATrrwKWgXgwp42YS2AWS4U4aX/mvbmWBq66xRcjUWVEs7YssOCVyI3geuMUXOIdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722517442; c=relaxed/simple;
	bh=kSCoKSw5DnZETEk8lly0c/wVEP/LzQmG+z9f0B9Xet8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7HL53B4mXyu9SpyKS18SNSE5TXNwJKLaYvNjmPOOhKmAOUA+OgNv94Q9LU8zcuZFnmMGmF3bOpMsUOkKQdWOT5Qp2jdOzWxiCoNxUg9WvfnP6v0Vj58iAn9Qn3aNmTIPYHdS+7wsTl7+NDgk0tQJaC4qb+kY13FfBT1tg3PPXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ruqq/X+W; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=UmKFNRw0LjtNfCc16BZfWf6WWKpUZoBiL2KbRjpT4Q4=; b=ruqq/X+WVqVxsCOGRsQzOraUVk
	/XDER8dHu9VOD6sOKYdGVLNwNfrs6MOlvtq6pRoFW/91H4g5AkDa17x5cZKzYRajpltx3ANqnQFXF
	miZ0xXQmy5jny2DthO4ZLMiz5wklJEPg0o+rmPuSK1OQPhQpKnMez5og9/JIGMHlrvcA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sZVTH-003mE2-J0; Thu, 01 Aug 2024 15:03:55 +0200
Date: Thu, 1 Aug 2024 15:03:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lee Jones <lee@kernel.org>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: leds: Document "netdev" trigger
Message-ID: <62cc3d64-c5e4-4af3-90ce-273ece6e8e57@lunn.ch>
References: <20240708114653.18566-1-marex@denx.de>
 <20240725085042.GC501857@google.com>
 <3c8bf807-8a8e-4704-a90a-d77ad3293b57@lunn.ch>
 <20240801125309.GE6756@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801125309.GE6756@google.com>

On Thu, Aug 01, 2024 at 01:53:09PM +0100, Lee Jones wrote:
> On Thu, 25 Jul 2024, Andrew Lunn wrote:
> 
> > > > diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> > > > index 8a3c2398b10ce..bf9a101e4d420 100644
> > > > --- a/Documentation/devicetree/bindings/leds/common.yaml
> > > > +++ b/Documentation/devicetree/bindings/leds/common.yaml
> > > > @@ -113,6 +113,8 @@ properties:
> > > >              # LED indicates NAND memory activity (deprecated),
> > > >              # in new implementations use "mtd"
> > > >            - nand-disk
> > > > +            # LED indicates network activity
> > > > +          - netdev
> > > 
> > > netdev is the description of the network development ML/repo, right?
> > > 
> > > Seems like an odd name for an OS agnostic property?
> > 
> > I agree that one meaning is the network development community within
> > Linux.
> > 
> > But it also means a network device, which is OS agnostic. I don't
> > really see it be any different to a memory technology device, mtd.
> 
> MTD is an acronym.
> 
> The only dodgy one I see in there is 'kbd-capslock'.
> 
> How about, now go with me here: 'network'?

We could do, but we have to keep netdev around for backwards
compatibility. There are DT blobs using it which we cannot break.

	Andrew

