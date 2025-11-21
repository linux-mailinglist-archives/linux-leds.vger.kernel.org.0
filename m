Return-Path: <linux-leds+bounces-6268-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E8057C78DB9
	for <lists+linux-leds@lfdr.de>; Fri, 21 Nov 2025 12:39:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id EDD8D2D593
	for <lists+linux-leds@lfdr.de>; Fri, 21 Nov 2025 11:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815A3350A3D;
	Fri, 21 Nov 2025 11:36:24 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C861D34B674
	for <linux-leds@vger.kernel.org>; Fri, 21 Nov 2025 11:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.23.86.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724984; cv=none; b=iRqbgGHrbI1nO67KwEALnNLqX2XjFbRaTHADtPUjGPBuY9QC59ZW6B7d/AF62D+fJ5cvme44atv/C1F0TyfGqL4D+an2YJ7eq3yecpuUM7kNNVay/gk0Q6QrzGnPMA1fYfKPnHexsrf0hFdOCzjXhVX3JFqCxJnJkFO++P1GcEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724984; c=relaxed/simple;
	bh=wh01j0CI1szC0I9F8ywAsWqOwMNY5fQbeTt3kg4NZ7A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ODtJZrp2jmmiWh0ikCItFK+lIxHUL5RYnp3eRzatfA+57MQvntzwk/zapNRl0kHVhJPMkXXE4MqHlsCh6ydwMMVrWusags00XFtG+DeOwJpFfHslOkxa6cmdwCpcP/6ks1vSB8Ihjw+Rr2rCFYV4cD7f6Ot/qhoIcblekdeGOpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=holoplot.com; spf=fail smtp.mailfrom=holoplot.com; arc=none smtp.client-ip=46.23.86.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=holoplot.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=holoplot.com
Received: from hq-00595.pfsense.f14 (p4ff24940.dip0.t-ipconnect.de [79.242.73.64])
	by mail.bugwerft.de (Postfix) with ESMTPSA id 6E5C9281EBF;
	Fri, 21 Nov 2025 11:36:14 +0000 (UTC)
From: Daniel Mack <daniel.mack@holoplot.com>
To: linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	Daniel Mack <daniel.mack@holoplot.com>
Subject: [PATCH v3 0/3] leds: is31f132xx: add support for is31fl3293
Date: Fri, 21 Nov 2025 12:35:54 +0100
Message-ID: <20251121113557.77418-1-daniel.mack@holoplot.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v3 of the series to support the is31fl3293 with the is31f132xx
driver.

Daniel Mack (3):
  dt-bindings: leds: add issi,is31fl3293 to leds-is31fl32xx
  leds: is31f132xx: re-order code to remove forward declarations
  leds: is31f132xx: add support for is31fl3293

 .../bindings/leds/leds-is31fl32xx.txt         |   1 +
 drivers/leds/leds-is31fl32xx.c                | 234 +++++++++++++-----
 2 files changed, 177 insertions(+), 58 deletions(-)

-- 
2.51.1


