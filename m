Return-Path: <linux-leds+bounces-8276-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLrMCYnmDmopDAYAu9opvQ
	(envelope-from <linux-leds+bounces-8276-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 13:03:37 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B72EA5A3B9D
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 13:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 044DE3002889
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 11:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE7E3A5437;
	Thu, 21 May 2026 11:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R+bu9Ipi"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06163A4F59;
	Thu, 21 May 2026 11:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779361413; cv=none; b=L45WybUavsBiW6meJGZeDo3lHehALCGCtgaE4N/1VKT+dEC/1HHT8BP0A8KkjxAOksvua5eWnbws9U+elAr9X/FgwuCdwdz0+Z1bfWurzJGDyP/RX60FF3WKEO0mXU070fNGkyEi5QQUW9CsdRsGAFvvi2qmTvAO5w+6iGZDv6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779361413; c=relaxed/simple;
	bh=lYF8aOjBEBr43woypX5gHsA6VpGLxan17D/MsdvsQB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rjmPkjNTbuP794iQMyHL261YrM7uPUpBQqKM8dmc5ArfycoQmIuMHnRFal/khBtI3hP39h5phYCf/Ne3lWtFNG+v9pDxzHPWIcOwaDsX4aoGuBv5AJBC7/MfNC8XfkFHi75gnHVKf4B9X6T4uUC4An30xBbQyLPS3v0/lIK2BQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R+bu9Ipi; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 802DA1F000E9;
	Thu, 21 May 2026 11:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779361412;
	bh=S4s/gx1hlGk6QR1Vwj5tSlBRAdw8Z7SMMViiB/spaRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R+bu9IpizqJ955xTYlwavfi3TRseb56TgZX9kg9pc9JI2cUKfLg8Xrdftgd9ZzKFz
	 LtAcfzDendPixMAm70Z3+rvG8u0PszrkfAHeDyFwaaGFVGJ2d/cjbcIxUrVHwsekza
	 gZRbShB8wfX/uPsfKOlDL5HVXDA1BmyEl31e7J0SfvRCKBQKZCSDgtv4lmrEml+vgw
	 pPeICaiQ5G85TXgveQXIc2iAdLtZOBlPg/nXY8nUEybbS3LXvIqDhZBE1Nlxso6FjT
	 6VMCRQO9xdWwLxlGoUDkdTq0Z9yUmgqojQrdbLHihG7hCwL46GyA9U5GniyfIlMFsE
	 7a9+bEsHfBohQ==
Date: Thu, 21 May 2026 12:03:24 +0100
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
Message-ID: <20260521110324.GB2921053@google.com>
References: <20260520200337.204431-1-mike.marciniszyn@gmail.com>
 <48c64757-dc3c-4d05-a269-fa4f50c299c3@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48c64757-dc3c-4d05-a269-fa4f50c299c3@lunn.ch>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8276-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B72EA5A3B9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 20 May 2026, Andrew Lunn wrote:

> On Wed, May 20, 2026 at 04:03:34PM -0400, mike.marciniszyn@gmail.com wrote:
> > From: "Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>
> 
> The Subject: of this email has an off 'dd' in it.
> 
> > The second patch stors the max speed from the firmware dialog
> 
> stores

It's also just a cover-letter.

-- 
Lee Jones

