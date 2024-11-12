Return-Path: <linux-leds+bounces-3390-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9669C4CBB
	for <lists+linux-leds@lfdr.de>; Tue, 12 Nov 2024 03:41:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65627285F45
	for <lists+linux-leds@lfdr.de>; Tue, 12 Nov 2024 02:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83236205E04;
	Tue, 12 Nov 2024 02:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1q048LS"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CD74206E;
	Tue, 12 Nov 2024 02:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731379278; cv=none; b=syP+YBTGRE/Q4K4hk05xfZvZdfOzwBg7BVrUMEoGcjVLXS0IPNhvIEeDfeOeIO10xu4XdbWx9SyOHaKU1eDws+h7MgU61NNNietfs7QxVZl4r/a9Icd+pD/+oVDR5+8WUqWPGg4ye8+t1rEDznz2oWta5H1UEEEHk0hlDZ+i+kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731379278; c=relaxed/simple;
	bh=V5vwGXQSOqlKHor9QPKQeOp/guRxpMu2AFdh9qH8knk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tld+IJpTNb4FhxGNAjP3Bl6SYvZhb/Yl8/b+XDREMZFS3b48TcdrCDU9FtEWR7InkDCLmxlKY/ZpPMnBaRA7LET2T/JvxUmMDehCxZOtTfsqxo3ol8M/UEQr2zPb49ZHh7VPihw8OzI4Jg//vBjB3cP+hg+0Z5vkoVmDvPGnaB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1q048LS; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6cbd12b38b4so34190156d6.2;
        Mon, 11 Nov 2024 18:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731379276; x=1731984076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fTCWKcQDfMBnJLbE85DJwjJzGhPAmUIYQ+EBhwUivc=;
        b=S1q048LSOjDhj04UihhaklbupVGQ0PykKgv7EKT8RJJCmx+QT4gyTumntwDz7YvxjQ
         2dFfRwnowseLjW7hkdFRNQL2m8yaUjSb9L6GGcjMv094nPwQxEroo3V/YetZWpfF3ir9
         cETs43KtncRDMZS+NZug+K2PnZkXl4jW0Pj4arqRmMCIM08Sx2bw8Ww337T9bpIS0lSx
         BZ2x//NX0pn/5hmYIBUiG9/gz3t2Xn8Q5JJ4rcu3LiBAEY7Bns42H/rmxbOXnagUC78Q
         m2nL17wpUbM2/tade7loAdd9ACJXIOe18nkpYQr0ruQTEQ8NhWjtGd9ZVZ2cr5lXfppd
         LIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731379276; x=1731984076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/fTCWKcQDfMBnJLbE85DJwjJzGhPAmUIYQ+EBhwUivc=;
        b=uRRcPliADJlouKYm/63igSQcG+/DHOB9G6Ktx429lmKN9JLY9uFeDvODJcijkB6otD
         DIkYMoHz/o2V6EBjyil7kNjXg41TZRatWluhMjp0rxTatRzGXJ3v+I10lftjza1vA3yS
         OUY8QzPbZAZK48SVjEjx61FWMXlHbY3t/KOgxCnq/iiP4TLA4ahnUcZ8Jd8uW5cgt4qW
         MupSoqYM+C1ty12BVqbmYuqeyH163BEgaLt/CSbO1h6iOH0fs6Cc4UVdRS9+urP+/s9g
         Orw7D2MQRqEpxcqu/m8YsrAoZ1Q8LZcZiZwHTnStIQ1wtOtqZ4q2Sb8W9VlW8tBjLwQi
         mI4w==
X-Forwarded-Encrypted: i=1; AJvYcCWC2ditht83udxpQi8xlKft2Zg0xj+QflZ0U0qAjQNV9BrPSHEWCW6g+2SBnHzum1d/Dg0+WpC4t7lo4hDWEw==@vger.kernel.org, AJvYcCXf4UMsB9KSQvw2De/X1WcLvBEFOW2xeVoVEvgjfXUE6G26OirmZmthXZl43DYA7/PTBTKLTPmIu+3Y@vger.kernel.org, AJvYcCXmqGwEEL1eKl4CwlgrKAKE0ly7Rgh+JdNS2mI16XnVcSpUI+Vn9RbsylFUIvkAtjbhGLfLai3YOd97bg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaMZAg3DX41kwswqt23rINC2eChpiUBKkoeAr+wM6OG++cd2tg
	mQv6IR5cmBF7hLj2RdGZthGUHMwcnye3vlAp8BF89bfd+8nSW/L/
X-Google-Smtp-Source: AGHT+IFhkImVyedpIPs/d7A+Jc9I6MAHP+B/rf0r1T+kw/i4mSdsbNyLCY4GeNd2fkeLgFZqNTqQPQ==
X-Received: by 2002:a05:6214:2d44:b0:6d3:4553:49ac with SMTP id 6a1803df08f44-6d39e1cf0b6mr219340096d6.30.1731379275858;
        Mon, 11 Nov 2024 18:41:15 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::ea7f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3cf934d85sm3618496d6.33.2024.11.11.18.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 18:41:14 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Fenglin Wu <quic_fenglinw@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 2/3] arm64: dts: qcom: pm660l: add flash leds
Date: Mon, 11 Nov 2024 21:40:53 -0500
Message-ID: <20241112024050.669578-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241112024050.669578-6-mailingradian@gmail.com>
References: <20241112024050.669578-6-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PM660L has support for QPNP flash LEDs. Add them to the device tree.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/pm660l.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm660l.dtsi b/arch/arm64/boot/dts/qcom/pm660l.dtsi
index 0094e0ef058b..3f8b9eafe164 100644
--- a/arch/arm64/boot/dts/qcom/pm660l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm660l.dtsi
@@ -70,6 +70,12 @@ pm660l_lpg: pwm {
 			status = "disabled";
 		};
 
+		pm660l_flash: led-controller@d300 {
+			compatible = "qcom,pm660l-flash-led", "qcom,spmi-flash-led";
+			reg = <0xd300>;
+			status = "disabled";
+		};
+
 		pm660l_wled: leds@d800 {
 			compatible = "qcom,pm660l-wled";
 			reg = <0xd800>, <0xd900>;
-- 
2.47.0


