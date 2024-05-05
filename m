Return-Path: <linux-leds+bounces-1598-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A32DC8BC2AB
	for <lists+linux-leds@lfdr.de>; Sun,  5 May 2024 18:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2429A1F21A88
	for <lists+linux-leds@lfdr.de>; Sun,  5 May 2024 16:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E08D66BFB1;
	Sun,  5 May 2024 16:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="t3cwjSYg"
X-Original-To: linux-leds@vger.kernel.org
Received: from mxout4.routing.net (mxout4.routing.net [134.0.28.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CECD5FDA5;
	Sun,  5 May 2024 16:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714927973; cv=none; b=dJn3e5+X97ClGhbTW2/3zZ2g0CKtXPXtSvjWSEaqzUCxK4w40J+7G+7tGPeMAnmTV9E2/itp7CFdKuuMZwVnVX6HqQbH4qo/5/eL6Hy+bVgmpWwgY+wOvk+SpfIIJKRgni/C5uw4a6nPXMRoDZZa0yHPaTQAQQJ6IlHMhPoR4fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714927973; c=relaxed/simple;
	bh=QgQcNi0VoUZ9/gVnBoTyFVE0KPU3pf74Zt+RD3W/KVA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lJh3QtUN3vXkQyWCPDc9O0Ho2RGjgoVFmSNAWb6wtrgzpN1hFgF6egXMkdyvhLvq5G3jiotk6BebzvthSjcvq3zqUFI9A+DHeCWcTJy/tbaerFSX8woiGJM51m87y3Q/OOECIoCcmH61qYfvdgOfclqRYDNIrD8KM+U7FXOmAq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=t3cwjSYg; arc=none smtp.client-ip=134.0.28.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout4.routing.net (Postfix) with ESMTP id D22291001BB;
	Sun,  5 May 2024 16:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1714927560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zu3t1qGKiCHdEeShUHBMRSBx5w0/UYs7wrInBMlDHyw=;
	b=t3cwjSYgbuK+d9TwB9w1UPmClSlr65BlMdK3z0HgTDwICHF8su+pk0o+C76fKi9lSjiGa3
	b9AaN8KwNaYViltpoWnBWVwrptCNgV4ZlDUd4yuY19FYyOKYzDuyI/nkDgdaHfz7SIzeO/
	wTqcZmqMBWrE1hNH6sn92/Bsc7/5Mgc=
Received: from frank-G5.. (fttx-pool-217.61.153.24.bambit.de [217.61.153.24])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id ECA573604D6;
	Sun,  5 May 2024 16:45:58 +0000 (UTC)
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
Subject: [RFC v1 1/5] dt-bindings: leds: add led trigger netdev
Date: Sun,  5 May 2024 18:45:45 +0200
Message-Id: <20240505164549.65644-2-linux@fw-web.de>
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
X-Mail-ID: 52850480-9ab4-47cd-8ce0-2b51c8b97ef7

From: Frank Wunderlich <frank-w@public-files.de>

Add led trigger implemented with config-symbol LEDS_TRIGGER_NETDEV to
binding.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 Documentation/devicetree/bindings/leds/common.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index 8a3c2398b10c..bf9a101e4d42 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -113,6 +113,8 @@ properties:
             # LED indicates NAND memory activity (deprecated),
             # in new implementations use "mtd"
           - nand-disk
+            # LED indicates network activity
+          - netdev
             # No trigger assigned to the LED. This is the default mode
             # if trigger is absent
           - none
-- 
2.34.1


