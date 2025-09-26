Return-Path: <linux-leds+bounces-5601-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7E0BA41DE
	for <lists+linux-leds@lfdr.de>; Fri, 26 Sep 2025 16:21:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEC551BC502B
	for <lists+linux-leds@lfdr.de>; Fri, 26 Sep 2025 14:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030C92222AA;
	Fri, 26 Sep 2025 14:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qdk9624X"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113A91F4192
	for <linux-leds@vger.kernel.org>; Fri, 26 Sep 2025 14:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758896361; cv=none; b=ZiU0oWuA+nycYClM43rG6LFOq/Qod0+9vgL0gn8R52TXCVb3N8gOzzneYuYlijmfAyLgNICsRZNoXv/iiQn/PEI3c+4HTaXg6SZ7F4fsRPv1ShPZIpup6ikazlFShkuogfFXyq1WAjdxVe4GLTIld/IwNQ/iXVFPkDbSEqca9cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758896361; c=relaxed/simple;
	bh=6/JQRqBUjkyOthrpHav3m3u/rhn4XRG3F00Nzd3iX7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LeGgskMkeb2T/QUVNuKdFDRb3FsOA8AAjO4HBKreUQeFmJEKzZbhkUbu6IM7kcqjfnKDi5CxSI5e/3rUqp9eiAY15MgJ+62tzCbZqKJev4b/CXzDbsBLahPDENrdIjLxbfNUlUG8H/N/HMd8Ea/fco/ysYPAC+GHCMZR7M7XPL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qdk9624X; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4b109c6b9fcso21054861cf.3
        for <linux-leds@vger.kernel.org>; Fri, 26 Sep 2025 07:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758896359; x=1759501159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7RhkLG3JZ6AWWqhGvapjhsuUBsTMt1EMhEwLlIwGFE=;
        b=Qdk9624XheBy8q8fKYUANY0V5dF8L3t56Yq3iVWKsKT6+g7pCi3AChpD5g6arDP2q4
         KswmDsFhZjbAlrlv+bqPWFQgIZvl5s8g347+dWsfiBUMPN5sSKj5WTS2v6s891s3Vhjy
         Cb9nN8fIStc4KFcjYtRyfI4fwd1i1Op7ikFQ2yRIHJqNoewhWtF763XaZb+2VhG8FyI6
         Lk2n0T8zzT3SYzdQR3a+QYSDBmU3XAwXOaqr+x9GiZMititSL7G34yEUI2pMRzidMHZc
         pZ2PJVMy1IpZjm6htdHrTf607v3RRfi+xeBAwc8wZ4gnTx67F7V9Ki7Bd5Vq12aQSe+9
         NKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758896359; x=1759501159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7RhkLG3JZ6AWWqhGvapjhsuUBsTMt1EMhEwLlIwGFE=;
        b=LLPSJz4GtOaOHpyDw8xR529O2mpK/bUQXn0GEaPkcTTMflo365ZcY/oRX5EKtiNzjT
         RVMdSSBWGQqs/JNyaeryJR6C+WjWdo7+tix6IeMc+bKgx28sK+06bnToS52KJAGWNc1V
         ekOZQ/WK7hzcZyYh38EgQelNfmqe5S7rvDM7yRf67satyJWqu38OMMydk/Hc9pxl46yK
         AkyMEfUAyjY6LwhKHqglU9AJK9OcKK5kOhCx5T7RC3sbdI9j6MiNdPTtx0vw1yVGPctS
         3ekrL9m70H1PAGK9//bCCfy/vCKf6nYBnh0iBnO+DhkvKuD63/EtFNBX4Si3ISG2WjO6
         9rQA==
X-Forwarded-Encrypted: i=1; AJvYcCXSzt9J59j+U5b1Q0cvyg23+LwPAot3wIiVhDSvgC5+BXKq2zG6ZLHVTNK0k/KfkYfi+Cdmki8IFdcG@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm5h9efSp1xDs567iAzxIl647hfGn7RLAbQzaBgEl8ECAT0p0a
	W/nFF7IEi+lEguNnIZEKKKTJhD/xCsZjAMfXiF6LXJ+hGWkZQXwSFyQu
X-Gm-Gg: ASbGncs5svUrU4GBiamBydxN+oqLVSgDZHfFjJ+KAyCi2dsLPEB5SgrYAfTlvFrhNxW
	skYHfjBDEZiN0T7DbvJSBPKJUKGd7IcaQ/epBLZf6g6IQ/7lxsscRj/NlNbMFljWj/KnkCd5/b6
	0U/tl9BrkD+Fjrr0YkUbq2V7D4UliVxAiS3kk+LSXCMrLPZjaKfpPtnm0S+flaVKEVKPOfNq9a8
	hr/9rhJdOCAsKXEPlS2G1zEq+FJ20K4EdsfutSxIB5ilXMEKsr9IsUzrTg4iiDjaiRDxq5SUDvk
	VJraLSKiyr2q6keWpkJ8EduLZYGypsDOgnsDPb3bS3+2nxwxq9GXFXvSkLG46RU2Iusc+NyuBfz
	pjVK9cd9tvchqq4XAdHC2LZXq9mBj2g7p9Irm7xzq+8n3Z7eMWOdBv+cQAmJ9ZfVkEX2zRARZ2O
	miqpI=
X-Google-Smtp-Source: AGHT+IFYT5zqtCX6jEUpwYjGWGW6f0XlIeWfVAPlXuLdY4tpOyCPjaihGRB/xqEcUQS2/YwFMG0jYg==
X-Received: by 2002:a05:622a:4a87:b0:4d2:be57:c380 with SMTP id d75a77b69052e-4da4bfc0801mr99026071cf.62.1758896358460;
        Fri, 26 Sep 2025 07:19:18 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c28a89bdfsm287474585a.18.2025.09.26.07.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:19:17 -0700 (PDT)
From: =?UTF-8?q?Jean-Fran=C3=A7ois=20Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v5 2/7] dt-bindings: leds: add default-brightness property to common.yaml
Date: Fri, 26 Sep 2025 10:19:03 -0400
Message-ID: <20250926141913.25919-3-jefflessard3@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926141913.25919-1-jefflessard3@gmail.com>
References: <20250926141913.25919-1-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add default-brightness property to leds/common.yaml to establish a single
canonical definition for LED brightness initialization.

The property is currently defined locally in leds/leds-pwm.yaml and is
needed by auxdisplay/titanmec,tm16xx.yaml. Properties should be defined
in only one location to avoid type inconsistencies across bindings.

Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
---
 Documentation/devicetree/bindings/leds/common.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index 3e8319e44339..96bd7fd0f053 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -173,6 +173,12 @@ properties:
       led-max-microamp.
     $ref: /schemas/types.yaml#/definitions/uint32
 
+  default-brightness:
+    description:
+      Brightness to be set if LED's default state is on. Used only during
+      initialization. If the option is not set then max brightness is used.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
   panic-indicator:
     description:
       This property specifies that the LED should be used, if at all possible,
-- 
2.43.0


