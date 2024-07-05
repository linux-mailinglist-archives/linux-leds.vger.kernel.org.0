Return-Path: <linux-leds+bounces-2195-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D747928EFE
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jul 2024 23:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38AC528456F
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jul 2024 21:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0E0145A1E;
	Fri,  5 Jul 2024 21:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="ZhbnZNqp"
X-Original-To: linux-leds@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158B81C693;
	Fri,  5 Jul 2024 21:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720216416; cv=none; b=QJ2vevXXxEC9kH+MqQgXsxSbIUXi+KUsa0LjLKO7PWVwEvvKhv5q5tliujmEEHYXUGqLnmwQDKNiLuRTG9NhWDgpvwupWLFJhd+OFpFs0CWELOzT2TOvkiZM3gkfW7n9ezA9UUMwoZ6wrA+ZsWBRcix7B9tFAcR5haJ8MVFNh+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720216416; c=relaxed/simple;
	bh=7RS//O1sJvZBsjt75ltHlk5ubxjwwyRXm284xrlcGeE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kcf7yIrPjnN/+9qOY2JXs2VPHX8zqe9dIj1Yj+/mQpPFv+JAIkUJKe5C14h6lXMY7608X3zZ/s/I+DwT16aQY//rRE2lRxHC7SRSBqHBHCkwCgP5PcgtZ57aCOAhbP9lM3jCnwYjSpqhZ4zraLDJJjya2A2b9Wv6x1PI4G8spcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=ZhbnZNqp; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 0D6DE881AD;
	Fri,  5 Jul 2024 23:53:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1720216413;
	bh=yXYTcJV2BM8NCC6fvNkqGrsypMESBBsvyS/tVJ7b8UE=;
	h=From:To:Cc:Subject:Date:From;
	b=ZhbnZNqplQ81X19TPdt/OvVc5j1DLyldyfRPRtt7q+/qklij6rNpOQk8mGXDd2Hvq
	 dvAhHZdclTfLp2yNkEh7C2zA4sJDna2VcF4NOkdlFNIbPZHmAHMtcZAY6hIsyUjpkR
	 0Z0aOVJ0Cg572jv4pdRij7a6tN4fFA1D9ee0qnOhHlopmkr0AdGt9wBozpHOXHEsM3
	 T10liYNO4thSbWn6ZdjU2hGS+sMseRuiXXPPpM/mapwPEkosax5dp0q4/IHP9o+YXw
	 B8xnwpGZVBx5JXBYyMf6PmDPupJQAOghmYSYgDgIYt30acJHupK0XeuvJAczBIGvBR
	 DHRBKctFIQs0w==
From: Marek Vasut <marex@denx.de>
To: linux-leds@vger.kernel.org
Cc: kernel@dh-electronics.com,
	Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: leds: Document "netdev" trigger
Date: Fri,  5 Jul 2024 23:52:51 +0200
Message-ID: <20240705215313.256963-1-marex@denx.de>
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
network device activity.

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


