Return-Path: <linux-leds+bounces-8321-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJ/cOSrXFWoSdAcAu9opvQ
	(envelope-from <linux-leds+bounces-8321-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 26 May 2026 19:23:54 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9345DA977
	for <lists+linux-leds@lfdr.de>; Tue, 26 May 2026 19:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4B4430BC29A
	for <lists+linux-leds@lfdr.de>; Tue, 26 May 2026 17:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 612E138E5D7;
	Tue, 26 May 2026 17:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WK5uQ5Fv"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B6138BF81;
	Tue, 26 May 2026 17:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815355; cv=none; b=X8PoaGrHuDdVys3eDnsHNZNsYIkesKyg7LY4srVMtVYtdGyRKZdSw0iDN4q2j+8qaQreKvOyfGoiMcezRVD6ikgg/YhFglhufwJlSKdNBAejgdEQ5puBEpHqoBBHXs7Krro+bYmeEjkkH3XMI4RyeQoxyuzpRQerPIGGfyHwegc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815355; c=relaxed/simple;
	bh=v7Ud0JThsDUVlaOY2JSZiVeQEyIcLMDq1+CE1eKQZdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJva/Izs3/j72UD0E1oLYwktiHB6QxlmyjYKo1qq7425EE73Zxe4clsbzVQYftPsszcyS2e4p6wcX7jG2emUP/tOImZdNHWj98zawMETGSPS/XbvI4OV2U7YmFJFaDWfXVPK15bNFRl/j9z5sqM0ow/xKJRwnghDsytNtlzv4+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WK5uQ5Fv; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 880821F00A3A;
	Tue, 26 May 2026 17:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779815353;
	bh=0UdLnNAcRN07DqG3+VVucy9/6y1b3FlYWoODW0sPSUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WK5uQ5FvcuW6rYqKWa/LfvAoFlMimCKu+jQtUP66aCqxtpVqc+m8NF6J+KuFJqGCd
	 0bAt/7Uozr5lNsMa+ToMmcqscJp8d33iilZ8tTof5V5GkUjj9OFC9v3F+yfmq5Alvi
	 a7FKYkjpRiZ3hWCqUZ/z5c1xaJZMryIBLT3VfE7QUpFryA8CJdf4sfnzJuy3PivyAN
	 9J2FWZ8AFHkkm0/weLHWZvZ+T9dNJDjbnN8G3/Odbdu8h4EN2riGM8pm6Sw+VyKtAT
	 4ll1lQZxmRHdQVpeWM+7lCJYmb6Skx17fUclmhxNvieGYIk2thrXE2XYLwVX9PmgoO
	 6l2mxDzfZkuLA==
Date: Tue, 26 May 2026 18:09:08 +0100
From: Lee Jones <lee@kernel.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: pavel@kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org, wse@tuxedocomputers.com,
	jacek.anaszewski@gmail.com, pobrn@protonmail.com,
	m.tretter@pengutronix.de
Subject: Re: (subset) [PATCH v4 1/1] leds: Introduce the multi_max_intensity
 sysfs attribute
Message-ID: <20260526170908.GJ3591266@google.com>
References: <20260509214603.262368-2-W_Armin@gmx.de>
 <177928768282.2811520.3177179770372088870.b4-ty@b4>
 <b04d64b7-1a50-4b3d-95f3-2bcb502c0a5b@gmx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b04d64b7-1a50-4b3d-95f3-2bcb502c0a5b@gmx.de>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8321-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmx.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lwn.net,linuxfoundation.org,tuxedocomputers.com,gmail.com,protonmail.com,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5A9345DA977
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 23 May 2026, Armin Wolf wrote:

> Am 20.05.26 um 16:34 schrieb Lee Jones:
> 
> > On Sat, 09 May 2026 23:46:03 +0200, Armin Wolf wrote:
> > > Some multicolor LEDs support global brightness control in hardware,
> > > meaning that the maximum intensity of the color components is not
> > > connected to the maximum global brightness. Such LEDs cannot be
> > > described properly by the current multicolor LED class interface,
> > > because it assumes that the maximum intensity of each color component
> > > is described by the maximum global brightness of the LED.
> > > 
> > > [...]
> > Applied, thanks!
> > 
> > [1/1] leds: Introduce the multi_max_intensity sysfs attribute
> >        commit: b1a9b7a904af2c793850f83a4801a013a718fc47
> 
> Thank you :)
> 
> I just noticed that i forgot to update the Date field inside the sysfs documentation, it should
> have been:
> 
> Date: May 2026
> KernelVersion: 7.2
> 
> Should i send a separate patch for this or can you edit the patch inplace?

Subsequent patch please.

-- 
Lee Jones

