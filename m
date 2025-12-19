Return-Path: <linux-leds+bounces-6454-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56488CD09D4
	for <lists+linux-leds@lfdr.de>; Fri, 19 Dec 2025 16:47:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CAAC0305E0A5
	for <lists+linux-leds@lfdr.de>; Fri, 19 Dec 2025 15:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517BD33BBCC;
	Fri, 19 Dec 2025 15:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zonque.org header.i=@zonque.org header.b="kQ0a2ZRN"
X-Original-To: linux-leds@vger.kernel.org
Received: from mailkram.bugwerft.de (mailkram.bugwerft.de [95.216.200.101])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE84F23EA82
	for <linux-leds@vger.kernel.org>; Fri, 19 Dec 2025 15:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.216.200.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159148; cv=none; b=K+DAfhrwwcxEXLqE9b4j47B65QMV0jrWWd3XPkWt+ktOEADsGKw60LjMsww6H3LzcPH4bRllZtj1FKQofY/kpGTeXvL7nFV+MhyGtjn1CYY3r4sRvBIdyycdHydiMG+sdQ2TuyIFW76JlnTk9zLTqPUf36k9rZ6qWFrTRo0vK+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159148; c=relaxed/simple;
	bh=cFYQ48pcQREiDeBw70pHa8iYig3i8QlkTOsODqsj+AE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oNN7xEhX4ab7TEEBAHyCZ7S5sKFexOo0qN9apAwKnV86iJpggI/44O5/BW+b77Zc0cLuwQbffJZcuCTrV1Nj3u7XB0t2J7x+pVcRqe4zymXL67qdMj7wW+J4E9Xynyyo0Z0+DWi0rSpcwxBR6o3WJph/oqAagHMgqnkv9AF89ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zonque.org; spf=pass smtp.mailfrom=zonque.org; dkim=pass (1024-bit key) header.d=zonque.org header.i=@zonque.org header.b=kQ0a2ZRN; arc=none smtp.client-ip=95.216.200.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zonque.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zonque.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zonque.org; s=mail;
	t=1766159137; bh=cFYQ48pcQREiDeBw70pHa8iYig3i8QlkTOsODqsj+AE=;
	h=From:To:Cc:Subject:Date;
	b=kQ0a2ZRNI9+s3deTpoRfNHR5KGpbb0QT87bR7BmrMAZwG59Q067MxtkrYuND/LosJ
	 o5gL3rkUNoJZeiIJYWv996Fm8k5OfIe6ol/OG7WQ2gHrui4HIJaNN1Z0entggrTgYe
	 ZCPxlorRyTJ/s/WP6PITh9HEW6hM1d/4wNRYsNOU=
Received: from hq-00595.pfsense.f14 (p4ff24940.dip0.t-ipconnect.de [79.242.73.64])
	by mailkram.bugwerft.de (Postfix) with ESMTPSA id 5EA944168D;
	Fri, 19 Dec 2025 15:45:37 +0000 (UTC)
From: Daniel Mack <daniel@zonque.org>
To: linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	Daniel Mack <daniel@zonque.org>
Subject: [PATCH v4 0/3] leds: is31f132xx: add support for is31fl3293
Date: Fri, 19 Dec 2025 16:45:18 +0100
Message-ID: <20251219154521.643312-1-daniel@zonque.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v4 of the series to support the is31fl3293 with the is31f132xx
driver, rebased on top of 6v.18.

Daniel Mack (3):
  dt-bindings: leds: add issi,is31fl3293 to leds-is31fl32xx
  leds: is31f132xx: re-order code to remove forward declarations
  leds: is31f132xx: add support for is31fl3293

 .../bindings/leds/leds-is31fl32xx.txt         |   1 +
 drivers/leds/leds-is31fl32xx.c                | 266 +++++++++++++-----
 2 files changed, 193 insertions(+), 74 deletions(-)

-- 
2.52.0


