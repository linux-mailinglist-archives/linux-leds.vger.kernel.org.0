Return-Path: <linux-leds+bounces-8277-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uImRDsP0DmqmDQYAu9opvQ
	(envelope-from <linux-leds+bounces-8277-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 14:04:19 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF6E5A477D
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 14:04:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3215B306D140
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 11:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A6133C9EEF;
	Thu, 21 May 2026 11:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="QhdckEer"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6AE360EDA;
	Thu, 21 May 2026 11:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779364777; cv=none; b=oPiVmd/iZ1WLoZB+jQ666inbmV1M0OyfmUq6irKwOqZ9cm4P4tpVZicWjlnNblvxbJ8G26LwVVuMeY3avaizeBLpAxX1B1eqkYjHc+wlzlLqhoV79Y1rOzg23kXDEtcZBKSx1yCr5zNey++0Zdkau90RaycV5oi76dBt03o76UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779364777; c=relaxed/simple;
	bh=tWqJjXHaQ2um6gVHUwxHaGyo9BPmk6JvIVRMoRl3spM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hr7cEeipB+telp8UwoAI7xG4hPcfyKn1HPq5HjWQs3yf3G8JIHf5CeT1zj18tn5sMg0H3E00dxUryGGp7JLhvkh9o9ex482/PWQwdG5yupqby29T9LAArFNH0XcTzpE3nMJXtrbI8eJE6INyOtoB6CqVOZhc1wQthucejDIYgrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=QhdckEer; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=I9Ukt0AQCmtJKH+wFgifFpDPG6vypcS0Mpig6HmuFc4=; b=QhdckEerrwKwBFvo2YLuROrin9
	EqsDkvBC8Jo9Zxw0SmLEZv35UHE0rFQvuOMRMU30rkVQ3P+nfd8QcfRScJsmDYeErNGmQgPzMnH+b
	+/NBdlo7Al+mw/vN/UXys7157VMZqb/82bFnPJ8dcjuqNKI741iTj5dkwZTAteZn5ojk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wQ23L-0040gt-P9; Thu, 21 May 2026 13:59:03 +0200
Date: Thu, 21 May 2026 13:59:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lee Jones <lee@kernel.org>
Cc: mike.marciniszyn@gmail.com, Pavel Machek <pavel@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Golle <daniel@makrotopia.org>, Kees Cook <kees@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>, Lee Trager <lee@trager.us>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Chengfeng Ye <dg573847474@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH net-next 0/3] dd LED support for fbnic
Message-ID: <d87c9ad1-f180-45c8-a525-40c1b39c4265@lunn.ch>
References: <20260520200337.204431-1-mike.marciniszyn@gmail.com>
 <48c64757-dc3c-4d05-a269-fa4f50c299c3@lunn.ch>
 <20260521110324.GB2921053@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521110324.GB2921053@google.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8277-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,fb.com,meta.com,lunn.ch,davemloft.net,google.com,redhat.com,armlinux.org.uk,makrotopia.org,intel.com,trager.us,oracle.com,linux.intel.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[lunn.ch:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,lunn.ch:mid,lunn.ch:dkim]
X-Rspamd-Queue-Id: AAF6E5A477D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 12:03:24PM +0100, Lee Jones wrote:
> On Wed, 20 May 2026, Andrew Lunn wrote:
> 
> > On Wed, May 20, 2026 at 04:03:34PM -0400, mike.marciniszyn@gmail.com wrote:
> > > From: "Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>
> > 
> > The Subject: of this email has an off 'dd' in it.
> > 
> > > The second patch stors the max speed from the firmware dialog
> > 
> > stores
> 
> It's also just a cover-letter.

It depends on the Maintainers workflow, but for netdev, a patch series
is imported into a branch, and the cover letter is used for the text
of the merge commit into net-next.

A well written cover letter contains the big picture, what does this
set of patches do, so it has useful information in it, so we want to
have it in the git history.

	Andrew

