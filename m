Return-Path: <linux-leds+bounces-8279-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLCrHRcfD2pSGAYAu9opvQ
	(envelope-from <linux-leds+bounces-8279-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 17:04:55 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D092E5A7E3C
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 17:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E792330E0D3A
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 13:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A3BB37BE6A;
	Thu, 21 May 2026 13:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UPFOcIKp"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7129E2D9484
	for <linux-leds@vger.kernel.org>; Thu, 21 May 2026 13:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779371966; cv=none; b=dYbiPIJyuy9YdJtdzEA4DUc29VjdbEJxYRsN9k9VrqmI5E2Hc573lr25IRnwZhZNE4sEk4ZEpHgddOSUhvCZSm/+I9qT/3c3dZnfFFjFB3Rl0GSyScipiuBKi66w3kuJ850+1MZASwoUzRm69qcH4tCTvUgeYj/gr/LpFgSab5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779371966; c=relaxed/simple;
	bh=Ho2qeqV6am2Dd+BGAsgs9xW9z3zcDQh6NiI9l8DFCs0=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l9srLDSPzdw87RDItEYVySsOzQwzjrdXmkRS+EGkwLbrs7tgv7YGCE9lYo1I5W3vXxa7860o8gkvR1LjiiB2Eor51Fqp6p5YdWMZDh+W53nBhyxEv/KnxYufCgHpI5n/BV42gRwGyAWnQrV9JMEwojvoJ5D3aITY7bwCFQO998o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UPFOcIKp; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F47A1F00A3C;
	Thu, 21 May 2026 13:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779371965;
	bh=TA244qGBFjgNo7ZV2xUn3w8W2LA0NEPhYZ9Aj6MoI3Q=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=UPFOcIKpw/LrA0ihP+iUpMcd2bAqA2r7DG9Srs9JtqU3HUkRfOtrrkSSJ+ZpHU1ML
	 /08M4ux9c7zo8kAP6U0xfHECvr1l+1iVewpoOEhGZnYtw1R7MTofgFNwGmzcaiInm8
	 bgDEhzry/A8KhPqXCFi13xF+qTbzyvkF4VrgetIokTogt4Z6KEH7Gz/PdjrU2WR6IR
	 nKkJy2Iwt3gq+TKAxk+Au4O2C2FRaGwJdTenTC21fTqoRpCH2bMhU34RFBDmafXREC
	 Am1Zy/lyAsWGHuzuZ1n3uen5dGmRxQVFwl0VvRlrhoTJcS1DMJqJQF9v+9Sm2uCOxz
	 0jeLaZ1dEBudQ==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, Craig McQueen <craig@mcqueen.au>
In-Reply-To: <20260423113638.2079302-1-craig@mcqueen.au>
References: <20260423113638.2079302-1-craig@mcqueen.au>
Subject: Re: (subset) [PATCH] leds: core: Fix race condition for software
 blink
Message-Id: <177937196425.3625834.18213597142229581396.b4-ty@b4>
Date: Thu, 21 May 2026 14:59:24 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-8279-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D092E5A7E3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 23 Apr 2026 21:36:38 +1000, Craig McQueen wrote:
> led_set_brightness() function: Change handling of software blink to
> avoid race conditions when stopping blink and setting brightness.
> 
> Triggers may call led_set_brightness(LED_OFF),
> led_set_brightness(LED_FULL) in quick succession to disable blinking and
> turn the LED on. If the delayed work task has not yet disabled blinking
> by the time the second call occurs, then the brightness also needs to be
> changed in the delayed work task.
> 
> [...]

Applied, thanks!

[1/1] leds: core: Fix race condition for software blink
      commit: db01b61ed4602a081d35c9458a522b58fca44b7a

--
Lee Jones [李琼斯]


