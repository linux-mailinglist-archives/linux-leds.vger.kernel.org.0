Return-Path: <linux-leds+bounces-1639-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B1F8C0EB5
	for <lists+linux-leds@lfdr.de>; Thu,  9 May 2024 13:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B0E9B212BF
	for <lists+linux-leds@lfdr.de>; Thu,  9 May 2024 11:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD851304BD;
	Thu,  9 May 2024 11:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="oHGl6lqv"
X-Original-To: linux-leds@vger.kernel.org
Received: from mxout1.routing.net (mxout1.routing.net [134.0.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A96D12FF8E;
	Thu,  9 May 2024 11:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715253121; cv=none; b=ljE30nUmwXOe924FD4YkBopTKFZqpXbKmF31nhkHcYwr4AIHed42vIUw9HuQEFpOy/thEUx/kTbu2DU9eSCoN61zcxfpVidyS+Wg6e323SNQMKMUimuZXIbIUe2vZJvEHblT/ZwceAlTDaf4PBC9anKoIbV3juP0wQdMwdvC96k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715253121; c=relaxed/simple;
	bh=nGsf/MgdZntlw0hqfgzXJ+zVt8pES0HjD57dZf4Vxgc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LGyRpKdOPaXp36OkKkoBk/tRYcs5YB3aOqh/tXxr93rZCXV70y8j2O5RjYAjc7nxm7g3d/gp9UG9LFfEtzuRwf76JZosa1m5lkyb4IAzwXm2A27GuWybjx9cqYNsAucFHDZKoRd2CffeW706ofGYrYl23rm3rYu+fS9zxr9+jGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=oHGl6lqv; arc=none smtp.client-ip=134.0.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id 42EFF40271;
	Thu,  9 May 2024 11:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1715252750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GEGFfh9MxXz9dR3HLGIfZ2niDiQZQ2wIMR9m2PmyxWc=;
	b=oHGl6lqvK/Me32lsZ92xikGNsJke3oyJ0mrV4F9TxKoo5ES/ugyyCwsPzv6hQ1N2v7nM/y
	VKho7DcjnQl3kBthVsfjsonrTm4YxdZnY97sn37R/un02KAHknX4r3pbph/srZg0UMfKmC
	MjS3m8l+em19NcEg0ML3rp4Fue/QYWQ=
Received: from frank-G5.. (fttx-pool-217.61.150.116.bambit.de [217.61.150.116])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 7410A100294;
	Thu,  9 May 2024 11:05:49 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] dt-bindings: leds: mark label as depected to match description
Date: Thu,  9 May 2024 13:05:45 +0200
Message-Id: <20240509110545.49889-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 610a2f7a-8cfa-4aff-82f7-52b52ec676cf

From: Frank Wunderlich <frank-w@public-files.de>

The description for property 'label' describes it as deprected, so
add a option to mark it like that. Future devicetrees should use
function and color properties.

Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Fixes: 24a71afe05a8 ("dt-bindings: leds: Convert common LED binding to schema")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 Documentation/devicetree/bindings/leds/common.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index 8a3c2398b10c..2d7331bba1fc 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -58,6 +58,7 @@ properties:
       no other LED class device can be assigned the same label. This property is
       deprecated - use 'function' and 'color' properties instead.
       function-enumerator has no effect when this property is present.
+    deprecated: true
 
   default-state:
     description:
-- 
2.34.1


