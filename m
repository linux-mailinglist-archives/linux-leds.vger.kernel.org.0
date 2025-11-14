Return-Path: <linux-leds+bounces-6133-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 351A0C5C650
	for <lists+linux-leds@lfdr.de>; Fri, 14 Nov 2025 10:55:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 851493AD6A2
	for <lists+linux-leds@lfdr.de>; Fri, 14 Nov 2025 09:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 348113090F7;
	Fri, 14 Nov 2025 09:54:41 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E21F33081B2
	for <linux-leds@vger.kernel.org>; Fri, 14 Nov 2025 09:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.23.86.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763114081; cv=none; b=IrwAtDW7/Vlh45HAGO3O20I+jAveuJpCktrCh9840XkW0M8RKggO3nggmYpbkrrOcFdmZaGzjBCfOuxdtlvTxb8oT/jqYqyT22aK0slEdP3Gn4SppZjrqNwWMEAELJTHRpvNl75Nmwg3Z11021spkDMgO6F8mB3uWqMuk590hxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763114081; c=relaxed/simple;
	bh=z4oT7cCvS54MkHtlDwR08ltEMUPe7L3w+jF1oVj+gFc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D+ACK1oM3gWAgoiSLxFKBcsap4PEQrTfzM5o6xoevaRuTR4x6ev4lShcfs28N013kPigR5Rmo2rsijrJ+HZsCElcDsqVd7mlAAwuGQBykONE9TSU8+DJ4HeuHLOS/NwYfWrDQQpfHQ70PAzxVgx1mJgxcjkcd202fOrJZqtt+Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=holoplot.com; spf=fail smtp.mailfrom=holoplot.com; arc=none smtp.client-ip=46.23.86.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=holoplot.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=holoplot.com
Received: from hq-00595.pfsense.f14 (p4ff24940.dip0.t-ipconnect.de [79.242.73.64])
	by mail.bugwerft.de (Postfix) with ESMTPSA id BA5CC281EA7;
	Fri, 14 Nov 2025 09:46:48 +0000 (UTC)
From: Daniel Mack <daniel.mack@holoplot.com>
To: linux-leds@vger.kernel.org
Cc: pavel@kernel.org,
	lee@kernel.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	Daniel Mack <daniel@zonque.org>
Subject: [PATCH v2 0/3] leds: is31f132xx: add support for is31fl3293
Date: Fri, 14 Nov 2025 10:46:37 +0100
Message-ID: <20251114094640.4096054-1-daniel.mack@holoplot.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Mack <daniel@zonque.org>

This is v2 of the series to support the is31fl3293 with the is31f132xx
driver.

It is now split into 3 parts and also addresses the removal of forward
declarations.

Comments on styling isses in v1 were addressed.

Daniel Mack (3):
  dt-bindings: leds: add issi,is31fl3293 to leds-is31fl32xx
  leds: is31f132xx: add support for is31fl3293
  leds: is31f132xx: re-order code to remove forward declarations

 .../bindings/leds/leds-is31fl32xx.txt         |   1 +
 drivers/leds/leds-is31fl32xx.c                | 234 +++++++++++++-----
 2 files changed, 177 insertions(+), 58 deletions(-)

-- 
2.51.1


