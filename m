Return-Path: <linux-leds+bounces-1651-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF978C215D
	for <lists+linux-leds@lfdr.de>; Fri, 10 May 2024 11:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C489282022
	for <lists+linux-leds@lfdr.de>; Fri, 10 May 2024 09:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5537D1649D5;
	Fri, 10 May 2024 09:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="kf2YVc0h"
X-Original-To: linux-leds@vger.kernel.org
Received: from mxout2.routing.net (mxout2.routing.net [134.0.28.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FCB15FCE1;
	Fri, 10 May 2024 09:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715335039; cv=none; b=ncf0bIO7Tpt9SiizIU3EKDMgZVwmIiwuwq7+neSQ1oh2ZpLrLFBM2QvRjIr45jIPD6383ss9HxUwENNKsUo8jT50QNV0FTsK81ActpU0LkEHpoR/paTeGGtTh27CcwtrFFVl4365e0DkgbYwmmIY/oUuT6bWGNXoZxNmRPm1v8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715335039; c=relaxed/simple;
	bh=uwKaZyMTFC2jPmMy7DLyjkOrP7HT743tJh/Qj4vTTEo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rYNElMr5P+wAiobWwKV5H3wL9UpNfcOXJkXTdpGyfZdXsl7Vx8b44YwkLFkW8vtgGT/kgVo1jRwHjanZQRWwhlaAECEUAb66NSI4OG99EC2BDnvgXLbms9qtENAbmnYvgD7MDYWQ4w5WsWnPewAYOKZ7/LfSX4Akk+DedLTIXX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=kf2YVc0h; arc=none smtp.client-ip=134.0.28.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout2.routing.net (Postfix) with ESMTP id 5202B601EA;
	Fri, 10 May 2024 09:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1715335034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IVfreqw0uH1zijg8e8Ue3UOGCbiqwXXFS7aG6Qf97+s=;
	b=kf2YVc0heVGoBZ53oLQl/aIWN0YfO6Btzz2ymGfSLu5TcJjA9CUbRcjTEDh1mdLmzTOW9h
	6kUa7GHs8sRbYcSciagYZwUSiX5kZKZV4vUBFzAthz9P+UOkTZbOa8QL1wGeDP4wg1Anx8
	w5VS1dTPbFnht8wPbrw7kBW/SQP3Ejc=
Received: from frank-G5.. (fttx-pool-217.61.152.152.bambit.de [217.61.152.152])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 086F640029;
	Fri, 10 May 2024 09:57:12 +0000 (UTC)
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
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/2] Add Bananapi R3 Mini
Date: Fri, 10 May 2024 11:57:05 +0200
Message-Id: <20240510095707.6895-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: ec672c86-1632-4f96-8758-6e1f268feb06

From: Frank Wunderlich <frank-w@public-files.de>

Add mt7986 based BananaPi R3 Mini SBC.

changes in v3:
- fixed unicde parenthesis in commit description of dts patch
- dropped "dts:" from title of binding patch
- added AB to binding and RB to dts patch

changes in v2:
- dropped patches for unrealated binding fixes which are already fixed in next.
- add missing node for nand
- add some information about the board in description
    
change dts based on review from angelo+krzysztof
    
 - drop fan status
 - rename phy14 to phy0 and phy15 to phy1
 - drop default-trigger from phys and so also the binding-patch
 - use regulator names based on regexp regulator-[0-9]+v[0-9]+
 - add comment for pwm

Frank Wunderlich (2):
  dt-bindings: arm64: mediatek: add BananaPi R3 Mini
  arm64: dts: mediatek: Add  mt7986 based Bananapi R3 Mini

 .../devicetree/bindings/arm/mediatek.yaml     |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../mediatek/mt7986a-bananapi-bpi-r3-mini.dts | 493 ++++++++++++++++++
 3 files changed, 495 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dts

-- 
2.34.1


