Return-Path: <linux-leds+bounces-5515-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F703B594AD
	for <lists+linux-leds@lfdr.de>; Tue, 16 Sep 2025 13:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C9A83BD7B8
	for <lists+linux-leds@lfdr.de>; Tue, 16 Sep 2025 11:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F9852C0F8F;
	Tue, 16 Sep 2025 11:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MaCmwuxh"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C658C2D2381
	for <linux-leds@vger.kernel.org>; Tue, 16 Sep 2025 11:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758020569; cv=none; b=EGh4hWOTxsQTk60idwHzu0GqF8JPTVTXPSbe99Lu/9U5wsGAyBYNY5eNQIurU8Q7nVkk1hIvkNeOCnNjBROezeuZwWGw49yPi6rgF5VQ0YsU81ppX/1c3M0lS/XxV688pBuQd9X50iJhsMxXhU28pJC2SV8KGlGLfJuYvz4vw/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758020569; c=relaxed/simple;
	bh=qdH0cwSzMgSsRxBe38syostBYt8ms24y1BNRUcCKgE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PQbQt1SNW28Xuf46gcAFuv3VJRfMJJspQg1eG1JWQTQzYYTcNAOYJyTSLa/dFM9csDCeQe22oZviNeW7ImVTX1bNFmyXNVvSNO2SS8+Y/MvuEZdWPpA3pkp9h1Jvf4x57mia2dOoTZwA3OY0mDVrLtNrthFTQzbDAv97aKBnpvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MaCmwuxh; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-77287fb79d3so3980123b3a.1
        for <linux-leds@vger.kernel.org>; Tue, 16 Sep 2025 04:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758020567; x=1758625367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4b6XW87JsHSuraknHjB3p/ca/yYzIT1w7Wpy7c6pfmE=;
        b=MaCmwuxht34jXbsj3VlalTsFqXFqDvIxM7MtX1ryIchJJlXEmpORU5DawXx4yQCya5
         bSmkxyD5IqYi+ESUfWJY+JR033qj25jIAHKUEPcDMEsRdaczznFPY+FDOSSRbkTWUbsP
         Zld0D14OyiDmO04DpN84ndeMtCQnI4DXcHKtkxN6q25Z0Zc9W5RNoy69psB1SAAbFDkU
         YQznLPlm+Fdn0HNLVzmp0Yj+10dkan3dh3q2I8k8ESYyfpOnzgWdcStDOTztKOXh5+ev
         +xeqkuAl5OzF9KSg6DolbTZob0OqPHKanhFASE/cTujvILq0ZbB8Mg8EqfdfoxSwaEWm
         lEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758020567; x=1758625367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4b6XW87JsHSuraknHjB3p/ca/yYzIT1w7Wpy7c6pfmE=;
        b=e7iSFS11R8CJ52xOT78g1O+4GGTchlJEug0+a/jF2FS66wYWSZuKRw5IKz38HfeBjN
         a6GnQF340aYe6WbL2O42ff0N96EPaBsB5G2s1nIKPL6YEP1Wtu11A78fWP6VrTyo4LW4
         AkI0tO5ecHifxfy6KkdVXChJdo7V05HZ8Vvo6C/5HxE0nMe2bdStoybaqIVSrRYCfggC
         8NxBP39uyAf8FyoWBAKodiyb5Rt45+d5wxsMLl8XJgeC2tQ45TPb7eMUSI+5iSRlGu1C
         lQyWPPB7aAIzZAyrtNM/n6fSCPuLf8hrIv7KxAF6D3R9rJNuGC1jdZQGgx6RQ5MEC5ah
         BCIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnN4DY5cjgLGezgV4ZlRFM/3E4aW46/rCy+J5jTdjFOXT+T5dQUACtVPZl2ZMFnebYY+2m3SmCjPLm@vger.kernel.org
X-Gm-Message-State: AOJu0YyxH1V2EAFYcogg1KIHlbXD4zAQwVwh0Ncm/tHguR3CoAu+yDry
	4/iRoHNTccUugmk7tlAJLFc+kyx2nzI4DbL9fDAxODc4s/mi1AwMU0ew
X-Gm-Gg: ASbGncv4ZUOQhncHrI6QMBLx/YFUTKmc6hdCVwuRGnQHctpMQWMwWUrFWe6GJGeX7Cj
	SfrC2eJDDu6UrPSp2j0XloTX4lwz7d0ECRtT3ZoCBzZoOAVVv16VSrz7Usb5Q2oCypNS8haC5x8
	zYSVhM48nFkS6N86dS2bczymRWfzUMHnBJfDJqfJsA3noESaGlBvSpByQwvoMORONkLaqPIN7Te
	ZE/FlI832qEgOQyYMjE68MFY8siBZUwNBXmrAJwxbUr5E21fFxKL6WPL7zfEybZFiJ8JQLn+jtp
	v4E2R2ff9a8J36iLAzbh97F94yft8Ofc4mM9ufvQvS4pDFfY+oH0L0RrSwH+ZSfGdkXJX+SsbeE
	xT4vXqya/J5+XK9zfvAGArKJDJYY0vv5KmJfKvqiVWI7D
X-Google-Smtp-Source: AGHT+IHMVHV6SjMVaNeLwIfjTx7n2IhBfG8XbV7sSrXxMiys4dDXgEzR/rAQd2mdNKbFfT8gCZG3/w==
X-Received: by 2002:a17:903:1b4c:b0:24b:640:ab6d with SMTP id d9443c01a7336-25d26e4872dmr216575945ad.49.1758020567101;
        Tue, 16 Sep 2025 04:02:47 -0700 (PDT)
Received: from MRSPARKLE.localdomain ([206.83.103.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3b304ce8sm158761725ad.128.2025.09.16.04.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 04:02:46 -0700 (PDT)
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
Subject: [PATCH 5/5] dt-bindings: led: add virtual LED bindings
Date: Tue, 16 Sep 2025 23:02:17 +1200
Message-ID: <20250916110217.45894-5-professorjonny98@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916110217.45894-1-professorjonny98@gmail.com>
References: <20250916110217.45894-1-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jonathan Brophy <professor_jonny@hotmail.com>

Add device tree binding for virtual LED groups.

Co-developed-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>
---
 include/dt-bindings/leds/common.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index 4f017bea0123..39c34d585a47 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -63,6 +63,10 @@
      "lp5523:{r,g,b}" (Nokia N900) */
 #define LED_FUNCTION_STATUS "status"

+/* Virtual system LEDs Used for virtual LED groups, multifunction RGB
+	 indicators or status LEDs that reflect complex system states */
+#define LED_FUNCTION_VIRTUAL_STATUS "virtual-status"
+
 #define LED_FUNCTION_MICMUTE "micmute"
 #define LED_FUNCTION_MUTE "mute"

--
2.43.0

