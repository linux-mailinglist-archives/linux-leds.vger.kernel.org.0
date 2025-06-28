Return-Path: <linux-leds+bounces-4910-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 566AEAEC8AD
	for <lists+linux-leds@lfdr.de>; Sat, 28 Jun 2025 18:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F4E91BC13C6
	for <lists+linux-leds@lfdr.de>; Sat, 28 Jun 2025 16:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6244E254846;
	Sat, 28 Jun 2025 16:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRm8kdsn"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5744324EA8E;
	Sat, 28 Jun 2025 16:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751127539; cv=none; b=FPh+pUp4av4tAa9sscfpoM4i6o2cnn78/kL3SwW4bKRJ17yNuuE9jBbA/qZYXNC8W8bAzDwq8GEFQfTiyK1R6SL/G1uBTe47im8e99pJkzRMbGq7yZagix6GYDlBgq01d+ZMokcFCLvxiIP//b2uH8JiDns37Ls6hNdQ8+feNkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751127539; c=relaxed/simple;
	bh=v2XAzjfgoGzkdFNzMifDiw3LW48guo2c5O2/eNjtFo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KIQws3GlVC/YVpMdp7KUZYT4V70CILrt9aLaYTsitMXaxlnd2VhjAzNc0BDSV8WsiTtr7CCykGh8GRKgw5lIQ0qT6qfc3U1iPJzQhbcUo716jmwCDFK4nAUxkUy3QtU4gAX4mO+wGNeUzDHNL8YJcVqpWckOvsrW5tNqfND76WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRm8kdsn; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d3f192a64eso288817985a.2;
        Sat, 28 Jun 2025 09:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751127536; x=1751732336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwEXumjeSgSKL538gxbS9ghqm2KZDoPQ2P9+gjK1hDc=;
        b=TRm8kdsnpXyz04yh94fzh7yir2iKhUfAqMNyaw9He0uTenX+v2W3nkLoP6t834Ie0Z
         lrbxRMAIOo9BnxUEuDdW56wCfYjeHRzk4kIHOW6iCIibdpTj4OsbbzvIwqOoBqeMF9G7
         k0PypbRAG5uLIU4ffTS9y0Lksl7dGUUyx1tV/z/XmIvTDM+EiHg0mW8ZlpVUXXg1otig
         TKXK5CBlRBhzpp7LIy38hidv7mwFKlKDLEdQ83Um7Pjgya9Zxd9nVRnVABhImEVFih4+
         kAwYYa2mRG06szIB8GKXPbII/fH0No4rMmlCXIYnnIFEzEjqj7XlStJl53+KQFLKWNRD
         Ut5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751127536; x=1751732336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QwEXumjeSgSKL538gxbS9ghqm2KZDoPQ2P9+gjK1hDc=;
        b=bwUiPV6e0ZwQDnG2ERh2xM0X8hJNBTQWbxfOUM7F9duPqY9DvICxRh2juNk+wtP6qD
         Ddf4hyRxPLHIhC//TetBJzTPI6v0h8QjyWgB6T7Wx14r1diYF3p+aMLdbLuopoeaob8K
         /BGowMsoPsuwKiZJ6E+Qc67l47J4K+RBCovkQkTZubTNwWZdttGNfwiHz5AFP5Tb4S+c
         N8vLVSSDX2ioWZkaMA9PG5qLIohTBTZcazAXyt7+hS0RoqV2LHDAnq19tMDNV1BCZCs4
         CIlOPWAk0yVnF6XNVINXz6wB311ecfTv9p7fP6LqWnhGEpz2p8GQmtgvja9zHQ6GCIXg
         YHWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV1L9k+vGfW4m2bFJH+jggm/nRhxoldyAUVh+vEduYAV4uufi9aUje7Psnv4PQ9TU0szno6NyOuJdoOg==@vger.kernel.org, AJvYcCVNWDYAn4wsryVGuGjIGhDjwnvFuAkR1nfyUGjIy2Fw1pnqoAkCaSAi/RHsXY+XkFTq61a/fK8j0S8G7HhE@vger.kernel.org, AJvYcCXb1DvFJaU2KCg4bB8Mx4yNaDFPJbMOXCHtJ/K/uKhjVcYdonK9PaN/mRuVTp57q6L1hpPuLZwtEAqt@vger.kernel.org
X-Gm-Message-State: AOJu0YyZPYRBb8G2aWvtdjg2I7CkpI3YQjbfb1elOKojQl5BHXDM8C+e
	FxYwBQiwOMX0eWJw4KyGjqty3hx5R39BywQab8U2X1+r5kpuX7lGZSC5
X-Gm-Gg: ASbGnctYT2QCOz5FUWP7M3ea/SSCOR6ITU2Lwi6G1Un1kzv7rkJCNwATvRwJlMYXpJj
	5qJzsvrohdwb4bwxcTelSXGOMuFK7Ux79J5UBfCfR0tvPXk+991Ge2BeLZKu8gYrDtk4RzJnr4e
	vTYs6xVyvEpmnH/NmUMQokCyTT7/op93KzlCA5bSKcrgtbLp6hkpIJ4JE7i05w20pttDQlWFq4F
	1+anCtlhmtayOWGbrxs+c4hCdemgKHaBPygdVBzs/O8vvRfSt9SdTDmXpbWzCrOaTqmCwgYb0Ss
	Ige58j6zCyy3kb1VCp1VVLia3hUzeNEqDk2OfQ3yks66dDuvjKchllSupDc/5q18sSWWf475xKe
	l1ESkV4gnmdCjwLpeR9w+lN+6Mst15Aru
X-Google-Smtp-Source: AGHT+IFJAgjjUvJ4Axja2qlG75v6t+zNV/P4Mzv+Z2dNBvvv3XJMOJm6seW8eqzZSXvIOaYI+M+l9A==
X-Received: by 2002:a05:620a:8197:b0:7d4:4400:d3a0 with SMTP id af79cd13be357-7d44400d4e7mr684665085a.37.1751127536043;
        Sat, 28 Jun 2025 09:18:56 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d4431345b8sm309110485a.15.2025.06.28.09.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 09:18:55 -0700 (PDT)
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
	Paolo Sabatino <paolo.sabatino@gmail.com>,
	zypeng@titanmec.com
Subject: [PATCH 2/8] dt-bindings: vendor-prefixes: Add Titan Micro Electronics
Date: Sat, 28 Jun 2025 12:18:39 -0400
Message-ID: <20250628161850.38865-3-jefflessard3@gmail.com>
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

From: Andreas Färber <afaerber@suse.de>

Assign vendor prefix "titanmec", matching their domain name.

Cc: zypeng@titanmec.com
Signed-off-by: Andreas Färber <afaerber@suse.de>
Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9e4d251e71..d02615496b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1550,6 +1550,8 @@ patternProperties:
     description: Texas Instruments
   "^tianma,.*":
     description: Tianma Micro-electronics Co., Ltd.
+  "^titanmec,.*":
+    description: Shenzhen Titan Micro Electronics Co., Ltd.
   "^tlm,.*":
     description: Trusted Logic Mobility
   "^tmt,.*":
-- 
2.43.0


