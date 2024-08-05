Return-Path: <linux-leds+bounces-2389-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 315A3947C4B
	for <lists+linux-leds@lfdr.de>; Mon,  5 Aug 2024 15:57:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 639911C21CA8
	for <lists+linux-leds@lfdr.de>; Mon,  5 Aug 2024 13:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E62527D40D;
	Mon,  5 Aug 2024 13:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XHNz8+TW"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57F1139D13;
	Mon,  5 Aug 2024 13:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722866208; cv=none; b=Gn8mCV/w2lQ2yVK/IaRweied48vKrc2VxQ5g2vyDwJf3fZr0fJdi5e5y5wf6ITuXPhrptSFsEK2LwIwNLEk3nQbal4ICGaWNVBL/T3geD521sViciNKWttv+apHxWgwVBSiUgA0xZx+ljebh7f6AnECuL3msWOfq/DqGX7q3o44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722866208; c=relaxed/simple;
	bh=ZzRvUJNou+i5hkMbxOV7BIqtrsXZICZgOzgjNwX80rM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mJOSE2J9U/9/tzFSS4vtdzsJNWdUdUVVhfOHqXr9+YrP+yVWdeLg3kolbH3C+THA9liFRf3NR2uaJDQSYXZRGUKUNsmqLBzF2/ul31F2rpReUx2KaVn0tvATZYX2N7+hascdNRU8m6GNDPMfoTpttcexyQ/GIKexDMm9KvGi25s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XHNz8+TW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB60C32782;
	Mon,  5 Aug 2024 13:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722866208;
	bh=ZzRvUJNou+i5hkMbxOV7BIqtrsXZICZgOzgjNwX80rM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XHNz8+TWZbjHPeLgerWFZ5aDNDyhFkHyfi+89/cAovwUMDba66piWWfnr2r1Nqub4
	 Xk/PANpw88fjVLNhJkdpsm73V+8fhLSmGWZxPArhxrnOMrB8Oz1nYj1982qn6SybxJ
	 E2SQBSj34ckGsSCFPlUtc4u+12ZWo5+9PkfsKMrk4xMP66n9t+gztwzOgIEhqm1u5F
	 gZMZuoLBh+Gdw3fojqZqz3xKtdU3rBOpt5VD95sfSOYLIUNpl6559N4QYx6HLOWEkw
	 o8vwEduvQSBk0rEZ3MRFLiYJDlNj+cBLICM2pVXkD7weoOdnc7uM4PTBqszE1wM7VM
	 lU0XVI3cF3kgQ==
Date: Mon, 5 Aug 2024 14:56:43 +0100
From: Lee Jones <lee@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: leds: Document "netdev" trigger
Message-ID: <20240805135643.GC1019230@google.com>
References: <20240708114653.18566-1-marex@denx.de>
 <20240725085042.GC501857@google.com>
 <3c8bf807-8a8e-4704-a90a-d77ad3293b57@lunn.ch>
 <20240801125309.GE6756@google.com>
 <62cc3d64-c5e4-4af3-90ce-273ece6e8e57@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62cc3d64-c5e4-4af3-90ce-273ece6e8e57@lunn.ch>

On Thu, 01 Aug 2024, Andrew Lunn wrote:

> On Thu, Aug 01, 2024 at 01:53:09PM +0100, Lee Jones wrote:
> > On Thu, 25 Jul 2024, Andrew Lunn wrote:
> > 
> > > > > diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> > > > > index 8a3c2398b10ce..bf9a101e4d420 100644
> > > > > --- a/Documentation/devicetree/bindings/leds/common.yaml
> > > > > +++ b/Documentation/devicetree/bindings/leds/common.yaml
> > > > > @@ -113,6 +113,8 @@ properties:
> > > > >              # LED indicates NAND memory activity (deprecated),
> > > > >              # in new implementations use "mtd"
> > > > >            - nand-disk
> > > > > +            # LED indicates network activity
> > > > > +          - netdev
> > > > 
> > > > netdev is the description of the network development ML/repo, right?
> > > > 
> > > > Seems like an odd name for an OS agnostic property?
> > > 
> > > I agree that one meaning is the network development community within
> > > Linux.
> > > 
> > > But it also means a network device, which is OS agnostic. I don't
> > > really see it be any different to a memory technology device, mtd.
> > 
> > MTD is an acronym.
> > 
> > The only dodgy one I see in there is 'kbd-capslock'.
> > 
> > How about, now go with me here: 'network'?
> 
> We could do, but we have to keep netdev around for backwards
> compatibility. There are DT blobs using it which we cannot break.

Oh, this 'just' a documentation patch?  'netdev' is already in use?

-- 
Lee Jones [李琼斯]

