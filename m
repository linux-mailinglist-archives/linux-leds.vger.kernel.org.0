Return-Path: <linux-leds+bounces-8278-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNIdDPERD2qSEgYAu9opvQ
	(envelope-from <linux-leds+bounces-8278-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 16:08:49 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B07045A6DB5
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 16:08:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24E06308F804
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 13:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E84AA21B9F6;
	Thu, 21 May 2026 13:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kHvho5Wr"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70313D45C8;
	Thu, 21 May 2026 13:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779370405; cv=none; b=iZU8cTraVrPuGpfhEnrODkn61RYVPjhJQTQdubOw1CXEiKStSxMiZVnI+hOQwQNyD6UPFAQOPnephhimbGGpEJBbQUaRwtA8Gp2ULsls2wdVz8Uhw6irrQNetWUcJqgn1To5B+2KFOm2AiGu8uTEONYtP5a9fd2lXwfHpsUbkwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779370405; c=relaxed/simple;
	bh=cqyQq0DP78v9nSQ6cIahflGo8yFIjCIu8QgW/oeEajM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7/vA3i+QLhLW/olyFD/QcWq/yVlpxmWO7FPagu+KbXNAVokA5lB2q/1vEH28TSK/eTGCRQIZp9KawS8SLdv1dBlvugQ6103RsrfoKzfl8Vjvj1q/vW6m7BUTiq0wKLzMtIk3lAf+5/KLPe3bHe+wuNx8pbBb1PZELa6oimEHXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kHvho5Wr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D5CD1F000E9;
	Thu, 21 May 2026 13:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779370404;
	bh=ODDTtTq5hBX3EAC0aw+uREKbcvSKr5vuv+UgMcftiGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kHvho5WrsPozCj3VJ7jOSghxS8JEsMnc80Uhy0TwHNmV6ntzZPXLCVQEsnSs6niWl
	 8VWepVnCaY9DSAmZJ7akXux8Dk/Ud6yy6UiW1yaj39mEdiDpMdW3msxf5+qxkguijA
	 Aqz/AlG7XEhrLKrcWaRa/Vgc3IJKcZp8vtDG6EZTcPp7LfX/LBKqbs0f8+skIJWrJ9
	 EiwI1Xa3ObU8gwBoGmyWIvU67ZXTzMGcF0X93ayWVBuxe8pSg5kNruEbYEVEsMRlIM
	 PD+X9QZjukAf9r4XVKF0Ou4VoxR/iT4cCUhlhukpA/31ekkwntE9lQv0wtfZAyk08H
	 Xr2ES9Kbf4aEQ==
Date: Thu, 21 May 2026 14:33:16 +0100
From: Lee Jones <lee@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
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
Message-ID: <20260521133316.GB3591266@google.com>
References: <20260520200337.204431-1-mike.marciniszyn@gmail.com>
 <48c64757-dc3c-4d05-a269-fa4f50c299c3@lunn.ch>
 <20260521110324.GB2921053@google.com>
 <d87c9ad1-f180-45c8-a525-40c1b39c4265@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d87c9ad1-f180-45c8-a525-40c1b39c4265@lunn.ch>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8278-lists,linux-leds=lfdr.de];
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
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B07045A6DB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 21 May 2026, Andrew Lunn wrote:

> On Thu, May 21, 2026 at 12:03:24PM +0100, Lee Jones wrote:
> > On Wed, 20 May 2026, Andrew Lunn wrote:
> > 
> > > On Wed, May 20, 2026 at 04:03:34PM -0400, mike.marciniszyn@gmail.com wrote:
> > > > From: "Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>
> > > 
> > > The Subject: of this email has an off 'dd' in it.
> > > 
> > > > The second patch stors the max speed from the firmware dialog
> > > 
> > > stores
> > 
> > It's also just a cover-letter.
> 
> It depends on the Maintainers workflow, but for netdev, a patch series
> is imported into a branch, and the cover letter is used for the text
> of the merge commit into net-next.
> 
> A well written cover letter contains the big picture, what does this
> set of patches do, so it has useful information in it, so we want to
> have it in the git history.

Interesting.  This is new to me.  As you were.

-- 
Lee Jones

