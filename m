Return-Path: <linux-leds+bounces-7495-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCQ3NHMlxGmZwgQAu9opvQ
	(envelope-from <linux-leds+bounces-7495-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 19:12:03 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AAE32A53E
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 19:12:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 91819301588C
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 18:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6EE42188F;
	Wed, 25 Mar 2026 18:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BowbVxWU"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7367421EE7
	for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 18:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462105; cv=none; b=UdTNQSeZYQ7HoN/RVc4mpbRElNUv1iULtdcuJGPHoQ3nnf9Qazn76xRHhsGA4XFNytRrlUcLyl/DY2pAonuDTYxcnO9vG2q4RVEhO4BoIE8ihGmAj0Dde+iohR5OjgTeUQBU1JhHy4a2yX2+jR/2Yg4Va8wZUMT3ksiAwUgNx7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462105; c=relaxed/simple;
	bh=O5VLqveoT1MLTeYBJSBjiMtqJBUVJFLJ/CLj6h7ZMKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LW5pu/RE21+G2BB1DrA6IXnhN4OofHZuVuFucnRm/idotVB3u1YIdz1CKRGmUyIYNF0iotR6zIMJeyV7VMKtYsM8m2wDYIz+c2cVz7NxYgW0TNgaq9xSBkopjwzaft3XZBtBHxZhxs5xn+9GTVrWTo11dYOL20//yBy8fjsLrWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BowbVxWU; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so956075ad.2
        for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 11:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462100; x=1775066900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+rvofdNd3f5+/efY7L/G9vZlRMw7vdhOoBtyFgJOyhQ=;
        b=BowbVxWUsTxPoaN+CY/4SCHwbmKekGCN9oRDlaklsw8SuxO9WJB1c0981LdLlONhPe
         SwaoMB5eTZvLEuRoCMtIwBNJhETQJql2EVD1lAZjnNL/LM9wuIzxfYs2SwBJFhFyYde5
         AF0wkLrb8mZtVsrmgL4EAuEnKBVOuqc+muqxzsjEOQZ2AuCwNnr6W48hiC+JU6CSRMls
         S2uHNUGm7Kr1xi31mTt8mSxNbHxKs3Tj3Ud80pGE/1NC59RITZ+ycot0AHe/7r47fYAP
         LPz6S/9CGGb2ggzK4R5jo6YLTgj7CBrSAZeodDBD4thBFnuAWlTglg755o0YjNqYW+8q
         gsKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462100; x=1775066900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+rvofdNd3f5+/efY7L/G9vZlRMw7vdhOoBtyFgJOyhQ=;
        b=sqccR5wR3YDn6phASGooH6hNkjwXniJaNb538PgEOKB1hDIS7+zETy3iAloiOR7yFh
         hlS2pJ4jpTUuKVw/KybZc9sF04fPENrYyqeZLejPS2m1Qa7j+FfG+xw+IbokDa5H5g6D
         kPyVVwGoTHwoBMSJ3jl/HccfRjOT+auItfI7Lns1LK4fW7Xxl9arvtAlFF9EbMKXi0Ij
         1zAaQJ1aJDPsgtImO2ivJLLR8IQf7UUoZ1yVfQs6EoY2tcJqd9812/Et0vks1p2T/Y+C
         6qU/pxI5o/LWvmO2YbUOKlifN7NQGcuWQp+TYoKBjO2oZtAkBPPozH/n3nca1yCFpK9Y
         x7Xw==
X-Forwarded-Encrypted: i=1; AJvYcCVXX+VVv1I80jb5hw/3nlF1xHLAHIh/s+zoTR+bnmhICMS+rs5ai+sPTnkvghXgl4OHKZ8ROEbFfRDY@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz37M8mr4j659u0oMCHDnRFeqzy1qMZ4H7bY+5ct/QirQ78tiv
	NSFPgFp67m7A3+mMIRsOJSGYwGbrqT0jr69YMuTdVuwp1nBR5UoTgm1j
X-Gm-Gg: ATEYQzw5eaIk6oS8gwJYT+dqfYXvAQW2EiulgjV9iCljwAaJEDqJg5MLJMtaL4A9tZ1
	Tt97Uh2BZRSUiopfyJY0jTbNgSvXCgAACHorF3V0xHUOneqwNaGheaJQw08QbdKqDJOgLAWf3Q6
	+98c1b8LJRUmaWm2DzWy8rl9hW/pZ59oZjk+8eBgJ06J/uWY/kyIGQ5izJTZfCCaHkgpfJcOb1t
	Abk4gEqZJRohEOciZnb+Nm73c/BhTxrOWVdIgeGg4Q+ti4H4y6/oG+QuF2fkVBIbiRvXxoLXbZ3
	s/3Zq6d+JD1MGhBacOjzj9MoC37q8Jbj3iOUb5Tj0ps4Lt7Fj38ZOl/gTEu/WRoT0JhlhuRGQ3m
	D+svwyrLpxgqvmgeTQKARS2MZXP95/zE5T2jbv2waDozO/f8KLKTe4Z3/wNosiyxghw+foYhgLv
	aFkeNVF0A/AkEZNarTf66IPvq2o6CJ
X-Received: by 2002:a17:903:3843:b0:2b0:9a61:916 with SMTP id d9443c01a7336-2b0b0a7f831mr49090795ad.31.1774462099766;
        Wed, 25 Mar 2026 11:08:19 -0700 (PDT)
Received: from [192.168.0.102] ([43.251.91.187])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc773b33sm5687805ad.10.2026.03.25.11.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:08:19 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 25 Mar 2026 18:07:30 +0000
Subject: [PATCH 7/7] dt-bindings: clock: qcom, dispcc-sm6125: Add
 #reset-cells property
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ginkgo-add-usb-ir-vib-v1-7-446c6e865ad6@gmail.com>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774462047; l=913;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=O5VLqveoT1MLTeYBJSBjiMtqJBUVJFLJ/CLj6h7ZMKI=;
 b=rUnZtLLz4Xmj0RcCQQLRkTmldWk3RQ1b5aFfulPjR4kYbTcb4NhNVfi/aoK7g8WkEfY0jg3ZZ
 1uXUOvuzSagDL/2aA9WfaTAyKY05yLQdKb4KrPcmZQxOrgym2fPHKNZ
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7495-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,intel.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathbappai@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 62AAE32A53E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The '#reset-cells' property is permitted for the SM6125 SoC clock
controllers, but not listed as a valid property.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603150629.GYoouFwZ-lkp@intel.com/
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
index ef2b1e20443..0d467c1f30e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
@@ -45,6 +45,9 @@ properties:
   '#clock-cells':
     const: 1
 
+  '#reset-cells':
+    const: 1
+
   '#power-domain-cells':
     const: 1
 

-- 
2.53.0


