Return-Path: <linux-leds+bounces-4988-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEECAAF7834
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 16:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D21F1C84B00
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 14:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FC7B2EF29C;
	Thu,  3 Jul 2025 14:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSQKKb5s"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C243F2E7F0B;
	Thu,  3 Jul 2025 14:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751554022; cv=none; b=Q7vyKYEa2v0qQq76bnGM6s+lKKyNs9SmEt/AZj8fESIgxiC/0/l0MnNP/1XGyBQ91liq7Op0DIxVu6FqnXax5Srhm7WGU4KjDp6DlKr9ZXTttlGiDLr5NZH3nWYtWpn/UFMa2h4NgsmEIRSL5cJf5Rm6PAlntaldJBnuVcyPVaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751554022; c=relaxed/simple;
	bh=OfkYxtrkvAlIT+rtcYk+EDLoNYgxFT8mt+UGJnP4hEQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=shroYZ+bvLV+gNXZ+iDL1ByukUlVB0zT+XCqW1LuaMOBHJTgjzQsOOUxZz8b+hCf94fZ1RSYIFZTJC4KuvjJIRNMLRFZOrYOK/laeykH6mDGaryxkx1+F7TYGsXyuEIJqO/LTHCynJedQvkfm7Om1TipWDHRxZoSW+GR0t5cTP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSQKKb5s; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-236470b2dceso135095ad.0;
        Thu, 03 Jul 2025 07:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751554020; x=1752158820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EbD4zYdOoa8/tJGVQ+bbN7gmx/+fi4I8jcF2rfLZN44=;
        b=iSQKKb5sBpCz9QjTszy73YxW2Ml5HaN3WcazWMe99iFPM0+S3c0PKR3u3udkEd6E1a
         07nU2b+UhgxN2enhmtS5B1BpTyom+27A4AfeWpF5k3Lo7f9Bx/xhSNMYavCbg35l9HQk
         eui2yGcasmyqaBhBXpQCRyk/P6M9vS04gHzB/qakDuJ93y/cnps1UxkPkAWyYh5dZK0L
         pdWQ9ryOY5HQJQ8PfESmSlUQ3xhSu4G5EGlbFU2JBCX+wTehpSarRNUkorgQk/aDNlOP
         Xuz108rk4YTYtC/nPK5xVZFoOW2IpQ5DwvXfzVPNdX0jnp5U8GRTaBzzV60Gu+WErEFM
         F2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751554020; x=1752158820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EbD4zYdOoa8/tJGVQ+bbN7gmx/+fi4I8jcF2rfLZN44=;
        b=gV0G3PKpcH8rUmUjFILueS/bLWMaHRjktoPiUmb02eQxP+Tzc7W8WiXOZ/rQKcvKlo
         +gCT7HCerrjI3Z++7G5gEOZOr54xJdVe88C3B8PCZAeYM3RCgkLPpfRnegX5cWCKBT5c
         WVRbwRRHMAkI7UJwv4BoA8l/PLGQG9JbDSOdqhf6fMKT98iGoiYr92SZSqnk5+S1jFlF
         QbEyDbR5U0A+lM22OeL/1RDwVyzyQgrlURU+9XPZtWdWujUv2nF4CN4rgn9pkszpqyHa
         Iz8KlpRQjsfksq0txyAuGWg+xkYBS7n4rhPQKVKoVRYZIBnGe5ioGXxqIV2IvcjVa7op
         bSHw==
X-Forwarded-Encrypted: i=1; AJvYcCUiuoIdrCy/0EDDwpFqPyQfk/su3hOK51ogf55yIQ3UQvEz7Ws26sQqTovdk9dFeZ7KhBd9SwAMBfvCSQ==@vger.kernel.org, AJvYcCWp7BVazMty7lrz6mE7Mn5CRZUEG15j2LhGE68VOGMaKtBKQfx6ognH9OJs+1IenWyV3jhriv7DmQ+E@vger.kernel.org
X-Gm-Message-State: AOJu0YzEMhVsKwlfNwJ5siKRA7wEEfITx0hdgFaocujsKHRgWOUcbESG
	YLI5BdY2qt8v64zmWR2gSQYunF2TYeWS512w1JxWjsFRG0g9DkmHKp35
X-Gm-Gg: ASbGncv3z9cWt+hyL7KMPCXo4ZkBUD9RtUF8zeVZQZmW8/0FkcJDsEWBadCcjs4Witt
	O8uLBmaNkDlCoGZgkEMO03HkIa0plUG9vDKGtLgiql65EQukiEBCA16ixVIbZx/3j4wE3ilNSW7
	SRtCTOdkKG7KswHdjkxpOz1S0aGiTtLh8E++q5ImrdFTOPEEi+WTmEQvweBMuTd9yA3G6TdhQEo
	EzrZvzbbSmXWUbqGhHnsY8oylcGgcOwqdG5O6UKN/QebjdhdxW6p/WYmf1ChQoWr7nDgw1QVbFj
	PZMUuBKDTf1uJ8kmSNaW/Km0JnaZT7aQxRCMBeZTbRzm/UE/JmcwEh7oYZLUBNEPOaT/wVA2EPP
	5
X-Google-Smtp-Source: AGHT+IG3/FXqnXBivzAWNNsh8xVfD7ZQvg15nUwD9p2hN8Mh1LbdLR57At8KzqtSjzxSC6T3cweYJg==
X-Received: by 2002:a17:90b:3c02:b0:313:d343:4e09 with SMTP id 98e67ed59e1d1-31a90b0ed5cmr10102680a91.3.1751554019897;
        Thu, 03 Jul 2025 07:46:59 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:26e4:d0f3:5643:fb4a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31a9cc8fe33sm2493339a91.44.2025.07.03.07.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 07:46:59 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: pavel@kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alkuor@gmail.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] dt-bindings: leds: ncp5623: Add 0x39 as a valid I2C address
Date: Thu,  3 Jul 2025 11:46:44 -0300
Message-Id: <20250703144644.2878253-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NCP5623C variant has the I2C address at 0x39 according its datasheet:

https://www.mouser.com/datasheet/2/308/NCP5623C-D-64591.pdf

Make 0x39 a valid I2C address in the dt-binding.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/devicetree/bindings/leds/onnn,ncp5623.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/onnn,ncp5623.yaml b/Documentation/devicetree/bindings/leds/onnn,ncp5623.yaml
index 9c9f3a682ba2..11d45c7f741d 100644
--- a/Documentation/devicetree/bindings/leds/onnn,ncp5623.yaml
+++ b/Documentation/devicetree/bindings/leds/onnn,ncp5623.yaml
@@ -19,7 +19,9 @@ properties:
       - onnn,ncp5623
 
   reg:
-    const: 0x38
+    enum:
+      - 0x38
+      - 0x39
 
   multi-led:
     type: object
-- 
2.34.1


