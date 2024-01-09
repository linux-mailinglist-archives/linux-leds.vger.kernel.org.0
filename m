Return-Path: <linux-leds+bounces-553-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AA78281D6
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jan 2024 09:36:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AC751F266F2
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jan 2024 08:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C1B62E83D;
	Tue,  9 Jan 2024 08:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THARGiVG"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626B73E46D;
	Tue,  9 Jan 2024 08:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2cd2f472665so28304991fa.2;
        Tue, 09 Jan 2024 00:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704788697; x=1705393497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oS16jOTYEmfjKgmQy0OVZ9aEx2EfxubHt6cv7RuAzio=;
        b=THARGiVG9/Nm2BWnj83bjae0nkHtnxoFPEMGbhsRuCBwGKhKqIYMnyfPK38f66L0rc
         3ZLLY5LKSsyzOA6u36VRJVdvShmePeMETGsOJ0T9gQ+bpgr665PeQdtckF2JroPAV0F2
         IDfjVHlnLkzY+bzxtJ61E+7ppVdmAmYqlAzxJjiIbKRooIrXe7AFp18tWB0mwPAzHBrg
         JaZrCA7fRIvye/D/XR1bYraseedY5Zt3im/eTV7jfHi11jm9k15VF97/Q/T469969Avm
         RdviXF1FW0Fpl8N5w34AZMa/EQx06E+kswnH2NOgpWjxZEQX2WIZLAdMvgyb067gWzXH
         h3Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704788697; x=1705393497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oS16jOTYEmfjKgmQy0OVZ9aEx2EfxubHt6cv7RuAzio=;
        b=GEQcTOkkox84CclREfjRwhKt794H8gVEfP7WlA07lO07HgehIi6Hvyd1ticvIrjJ0/
         jv6/QDqXrwv3w+LPAX+WOpxiz4MPkAKaJcuc5ZN4pGTOjGhsIKe0cCe1hVOSqFwHT3+m
         V3qUjAtboSVg029XT1AtbT2LqU4YHV9ydoRwOTAsxR2Fi7dBM6JWnwBgjTsdgIG64BTN
         vIcP+xBvNFQc/ULd2lSc/tR5GzTPkNKHTIgVMucVGmPQgbGMHlMTXFKLdYoW0Bp2BCmX
         wJWXLnoex+AryM+QZcSvu1qpy+Cm6W2vR3KEGZjv3/mhVuAHzQgdu5rHHDEdFKtyOmFg
         EMKg==
X-Gm-Message-State: AOJu0YzDvBWyqwnvX/9OqB5EeHE6cgsBPM9p2sQneX42WEJTmJGqoiUF
	qd+Ip45g9977KPKxVD+XG6Q=
X-Google-Smtp-Source: AGHT+IFkv3rj+4e7K4EAVs0axeb23BF7fwAZsmYAEawsPvIctanXl5Ky9pzu6hd4AvY5vErziW8iEQ==
X-Received: by 2002:a05:6512:ba6:b0:50e:a219:e05d with SMTP id b38-20020a0565120ba600b0050ea219e05dmr2421838lfv.12.1704788697092;
        Tue, 09 Jan 2024 00:24:57 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id l2-20020a1709060e0200b00a26f1f36708sm769094eji.78.2024.01.09.00.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 00:24:56 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: linux-leds@vger.kernel.org,
	openwrt-devel@lists.openwrt.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH dt-schema] schemas: chosen: Add OpenWrt LEDs properties for system states
Date: Tue,  9 Jan 2024 09:23:12 +0100
Message-Id: <20240109082312.9989-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rafał Miłecki <rafal@milecki.pl>

OpenWrt project provides downstream support for thousands of embedded
home network devices. Its custom requirement for DT is to provide info
about LEDs roles. Currently it does it by using custom non-documented
aliases. While formally valid (aliases.yaml doesn't limit names or
purposes of aliases) it's quite a loose solution.

Document 4 precise "chosen" biding properties with clearly documented
OpenWrt usage. This will allow upstreaming tons of DTS files that noone
cared about so far as those would need to be patched downstream anyway.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
A few weeks ago I was seeking for a help regarding OpenWrt's need for
specifing LEDs roles in DT, see:

Describing LEDs roles in device tree?
https://lore.kernel.org/linux-devicetree/ee912a89-4fd7-43c3-a79b-16659a035fe1@gmail.com/T/#u

I DON'T think OpenWrt's current solution with aliases is good enough:
* It's not clearly documented
* It may vary from other projects usa case
* It may be refused by random maintainers I think

I decided to suggest 4 OpenWrt-prefixed properties for "chosen". I'm
hoping this small custom binding is sth we could go with. I'm really
looking forward to upstreaming OpenWrt's downstream DTS files so other
projects (e.g. Buildroot) can use them.

If you have any better fitting solution in mind please let me know. I
should be fine with anything that lets me solve this downstream mess
situation.

 dtschema/schemas/chosen.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/dtschema/schemas/chosen.yaml b/dtschema/schemas/chosen.yaml
index 6d5c3f1..96d0db7 100644
--- a/dtschema/schemas/chosen.yaml
+++ b/dtschema/schemas/chosen.yaml
@@ -264,4 +264,13 @@ properties:
 patternProperties:
   "^framebuffer": true
 
+  "^openwrt,led-(boot|failsafe|running|upgrade)$":
+    $ref: types.yaml#/definitions/string
+    description:
+      OpenWrt choice of LED for a given role. Value must be a full path (encoded
+      as a string) to a relevant LED node.
+
+      Property user may use specified path to control proper LED during current
+      system boot phase.
+
 additionalProperties: false
-- 
2.35.3


