Return-Path: <linux-leds+bounces-217-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63ED87FF809
	for <lists+linux-leds@lfdr.de>; Thu, 30 Nov 2023 18:19:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06911B20EA9
	for <lists+linux-leds@lfdr.de>; Thu, 30 Nov 2023 17:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48AC056465;
	Thu, 30 Nov 2023 17:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="teH1Wywk"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2599E55C09;
	Thu, 30 Nov 2023 17:19:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E203FC433C8;
	Thu, 30 Nov 2023 17:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701364752;
	bh=PvCAxPOZ0lYTZaufhXNc1kd1nvehZHcqsT5UF6Hm2Uc=;
	h=From:To:Cc:Subject:Date:From;
	b=teH1WywkGfVlqYJZW1HF2OeJV/+7czbISREfpUEa0JFpjPG8dxsU+693qOiTVdrCj
	 g4Ziymp3ou5G7v4cMX+lOsvI5Z6ead/MV+pueHv+UFoHTxypfY+o1jzuhmEhoMVb5Q
	 yNoAW8i8W6vBcAc4tXmaBJ/dyX9Dh4tCzGrtoo9ETH9XobbXtAVP+VFJKUNPREDHJ0
	 LMQm8gf+907AJBlCqfs68VKGtcsCiE8Y9+i7sRl6rpZU73d/zGie7B5CJFZSgAttOH
	 aR/HDVTtkrHqXU1etkS7lorho5dwJXlSqmrUR5qChV2RfyzD+uYIHJzvcHBnGylcfD
	 OETHBYCGATGfA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1r8khU-0003E6-2a;
	Thu, 30 Nov 2023 18:19:44 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	inux-arm-msm@vger.kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] dt-bindings: leds: qcom,spmi-flash-led: fix example node name
Date: Thu, 30 Nov 2023 18:19:40 +0100
Message-ID: <20231130171940.12391-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The led controller is a child of an SPMI PMIC, which in turn sits on an
SPMI bus.

While at it, add some newline separators to improve readability.

Fixes: 1aeff6216891 ("dt-bindings: leds: Add QCOM flash LED controller")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 .../devicetree/bindings/leds/qcom,spmi-flash-led.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml b/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
index a8736fd5a539..1ba607685f5f 100644
--- a/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
+++ b/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
@@ -89,9 +89,11 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/leds/common.h>
-    spmi {
+
+    pmic {
         #address-cells = <1>;
         #size-cells = <0>;
+
         led-controller@ee00 {
             compatible = "qcom,pm8350c-flash-led", "qcom,spmi-flash-led";
             reg = <0xee00>;
-- 
2.41.0


