Return-Path: <linux-leds+bounces-1594-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 086AD8BC298
	for <lists+linux-leds@lfdr.de>; Sun,  5 May 2024 18:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A83C1C20DEF
	for <lists+linux-leds@lfdr.de>; Sun,  5 May 2024 16:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA2054903;
	Sun,  5 May 2024 16:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="UW/d8YIV"
X-Original-To: linux-leds@vger.kernel.org
Received: from mxout2.routing.net (mxout2.routing.net [134.0.28.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CAD40848;
	Sun,  5 May 2024 16:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714927944; cv=none; b=qjk+9dXx1WXtjQOd4muCardofM5ohpMDN/Kis1SAZROyfE9uvW+pq1/oSxxPqDikmdnmhg+m6WsMkxVtGi9swMXlB7+bGj5TGGkxmGTQkaZ/Mp8Skn2GINIg9AqUrdT1JcK0PW5pByXjQdUbPHNA1QX/GCkIPUHN3+urBy3xQbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714927944; c=relaxed/simple;
	bh=uBdD4j/qcVqfiTQc3aMSaCW0q+TOLKg73rRJRcTG9kA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fc9cZ2Je0qsF6LFQSqbjLWgQUiwxNGQism2p+M+WeQwqP6wi0SVkD+EhxiX3GtqHVr8aSW2g8eX0hAJAZ3B6O4BtYC2g8GQrPBTjazHol8U7HHmEIwff3PzePbkasq4lcYtmokRjyLQnm3HxeYEPfWr3VFjH6TpA5W38vkg+wCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=UW/d8YIV; arc=none smtp.client-ip=134.0.28.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout2.routing.net (Postfix) with ESMTP id 0AA035FC1F;
	Sun,  5 May 2024 16:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1714927559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RLH3io7UNKePw3EyOdFULg9Ms10FSzoi3dnG86S1EXo=;
	b=UW/d8YIV0QSPsg1hKTYKgbmMNM6nLY1veCdqtdo63qaDl3Q45beJJ0NPCWmk1DPpjOWU4B
	VYx69bxiAHIN61XNZNmP0839JzRASQof9+HWa29txjKLwatn44c4aydyTB/LbTOKapJIix
	uPYbf/vKvZlf6Yc8quEJocQ2tKzNpOo=
Received: from frank-G5.. (fttx-pool-217.61.153.24.bambit.de [217.61.153.24])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id CAC4E360233;
	Sun,  5 May 2024 16:45:57 +0000 (UTC)
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
Subject: [RFC v1 0/5] Add Bananapi R3 Mini
Date: Sun,  5 May 2024 18:45:44 +0200
Message-Id: <20240505164549.65644-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 4acaa28b-d825-4c5f-b59f-9ec20eb5ead6

From: Frank Wunderlich <frank-w@public-files.de>

Add mt7986 based BananaPi R3 Mini SBC and fix some related binding errors.

Frank Wunderlich (5):
  dt-bindings: leds: add led trigger netdev
  dt-bindings: clock: mediatek: add address-cells and size-cells to
    ethsys
  dt-bindings: net: mediatek,net: add reset-cells
  dt-bindings: arm64: dts: mediatek: add BananaPi R3 Mini
  arm64: dts: mediatek: Add  mt7986 based Bananapi R3 Mini

 .../devicetree/bindings/arm/mediatek.yaml     |   1 +
 .../bindings/clock/mediatek,ethsys.yaml       |   6 +
 .../devicetree/bindings/leds/common.yaml      |   2 +
 .../devicetree/bindings/net/mediatek,net.yaml |   3 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../mediatek/mt7986a-bananapi-bpi-r3-mini.dts | 486 ++++++++++++++++++
 6 files changed, 499 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dts

-- 
2.34.1


