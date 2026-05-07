Return-Path: <linux-leds+bounces-8030-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uM8IFR+Q/Gn3RQAAu9opvQ
	(envelope-from <linux-leds+bounces-8030-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 07 May 2026 15:14:07 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB8B4E9052
	for <lists+linux-leds@lfdr.de>; Thu, 07 May 2026 15:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8AB73008E20
	for <lists+linux-leds@lfdr.de>; Thu,  7 May 2026 13:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77AD739F188;
	Thu,  7 May 2026 13:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VR39iks7"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55138388E49;
	Thu,  7 May 2026 13:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159644; cv=none; b=LAPPFkvoollGlEGwtrygrxQKz1mNtPd1x93kAfvbT8hw2Hhd778sXp3N1AWN+1/3UZfwOSHCrJaIf5yZJx0Vyw63TwZNAoK4gn30/6wzUS4xTKGou9MKa7V7XB8UUd+YanlFr5PXIq8W47paDqKniPXF1cca8eJafeRFS1pHkDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159644; c=relaxed/simple;
	bh=yHjLeDwADUwN/W6MVipTXX7lT1nJvbL25gq/S54YyoU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eeRUozAMq2qymh8PT7YQ9zgB7/yhYULHfP1DEPmE51BZzIiThL2DGQEuxYvp7fmTL3etaQqfgWrF4mSr5TAiPYoA85Dx4EUKtcIcBJMiqP3dRd+rKpxeM2ZoGq8EE5NmPdSjcK1xgppIWWKbgd1LrgBWesLBi/9Q1UwLar6ZgPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VR39iks7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDDBBC2BCB2;
	Thu,  7 May 2026 13:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778159644;
	bh=yHjLeDwADUwN/W6MVipTXX7lT1nJvbL25gq/S54YyoU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VR39iks7teICmmysQ/lJVyxrs5AoA3L5XyZBo1Rh1e8dk33HUdqmniupGrgqAw6eD
	 3/IYILXh5qUXd4e6OjlO65j18BpzOslZoB82HZ4KzIhqjTG6tl9bEBDNg6g+EOzS94
	 qQd8XHpbk8xQlmm7hcbtWc/EQTTKjBJUZt/bc5694d1ZmSiEy/asw0PL0+ayXBtuVv
	 JdU1l8tSiOf+tL8e+9VfD1orhHvmnInf0TO/VuGMi3UyTJF3UMOHd/D+F95UII7GPU
	 Z7s24EQGgjHBx6JWz1+AbDZWCy2VlHmB/T5QgKVLU5G+gZYkMOTRpikoYRtyWZKl1V
	 1e119eqNh0wiQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Sasha Levin <sashal@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260426000322.55999-1-sashal@kernel.org>
References: <20260426000322.55999-1-sashal@kernel.org>
Subject: Re: (subset) [PATCH] leds: as3668: Fix Kconfig symbol name
 mismatch in Makefile
Message-Id: <177815964265.1857555.230971455145782585.b4-ty@b4>
Date: Thu, 07 May 2026 14:14:02 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Rspamd-Queue-Id: DAB8B4E9052
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8030-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sat, 25 Apr 2026 20:03:21 -0400, Sasha Levin wrote:
> kconfiglint reports:
> 
>   X001: CONFIG_LEDS_AS3668 referenced in Makefile but not defined
>         in any Kconfig
> 
> The AS3668 LED driver was introduced in
> commit c7dd343a3756 ("leds:
> as3668: Driver for the ams Osram 4-channel i2c LED driver").
> That commit defined the Kconfig symbol as LEDS_OSRAM_AMS_AS3668 in
> drivers/leds/Kconfig but used the shorter name LEDS_AS3668 in the
> Makefile's obj-* line.
> 
> [...]

Applied, thanks!

[1/1] leds: as3668: Fix Kconfig symbol name mismatch in Makefile
      commit: b24e1049a5a53f0912046a8f4112d2d43dec74e7

--
Lee Jones [李琼斯]


