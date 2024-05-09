Return-Path: <linux-leds+bounces-1644-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFD88C11E1
	for <lists+linux-leds@lfdr.de>; Thu,  9 May 2024 17:22:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56C722825D1
	for <lists+linux-leds@lfdr.de>; Thu,  9 May 2024 15:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A7916EC01;
	Thu,  9 May 2024 15:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="pZGwikcb"
X-Original-To: linux-leds@vger.kernel.org
Received: from mxout2.routing.net (mxout2.routing.net [134.0.28.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF20015279B;
	Thu,  9 May 2024 15:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715268132; cv=none; b=J2xz7SNOTadkEYGDnqG48NB5VC8hmhsR594TepZNVmOGgmGgGFwR/tTakB9iRsXSXhEjP7nMsO9TQefHXvdtWy7coMtbJOxS/rBKGyKEk1yeUjoLyUo6k9g8AxMGK+kIn4Y2W97lCqgHZA4RQqYcr7tDMP9eb1iJoapdCu3W3vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715268132; c=relaxed/simple;
	bh=Ws8I3Ql5U94+kEXDdzcb5l55Jyb/IE5FKK+9XzxVTjI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=V8RLvE6rWUyfcpfE1Ls7nsU4IZvKsmvI05gAdzlFs1+sctuOKGUTWS+vPR4MaCQ9RovHorSExrMBVK8qT+xJKBwLAlLAngDjmTypWXLtfRyBXTbeFSlaXKJAgMNVGkyJ44G+XZmAcBbfYkuC6xniezR3jp/du1wL5dv23WzOAP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=pZGwikcb; arc=none smtp.client-ip=134.0.28.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout2.routing.net (Postfix) with ESMTP id 591226024A;
	Thu,  9 May 2024 15:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1715268126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fotgTM148ZqesmSfyYXvxrplZmNhg1acut380A13LMw=;
	b=pZGwikcb0fsbAnFSwhOmJmJNL+0A2wQOMwfNjjzcAj22oltjQL3GjN20xnOEnqYHVNOoVV
	REm5ejw0Mgx31iV60ZmucqomylPsXnLM0aTrabFSw0IBcbmX/Q+46paSNjj2BZWKaI0zrV
	OotCNlOIyCPo3WMRuYr0/9V0+VI8CA8=
Received: from frank-G5.. (fttx-pool-217.61.150.116.bambit.de [217.61.150.116])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 0BF403604D4;
	Thu,  9 May 2024 15:22:05 +0000 (UTC)
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
Subject: [PATCH v2 0/2] Add Bananapi R3 Mini
Date: Thu,  9 May 2024 17:21:55 +0200
Message-Id: <20240509152157.10162-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mail-ID: 576f1382-99ca-463f-b168-02acee2867b6

From: Frank Wunderlich <frank-w@public-files.de>

Add mt7986 based BananaPi R3 Mini SBC.

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
  dt-bindings: arm64: dts: mediatek: add BananaPi R3 Mini
  arm64: dts: mediatek: Add  mt7986 based Bananapi R3 Mini

 .../devicetree/bindings/arm/mediatek.yaml     |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../mediatek/mt7986a-bananapi-bpi-r3-mini.dts | 493 ++++++++++++++++++
 3 files changed, 495 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dts

-- 
2.34.1


