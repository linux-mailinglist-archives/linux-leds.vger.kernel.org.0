Return-Path: <linux-leds+bounces-7162-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aB4GAEwWr2nJNQIAu9opvQ
	(envelope-from <linux-leds+bounces-7162-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 09 Mar 2026 19:49:48 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9422B23ED4A
	for <lists+linux-leds@lfdr.de>; Mon, 09 Mar 2026 19:49:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DC4153011C97
	for <lists+linux-leds@lfdr.de>; Mon,  9 Mar 2026 18:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F883CE4B3;
	Mon,  9 Mar 2026 18:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QaJB5kdp"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806422745E;
	Mon,  9 Mar 2026 18:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773082164; cv=none; b=g5mJ5zHfu4OFRE0o5RzX81uwypyO8Q+wGHUrmK/c+Sm3E0QR/ssDkuYn3AIZp/8zGZEcxfAAdwntfkSsX536rEBBKSZ3Cp/FALCG1WUoCwz5Mgi03Wp5/j1oXIuFDjW+qQPbuqu4z6CGwnZKLdkyoQrRpgF6BzHQFiETVDB+EMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773082164; c=relaxed/simple;
	bh=0c7PfNlywEu5YRiPhWq72Cwb/p1gFPYWyAfM/6HbHMc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SQ9sIa1/kRNTEtsaU1ISjvjh2aZreodeQ395Xlo16wTXE+eow9aEkZu/Ee2xxBFgufV4s5Le48SNpGoPpMhZQ5WEx8Xb8mqQix5bIkJVrhufBBLy6zn3EaFthzrA7+JRUy2FXTt9/6XkLIoZvaeMA4QW7aln56CL3S4wba2tqdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QaJB5kdp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E393EC4CEF7;
	Mon,  9 Mar 2026 18:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773082164;
	bh=0c7PfNlywEu5YRiPhWq72Cwb/p1gFPYWyAfM/6HbHMc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QaJB5kdpK9REfw02zPJL5SzA6cp/g2GZpsqa2TqoPYncIbQKaOp5DfMSWS/RL+N+4
	 4DTu01L5qRpPTThvIEYX2JVaqNSGsutsnMcSw5ML4dyRX6JkuxE1wXnVaDEwyK1K6p
	 52GzZZe/jCgHWx/7CeWnvx9cj9Jw3NGboJHCZHQrYUL9usxtfTrgcaKTPEBRWmzBpt
	 A9TndQNrMMTBqPEY0GWMOznIxSUEHItvWBztbjBiyijajHq1O2oGb2ZyS1Dr25zOO+
	 jJJ5fvQDouHmzXbEDeZlpXjhKr3JW0vSjyAbmU1v+5jZosWHg/rNProaVmleSCYNtp
	 llfXkt5blg5Aw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 David Owens <daowens01@gmail.com>, Andrew Davis <afd@ti.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260305203706.841384-1-afd@ti.com>
References: <20260305203706.841384-1-afd@ti.com>
Subject: Re: [PATCH 1/5] leds: lp8860: Use a single regmap table
Message-Id: <177308216264.1638430.17176554849062156181.b4-ty@kernel.org>
Date: Mon, 09 Mar 2026 18:49:22 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-Rspamd-Queue-Id: 9422B23ED4A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,ti.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7162-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, 05 Mar 2026 14:37:02 -0600, Andrew Davis wrote:
> Instead of a regmap table each for the normal registers and the EEPROM
> registers, make one table and use an access table to prevent read/write
> to/from the registers between the two ranges. Slightly simplifies the
> code.
> 
> 

Applied, thanks!

[1/5] leds: lp8860: Use a single regmap table
      commit: cfbe3ef10db19c2a39640204be160952754e430c
[2/5] leds: lp8860: Return directly from lp8860_init
      commit: c6cde1446602bf990ce8ad81181434f436a16037
[3/5] leds: lp8860: Hold lock for all of EEPROM programming
      commit: 34b7e5d805a33263f4297b42922bae4c70c34026
[4/5] leds: lp8860: Remove unused read of STATUS register
      commit: e4bacd32bcf0fd0a3dc78363d5ce6aa3cce63563
[5/5] leds: lp8860: Do not always program EEPROM on probe
      commit: e5e4ccc8896f9391f718817a19603c08bf8d4cc4

--
Lee Jones [李琼斯]


