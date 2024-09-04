Return-Path: <linux-leds+bounces-2598-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1227896B2FA
	for <lists+linux-leds@lfdr.de>; Wed,  4 Sep 2024 09:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA5631F21A7F
	for <lists+linux-leds@lfdr.de>; Wed,  4 Sep 2024 07:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE11824AF;
	Wed,  4 Sep 2024 07:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="pr77zmjg"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.nic.cz (mail.nic.cz [217.31.204.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D24D3C17
	for <linux-leds@vger.kernel.org>; Wed,  4 Sep 2024 07:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.31.204.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725435395; cv=none; b=s4A4peHhW9zF0kiJfk/87Cwfdem7WZO453P28FK3v7OoiEAclQWEbG0peAY/17A4TVRwiCr/NBJHYRXMKc8jEQWqnilgTwtznfykwtr81sxbJJEKpcGCCjo3H6nIrwkBpjz4w5u7bSEOB+bdRQ9bqFGIcdNak2HRhSB3Hc398MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725435395; c=relaxed/simple;
	bh=tk3GLcKEhbugbqCDMBb450vXfJ/SOUCvr2F6s0BsG/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qIKcreiBwwFa2s6s2EQIx37J28h0+vUYp+HyfJeBpw0a0Zh39KGrHcSDkyKkCvLuFHNFY1/V9JKbn8X4kN1tK/Cf5NuZCTAabCppn/C61/xxBzBCcYl7CXoQXSUX52NQtrwsTig+5Oyja3uBcFAXACDy8xMf/KCQdsSJUX19V/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nic.cz; spf=pass smtp.mailfrom=nic.cz; dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b=pr77zmjg; arc=none smtp.client-ip=217.31.204.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nic.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nic.cz
Received: from solitude (unknown [172.20.6.91])
	by mail.nic.cz (Postfix) with ESMTPS id 9CF0A1C11E3;
	Wed,  4 Sep 2024 09:28:46 +0200 (CEST)
Authentication-Results: mail.nic.cz;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
	t=1725434927; bh=tk3GLcKEhbugbqCDMBb450vXfJ/SOUCvr2F6s0BsG/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Reply-To:
	 Subject:To:Cc;
	b=pr77zmjg5yvhZhrJPb31kUOZFNX4X5cVM8/lMbOU4Q0LlbavQ3D2G/Ztlh/KYYr8F
	 HrjMJTlDSOR03/Ib5paaGPhjLM886teXRoY8DlKGUYfeD3dDb6QfoZn83MTWR1tOdh
	 RZ1qcj3pZ3w0XoMvjBbzByUXlWpVZhztqJyLcGjc=
Date: Wed, 4 Sep 2024 09:28:46 +0200
From: Marek =?utf-8?B?QmVow7pu?= <marek.behun@nic.cz>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
	soc@kernel.org, Gregory Clement <gregory.clement@bootlin.com>, 
	arm <arm@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH leds v2 10/11] leds: turris-omnia: Use 100 columns in the
 rest of the code
Message-ID: <qlvkoj3nnfcnl2p5ekiaguhdgvsqug33jtpjxe3znj7urkvkdv@22honu42olit>
References: <20240903101930.16251-1-kabel@kernel.org>
 <20240903101930.16251-11-kabel@kernel.org>
 <fce1d0ed-d7e3-401a-9132-0b5c1571398c@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fce1d0ed-d7e3-401a-9132-0b5c1571398c@app.fastmail.com>
X-Virus-Scanned: clamav-milter 0.103.10 at mail
X-Virus-Status: Clean
X-Rspamd-Action: no action
X-Rspamd-Server: mail
X-Rspamd-Pre-Result: action=no action;
	module=multimap;
	Matched map: WHITELISTED_IP
X-Rspamd-Queue-Id: 9CF0A1C11E3
X-Spamd-Bar: /
X-Spamd-Result: default: False [-0.10 / 20.00];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	WHITELISTED_IP(0.00)[172.20.6.91];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]

On Tue, Sep 03, 2024 at 03:21:15PM +0200, Arnd Bergmann wrote:
> On Tue, Sep 3, 2024, at 12:19, Marek Behún wrote:
> > There are 7 more places in the code where the 100 column limit can be
> > used to make the code more uniform. Do it.
> >
> > Signed-off-by: Marek Behún <kabel@kernel.org>
> 
> I feel like it's ok to use either 80-character or 100-character line
> lengths in a file, but I don't see much value in changing from one to
> another here, maybe just drop this patch.

By either-or you mean exclusive or inclusive OR? The driver already has
some lines at 80 and other at 100, so I just wanted to convert to 100
completely.

But I don't mind dropping it.

