Return-Path: <linux-leds+bounces-2318-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D1993C22A
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2024 14:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE5842825D1
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2024 12:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE084172BBC;
	Thu, 25 Jul 2024 12:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="eO4J/eUI"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F021D2D792;
	Thu, 25 Jul 2024 12:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721911046; cv=none; b=Xcu2a7A2N+0P3qoLUFQUX6XpQ5F0C5vigNo9TQ21crxycHnZRF6aSRAeRa6OeWwO+iJDaq1LVZmaEkjJ70QPeY/UeQuZfucMm3A/p432iJpRmF6PAiZk9FFO0MQscFD7lz7mJARgpzdWLLYEYMzmZPj6pLcyrhFNZkFHOrPv3Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721911046; c=relaxed/simple;
	bh=5EBCrjMabXGF3K8R5/OThItfRG5hy5b6tzhVOupZxCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FmPizEKx1ZfGDLIzSrzuH9/d1CgsRiP9dqQtDJa/zXtb4jQn2RmeiD5w8g/cCEsTCtdVk2uz91JHa2wB6Lz46OjqvL+g1qexQxj0X0iNqXegm/FL7LDRN+cmzVMWqYxs610EnfvySoZnlTUXyNpktrAkymSSY9ZK2YERkoW8WnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=eO4J/eUI; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MMb1toEg/PtgiTSVQBzNuystiKP5jbjWuDdKMMdNBhk=; b=eO4J/eUIjlqjvIDa0q5Fb2ubnD
	qQCHR/ZEXXM5jEm016I851uEMbGDSoSUEX3ndfsuM1zDYAB9XjPwyVZEHeXg5wTO0pkxfJ4hm6ko6
	pCYaQzX5QaE64XvBwNQZyOavaUhFzV5ORxtm0eA/I/Q0uno4JIFqRDfXnZuxufMkIqc4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sWxif-003CWJ-Ci; Thu, 25 Jul 2024 14:37:17 +0200
Date: Thu, 25 Jul 2024 14:37:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lee Jones <lee@kernel.org>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: leds: Document "netdev" trigger
Message-ID: <3c8bf807-8a8e-4704-a90a-d77ad3293b57@lunn.ch>
References: <20240708114653.18566-1-marex@denx.de>
 <20240725085042.GC501857@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725085042.GC501857@google.com>

> > diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> > index 8a3c2398b10ce..bf9a101e4d420 100644
> > --- a/Documentation/devicetree/bindings/leds/common.yaml
> > +++ b/Documentation/devicetree/bindings/leds/common.yaml
> > @@ -113,6 +113,8 @@ properties:
> >              # LED indicates NAND memory activity (deprecated),
> >              # in new implementations use "mtd"
> >            - nand-disk
> > +            # LED indicates network activity
> > +          - netdev
> 
> netdev is the description of the network development ML/repo, right?
> 
> Seems like an odd name for an OS agnostic property?

I agree that one meaning is the network development community within
Linux.

But it also means a network device, which is OS agnostic. I don't
really see it be any different to a memory technology device, mtd.

	Andrew

