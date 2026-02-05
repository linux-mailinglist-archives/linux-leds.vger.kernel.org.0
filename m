Return-Path: <linux-leds+bounces-6846-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPn7DDG9hGnG4wMAu9opvQ
	(envelope-from <linux-leds+bounces-6846-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 05 Feb 2026 16:54:25 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8493CF4D03
	for <lists+linux-leds@lfdr.de>; Thu, 05 Feb 2026 16:54:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1FF13010141
	for <lists+linux-leds@lfdr.de>; Thu,  5 Feb 2026 15:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C17426690;
	Thu,  5 Feb 2026 15:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EgzHGnTY"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB913A1E91
	for <linux-leds@vger.kernel.org>; Thu,  5 Feb 2026 15:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770306713; cv=none; b=nJjW/nZAx4OR2ovQhh6jKIjR/FJSkciChSjlNEtFHlOXYqEGyozuR2+JxSxygUJgTFtIHbgOeAnocryNzn9Rlo57zD87THrhRGqWBsiX3HpLzxawfv5OlfFT4GyOZAZ5KogB3Bh8MznAKt7h3IM8DEC9gh3c+myxno+etB2P2Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770306713; c=relaxed/simple;
	bh=q9JPZzNrbWb0wSPW6dbkP8HxqNqG1TxRXw3FSvd/ncg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jJjVQfFppYFefrB63ivqqayEWVwNJSSNtxdjwLnVCOINYvJr2W4kzdmZAfRxnH2WBcO2xNmaTzVjfHD0eXo0R8wFOYRXxvOONt9fbu4FMf+NqajrOsRUhJkNPRmC1j3BrvlPvQR6ssb6wBD8FF084gjRjNo31dfGkAxdDgE+dP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EgzHGnTY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BC12C4CEF7;
	Thu,  5 Feb 2026 15:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770306713;
	bh=q9JPZzNrbWb0wSPW6dbkP8HxqNqG1TxRXw3FSvd/ncg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EgzHGnTY3JUN7n3XElh73LL6H73WKEfvAu0971jI/VHnnPVrmENQIiB+nBoMp5e/u
	 v1kOcVqzv05MqI2eYpUPu5dXjvwKvXuTZALu+WcIFXyE+5djAtsP+EInmTIHCVnZ6/
	 fXnLeASxn127tnTL0bK1TafXaY0Bl/D4N3WY/NQGoorwgFNNH4MYhDxbywbuJcOdGD
	 7OGX2PohwNhZ4ZtBkUeSU/339TFSstOeBoPgJCCb1bBHKaG8xWOXxdEmpqy86R/qHx
	 XiOYcow/xghbbCHiYrPYFxeKcTytL2CtEzqyNIQMmBfQZI3k5aBJShJTyzipP7Ec2g
	 N3++0gECMimVA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Dan Murphy <dmurphy@ti.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Michael Tretter <m.tretter@pengutronix.de>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 kernel@pengutronix.de, Khalid Talash <ktalash@topcon.com>
In-Reply-To: <20260123-leds-multicolor-limit-intensity-v1-1-b37761c2fdfd@pengutronix.de>
References: <20260123-leds-multicolor-limit-intensity-v1-1-b37761c2fdfd@pengutronix.de>
Subject: Re: (subset) [PATCH] leds: multicolor: limit intensity to
 max_brightness of LED
Message-Id: <177030671081.1676312.14030909402234954493.b4-ty@kernel.org>
Date: Thu, 05 Feb 2026 15:51:50 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6846-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,ti.com,gmail.com,pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8493CF4D03
X-Rspamd-Action: no action

On Fri, 23 Jan 2026 11:13:24 +0100, Michael Tretter wrote:
> According to Documentation/ABI/testing/sysfs-class-led-multicolor, the
> intensity should not exceed /sys/class/leds/<led>/max_brightness.
> 
> The interface doesn't check the values and higher values may lead to
> unexpected color changes if the brightness is changed.
> 
> Clamp the intensity value to max_brightness.
> 
> [...]

Applied, thanks!

[1/1] leds: multicolor: limit intensity to max_brightness of LED
      commit: 129f82752bcecd554936209aac4dbdd888e92224

--
Lee Jones [李琼斯]


