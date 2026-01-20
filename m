Return-Path: <linux-leds+bounces-6689-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KVgKpyyb2nHMAAAu9opvQ
	(envelope-from <linux-leds+bounces-6689-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 20 Jan 2026 17:51:40 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1006647FAE
	for <lists+linux-leds@lfdr.de>; Tue, 20 Jan 2026 17:51:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 420529818FF
	for <lists+linux-leds@lfdr.de>; Tue, 20 Jan 2026 16:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1014F44D6BC;
	Tue, 20 Jan 2026 16:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C3W5RTc9"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71FF441042;
	Tue, 20 Jan 2026 16:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768925497; cv=none; b=tKoZ83eR7IkV7VmAy6CmgBnVfBrgdo7D4bx4b0M0bkD52R2uzJ6nZ5Sh+Cda9KgJa3OwonAwRz+/THVy2OWsYnNUPiH2J1AhzWHklmMmIBS7Luw1rhlGXicTK0iRYFcqSnNmWHMfa2ArZsnOZg1dMz7A9duFyIXI5YQqrJ8xQ9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768925497; c=relaxed/simple;
	bh=HXBV3Lx/h+H7VdEBJ3BfmE6klv68lSG5XkCtGO3hs6E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QUOeHn95v9rJpkcXdNKp5ZncF1laaJLU/Y3NuLoG2BrByuvqRPV39FeuJmoOX6vFkaaOzrOiyVxlEnUB3uJwg6NPhG94kfbc4VoFBzy5NibJLByw/BDtFectvTenFiQ6W4mSyEThH4Im4JI4YNTSrzHxMlhtdCC1+XGpuhhQhO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C3W5RTc9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BCD9C16AAE;
	Tue, 20 Jan 2026 16:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768925496;
	bh=HXBV3Lx/h+H7VdEBJ3BfmE6klv68lSG5XkCtGO3hs6E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=C3W5RTc9BDp+2tl/P41YC7OFToe0242b3ObhNOj343jvSEcE5i4Df7WCOiz5L/WvB
	 Q5OuquBfIbmIBbdcd5cdB7+krmmqYmEn6PWMmzCVNdU9utkubtF8CRqvRuTwh0kyjT
	 hWAJuPDx7Bdw0IjE3BK3nL4tQSWDMqtLYh5mXliRDdBlNx1RLJC0urKSnzbxqRrHIo
	 Bugnab4PPc/2R9Dagphp5Z12HSzhryBKONAIMUKMQaT+k7obwDdkYJlp0w5poHL0Jt
	 IPdkOu7SA5VgMqf/T2FFcbbCs4tVXT3j5wh/foK8HiEasB1YrhwdDgJCApBPF1MQSf
	 lOLiNN/awpH+Q==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, Nam Tran <trannamatk@gmail.com>
Cc: pavel@kernel.org, gregkh@linuxfoundation.org, rdunlap@infradead.org, 
 christophe.jaillet@wanadoo.fr, krzk+dt@kernel.org, robh@kernel.org, 
 conor+dt@kernel.org, corbet@lwn.net, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org
In-Reply-To: <20260111135519.28112-1-trannamatk@gmail.com>
References: <20260111135519.28112-1-trannamatk@gmail.com>
Subject: Re: [PATCH v21 0/3] leds: add new LED driver for TI LP5812
Message-Id: <176892549321.2317951.5782623090623899229.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 16:11:33 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6689-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,infradead.org,wanadoo.fr,lwn.net,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 1006647FAE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 11 Jan 2026 20:55:16 +0700, Nam Tran wrote:
> This patch series adds initial support for the TI LP5812,
> a 4x3 matrix RGB LED driver with autonomous engine control.
> This version provides a minimal, clean implementation focused
> on core functionality only. The goal is to upstream a solid
> foundation, with the expectation that additional features can
> be added incrementally in future patches.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
      commit: 014efef297240de5933b121f59f04800f732a09a
[2/3] leds: add basic support for TI/National Semiconductor LP5812 LED Driver
      (no commit info)
[3/3] docs: leds: Document TI LP5812 LED driver
      commit: 974d724e58fd2eee0fe46299901deae6fa9ebad1

--
Lee Jones [李琼斯]


