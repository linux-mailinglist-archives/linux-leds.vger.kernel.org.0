Return-Path: <linux-leds+bounces-5685-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FC8BC8196
	for <lists+linux-leds@lfdr.de>; Thu, 09 Oct 2025 10:44:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E12D9422002
	for <lists+linux-leds@lfdr.de>; Thu,  9 Oct 2025 08:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE1C2D2488;
	Thu,  9 Oct 2025 08:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DVIzCVpS"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125542D23A8
	for <linux-leds@vger.kernel.org>; Thu,  9 Oct 2025 08:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759999442; cv=none; b=Nzv6Sn4d71kBr9BnFzEIf1Rog9wYVo0BjI72uevCRyBVnN+Gu99o0q1zjV6+uriFyY2raUjNcmY9pxY5dOe8dzL1RBoJV4uYqTYNrkgMrXnVrW5gMqqH7oSbJiG0vQoJgN/qvixSsxMjasmFjNS2dMpZZzu9aqM5PkHBjhwMtyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759999442; c=relaxed/simple;
	bh=Gkb/A0RJIQzAnZn7S1frkdjg/udo1diN9JpAXJjfQow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qTQXJJnjFayhDA/sz6ALucEbYy3dWk/+7nbDgdks4wsF6f6yuTukrqBy/s9Bf3/bG36Q2aBgU8WNcOlSTDynKLUjSv5jdfMEG/sS/tCzuWoBZcCGMu0YgGhshDagCWYs5l5bJOueu2jURAx/ukFA/qLCClqUJj5VLYNz+BXzUQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DVIzCVpS; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-781206cce18so802628b3a.0
        for <linux-leds@vger.kernel.org>; Thu, 09 Oct 2025 01:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759999439; x=1760604239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Si5rnCD2PQuC/I678NvnQ9shnaktodeRJo3+LLVgXtY=;
        b=DVIzCVpSsamXS+2SCQys9HWJV4+UNaOxql8tgkIcmi577MygSq3upADzw99zYKYvkU
         Xgz3/v731xgSmrgGH2R1fOjYXGYTxnIBcddDeE/lYsYEiJPJi7AmPQLN9aUCiHIvMBGK
         D01DF7IWCNirpUUU12MXdLn4uamMMQt3OtGRwfqkHtmsonNe+vJjMC1ONlpQceFmGy6K
         l7GDBwupF4LDk3zv/JsnHZNQhifVsSewK4lmeo4US3dPcxwrZ3+Haeaae25qZdfwQJL9
         szTqrEWVED76szp5FlNEYYa4rmTEQVFbdRHE9sVc/YLsGtfzKeowAvz5YSwXvKcOkKtT
         dOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759999439; x=1760604239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Si5rnCD2PQuC/I678NvnQ9shnaktodeRJo3+LLVgXtY=;
        b=HtsHHlLE2vJblg3F7qwXTgSGjbATYJGiEETaVVr2SXkVosX4JD1l68lSWl7UQYkLkt
         aazo5Dn5pcT5mUMKliPuRcjy5AhZIUuiXorCxyc2KI6GNENFkSHRveCNKkSUVsJ6c0Q7
         z/v8pOBBtytWgvSIXlHvWOyDNqF3pvLb9BKMTW9YH6pEr1NCSNaTpvLksAPbrrUsD84o
         1v5ygNmZ+fpr2aGbtyFknAVwAGGqMZL+hU7wBkThJmfrqIWvab7XD+6Z8M2td9eQLwBR
         q5DzvTdkTu1BTtHLJu45DWS6iwvFk7uH9kHHf/Ci92dcuTFXAW3NFFPARLPndjXOw5Rm
         Y+bg==
X-Forwarded-Encrypted: i=1; AJvYcCVoJzB76TloxTngzMfeO7YllE8VgOLBP8vVjThhOVs+ZWqvcSSlg0igKTOo9gNn5UOyKiM4ngrJP57X@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/1huuEeWl1DwuMggFnnfOI0uZqRQuhwITpqwobLlS/Quouop/
	v029poo2nfehBi3NPaumHDHoyrByF3fwhCFDivp0rvjI+hmqtSy9Pyg2mB9gPhLy
X-Gm-Gg: ASbGncsQ5zgvtIld5LfMCpHfprEB/pM/fhX08eoFDAcat1+sEpThgAo7MWEqk+JEBQl
	Tmg560d5C/q4uYn2bPEhKLyq9nsGBlzB614gLCihHeyHIExueOAPCiLskZ6WWxBmiAg4tJ4I5Hg
	opF4swsYpFO88PgoiLq3GTStAhiJDMS7UOgEgxYdH3R1rrsTmMmX/SWBr31M1bKKBUVcW7clb6/
	PVrfFWK9/+Y/MhZrV7srAtYzf/c4tq6CyS0lYYC/e6MtkIxP8DSRQYgAIshjrvLaJoy1ZyRUpDb
	dgl9mS0TNRPLh721HGi828gnW6pp9qwiu0C8LFV7j2R56tfVhOS7XxSY0FycyRsOmi8tmv6uaSg
	3NqUe5xOOo1jsv4iWWvkY+iFBLll9rQb6E9OHIYeHRdZlrtWzz+wxWVCt4chAdWbFRfde9LHi4c
	Zl6bw=
