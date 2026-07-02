Return-Path: <linux-leds+bounces-8843-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9VUfCCp/RmprXQsAu9opvQ
	(envelope-from <linux-leds+bounces-8843-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 17:09:30 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BF46F93AC
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 17:09:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NkG2+Qdd;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8843-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8843-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A7D5320D63D
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 14:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B78C353A82;
	Thu,  2 Jul 2026 14:52:41 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B85353A6E;
	Thu,  2 Jul 2026 14:52:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783003961; cv=none; b=iR+dzwwu7evlcNvuaTljO0msTV760Q2Rgy2qGfa6scj5RGhborC0umc51qO9oOhJSkARSIBBOZVBfDKW7B/eqMsnEraOhKZlXv8b9ius30UsE584vILdwVQAXtyjJHaGTnWkugWWeBmGKEl/uN+PqBxe0jIiQBbUYq9YV7OrWNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783003961; c=relaxed/simple;
	bh=TEJ8hd2/Kj8GyfJVYLEeR5dtqLQ4Oivv5HStuKS/ZAE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ir+kTwFYLSUperBJuBnOhZz3qO6klr+kP9Wu272ASbdT6uC+ywbgACC/4cvgKQGuDWgvzdNEI/HSvfSoF5evrOflXie3Nd90RLuwi6WiImIqWbK2IkvnwIa+dbpSwd720eJWBIcv+5lJ0dS/jwlFo5tDtt3Aq3lfdNO0W9WNBAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NkG2+Qdd; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B8C91F000E9;
	Thu,  2 Jul 2026 14:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783003960;
	bh=F9ZiqgUMNO9OfRGt0gbxbnEcXpp2cS9MV+sJJKwVLzY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NkG2+QddcHWeAVqQnCwQEg+3w16uGSEcW1inghcCKlWanBwlOSr9ouBygXbx3cDER
	 nvQbaVWT9UksmTEN0JE++kBg/ymJQn8NZ4DBBJKk5DVd/5cX1S9LHmfT0BWxJq6X3W
	 Xc5tOZuxOXPYPMgt9Z4NQRblrfUMzPq97cfp1b+GOLyzBvO6spxfLD29R5HrcImlsL
	 wTsvkIRE1Ix8L033ZXwj9nP+F8LDYpRb3K4iQgmxadVvm1YW2QObVk6W/6a/FnJO0M
	 m/lP1hf0S3X9IJEZl3BH+CPi8qDHmGmbqwF+dZKN8wFRKQcqUzLTaojaNW1Fi7FdVk
	 omvBQTSVFJBwA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-leds@vger.kernel.org
In-Reply-To: <0f4d556e0532bfa881d7d83c1e244572117a89e3.1781970674.git.christophe.jaillet@wanadoo.fr>
References: <0f4d556e0532bfa881d7d83c1e244572117a89e3.1781970674.git.christophe.jaillet@wanadoo.fr>
Subject: Re: (subset) [PATCH] leds: lp5860: Fix a potential double-unlock
Message-Id: <178300395823.2187505.4713396365487978231.b4-ty@b4>
Date: Thu, 02 Jul 2026 15:52:38 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:s.trumtrar@pengutronix.de,m:christophe.jaillet@wanadoo.fr,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,m:linux-leds@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,wanadoo.fr];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8843-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92BF46F93AC

On Sat, 20 Jun 2026 17:51:53 +0200, Christophe JAILLET wrote:
> In lp5860_device_init(), if lp5860_init_dt() fails, an already unlocked
> mutex is unlocked another time.
> 
> Slightly rework how the lock is taken/released to avoid this potential
> double unlock.
> 
> 
> [...]

Applied, thanks!

[1/1] leds: lp5860: Fix a potential double-unlock
      commit: 10a5a70c02277a1c12999b669a1bd1922558338a

--
Lee Jones [李琼斯]


