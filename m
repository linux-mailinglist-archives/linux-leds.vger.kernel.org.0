Return-Path: <linux-leds+bounces-8086-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4D0GCQWGBGrVKwIAu9opvQ
	(envelope-from <linux-leds+bounces-8086-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 13 May 2026 16:09:09 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AAE534B7D
	for <lists+linux-leds@lfdr.de>; Wed, 13 May 2026 16:09:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F2B793080838
	for <lists+linux-leds@lfdr.de>; Wed, 13 May 2026 13:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCCCF3F4137;
	Wed, 13 May 2026 13:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gbKZUt/S"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49CF1DD525;
	Wed, 13 May 2026 13:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778679910; cv=none; b=k0WJ0pdu+9QNtViEyV/P1rrCV+/ZMsNyFYW00s1ZvWBT4ROzckGVgEyk+0Qo3ZspWjE1NKan51OHzHWy3MXBjTX2F+/5H1I4+DTRao+qDGxe9DnDDcIOtT7ZPs9M4Mu57hW6TzPrmHscF+JM7tXYotXFt/+PcA6UdD1CRjfJj0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778679910; c=relaxed/simple;
	bh=/2Zi2HXOozPMYlO4SRd+BwhuqjEe95AV6PaRkPBbc+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KjaHyp6tZHoXYH9aPGkRWaRI9VG323Tm/ZYhKdQyXV94rtQhUxtDNEBUNdO5M+caDljZwOb5UngToMW7KgU3c+Nn1gEajvWXBz6kTxtK7otxfELTdoPD29bb5meXOKfzKxDCJWFKPuX+snuN33K5FUNnnwfYaThu95cP2JbVsPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gbKZUt/S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B16D8C2BCB7;
	Wed, 13 May 2026 13:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778679910;
	bh=/2Zi2HXOozPMYlO4SRd+BwhuqjEe95AV6PaRkPBbc+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gbKZUt/St34aLV1gd/IUWs2xzL9X7M41tgSf6MAvLy32IvYBNvwx6h5YZqPXXONdc
	 TcNfjY+BsNOsg8/ydy2zXUvh5yy9cbUrCnFqaYTdeDpshioacGPhb5sKCyaz+b5AcF
	 WkgRbpNcacRNTZnfujIZEv7ZbaNe7odv/29/qSp8cgo4QbsbX8p5n+P33JnQN+xmit
	 sPou6fMg84lXNJznmWYtVYGLaWa/3pM3yWeEnbfmQhxior4AqAFX1iHdyh0eW0r9b8
	 vWMXpb0p5nXcBBaVr+4ycmilx1oZ/JGufYy7dNNdtYXRKxYdVo4FFVNrEwM+DdA82s
	 L12vEPuX1MzCw==
Date: Wed, 13 May 2026 14:45:05 +0100
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Bj=F6rn?= Persson <Bjorn@xn--rombobjrn-67a.se>
Cc: Pavel Machek <pavel@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: leds: uleds: Make the documentation match the code.
Message-ID: <20260513134505.GZ305027@google.com>
References: <20260402220811.4804DD8F722@tag.xn--rombobjrn-67a.se>
 <20260423152655.GF170138@google.com>
 <20260424194714.71de0ef6@tag.xn--rombobjrn-67a.se>
 <20260507131128.GM305027@google.com>
 <20260510214308.09652225@tag.xn--rombobjrn-67a.se>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260510214308.09652225@tag.xn--rombobjrn-67a.se>
X-Rspamd-Queue-Id: A6AAE534B7D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8086-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sun, 10 May 2026, Björn Persson wrote:

> Lee Jones wrote:
> > On Fri, 24 Apr 2026, Björn Persson wrote:
> > 
> > > Lee Jones wrote:  
> > > > On Thu, 02 Apr 2026, Björn Persson wrote:
> > > >   
> > > > > +The current brightness is found by reading a whole int from the character    
> > > > 
> > > > Try not to shorten names in documentation "integer".  
> > > 
> > > The type is named "int" in C. There are many integer types, but it would
> > > be wrong to try to read a uint16_t or a size_t or any other integer
> > > type. The document needs to use the actual type name to make it clear to
> > > the reader that they must read sizeof(int) bytes.  
> > 
> > Right, but you're not writing in C.
> 
> That's technically true, as I wrote my program in C++. It's far from my
> favorite, but I had to use a language that can include C header files
> and use C types, because /dev/uleds is a very C-centric interface.
> 
> If API documentation isn't allowed to name a type, then I withdraw the
> patch. It's pointless to continue. The next programmer will also have to
> read the code to find out what the true API is, like I did.

It's not that it's "not allowed".  90% of my review comments are
suggestions.  These ones are for simply for the sake of readability.

Equally, I'm also not coming up for blackmail or hissy fits.  If you
don't want to continue with the review process, no one is going to beg
you.

-- 
Lee Jones

