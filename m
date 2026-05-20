Return-Path: <linux-leds+bounces-8212-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NKWDDKkDWq10QUAu9opvQ
	(envelope-from <linux-leds+bounces-8212-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 14:08:18 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC7858D4CB
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 14:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89DE3302D088
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 11:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12E63A8FE8;
	Wed, 20 May 2026 11:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bOFCMVGJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46C63A9D83;
	Wed, 20 May 2026 11:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779277673; cv=none; b=kSohrtu6aI/Xq0eGEm5qKLL5wawwpUQd8LUqK94sw+mxMVkbHGcU1uoySrFeglDqA7rR5mL7JNS7uMPwgX0dknZtWXhj4rXM/9S+NJ6iOGRIHEY0COCOYD7zk45pm+SN5ENgnaAptUSTi2s2cygGKlydx1SOJkgssPtv4RwmcWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779277673; c=relaxed/simple;
	bh=t+iwayKXEpw+1wMdev1ak8k0IMLe8fLfYmyzFuBv8Vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rzDLyaCHiLhHl0Qcmj5MnqlLxv7tMgJZjaSHteel7Dpxgkux0uQJKBAIn0sB3x653ZommxK4Ur6LuT407BEb1ZgguiQEmhtodO/88/lTEsrGaCr5EWXnl2Fc/ef2DUgCb1mC4ZN0Onh6/wS/bWmHoFrUHMbdJq5ACMwcDMqmtWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bOFCMVGJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C29D1F000E9;
	Wed, 20 May 2026 11:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779277672;
	bh=u0lWDGQPsgD8Yt+SND0PZatIJxC14109hDfaKdLRGZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bOFCMVGJXFHkVeFNfzqsvgVmMLrcUtaCiVj1Y7yJ1pOPV9H/G+h2qeXk6km5b7MpQ
	 v2n5pWvHXYW+qs78HBeFlxsLKMtZJs+42RdZcHqWzkc/0v3Pf8lO9qOl5rc49Gxl3I
	 ROZYhYEySzTKD4OERMpijGA8BoMH9dFv9cbZYRRQagM3LC9foWUzqYNDTiJBPRmRX+
	 ctetoItSkshyFzA3B21q2QfjUSeMpgY5yfinoqAxG3ELfqo5Y8ZTPQQwuGpIcvHPOm
	 apuh7k1/sh7QNvdzuV8NtzaPloSps9JQZPHRF/5Va0X/GL2Sjsmg7eDtGRlpCSq86q
	 PGuISNquSI0FQ==
Date: Wed, 20 May 2026 12:47:45 +0100
From: Lee Jones <lee@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Maud Spierings <maudspierings@gocontroll.com>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v8 1/4] dt-bindings: backlight: Add max25014
 support
Message-ID: <20260520114745.GX305027@google.com>
References: <20260407-max25014-v8-1-14eac7ed673a@gocontroll.com>
 <177755722019.2606736.10749503716773482329.b4-ty@b4>
 <agyxLnTYstqRwGva@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agyxLnTYstqRwGva@lizhi-Precision-Tower-5810>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8212-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gmx.de,pengutronix.de,gocontroll.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6CC7858D4CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 19 May 2026, Frank Li wrote:

> On Thu, Apr 30, 2026 at 02:53:40PM +0100, Lee Jones wrote:
> > On Tue, 07 Apr 2026 16:41:42 +0200, Maud Spierings wrote:
> > > The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> > > with integrated boost controller.
> >
> > Applied, thanks!
> >
> > [1/4] dt-bindings: backlight: Add max25014 support
> >       commit: 5fcbbedec9dfce78044eee922bf2030e1bd03faa
> 
> Lee Jones:
> 
> 	I have not seen it in linux-next. Anything wrong?

I don't know why Backlight hasn't been added to Linux Next.

Rest assured, it's applied to the Backlight tree.

-- 
Lee Jones

