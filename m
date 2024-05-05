Return-Path: <linux-leds+bounces-1595-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC5C8BC2A0
	for <lists+linux-leds@lfdr.de>; Sun,  5 May 2024 18:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAC6A28194B
	for <lists+linux-leds@lfdr.de>; Sun,  5 May 2024 16:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C6FF3FB9D;
	Sun,  5 May 2024 16:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="r8Xd++4m"
X-Original-To: linux-leds@vger.kernel.org
Received: from mxout3.routing.net (mxout3.routing.net [134.0.28.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20A1374DB;
	Sun,  5 May 2024 16:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714927957; cv=none; b=MnGchLLxcGDc2AQ/piojd8TutGmta47CpnNpEG1q4oxvV9nwM9HWXczdmMGtG2yirODKX1V5B/SiH7IemZ0529L+dDlGeAWisJnPVGLdWgFxY3kJqWn5pza4Ram0gs9gh/L+Csy7y5I/peNuDffJpb6WrOVkYWZMxCUu1UUSErQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714927957; c=relaxed/simple;
	bh=/Qzj5nd6IlnXyI8xQ6KpRh7qJX97MpZcROYGIASsScA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fOJf52s+wvsT4CYFXHufQYkCPwYLQClSY6cHkMDKBXCTnXOkpMUpqsQtZCmBCR8cTR17UDAUguNOocNj9nhJ8ZRMeuj4Wi4ZJzOtedvV1ZQyji76FAyjupymkCCn1Cn6k5YIBlQrmEFew1dBIn4l3EFbZ+YqX63Xg2/+f7ZWg0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=r8Xd++4m; arc=none smtp.client-ip=134.0.28.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout3.routing.net (Postfix) with ESMTP id B7BA160028;
	Sun,  5 May 2024 16:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1714927560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b8CC5FsbogjZoptEYJG363eKljb3vexCvHMr6xKGdvw=;
	b=r8Xd++4muWmwyDD5Xd+UwQY9nTveijg1zPeMjggUy8ABSeGpRrnJg0Edse6gx9psCUjak4
	Tu1rFXrgeZAKX/p7kuDzOYrW2gMQVu4PvVgoFn4ByFsQ+Bgvp/r9S+c6qY2Fdo04f2RYxU
	60KRT+YKBG/xcSdWM7ZqeOmT7JSu+Xo=
Received: from frank-G5.. (fttx-pool-217.61.153.24.bambit.de [217.61.153.24])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id B6869360233;
	Sun,  5 May 2024 16:45:59 +0000 (UTC)
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
Subject: [RFC v1 2/5] dt-bindings: clock: mediatek: add address-cells and size-cells to ethsys
Date: Sun,  5 May 2024 18:45:46 +0200
Message-Id: <20240505164549.65644-3-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240505164549.65644-1-linux@fw-web.de>
References: <20240505164549.65644-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 12140d7a-4053-44a5-aee2-e46c434d17da

From: Frank Wunderlich <frank-w@public-files.de>

Add missing properties already used in mt7986a.dtsi.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../devicetree/bindings/clock/mediatek,ethsys.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,ethsys.yaml b/Documentation/devicetree/bindings/clock/mediatek,ethsys.yaml
index f9cddacc2eae..ce953a35f307 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,ethsys.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,ethsys.yaml
@@ -32,12 +32,18 @@ properties:
   reg:
     maxItems: 1
 
+  "#address-cells":
+    const: 1
+
   "#clock-cells":
     const: 1
 
   "#reset-cells":
     const: 1
 
+  "#size-cells":
+    const: 1
+
 required:
   - reg
   - "#clock-cells"
-- 
2.34.1


