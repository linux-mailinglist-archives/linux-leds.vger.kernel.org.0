Return-Path: <linux-leds+bounces-4925-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 83684AECCBF
	for <lists+linux-leds@lfdr.de>; Sun, 29 Jun 2025 15:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADD0C7A965A
	for <lists+linux-leds@lfdr.de>; Sun, 29 Jun 2025 12:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B44522248BD;
	Sun, 29 Jun 2025 13:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+EmVxqi"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C617227EAF;
	Sun, 29 Jun 2025 13:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751202020; cv=none; b=n5TM/rlvodCIC7j/XPVk48Qen/xr9gx/s3tylUezUwKSkJH2tzC+OjS66w1TFtzPuz3QDGcelKBuVmqtK3AXUn0i9l3Rwf2yD8nrkLaN3BNQ7/AbYqv/bRn/GZjese5oAlAyrWQDtftmYionc4C07oVFxMDm+2WYsHAdFKaLu1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751202020; c=relaxed/simple;
	bh=G1Q8D6jOikxX1zwFXkcuptTqFJ5Isuw2m8fvtA+iz9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UWWHIwZL9e0C1NgHPmxVooTynl/3lQcACLmUK+7fhh5O2qLWYcABQ/mGupwPZSr5AoktSuir3heKaycPSFjFc9hQ4I8/7JPChstpD/E4LDgGA6x75uYwUE8riufufmQAalM3KzRrUd9VJHJiSTikOiIZPRPxJEAWXX/I48DIl1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+EmVxqi; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7d44c6774e7so56877785a.3;
        Sun, 29 Jun 2025 06:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751202018; x=1751806818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAYRuJa0HJ7gSh5MDCUBCeoo30fnrv8HsvgBIoglxMQ=;
        b=O+EmVxqiTptOlIXL4GUk1xVkXwdupQv44bTv8mQAKwXIe0sCAvp26L1Q86rtrKXtjV
         HIKQMA6GMD64oOeFWE2l0gTGZDU5ZNLh2JEW6Vok3zB96X+2qXnypZythkt4aGV9EKXK
         qTvuJcllbP0HmpQWiJSvnEWQni6CzUHRVvdnzZkSh2BiK9QrNQ3aVUcLnnwo+8v4R2W9
         yr0wQKdpu7zo7VDfj3r0ARguPTMEqr15TOfK6V0pt0NI826n2UOqdg90WzIWYqPAyHsh
         vsHCO0CzOPdyjaLfIrDxxw7jhu9tNmEJOnoajhpNn4LAsEhVi/sXkJD7lFqgyx7QX6BL
         uPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751202018; x=1751806818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TAYRuJa0HJ7gSh5MDCUBCeoo30fnrv8HsvgBIoglxMQ=;
        b=mUQ02tif02pavG1meiFUmhe3jUlJnR4y9dN4XEqpVZZ5WHFeWyOsvRQrrfyOGo6k1n
         YcMuBoblQ9LWT4RFEPACLNZFdootbUOzKyje4R8coV/XfZiHMNlttJBzAjuva4O21TjU
         5tG4ukoVQegBl9w24NmfQFSGpJJbTlF3NxtAVY4Rx/9mKPJRhhS/s72lF5PhILPQqUVD
         IvqTxr8Bli5uCFYCDqqB+Uzt/KfoDhClnMXdWSEKgpMr3VWh6De7tt9yq0nYYJI8Df7u
         jtU/xTjyH1Q45p6AtJYXVyBxFfiQEuD8+5mWcQvjBePhg8ZjfgqcAW8ciG00dPrMz9gA
         TEtg==
X-Forwarded-Encrypted: i=1; AJvYcCVjsJbyCTP5cS9z348itMnVzrYhhkr8hGVWM4GVIF4XqY+Pn6zWroNNPUzIRo+4L22R04lU+BgZIBNmf1OP@vger.kernel.org, AJvYcCWKf7a6kt0pdHu9SlGrDUGqP4mMsSIcdBWufX4D9bxi6AEUrmareI1QdPYRbG/c475U/FkF/hTil2Eo@vger.kernel.org, AJvYcCXjILhe5JkkELwhiaqfCpWEUpY6CbisiH0SYK88Z12DsIiAyIhO1D9GqP13OG8ddiS4/mDOgKZMjRGiLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSB+80UTh/5v7X/D2QZ3DLhlsbvnc+wunSL7CRNrZSLiD3p1+H
	G809pVOmHsOU2ovr542J8pFvkUABoYQ8P/PF7P+SkWwkHlM1BnbdLOCb
X-Gm-Gg: ASbGncupN+zGmmaG+/ybP7ZWtyxNUHE5Kr/3SOQGE/D3j52QHsQWTK61tR5YUdA/O8L
	77MAWebR8/7FJmfyM4MRQ+U45K39KJfGtB7w6pJXaEPb2se2+Bam+H8pqoiZTKlJjjDcMiUrlwv
	GYWqOxigQMT1rotfQpCk73TDAcAAnTpMhwKp3awcY5xEB+cxaaLUDVzWQ/p79/Omk9erth09YlE
	SWtdyRMusBdWTEnfQpVz7dRe0CvdalZMHIUM0/gKnKsk18NTub5ZN8u4r/olDLr/bDFJ+HKnJ/q
	n6DqNEjJY+8P7W7UBLmsiRTU+0/X6tiG4U3G/8R60CE1rCZjCb4PaFgxmYX0hnODAGomYwcPaSO
	bzPzlzY3ALsc9J4MKzJyrnlXZrmW51vFf
X-Google-Smtp-Source: AGHT+IGpp4H+hY7xTDDn33o0Jfx0luRjvrsBmgn4ANcBYYq1yGsVOrwEBfC9ltoCqZNX8DId4b05Rg==
X-Received: by 2002:a05:620a:4487:b0:7d3:99db:c4c with SMTP id af79cd13be357-7d44397de38mr1392566985a.6.1751202017633;
        Sun, 29 Jun 2025 06:00:17 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44320265asm432010485a.66.2025.06.29.06.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 06:00:16 -0700 (PDT)
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
Subject: [PATCH v2 5/8] dt-bindings: vendor-prefixes: Add Wuxi i-Core Electronics
Date: Sun, 29 Jun 2025 08:59:55 -0400
Message-ID: <20250629130002.49842-7-jefflessard3@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250629130002.49842-1-jefflessard3@gmail.com>
References: <20250629130002.49842-1-jefflessard3@gmail.com>
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


