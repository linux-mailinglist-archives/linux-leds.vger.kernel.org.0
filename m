Return-Path: <linux-leds+bounces-7294-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBijK4NgsWl/uQIAu9opvQ
	(envelope-from <linux-leds+bounces-7294-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 13:30:59 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F682639F9
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 13:30:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4327331A9EA5
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 12:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2B03E023C;
	Wed, 11 Mar 2026 12:27:43 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E40C3DEAED
	for <linux-leds@vger.kernel.org>; Wed, 11 Mar 2026 12:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773232063; cv=none; b=JgDkyGYKZJ64vRIGWkaEnqdvRPuok7Uxkhj4yszwTIJDRPdsPREcuKK+oop+CoZ4mPmG0aNpfqPQ2DP9BoVGh/YyRqgC1VwOKWd4kHpaf7uhghWrib2MxImXwCYAO7T4GmJ8SGH11+GGF6+qPKvlCiNAa9dinrd2VIH0w7fJPgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773232063; c=relaxed/simple;
	bh=k91URhsfRskdTZme8uSkpuSCgqA6D++LrvkN7g0hseM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IhMHKtIw0g6Dw27oavpV5b90peFaStqBjmlbZuAyqIaXlsi43bIJVfhoI20drDTAFismJ4FcpxnwFQhCUPp/SPCoyuKS9eOncp35EGfuR+YqUlS2mQzs3/nVu0D8BwoWYzWMVTyQHKdsR+EOUBmh7QcZsysdGQ5dkC2M7eDYHOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1w0Iez-0002PX-JW; Wed, 11 Mar 2026 13:27:33 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH v2 0/2] LED: Add fault state handling to LP5860 LED
Date: Wed, 11 Mar 2026 13:27:00 +0100
Message-Id: <20260311-v6-19-topic-ti-lp5860-fault-v2-0-f9454910f009@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJRfsWkC/43PTW7DIBAF4KtYrDsVYIOxFVW9R5UFP0OCFBsXs
 JUqyt1L7V276fLN4r1vHiRjCpjJ2DxIwi3kEOca+EtD7FXPF4TgaiacckkZH2CTwAYocQkWSoD
 bIpSk4PV6K2CVccyLwdvWk9qwJPThvrd/nGu+hlxi+trHNvZz/V/vxoBBN1jFuLNUOv2+4HxZS
 4pzuL86JOfnsZbwc60vlGOSGJ0RbJymUMZGOuStV0wLpMqg8sYLVK7HwaOxPdfCCM/7HT5hznr
 /fWxOO7GlB7H7Q9z6ijMMnbRSd73FX7i3qnt+A8TfjgFoAQAA
X-Change-ID: 20260129-v6-19-topic-ti-lp5860-fault-c8bd1f59fc3f
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Rspamd-Queue-Id: 51F682639F9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pengutronix.de:mid,pengutronix.de:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.706];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FROM_NEQ_ENVFROM(0.00)[s.trumtrar@pengutronix.de,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-7294-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Action: no action

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
Changes in v2:
- make some functions/defines clearer
- minor newline cleanups
- split sysfs patch into own patch
- fix scope of some variables
- Link to v1: https://lore.kernel.org/r/20260129-v6-19-topic-ti-lp5860-fault-v1-1-49c812dc06da@pengutronix.de

---
Steffen Trumtrar (2):
      led: lp5860: expose fault state via sysfs
      leds: lp5860: detect and report fault state

 Documentation/ABI/testing/sysfs-class-spi-lp5860 |  49 ++++++++
 drivers/leds/rgb/leds-lp5860-core.c              | 143 +++++++++++++++++++++++
 include/linux/platform_data/leds-lp5860.h        |  19 ++-
 3 files changed, 208 insertions(+), 3 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260129-v6-19-topic-ti-lp5860-fault-c8bd1f59fc3f
prerequisite-message-id: <20260309-v6-14-topic-ti-lp5860-v7-1-b1ed6c6a47ce@pengutronix.de>
prerequisite-patch-id: 45e295aab0d3ea7d92bf71596f8b0e18e8621ac0

Best regards,
-- 
Steffen Trumtrar <s.trumtrar@pengutronix.de>


