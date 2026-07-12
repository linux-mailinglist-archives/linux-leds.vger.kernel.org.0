Return-Path: <linux-leds+bounces-9050-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EJChLgLiU2pufwMAu9opvQ
	(envelope-from <linux-leds+bounces-9050-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 20:50:42 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1143A745A9B
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 20:50:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=alistairbell.org header.s=mail header.b=pSRatjIY;
	dmarc=pass (policy=reject) header.from=alistairbell.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9050-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-9050-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBE6C301464E
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 18:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EBCB3B3BE2;
	Sun, 12 Jul 2026 18:50:16 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from alistairbell.org (alistairbell.org [88.208.227.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F303AA1BB
	for <linux-leds@vger.kernel.org>; Sun, 12 Jul 2026 18:50:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783882215; cv=none; b=AZKbE2vN+yLELIRON7LlcFiBz9+EhkIDIlH1hYaqFAYQ71NGiuAhrR7GHSQeSnHgMRo4CqSuWNBSXE+FLooCtpTxkupp97G0TIEUqHGsxah3svnEvWmyM4wTpesbipABKrk+/hj56kfbW2eoYvfCVByeGjaFj5k4shsQZFrDHes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783882215; c=relaxed/simple;
	bh=vSUZxbFibZXfE6NkNGNWLUY89b06SuuQ3woPcjBFEZo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DKckZqfRo54UlGBD5/xk9emNKnWkl4I+m0NeA1BZopcXH14u3lfxXwP/DhB/p0J9CBWnelBWYTEjeZcyGlFLn4PhPUnxzIKo87kMlRW/VtrIbvZta3IZ63obeTGnjXKSHy2XhVowP/pLC1reZMVblb0JE9rX0YNwT45oLkMLkd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=alistairbell.org; spf=pass smtp.mailfrom=alistairbell.org; dkim=pass (2048-bit key) header.d=alistairbell.org header.i=@alistairbell.org header.b=pSRatjIY; arc=none smtp.client-ip=88.208.227.103
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alistairbell.org;
	s=mail; t=1783881843;
	bh=vSUZxbFibZXfE6NkNGNWLUY89b06SuuQ3woPcjBFEZo=;
	h=From:To:Cc:Subject:Date:From;
	b=pSRatjIYPp3FmtqhxaKNa8qMbTAJ7FPa69mTu0tY8GDTEgRP/U6A8nyH+oqfTg97i
	 dainaADqn0MQOFEP0+bpk5+seDJdCV4cBh25BwRA/09F20NqzO3+jIYwaBcCYWK6nv
	 rAdEJhs5Mu4HxjURyS1cvHFvD3VLJVPpaq9Y7MU1t0/NIi9DzSd7ERjnU8PIshDLw2
	 ZUhB9tE65EuuuPHOVcEzhyZhl8jC86a9LN+r386Ad3HrPrEsJawX57bsaaXl2FWt0M
	 Ng/H2dcmnNIO4qEB9DAqkyCUaq0xZhcp5uyckRCTNI0zKvJL61SbQue/oZawmcqyBU
	 2qaWWMB/e4Hag==
Received: from localhost (host-78-150-86-125.as13285.net [78.150.86.125])
	by alistairbell.org (Postfix) with ESMTPSA id BBBEC4EBA;
	Sun, 12 Jul 2026 18:44:03 +0000 (UTC)
From: Alistair Bell <dev@alistairbell.org>
To: linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	pavel@kernel.org,
	Alistair Bell <dev@alistairbell.org>
Subject: [PATCH 0/2] leds: Introduce Texas Instruments LP5816 LED driver
Date: Sun, 12 Jul 2026 19:43:16 +0100
Message-ID: <20260712184318.78852-1-dev@alistairbell.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[alistairbell.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[alistairbell.org:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-9050-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dev@alistairbell.org,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:dev@alistairbell.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dev@alistairbell.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[alistairbell.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1143A745A9B

The patch series adds support for the Texas Instruments LP5816
4-channel I2C interface RGBW LED driver.

Provides sysfs control of fade, fade duration, fade profile and
control of maximum output current.

Tested on: Qualcomm's QCS615 arm64 platform via a daughter board
display adapter.

Alistair Bell (2):
  leds: Texas Instruments LP5816 driver
  dt-bindings: leds: Add binding for ti,lp5816

 .../ABI/testing/sysfs-class-leds-lp5816       | 123 +++++
 .../devicetree/bindings/leds/ti,lp5816.yaml   |  45 ++
 MAINTAINERS                                   |  10 +
 drivers/leds/Kconfig                          |  12 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-lp5816.c                    | 443 ++++++++++++++++++
 6 files changed, 634 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-leds-lp5816
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5816.yaml
 create mode 100644 drivers/leds/leds-lp5816.c

-- 
2.54.0