X-Google-Smtp-Source: AGHT+IHTfodQ6thakogJCCtUqijG6o9ExaTwcmf9H8CuOIFFERYxT+vMs2mdlyqLdFHkyrmrKA03TA==
X-Received: by 2002:a05:6a00:806:b0:78a:f6be:74f2 with SMTP id d2e1a72fcca58-7939753d3cdmr7774516b3a.5.1759999439379;
        Thu, 09 Oct 2025 01:43:59 -0700 (PDT)
Received: from MRSPARKLE.localdomain ([206.83.103.239])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794e06fb374sm2141633b3a.56.2025.10.09.01.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 01:43:59 -0700 (PDT)
From: Jonathan Brophy <professorjonny98@gmail.com>
To: lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: leds: Add YAML bindings for Virtual Color
 LED Group driver
Date: Thu,  9 Oct 2025 21:43:37 +1300
Message-ID: <20251009084339.1586319-2-professorjonny98@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009084339.1586319-1-professorjonny98@gmail.com>
References: <20251009084339.1586319-1-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Jonathan Brophy <professor_jonny@hotmail.com>=0D

Document Virtual Color device tree bindings.=0D
=0D
Co Signed-off-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>=0D
Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>=0D
---=0D
 .../leds/leds-group-virtualcolor.yaml         | 88 +++++++++++++++++++=0D
 1 file changed, 88 insertions(+)=0D
 create mode 100644 Documentation/devicetree/bindings/leds/leds-group-virtu=
alcolor.yaml=0D
=0D
diff --git a/Documentation/devicetree/bindings/leds/leds-group-virtualcolor=
.yaml b/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml=
=0D
new file mode 100644=0D
index 000000000..945058415=0D
--- /dev/null=0D
+++ b/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml=0D
@@ -0,0 +1,88 @@=0D
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)=0D
+=0D
+%YAML 1.2=0D
+---=0D
+$id: http://devicetree.org/schemas/leds/leds-group-virtualcolor.yaml#=0D
+$schema: http://devicetree.org/meta-schemas/core.yaml#=0D
+title: Virtual LED Group with Priority Control=0D
+=0D
+maintainers:=0D
+  - Radoslav Tsvetkov <rtsvetkov@gradotech.eu>=0D
+=0D
+description: |=0D
+  Virtual LED group driver that combines multiple monochromatic LEDs into=
=0D
+  logical groups with priority-based control. The driver ensures only the=
=0D
+  highest-priority LED state is active at any given time.=0D
+=0D
+allOf:=0D
+  - $ref: common.yaml#=0D
+=0D
+properties:=0D
+  compatible:=0D
+    const: leds-group-virtualcolor=0D
+=0D
+  '#address-cells':=0D
+    const: 1=0D
+=0D
+  '#size-cells':=0D
+    const: 0=0D
+=0D
+required:=0D
+  - compatible=0D
+=0D
+patternProperties:=0D
+  '^led@[0-9a-f]$':=0D
+    type: object=0D
+    $ref: common.yaml#=0D
+    properties:=0D
+      reg:=0D
+        maxItems: 1=0D
+        description: Virtual LED number=0D
+=0D
+      monochromatic-leds:=0D
+        $ref: /schemas/types.yaml#/definitions/phandle=0D
+        description: List of phandles to the monochromatic LEDs to group=0D
+=0D
+      priority:=0D
+        $ref: /schemas/types.yaml#/definitions/uint32=0D
+        description: Priority level for LED activation=0D
+                     (higher value means higher priority)=0D
+=0D
+      blink-delay-on:=0D
+        $ref: /schemas/types.yaml#/definitions/uint32=0D
+        description: Time in milliseconds the LED is on during blink=0D
+=0D
+      blink-delay-off:=0D
+        $ref: /schemas/types.yaml#/definitions/uint32=0D
+        description: Time in milliseconds the LED is off during blink=0D
+=0D
+    required:=0D
+      - reg=0D
+      - monochromatic-leds=0D
+=0D
+additionalProperties: false=0D
+=0D
+examples:=0D
+  - |=0D
+    led-controller {=0D
+        compatible =3D "leds-group-virtualcolor";=0D
+        #address-cells =3D <1>;=0D
+        #size-cells =3D <0>;=0D
+=0D
+        led@0 {=0D
+            reg =3D <0>;=0D
+            label =3D "status:red";=0D
+            monochromatic-leds =3D <&led_red>;=0D
+            priority =3D <2>;=0D
+            blink-delay-on =3D <500>;=0D
+            blink-delay-off =3D <500>;=0D
+        };=0D
+=0D
+        led@1 {=0D
+            reg =3D <1>;=0D
+            label =3D "status:green";=0D
+            monochromatic-leds =3D <&led_green>;=0D
+            priority =3D <1>;=0D
+        };=0D
+    };=0D
+=0D
\ No newline at end of file=0D
--=0D
2.43.0=0D

