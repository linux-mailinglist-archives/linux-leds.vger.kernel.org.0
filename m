Return-Path: <linux-leds+bounces-7519-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AP/YCdf/xGlC5gQAu9opvQ
	(envelope-from <linux-leds+bounces-7519-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 10:43:51 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89929332875
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 10:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0653C310D452
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 09:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA77347FD3;
	Thu, 26 Mar 2026 09:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jJ+PgrfY"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F067346798;
	Thu, 26 Mar 2026 09:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517574; cv=none; b=pccTnzmDlO5wNfcQ2A1kqngQgrmjIjceE6T/ZGJtJhhmkFMgHpI329HDVXgXtAsvtK4OTlNYbnp0aQE3syRvWTT+Vlw68/y5XVLowblfR9hE9yS8gIoR1GJwtoatKZfBrcB1cRlBP7s0fsVOjmR/Q/ma7iOXEkx9qgrpT/+mw/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517574; c=relaxed/simple;
	bh=/8GgpHeJ6aKnpV+8lzXTZTOBzxpwF8Oew8VpTios14M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CgHL/L/zFDJysOrEVs0x9CK1v/mgl2LIm4+7u1tn3HIAW4YQvNEhsxV1i3jftrtmiPFW6njB9b3QhXOPC8lMIO6pv0d+at6Cwhv0XNDadFA/Sdldd/c+O5RfzNqWPy+5tfqsM8WG4OQrrF0tuOsnSUYRCccNzrOBjh4XbOkJcnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJ+PgrfY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B47AC19423;
	Thu, 26 Mar 2026 09:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774517573;
	bh=/8GgpHeJ6aKnpV+8lzXTZTOBzxpwF8Oew8VpTios14M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jJ+PgrfY+JrgmtAq64idoKBeuTIFG0R/cHfCjFFxKnYSWdw20+m8T/7Dh6iAmo8PZ
	 g6CT3l6MW0X/+1/92PLb4oq677fpVKCoOsqnnpFX7nJNCp22oJn7xGUgei614+DJGK
	 GUPz2J4ExN78PudEK9Mpf2O2Wm/QQWoYSNBANiYmtvQ7ekcbn6MIHN1nckrpPxdHJ9
	 08vomQKJ17OYY9T15imjBiIzmOW/klcm5ToeawdgaLdO1wknyiipKC+pU5Sh6kq8wd
	 PlyUwGu9/P0YSbRsJkeBx3PXY2dnqaD4BvaftPoUyVhrgf2UsPr8oYAoN/2h+U3/Va
	 iSPL8xSshbkEQ==
Date: Thu, 26 Mar 2026 09:32:49 +0000
From: Lee Jones <lee@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Fall back to using software node name as LED name
Message-ID: <20260326093249.GH1141718@google.com>
References: <20260311-led-swnode-name-v1-0-798a49e041c6@gmail.com>
 <20260325133836.GB1141718@google.com>
 <acQGdOXRRnfVUxmD@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acQGdOXRRnfVUxmD@google.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7519-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 89929332875
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 25 Mar 2026, Dmitry Torokhov wrote:

> On Wed, Mar 25, 2026 at 01:38:36PM +0000, Lee Jones wrote:
> > On Wed, 11 Mar 2026, Dmitry Torokhov wrote:
> > 
> > > This allows setting just name in software node representing an LED
> > > instance and forego "label" or other properties needed to form a name.
> > > This is helpful when converting old boards using bespoke platform data
> > > to software nodes/static device properties.
> > > 
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > ---
> > > Dmitry Torokhov (2):
> > >       leds: core: implement fallback to software node name for LED names
> > >       leds: core: fix formatting issues
> > > 
> > >  drivers/leds/led-core.c | 20 +++++++++++---------
> > >  1 file changed, 11 insertions(+), 9 deletions(-)
> > > ---
> > > base-commit: 7109a2155340cc7b21f27e832ece6df03592f2e8
> > > change-id: 20260311-led-swnode-name-6db2e5757071
> > 
> > I'm happy with the set, but it failed to apply to leds-next.
> > 
> > diff a/drivers/leds/led-core.c b/drivers/leds/led-core.c        (rejected hunks)
> > @@ -584,8 +582,9 @@ int led_compose_name(struct device *dev, struct led_init_data *init_data,
> >         } else if (is_software_node(fwnode)) {
> >                 n = snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s",
> >                              fwnode_get_name(fwnode));
> > -       } else
> > +       } else {
> >                 return -EINVAL;
> > +       }
> >  
> >         if (n >= LED_MAX_NAME_SIZE)
> >                 return -E2BIG;
> > 
> > Please rebase and [RESEND].
> 
> Do you have something that is not yet pushed out? I see "for-leds-next"
> updated 6 days ago and the rest of branches even older. I tried rebasing
> on top of next-20260324 (latest) and there were no changes...

Must have been a tooling (or my fat-fingers) error.

Applied fine now.  Sorry for the noise.

-- 
Lee Jones [李琼斯]

