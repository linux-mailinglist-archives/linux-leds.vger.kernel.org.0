Return-Path: <linux-leds+bounces-4914-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B551AEC8B2
	for <lists+linux-leds@lfdr.de>; Sat, 28 Jun 2025 18:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1ABA33B0BB6
	for <lists+linux-leds@lfdr.de>; Sat, 28 Jun 2025 16:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8AE025A631;
	Sat, 28 Jun 2025 16:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThWhm193"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380B2259CBF;
	Sat, 28 Jun 2025 16:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751127546; cv=none; b=G/+Xjz9fpY+PzPHRMpJ0LH/0/tO9mQJEhZOsi0siQUx3AYrqhxmja+pwfjAh19pf/jGhATN+5NnP77RM1bNSirlh4K8lKmiwMPPYyfGMaz5zo3DE/DIjeLxOzADmhfyfsU61OOe6orDTkoe44k5WSZMJj/1FdZXMI8HffIEqjIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751127546; c=relaxed/simple;
	bh=X8muxxDxDmy0XqQEk7CC50jn+pIWJ6ls+EuAs/aimpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VVa6kx2PhTqtac5e2Nfa2DFgO7EzLjkUMWpZQPfZ22klixocL53noyb9WhOaNgXKXWdLwiQ13CRmO91W4sbvawtE8NVhsCxMfqo0CE7v6ouAVVnGAGYp0mJZ78XUmXHjofSgoc79qduR1dFwgJJIB7BgoQUPIEwW6PtaraPtRsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThWhm193; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a4323fe8caso4627231cf.2;
        Sat, 28 Jun 2025 09:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751127544; x=1751732344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0k4LhJKqyTvNmQU92jSwlsQ8S/H0we/0goef/do+h4=;
        b=ThWhm193EE2MTOmu63ToDY7+9vuizc0L2jNhYbZ+21pXDWvBl8nniTouuATt5WCE3w
         rvUzYiXtZY25Rmwd8FnhtDW1lADLecryqNaz0K3IiOfy5y/0kfljSnt7t7XYQnz1CwOu
         wUfre2usJLFETOcXh4ElCYr+pDf7iU/dKCxGW8itM8hcFEJkCsJus7fUMIYDqwmfxUjT
         HZB7rd0ZsYfIwvbkGZCMjcGthIMGSeeMnCNxru4BJr3wN5zih62a7AjVC4kitKJt8mTO
         okP6djd9Ms+PM46LdBvDvN7gunxDV+BsKxrMSfFRtsO8yafXCQHzhzXYy3UR+Gf8BJmT
         NL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751127544; x=1751732344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0k4LhJKqyTvNmQU92jSwlsQ8S/H0we/0goef/do+h4=;
        b=jHe5DTM2aigN1LSOe6FcWXRxUOKS2dTnEdtGX7HStaMdsuRWJnCDu0VisfGhrIVYuy
         D8A6BgZ1dyzJtQD0lWZybtuzgZb/I+/unlXK07kMFpyBpEBPZLPEPa2gxSlZ/aPwP6jo
         MTNE1LTHZZFA7yXoUwKfBxggidQf0SP5JDVpmQBfujJ5u7LH0rALxkMXccTx5OpWDA3y
         +ga8pzeSJo9EEoX480YiA3CFhXNU5ynQTDYKxDv85fn+SsR+YpyQ5sdomTegB1257e+0
         ER2T48Z/fgA796YUNV77zGfvCBfuFrlMu5mYWL/n6sVfpbVHgd+WvNvrNuvzDDYxQmi3
         rdIg==
X-Forwarded-Encrypted: i=1; AJvYcCUWMTBP3RDe2s3Ddnomuo3iCrNjC5aSOEULWnrZ6+2dwPtnFsfv3uUsho1wRIYw1TFIolCGlEG8AGYh@vger.kernel.org, AJvYcCVt8L9jgYZUhDQ6oPlNqDa5tNONmVVeQjojurZYAux1pcevAcWcwKjxmJ70lvnTHKuJKFTZL7pwCRAi/g==@vger.kernel.org, AJvYcCXYhR1f+xvJdp4I2IIkb3jOPMjAjMvOInAacOeoOuihwvrMsNgHn/s5AyI7OeY/7itY2HEAylZ1qg10oK33@vger.kernel.org
X-Gm-Message-State: AOJu0YwnKPrPXg302tF7pf93/h2U8HMDuxMTzG9MJcjWNy3bcgMC/tOd
	QSg8+j6ipWyesSN0nZiF170lTwFAgh/zsHAPvlwUC4kjhv9BKcqlFjV9qqYjtrZv
X-Gm-Gg: ASbGncsZvlEmRv68n1CgDR3vI8Jc6l1KGf3+4U87g7GNm2clCpO1QpAJyrz2OvKe/ZK
	jn9zP85YwtlCTvIJzdOoLtdG4yLrW7FN8LGb89PUHPMcxrEeb+udcmXngI7z59WJQIOH97Yxk3A
	7kD4VASmtlqyrNaA5jxBJQhBkgOo4on5gY/5wRnHYM63S5ScKkJ5FOcub5UUPYOZU8bD9vDJV8S
	YW2qB8Ysrn0QVjop4Eeaz9cLIwz9PY98/+NWrAii6BUUCL+2RM/5kWwuLXo+85qh1iUzPODgmIH
	5YDMdMkr4K7rTj0LCXSdmSIx7bpe3da1X62phuJIceSNRy29L2uLmVBEYCCGHMjyBN82C3RC+aH
	Q5MWhwTbKPq6fqy6we6JzV1AV2ewD3x5P
