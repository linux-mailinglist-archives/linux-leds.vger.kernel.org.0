Return-Path: <linux-leds+bounces-2217-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2B992A172
	for <lists+linux-leds@lfdr.de>; Mon,  8 Jul 2024 13:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 826F01F2137F
	for <lists+linux-leds@lfdr.de>; Mon,  8 Jul 2024 11:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7885877113;
	Mon,  8 Jul 2024 11:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="PjBsYCaX"
X-Original-To: linux-leds@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927D21CD15;
	Mon,  8 Jul 2024 11:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720439228; cv=none; b=FF5r8bpaTgI7Afh/rNpRHAPcu6ZNWVL3wArot6gVA0hfNYBMX2Zvp/N4otLHDPhuAJ0y37I3hejvJgyxI6XrNMSe1kGXHvbumlAPff3mRCHs1wnBvnOGkCOPr+kaj3+ebEzyczEmoeBbYiqp0iXqQjMmLBHYb7UuBamTeHji/0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720439228; c=relaxed/simple;
	bh=cj5tcdWY40m1QZCuCRgB+W2hud5SCnBSlhPK5TIOQPs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ISBxkffFghKXKPv9gCZhlU6HpQ70/Qx5rMonHCsnJyFh2zh1Jct9zarN6Z8zqSOVpBlJBMDeriyCmskG5HaEO5KITvaCWQRyNK1PPN8u8/VTIrYr5F8/NHzw/abcviZm0PTp+h8uQArQzxgb+lrGS1WdIp2mXPgxyJn/j/8sWB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=PjBsYCaX; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 89E918862E;
	Mon,  8 Jul 2024 13:47:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1720439224;
	bh=JlSSnYF+b1qegh0t9YEt8vgYWncKOfXqPWuJY42Tlrs=;
	h=From:To:Cc:Subject:Date:From;
	b=PjBsYCaXEc/kcYtHpeElz1XjrmBbxzmdXH+2+5vu5sbf6YlS82e3bkX2gXwxwm5bU
	 Abl/4KWRZQR3K87mKySnYI5lW1yRC8GjXnIFd+p024m/I+ayI5GEeEE9iSomyPAy4B
	 bZk9zYyWgDsRL4UXfRSFU5H/iZRU+yl9Ab5uilrnuRGnIkPz+rkOxp+lpIXz/QR3u/
	 wEq2XMPTb5C/ifxqTCxQgyo0JbWJF1kYIZxw94v76ch4BPNJTK3sxFuKTzdbWgjQns
	 gyUW/DDfxaVygPL10I78y5RLX/kppk3cne3yKtx1Fy+0Hax2MeUybge2t0acG+r5iV
	 c/fWmeK7mL7Xw==
From: Marek Vasut <marex@denx.de>
To: devicetree@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	linux-leds@vger.kernel.org
Subject: [PATCH v2] dt-bindings: leds: Document "netdev" trigger
Date: Mon,  8 Jul 2024 13:46:27 +0200
Message-ID: <20240708114653.18566-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Document the "netdev" trigger which is used to control LEDs by
network device activity. This is an existing trigger used in
existing DTs, document it so validation of those DTs would pass.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-leds@vger.kernel.org
---
V2: Expand the commit message slightly
---
 Documentation/devicetree/bindings/leds/common.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index 8a3c2398b10ce..bf9a101e4d420 100644
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
2.43.0


