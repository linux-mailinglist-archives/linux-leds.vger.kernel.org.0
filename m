Return-Path: <linux-leds+bounces-6787-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPEvM6cse2lRCAIAu9opvQ
	(envelope-from <linux-leds+bounces-6787-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jan 2026 10:47:19 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2C8AE3C6
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jan 2026 10:47:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 20D78300B460
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jan 2026 09:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A4D322B7B;
	Thu, 29 Jan 2026 09:46:31 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F133803E2
	for <linux-leds@vger.kernel.org>; Thu, 29 Jan 2026 09:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769679991; cv=none; b=fpmM2UZ7xVUOqgxhahA/pLToIhrp/l9j/iR5Y5jyTxSguspsxl2lmqDjUEQ48RyU6fQi8fMteKaVWamdc3vY6EqfV6W4cbGxiSCkcp8NjXZ5pOrmatPIrBtumm/go2T4b+ozucW75O0Hi74E1lJQZsxWsS75IjfVUvPdBYOeevg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769679991; c=relaxed/simple;
	bh=UpMstPUWztDyOwyRGJBi1y7vppuuG84MQ+iyTSWu5ZI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Dfwnkf3pDDsbgmauZP26xAl3Bk6IO831ehsKkQbFDc2nJJIjjGW3svqKzt8WzE8+Uwty0MOcxIxyrZphSFTIRpiLkB4hqXbZC780+em5EXNAwXN2DC8Bg6+v8EpLWJ3v6bmvSUQBenISC5tgbxaItjyb8sDI60G9nGCh7EfslC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1vlObX-0000zg-SE; Thu, 29 Jan 2026 10:46:23 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH 0/2] lp5680: compile fixes and cleanup
Date: Thu, 29 Jan 2026 10:45:54 +0100
Message-Id: <20260129-v6-19-topic-ti-lp5860-fixes-v1-0-635ab524ebbd@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFIse2kC/x3MQQqAIBBA0avErBtQS9GuEi1KpxqIEo0IorsnL
 R8f/gOZElOGrnog0cWZj71A1hX4ddwXQg7FoIQyQiqHl0Hp8DwiezwZt6itETjzTRmbRvvWBqN
 9mKAcYqI/lEE/vO8HbZBuX20AAAA=
X-Change-ID: 20260129-v6-19-topic-ti-lp5860-fixes-335c48d65cdb
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,pengutronix.de:mid,pengutronix.de:email];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-leds];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.trumtrar@pengutronix.de,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6787-lists,linux-leds=lfdr.de];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: EF2C8AE3C6
X-Rspamd-Action: no action

This fixes a compilation error that the kernel test robot found in the
lp5860 driver when it is compiled as a module.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
Steffen Trumtrar (2):
      leds: lp5860: Fix compilation as module
      leds: lp5860: Remove useless select

 drivers/leds/rgb/Kconfig            | 2 --
 drivers/leds/rgb/leds-lp5860-core.c | 6 ++++++
 drivers/leds/rgb/leds-lp5860-spi.c  | 2 +-
 3 files changed, 7 insertions(+), 3 deletions(-)
---
base-commit: f8d19c87baf1382ff718295c571bc40202be3dd1
change-id: 20260129-v6-19-topic-ti-lp5860-fixes-335c48d65cdb

Best regards,
-- 
Steffen Trumtrar <s.trumtrar@pengutronix.de>


