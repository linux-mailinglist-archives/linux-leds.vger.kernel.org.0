Return-Path: <linux-leds+bounces-6452-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F592CD09C8
	for <lists+linux-leds@lfdr.de>; Fri, 19 Dec 2025 16:47:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6C2603066AAE
	for <lists+linux-leds@lfdr.de>; Fri, 19 Dec 2025 15:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148FD26CE11;
	Fri, 19 Dec 2025 15:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zonque.org header.i=@zonque.org header.b="aZ/gMK9R"
X-Original-To: linux-leds@vger.kernel.org
Received: from mailkram.bugwerft.de (mailkram.bugwerft.de [95.216.200.101])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE799236454
	for <linux-leds@vger.kernel.org>; Fri, 19 Dec 2025 15:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.216.200.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159146; cv=none; b=RfGnW8bKjoARtn4uzc6prFH4SvYgYBBAwOYKNqq2OZqWTacoKU3MdBQIVa0Z2iLbNBh9iBMqfS+Is7owseDMU71mxnEytgQ0RH8GaqHun7ARIDppE8rH00aZ6tTBoZFSAsT+5c6mF9UndbyIt6aLRTzX6Ngp/zZlk3Knm/joU7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159146; c=relaxed/simple;
	bh=Mbm+KQiSrtuNe9UFB/tTmk/UQ4jwKICTeRUt0y0vVcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DeRWsdvyZEKA7BnwkUmsyTgoOx68ULZQjFGOAWWbx25LqIhbk5J4b3M2SxrH+rt9RQ0y7/N5fGh6P0NnbgczyaWRx+VLq6Jml/N89GTmbKS0wFp45T/leWxq01DVPJNjp2ryXYDc/WVQNkKWfJUyaH7nwjN9/dCdCX4Ls4SB6Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zonque.org; spf=pass smtp.mailfrom=zonque.org; dkim=pass (1024-bit key) header.d=zonque.org header.i=@zonque.org header.b=aZ/gMK9R; arc=none smtp.client-ip=95.216.200.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zonque.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zonque.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zonque.org; s=mail;
	t=1766159138; bh=Mbm+KQiSrtuNe9UFB/tTmk/UQ4jwKICTeRUt0y0vVcs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aZ/gMK9RDxGaF8Yi3aTBn8FzqMbM14tDkiz8wlr4EghpJyAwjN7KxV08i8OWvBmZj
	 5tqjSdubbtGHRLfn+U/i6WtyWbzrNr+4Rg0EynU/XtDsV1A4AhXrbuAWn9vPDnZ+HE
	 U+bSs0N2pGNhI7m9ltjw4uKiz4waP7Lr2dOUv31w=
Received: from hq-00595.pfsense.f14 (p4ff24940.dip0.t-ipconnect.de [79.242.73.64])
	by mailkram.bugwerft.de (Postfix) with ESMTPSA id 20E7F416D0;
	Fri, 19 Dec 2025 15:45:38 +0000 (UTC)
From: Daniel Mack <daniel@zonque.org>
To: linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	Daniel Mack <daniel@zonque.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/3] dt-bindings: leds: add issi,is31fl3293 to leds-is31fl32xx
Date: Fri, 19 Dec 2025 16:45:19 +0100
Message-ID: <20251219154521.643312-2-daniel@zonque.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219154521.643312-1-daniel@zonque.org>
References: <20251219154521.643312-1-daniel@zonque.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This variant supports 3 channels with 4096 brightness steps.

Signed-off-by: Daniel Mack <daniel@zonque.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
index 926c2117942c..7082ed186dd9 100644
--- a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
+++ b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
@@ -10,6 +10,7 @@ Required properties:
 	issi,is31fl3235
 	issi,is31fl3218
 	issi,is31fl3216
+	issi,is31fl3293
 	si-en,sn3218
 	si-en,sn3216
 - reg: I2C slave address
-- 
2.52.0


