Return-Path: <linux-leds+bounces-4923-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C13B0AECCB9
	for <lists+linux-leds@lfdr.de>; Sun, 29 Jun 2025 15:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB81418949E7
	for <lists+linux-leds@lfdr.de>; Sun, 29 Jun 2025 13:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0087022540A;
	Sun, 29 Jun 2025 13:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAxjPhM6"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33783225777;
	Sun, 29 Jun 2025 13:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751202014; cv=none; b=NDej42e6pFf6whT3Yos1GMuQMZC8TpirzCmFN1kQcSIuQ2+DF2tyCtar4pujYM7MGpwhaxuRrAXCM5vE3Vo8LoLXRucWLmndgKINhusI2ezw7Xqf2bBxFtv3iLksVlnbIh3FFuVY/artH2HBD0CjcFZy8DnXoKEHGcjazzH1iTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751202014; c=relaxed/simple;
	bh=Bkb0DSpaKgNDotVl98+tkhn35EvYHk5lJQNuHDhpqR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EMLYfGSuRj/MC8YIuK5G5QY/XE8HnXBVdWJO6SI3tbSar4HM5Qzj2iByR53N6ebaIQXuVdu0SOdC9s4wwzEZIW+2MMbUmLwcx0TF8RPK0BtW4eMql/BVlNhs+h1yVZCPmW/rkxqUM3mGiOlxRHLiF3PJcaChUc40G8Sp4l9VNIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAxjPhM6; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7d0a2220fb0so173687485a.3;
        Sun, 29 Jun 2025 06:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751202012; x=1751806812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LKIa1UkIqEHYKA4TXZ32HlvxWrAPwqU+G93P95AKhM=;
        b=ZAxjPhM6HXWfKzi6OOEqa8aHopTERJiodlovG8OGzN88IQkSsBXIl9i/zzA1XcFrDA
         WE7nsDDAdvKHXCE/bgTM0yFxSq4PGYlef/5aOzbmZfY16CnNWFp9b0LEtVt9kSGde6yi
         ixPc3eGPCTB98vc5/aOdBY2AiwufQxKLfPunihQxFsCBjmFqV11T4S/QZXbm9UzDNZ19
         e0OLr8fDeSVtkGAGcvGkXcWR630sj8Ce+RpwBYvpVY1+9XoYHNH30PIIWFWzFxpjmuR+
         7Gx6wzYuapjbkdQqeWWq8/OqcFzK2NoWlCpml5R4Rgz8ONqCmDxykcggVAUceZscLHT3
         An8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751202012; x=1751806812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5LKIa1UkIqEHYKA4TXZ32HlvxWrAPwqU+G93P95AKhM=;
        b=O9EJ1EcU2zmTqkTqfUtvFwe/NLKNv5FKO8DRoYLV3nwX4670YYo9MKCxnzUNJeva3A
         NVeEubvzyt9tM0FeCOtBIeBYWpy/vNyoBnrsn15XZbW/yUZ8IMWYE6b+yzMJp6D+4nud
         eOqX2R2bhVWIpwI/h6rmTT8eh4RmZRVTWxPaD34V7zYzdrgcnUg8iR1o1cdxQ8zvhstN
         tuDwiY69dQUI24G9AQCCRoAp4BoAI7jLAgV0ulw4Nr4bWAY3GmhOrhFQtpO0ImfuuBPR
         MUm2zw6UX9EcBiM3Dsl5bPj1/gqBB2M0Ek7J3k1Meh6gGomxFanxA4E5D5LOY6A3oToW
         zGfQ==
X-Forwarded-Encrypted: i=1; AJvYcCU44Oxg0fA0jHOxGxzOmTGnuzEgLC3urgN+MjSeJucjeOmgHMqQbF2b9a5kq9EzCEUyQwdHsiKPg8fR@vger.kernel.org, AJvYcCVE12fOR5/iQ53mGgFg+ymb7TbwvF/gkR8L4Q3+MuvnZQcS58Vu0bZL8Qva/SMEe7+SzvV6CmE3rgPk9Jg9@vger.kernel.org, AJvYcCWBtFHyt0VTC0okuqj77Eh7mIlbxFvMBa3ACN97ixij9/kkMr9vmtuPYkJa7Gm3le6bVmspS442fudO0A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8eE0hn4R32Tj69y7oOQw84jznLzpU7V7ErSknNTQNNKIYkfLV
	55KK1pHSRHoYaS0riUPy6098e7d98ZMfSrOZ2Bxoa+CDQXltDPlRXWX0
X-Gm-Gg: ASbGncvzoYD+xPuCmskZq75DasU0EZ/dMAC2FwUhR0OYiMIi92mTWM/ikgQPPg4MtHF
	XEHQps8+1BM7zxv7Ce7gSArfT1LuEQujFnVPhy0YjK38PcqTykLMj743jzAnKbaXbwhiQ3oUKIv
	evYdF+d4u9wZHm8DY5IC5X3vkC+chZ0zyUaZ71wAs1ghWmr31drtNTYhnmSGpuvBvWut/mfLAiZ
	mQYns6TYkwey+o7f4B/tk+mqmRXLnTFim/uxCPOWMCCLm6TVQxo4/idzAFJkSZCLHZuJ1KPhOI+
	FmyxzyPx0UMVurlPR1aI26XSkr4kzklzcrtpcoktTjaKuIqO32tJ11R8kmsuV4G0RA4AbQMgSSJ
	bukm5fmjE6HWihyH2HXrgXMSltOPngdNO
X-Google-Smtp-Source: AGHT+IGEA5tebGug8XsRO6EpqJwOU4VUE0SEFDgXFVSNuceQniMx6eeeTJFYxY8nBnxBJg4lGxx1vA==
X-Received: by 2002:a05:620a:b89:b0:7d4:254:8377 with SMTP id af79cd13be357-7d44399345amr1201837885a.58.1751202011633;
        Sun, 29 Jun 2025 06:00:11 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d443181e63sm432919085a.49.2025.06.29.06.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 06:00:11 -0700 (PDT)
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
Subject: [PATCH v2 3/8] dt-bindings: vendor-prefixes: Add Princeton Technology Corp
Date: Sun, 29 Jun 2025 08:59:53 -0400
Message-ID: <20250629130002.49842-5-jefflessard3@gmail.com>
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

Assign vendor prefix "princeton", based on their domain name.

Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index d02615496b..f03ab02afe 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1218,6 +1218,8 @@ patternProperties:
     description: Prime View International (PVI)
   "^primux,.*":
     description: Primux Trading, S.L.
+  "^princeton,.*":
+    description: Princeton Technology Corp.
   "^probox2,.*":
     description: PROBOX2 (by W2COMP Co., Ltd.)
   "^pri,.*":
-- 
2.43.0


