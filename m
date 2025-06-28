Return-Path: <linux-leds+bounces-4913-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4302AAEC8B1
	for <lists+linux-leds@lfdr.de>; Sat, 28 Jun 2025 18:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 699D43B8950
	for <lists+linux-leds@lfdr.de>; Sat, 28 Jun 2025 16:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F52E258CF6;
	Sat, 28 Jun 2025 16:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hdel21P8"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109992586C8;
	Sat, 28 Jun 2025 16:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751127544; cv=none; b=piH+Qf+6C7GsWHhFD0I5NDsyRHxXl7XvVS5yrB08Tky/u3N8/nzcZkHlfgUc81MvpF3raLcmwIOk3qr2ziosMNsc+ymiOlh9XaQetpeSwG3gboB0SLUu/ofqBjcYtL/2V0x6p9PnxqCq6mBY7ZbN9EIa1bvDz/2gviM/bcHEEiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751127544; c=relaxed/simple;
	bh=G1Q8D6jOikxX1zwFXkcuptTqFJ5Isuw2m8fvtA+iz9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j4L6V8fHZL9RHg8OJL00X/jx0Vl8ZmzIJXSKb2ISlBN+J9OHioyx9MfhBC9K3l5J07tHE1OH5DU3cO8UxM+zQ7C60E+NM0GLOW/qZtGlPmP0i7o7xMi03XDyDogpxalORznRkWDEeapQItJtmc29X6MY6vJDxnU5BKImyaWioO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hdel21P8; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d0a2220fb0so103026485a.3;
        Sat, 28 Jun 2025 09:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751127542; x=1751732342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAYRuJa0HJ7gSh5MDCUBCeoo30fnrv8HsvgBIoglxMQ=;
        b=Hdel21P8u4MLtEmTlrFPMWgZrH/XmymxAt57KTksHlgOB7oY0OhzCNXrErCbsnwpTI
         SJcp+HqaQ17PQBj/tuhWS/RKHhxv5qaMQqjSlcvU4pKaXEv3QMbmEfEMfmxGI13Dop6/
         pz6xFiy00DoAIJ36QPY8sfOhFcg24J3JL9ebYaECZGBvssgwkZbvXuPaJF+RFWLLuzHg
         Dm9xWQzYrhO4qXxzd/lcyG9peukgh2hwvLNNDWkx0thghAFi3pe1+jevHgY8xaMDlwAW
         6nfmSNOEg6D6GMUdoiLH8qzk57sPKGPpR6xnOL5BHRTOmVZ0SyPoo5UPCVSKRfgIwc0Z
         hnMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751127542; x=1751732342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TAYRuJa0HJ7gSh5MDCUBCeoo30fnrv8HsvgBIoglxMQ=;
        b=noh1K5kiMgOVWreimC7UMERoc43XL2AJr0YCZQxUJnXH4856NmHEIHczoYJ8IThqS9
         CdjcIjG89QnHy6ycLlFYHc/dEUdRUM2EMOMkcmPkXefLlq4onAL0LRV4m6lzEF8qeSWv
         7f/MlEKvRoe5ZY0ZWA1et6r2nDUXvKnpphMd0qtibfETXS2/WaVPVwcqTQKH6rUn4icT
         ZRB8eS5Q00pPu3ouQFG3/o4lJY+Pg+jOMJGKa4DrmmpKk86NP22gkXeqsD4NWmsWBQm2
         g5r4+px4oPlixaGgTYEPHTwZ/Xg6EbqB/RQKJoFJOpgyNWavrkVnBZLBupQG4A7NZ5+X
         0dMg==
X-Forwarded-Encrypted: i=1; AJvYcCVjfh9a2rr7Ay5faHTBaaA57VRQxWhRdUCe8Y9Ftf2z0GypHzg9tfp1Gj2lILwCIM7NM+Y2FKqqjVp5@vger.kernel.org, AJvYcCWnpRgbQingGyRuSwrSwlq4lL4jaSlnWJTU4BECT+kSrcUL/e+If9zfufOo77Fackt2DReRR7Hsy6agQ7QA@vger.kernel.org, AJvYcCX7q49vvX7JcOt4Py5NY1SAdsWG64ctC0xfJAn8Mg+/t1pKJf1mZMN0SWyXWtONS0tKE4KF6KGi78N/pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzupKwDrnWRYTsm7S/RpBW9OizE0LYRtHlAlnszLHNB8Yc6gifs
	5Dh+CCTKfl4nKUOz11L1XSRBB6BF+qWuT+EC4yIm/PTEnZh2RokYT3W9
X-Gm-Gg: ASbGnctJS0Bj/9vVDjUxa5ZqMeR7tkXUAe/UzK7hYvBqybGvK1urWleoQk/ie645TOY
	Stmyr5+xFZUEj/7TUeGSJrQbDR7UFHJDPbuegf6TRJRSF7HBd7n8kWv/Nre3/glmDJR6bLCMf3C
	TxQt0SvXYcm/kjtsCw2jtPZXakKsqS42MFVZ6gVTUPvTtgBLPjl+0b48TotX/RkhXeWPNGknmhs
	GCM+j9Su1MKXJaP9tcEyV89iaLzTYzw7rckUzrL5vW5HvzgVPuTP901JC59qxkfv+AUNqEm+JWE
	vPyv/ziuPRRLKUzLp/cI5UNgCfwGCUqNs63fVpQax05z9bu5BUhSUxmCvk6izcYiQLyW8nVhoRE
	PXpvdpfU8GTNQ+W1OHQHTjPc+BnsRQ3oC
X-Google-Smtp-Source: AGHT+IHiBbj8iEKe2+4gRjwqaQ3NZE3sB2B8QOX8DFW6zPTUO+jBtdYEf314ptf52zfG+gUjAcrg/Q==
X-Received: by 2002:a05:620a:46a0:b0:7d3:9012:75d7 with SMTP id af79cd13be357-7d443976abfmr1164283585a.43.1751127541996;
        Sat, 28 Jun 2025 09:19:01 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d443204e61sm310869885a.75.2025.06.28.09.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 09:19:01 -0700 (PDT)
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
Subject: [PATCH 5/8] dt-bindings: vendor-prefixes: Add Wuxi i-Core Electronics
Date: Sat, 28 Jun 2025 12:18:42 -0400
Message-ID: <20250628161850.38865-6-jefflessard3@gmail.com>
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

Assign vendor prefix "icore", based on their domain name.

Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a3bf93e5dc..def3530099 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -694,6 +694,8 @@ patternProperties:
     description: International Business Machines (IBM)
   "^ibm,.*":
     description: International Business Machines (IBM)
+  "^icore,.*":
+    description: Wuxi i-Core Electronics Co., Ltd.
   "^icplus,.*":
     description: IC Plus Corp.
   "^idt,.*":
-- 
2.43.0