X-Google-Smtp-Source: AGHT+IFPTJZsi+eUnIIpGezelkmFlfNJdFrbycaoQTzzSxXtuxbeNSq/ZtPLEipYOfJOoG9XixZAoQ==
X-Received: by 2002:ac8:5711:0:b0:4a7:14fc:205e with SMTP id d75a77b69052e-4a7fcbf7a94mr130101721cf.50.1751127544004;
        Sat, 28 Jun 2025 09:19:04 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc560477sm30820031cf.41.2025.06.28.09.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 09:19:03 -0700 (PDT)
From: =?UTF-8?q?Jean-Fran=C3=A7ois=20Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Boris Gjenero <boris.gjenero@gmail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Paolo Sabatino <paolo.sabatino@gmail.com>
Subject: [PATCH 6/8] dt-bindings: auxdisplay: add Titan Micro Electronics TM16XX
Date: Sat, 28 Jun 2025 12:18:43 -0400
Message-ID: <20250628161850.38865-7-jefflessard3@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250628161850.38865-1-jefflessard3@gmail.com>
References: <20250628161850.38865-1-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add documentation for TM16XX and compatible LED display controllers.

This patch is inspired by previous work from Andreas Färber and Heiner Kallweit.

Co-developed-by: Andreas Färber <afaerber@suse.de>
Co-developed-by: Heiner Kallweit <hkallweit1@gmail.com>
Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
---
 .../bindings/auxdisplay/tm16xx.yaml           | 153 ++++++++++++++++++
 1 file changed, 153 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/auxdisplay/tm16xx.yaml

diff --git a/Documentation/devicetree/bindings/auxdisplay/tm16xx.yaml b/Documentation/devicetree/bindings/auxdisplay/tm16xx.yaml
new file mode 100644
index 0000000000..eba3d3f3f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/auxdisplay/tm16xx.yaml
@@ -0,0 +1,153 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/auxdisplay/tm16xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Auxiliary displays based on TM16xx and compatible LED controllers
+
+maintainers:
+  - Jean-François Lessard <jefflessard3@gmail.com>
+
+description: |
+  TM16xx controllers manage a matrix of LEDs organized in grids (rows) and segments (columns).
+  Each grid or segment can be wired to drive either a digit or individual icons, depending on the
+  board design.
+
+  Typical display example:
+
+           ---    ---       ---    ---
+    WIFI  |   |  |   |  -  |   |  |   |  USB  PLAY
+           ---    ---       ---    ---
+    LAN   |   |  |   |  -  |   |  |   |  BT   PAUSE
+           ---    ---       ---    ---
+
+  The controller itself is agnostic of the display layout. The specific arrangement
+  (which grids and segments drive which digits or icons) is determined by the board-level
+  wiring. Therefore, these bindings describe hardware configuration at the PCB level
+  to enable support of multiple display implementations using these LED controllers.
+
+properties:
+  compatible:
+    enum:
+      - titanmec,tm1618
+      - titanmec,tm1620
+      - titanmec,tm1628
+      - titanmec,tm1650
+      - fdhisi,fd620
+      - fdhisi,fd628
+      - fdhisi,fd650
+      - fdhisi,fd6551
+      - fdhisi,fd655
+      - icore,aip650
+      - icore,aip1618
+      - icore,aip1628
+      - princeton,pt6964
+      - winrise,hbs658
+
+  reg:
+    maxItems: 1
+
+  tm16xx,digits:
+    description: |
+      Array of grid (row) indexes corresponding to specific wiring of digits in the display matrix.
+      Defines which grid lines are connected to digit elements.
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    items:
+      minimum: 0
+      maximum: 7
+    minItems: 1
+    maxItems: 8
+
+  tm16xx,segment-mapping:
+    description: |
+      Array of segment (column) indexes specifying the hardware layout mapping used for digit display.
+      Each entry gives the segment index corresponding to a standard 7-segment element (a-g).
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    items:
+      minimum: 0
+      maximum: 7
+    minItems: 7
+    maxItems: 7
+
+  tm16xx,transposed:
+    description: |
+      Optional flag indicating if grids and segments are swapped compared to standard matrix orientation.
+      This accommodates devices where segments are wired to rows and grids to columns.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-7],[0-7]$":
+    $ref: /schemas/leds/common.yaml#
+    properties:
+      reg:
+        description: Grid (row) and segment (column) index in the matrix of this individual LED icon
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - tm16xx,digits
+  - tm16xx,segment-mapping
+
+additionalProperties: true
+
+examples:
+  - |
+    display_client: i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@24 {
+            compatible = "titanmec,tm1650";
+            reg = <0x24>;
+            tm16xx,digits = /bits/ 8 <0 1 2 3>;
+            tm16xx,segment-mapping = /bits/ 8 <0 1 2 3 4 5 6>;
+
+            #address-cells = <2>;
+            #size-cells = <0>;
+
+            led@4,0 {
+                reg = <4 0>;
+                function = "lan";
+            };
+
+            led@4,1 {
+                reg = <4 1>;
+                function = "wlan";
+            };
+        };
+    };
+  - |
+    display_client: spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@0 {
+            compatible = "titanmec,tm1628";
+            reg = <0>;
+            tm16xx,transposed;
+            tm16xx,digits = /bits/ 8 <1 2 3 4>;
+            tm16xx,segment-mapping = /bits/ 8 <0 1 2 3 4 5 6>;
+
+            #address-cells = <2>;
+            #size-cells = <0>;
+
+            led@0,2 {
+                reg = <0 2>;
+                function = "usb";
+            };
+
+            led@0,3 {
+                reg = <0 3>;
+                function = "power";
+            };
+        };
+    };
-- 
2.43.0


