Return-Path: <linux-leds+bounces-7492-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLcWOSMlxGmZwgQAu9opvQ
	(envelope-from <linux-leds+bounces-7492-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 19:10:43 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AE932A519
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 19:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D5693017501
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 18:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0691D4219EB;
	Wed, 25 Mar 2026 18:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pq1ZarGF"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C864218B9
	for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 18:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462083; cv=none; b=QmBmgCg4BG1vWVp67BtQF8xAQf67yFyu3kWivJtB+x/DOLjp+Iq1a9ND1Oaa8bZJXzLZlkgIO/+sTZVhMXK856K/YbcRS2sl6lb7T6bdcMQmNtpspf7RU+HovhG2FfaDjzWUcFZhkr6dHP4dyUpdIGKz9PkdTapI66N/HJQ4a58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462083; c=relaxed/simple;
	bh=idSfP5HyQiNIGHknsAW93yLVNiPUDIYoFLjjk8abFqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kRYi02zbMq0X5oC9f9xuuDHEWVyMNKqz++VUkqvmxvcNNE5IInDe6M+zhRXocTyLwclJBgbKBODhaLjlJn9yZoOworyzdC1jrzLLpCs/+KMCZ0FQA1KqxXcIGq9SDqeVp8pTnkuN7xG6UpzeIz++E+QVcEQTmkaQTk/fBfw8Z2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pq1ZarGF; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b056b7f783so186135ad.1
        for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 11:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462080; x=1775066880; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6RW8W7t9a2T2GNiqIF1Tp6pK/FWIbbUcezYtUjj9vmI=;
        b=Pq1ZarGF9TL0vKJmvaevq1b13it8hPBAYEV8Snb+4rZKq0/HLKMcy4165GSIHgY8Et
         06vb6HpVn0WO4z/ZKgYUJwaLOYQrBTW7YSXWAKPT+U2H2D/PRaG5VZQL7tgpgVaYiWCp
         oeo4XnjVQu4R6EINyfy8Xv21vb/vU6oZl7hbIgxYPzzGgrY4KU3yBfvog+8sTc9+a5fz
         VQ5jkB5hnkxjmuggtWH7ki9esxh+lPrf9z3slLwbzopfHvsZhTGN52gllnSUXdHUp5jq
         xf9yHdFTsYUZEUo2nD8wHPCsgTzqcYt7e+NX+E5MKNKMS9ClS1tNjT1m8KSztt735BBh
         QAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462080; x=1775066880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6RW8W7t9a2T2GNiqIF1Tp6pK/FWIbbUcezYtUjj9vmI=;
        b=ZrahijVOp8NfTQBmKUBbV3TgMEw+lFvG07Bu8gvAUndH3Iis2ly1LnRQqH0Qcx5YMJ
         UAV0OnIs2BiFS2b4I81am1fj0rG3uDvbYkR/Pb3xtxfhghd97bVMvsGbv3c4RTHN7FPW
         At1XBBFyd4e9drOMzotswls98WctFzlIbMiSY5Z6NDN7ca2aYVuYKbr7VZ1EWL2Qa+Lh
         0CB4KLdCAzvh94piW1/X75z5MiLMNmnxMedk5O/dCyIw7V5wVmOq3jXOUO02KMVqPMHS
         BNN5IEoD3q4w2xQZ/Y/tvjNtj9O6QEKcLkU3Hk8RJetPvRYjvcjwYAs2YPu0u9KGV7MZ
         IV7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJ9y3VYLWugHXQEg1LYwJ2gQlEjk8ivDcZLHi9mLEAsRveRYZBdJpmdOXezmJLHL+U9gUUihd2zkI3@vger.kernel.org
X-Gm-Message-State: AOJu0YzM3acxCtwAeTprwrb9LlESUHx0UkPHGijRd3RSpBqxv8GRxduT
	nVk/qVlBnBCw7zW51a0pzZASlSTSNeCIq2cLozRCLMp/3S+L8gvoE83P
X-Gm-Gg: ATEYQzzcDP9WQtH/o/92iuH8oiIMbZlNgFx1QshTc/57Gk34DYoSgPgT+m+T0viW6FC
	2QIxAd6OESmom0fnMMYfHM//wu+41K26HVIUQT5bU76kqKVsu6KgbyXZanTF5a//pIrcWRMaFtj
	hkNMNG5mjqnxrWGDCdVN1yHFddBDc//KPH6pzlqFEKe/Vp3U7pmQvsH0ybZv2rOlg7a2In58DZw
	lcK8PCjgyl6EKHnGGyKxSxkDVQ7UWUgJKNrKeXJ4qJa69u2j/Y9LQ60lCUyh7ZeA6k0g6dabhMn
	7IqtU0VuNdRrwexf1wPp4igu9bj50YNxGIP39dvskb/MTJC8YUz2BJ/eAypfs/0ndB/9fXiIhFE
	R34mQauDsw6bFozhGKTE6YYb4nB+2Kbk36qjyU/IVGD+exkgRPgVjKVUk8XLhEbFtDV1nLzstZa
	qdYOiOlJcjIjOl2xZLz8uC7QEHUh/8
X-Received: by 2002:a17:903:8c7:b0:2ae:4aa8:cab8 with SMTP id d9443c01a7336-2b0b0695a47mr41847625ad.4.1774462080126;
        Wed, 25 Mar 2026 11:08:00 -0700 (PDT)
Received: from [192.168.0.102] ([43.251.91.187])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc773b33sm5687805ad.10.2026.03.25.11.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:07:59 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 25 Mar 2026 18:07:27 +0000
Subject: [PATCH 4/7] dt-bindings: leds: irled: ir-spi-led: Add new
 duty-cycle value
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ginkgo-add-usb-ir-vib-v1-4-446c6e865ad6@gmail.com>
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
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774462047; l=850;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=idSfP5HyQiNIGHknsAW93yLVNiPUDIYoFLjjk8abFqc=;
 b=f2ywcUw6qhQWvHyTyNv4T149ViOhu8Y4DN0CMzzvFS+yL2U+g3sDFvUmgPmgqRQun2OmgiGWK
 iGQLZq9lALSDBlMVUEXSVv7UjdbHBHOv8L9hpbNCB5IlKhRe3SeE4+q
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
	TAGGED_FROM(0.00)[bounces-7492-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A7AE932A519
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

30 duty cycle for IR transmitter is used in Xiaomi Redmi Note 8 (ginkgo).

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml b/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
index 72cadebf6e3..0297bfbb275 100644
--- a/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
+++ b/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
@@ -25,7 +25,7 @@ properties:
 
   duty-cycle:
     $ref: /schemas/types.yaml#/definitions/uint8
-    enum: [50, 60, 70, 75, 80, 90]
+    enum: [30, 50, 60, 70, 75, 80, 90]
     description:
       Percentage of one period in which the signal is active.
 

-- 
2.53.0


