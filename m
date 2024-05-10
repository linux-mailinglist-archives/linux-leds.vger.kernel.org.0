Return-Path: <linux-leds+bounces-1653-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F285D8C2166
	for <lists+linux-leds@lfdr.de>; Fri, 10 May 2024 11:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE34B281F9A
	for <lists+linux-leds@lfdr.de>; Fri, 10 May 2024 09:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 281B416C6A9;
	Fri, 10 May 2024 09:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="ipH0V/WG"
X-Original-To: linux-leds@vger.kernel.org
Received: from mxout3.routing.net (mxout3.routing.net [134.0.28.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6492C16C443;
	Fri, 10 May 2024 09:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715335045; cv=none; b=MbmVEjkrzUBtvYEg9UlovwM8A5BZizB6ysUv/PA/RNJ2Ag0C33zECgvMX5F+RMNfJWO4//s46piloXXqYkm/MpyNE8v4UPYPcBt0iRi2XP9jmPbbTNuXtAoiASWLRT63P1BAr5vDJv+lXYjqVMNhZpxat7beC0LD75D1dyc5cvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715335045; c=relaxed/simple;
	bh=5ZIFWI7XJww8H/IRiz24CEViZc0Vd/y+QZ7Nu96HSng=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QFKZLIB90RSVfMvNsOqUYBnDlA/+mKo0I0SnO9YySnHxjioQfBRkb4mtL3oSH0NSrqcJSdGAM2XAQzTMrNW4+gn1FUi754P2q9XkzEwHF05PkgeVzNTX3JoTrB3m6aG8tulTzHhRp6ZTYN8kHuKh9KBmg3ZYP6QmXBoqIE+3hXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=ipH0V/WG; arc=none smtp.client-ip=134.0.28.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout3.routing.net (Postfix) with ESMTP id 3C3A2616AD;
	Fri, 10 May 2024 09:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1715335035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c/Hoj7MJiHi8HmiwMQBwdoIi7cvTzX37sRigg09M4hc=;
	b=ipH0V/WGfGA3XJ5W8wKXc3CACSlXLq330jLwqa4DrTRiEZbloukQ35YfDtrJSlhsCcm6Or
	n6atVUJdYcaudULRrtYYbQr8e/K4HnIAXCuTpWHy0+d+xT9ChOHHGPaBEx6k+ZJtAjN4eE
	AIVkIjsImT4iggQcL0OiSAtkIg8wmOM=
Received: from frank-G5.. (fttx-pool-217.61.152.152.bambit.de [217.61.152.152])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 2AF4240075;
	Fri, 10 May 2024 09:57:14 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Eric Woudstra <ericwouds@gmail.com>,
	Tianling Shen <cnsztl@immortalwrt.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/2] dt-bindings: arm64: mediatek: add BananaPi R3 Mini
Date: Fri, 10 May 2024 11:57:06 +0200
Message-Id: <20240510095707.6895-2-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240510095707.6895-1-linux@fw-web.de>
References: <20240510095707.6895-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: fadb8d33-81e3-4bdd-928c-57f3030276a1

From: Frank Wunderlich <frank-w@public-files.de>

Add MT7988A based BananaPi R3 Mini.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v3:
- added ack-by
- dropped "dts:" from commit title
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 09f9ffd3ff7b..d4640e2e5fad 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -91,6 +91,7 @@ properties:
           - enum:
               - acelink,ew-7886cax
               - bananapi,bpi-r3
+              - bananapi,bpi-r3mini
               - mediatek,mt7986a-rfb
           - const: mediatek,mt7986a
       - items:
-- 
2.34.1


