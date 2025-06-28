Return-Path: <linux-leds+bounces-4916-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39765AEC8B7
	for <lists+linux-leds@lfdr.de>; Sat, 28 Jun 2025 18:20:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40D0C17F5CF
	for <lists+linux-leds@lfdr.de>; Sat, 28 Jun 2025 16:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C794E25B31E;
	Sat, 28 Jun 2025 16:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gGTwh4Pr"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3928C25B2E1;
	Sat, 28 Jun 2025 16:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751127550; cv=none; b=oy1NotCDflbQ8HZctqfTvOgKp5hOajSVuGD+ePgeUEIadqmtoOlEuhixht0vlkLWTm8rgRNb0tTo2+TFinqSPCF40DMBuPhOwjJFJzRtRRME43hNYRuq6KgmSQaIh62VBsOg6sX5XNoJ9cOfZIP8zLehJWIy/ec0lxWbN1I8sWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751127550; c=relaxed/simple;
	bh=qaOX8z5zfg86eK/PQiHHkZK83GpNfHTkKPNUbbYq5lQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LhBM9RSd/2prKGyOz5G+l4ylpJxOT3ElnKLIRVPq7UpCL/ulJwIl8OWT5kE3h022YNZQUeQA15uYkuXQU2P6X8u7rKCCXbQJm9I2DEdsD+YAI4u+HlQqeJb8802P4kVKIo/+/U2QpVpb64MLOntMEmmYh7H1BZSEbAnUI5BikLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gGTwh4Pr; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7d20451c016so44603385a.1;
        Sat, 28 Jun 2025 09:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751127548; x=1751732348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98CANN2mac+LxQivogTs8pZMoDn+iJwC4xTPGj/jBfs=;
        b=gGTwh4PrhYgnB3HG5Ewx69jz7XV5Optt63W6VK0e75PDJxlfycwLx6VqKMVOyV73Tz
         VJynBcp5efKQ67r/7J1TG4sOEKwj3vGGBrDdTGwzdU6tvazI5g45XU5gJTbtBFVw8+6P
         wLrISsMyqmsvygVJTpSqfE9cxy2eVgOj2W/c+RaRSP0NooamC4uRECFTmkohRNPCl08v
         t1hA7DIgnV5+zAdFh7YC0OjoRmEn/ecXdPiln3oiVonyBTZddVYTi95pGNL7ybZx+S3Y
         3hwISYnUZ3PEFeYBWhdbwOCNzD0mL6NYfSdjRhv7QIfKv1PwrBZNlQ+LWzxdvy3N/ZCO
         rtMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751127548; x=1751732348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=98CANN2mac+LxQivogTs8pZMoDn+iJwC4xTPGj/jBfs=;
        b=i+AObVFYsGrOdksiDzcVd5W6NbtOiTJasa1V24NXF4x67NkFftTxSHQiyuYfgazi+F
         qBGXhTmq73vkKx7RmHI37TXTPDRriFygGsc6eETWw062LNARKOhljNlMYCQvNzpGLtvj
         0sZFwCXK0T1Wahp6gC55x6nttromhqTzAYxLB8Z+BIdVBM4GBu9ZAEHZE7lYdlalwiLR
         6xDCBlaFdP5xiRB/q2f5urt1soiCEu8TXj1ST3FUDNI572ZpOJRWoS0Qp+ahIAssB5U7
         mEMsLbx2eLAAA1s1HMJi8PztLL1ac6a8qxobJN2KqI69LuN1rIS6uImeIZJEEA7r3cMj
         lXqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCzZfaVJVZlqn+ifPRmPkBObRu+8+M8SKxpRVIOGXFW2YWoqKcMo7IXtweATkeLVfRAfSk9EJgCLFQ@vger.kernel.org, AJvYcCVaOjvChqJUXMqKm7VcgoZTSsxfSR/LvSy7y4omHhinydjgZwBIK3k90lbKJT/ovjggxDjfT3MPwzuMCw==@vger.kernel.org, AJvYcCWtzZosOYgSspB/qnwABcu7aEHHaRmh6oz0shznjWjju6G9fLvjKmllKI9t2tckeLf0QJ6fllwohLsAQ1Ns@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf0eEVTL7jwuhGMDZfTGdhSG4lS8Y/tHl7xrPJwnk1YSzIdHIf
	j0bQ1gZOj3KV9XSk64TTtphNb+wXxIyjLNXrcYGW7C49jJ0YkkP6xG2c
X-Gm-Gg: ASbGncuM/f6mH/1YFQZAiPoGVrZYkkzmfv7qQBRXnx95zS2B8Xob53w1+U/Fm+u8ePa
	tK1/a7uUYCZE0gaZRzbfw2hgG0uQi4qMxhDe8/p6No0ZZWSPiHEXufrrCFIRQ93bx9k6xVw6mrc
	YTaO4Y0Jtd0uRidBfd+wj9qN2fHePzxV1RoS6opuVhcKXWl3lwKPZU80SAIF6u454cFoZ42++kC
	5p8fX7KM2rwHgGwMk9RsXI2WDekUmwDImS0oJOunQp8hty/eG1G8YUrCd8e4BEa6ROLXXp1+/PZ
	ofIEXDlseNyVMLStxnfUjTek52Zp8S+/hz/J0D9YVr8Pf41+cVlT4OUF5mINw7MTOE/iSLY729W
	ZnnijHNanAQICB3b8vU9m97vNJ3qhV2Ms
X-Google-Smtp-Source: AGHT+IFoFGemIQDODCcxPjL3icl5s+PMS9LVncKIT79PgFSST82p+yBw5aiPdoHzPF733Q40giqM6w==
X-Received: by 2002:a05:620a:4484:b0:7d3:cf5d:58b4 with SMTP id af79cd13be357-7d4439e27aamr952177585a.33.1751127548193;
        Sat, 28 Jun 2025 09:19:08 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44321fea0sm308592485a.83.2025.06.28.09.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 09:19:07 -0700 (PDT)
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
Subject: [PATCH 8/8] MAINTAINERS: Add entry for TM16xx driver
Date: Sat, 28 Jun 2025 12:18:45 -0400
Message-ID: <20250628161850.38865-9-jefflessard3@gmail.com>
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

Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index efb51ee926..eee24ad0a8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25047,6 +25047,12 @@ F:	mm/memfd.c
 F:	mm/shmem.c
 F:	mm/shmem_quota.c
 
+TM16XX-COMPATIBLE LED CONTROLLERS DISPLAY DRIVER
+M:  Jean-François Lessard <jefflessard3@gmail.com>
+S:  Maintained
+F:  drivers/auxdisplay/tm16xx.c
+F:  Documentation/devicetree/bindings/auxdisplay/tm16xx.yaml
+
 TOMOYO SECURITY MODULE
 M:	Kentaro Takeda <takedakn@nttdata.co.jp>
 M:	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
-- 
2.43.0


