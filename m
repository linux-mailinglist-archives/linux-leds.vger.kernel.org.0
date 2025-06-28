Return-Path: <linux-leds+bounces-4909-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D4AAEC8A7
	for <lists+linux-leds@lfdr.de>; Sat, 28 Jun 2025 18:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F20E1BC0FEC
	for <lists+linux-leds@lfdr.de>; Sat, 28 Jun 2025 16:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D2A24E4A1;
	Sat, 28 Jun 2025 16:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJ6l5nFM"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56021217F27;
	Sat, 28 Jun 2025 16:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751127537; cv=none; b=AeKHU74P0k74hQjDLxZ7rch1mmI1D261T0HVyoQeLUjdPwKe4TpwI8mN5QSISNLzWgeiQlgYk4ua1iS8vXPCUihtaYXW0FqWmR4cqrAGUF8KLYGlCMQqJg3MD+0zkUbCILG/+xp/ODzi5Sn/ZhZ02qhaVNd5UFMuTB7bxzt5KmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751127537; c=relaxed/simple;
	bh=VPXwInonU9FGvXJ0LXgLGZ+V0gSc7vckQtgi8zBOXZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WEDDVyLtmyDuviM4BWkaygA4Q0+wgZX6YRwNbPCSDq08jNLZErU9y9DYaMnWut1/A+oBz36lg72DBqHFXbUBoQv3BS/nHjEw6THtb0qKnSdnGdKBvoOvxDbeshfs6R5jyRpu6QvywoWZeq+1w5QkbUlLE5MT5gGWbMkYsj6l9sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJ6l5nFM; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4a43d2d5569so11043831cf.0;
        Sat, 28 Jun 2025 09:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751127534; x=1751732334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IouU7a5uPzIAqGhqgxh18KDCBsLsQhNOKT3uXf6rrdY=;
        b=hJ6l5nFMw7WCWUf0MriqIpfDsuFSjmIckW4+tGm+iqWqB8xeQeI7Fp4ctKGXJkodz7
         tkpHEoM+4Ed4Dw/mIMPW8YQkehKSt/m4w9ZAQewUy2d0sAQmbjQgQyqPCMN0OrZzNYIp
         /g8lIi0kINBCLMpHk5KMoHagqvAyCuFSfW7NWTUnOrgJO3LIDUbyz4SVum/WK9KTI5f7
         ZA6/zUl4mcW5U9njfsitQnHuT242aBuI58gqWdqMXxBg7vJdH1JKFOWTp5x1Yzu+elp2
         R9uEkJ8OnceCzf4B7PP5EJBGH+vzeHcKtC4c0/lOvsmtsCWi4f1PK3vhwBeN/g6cVWuk
         RKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751127534; x=1751732334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IouU7a5uPzIAqGhqgxh18KDCBsLsQhNOKT3uXf6rrdY=;
        b=krhZ7+Cm/oclJ5YTE+oFAXCvo35dufIgVRNQiUz450HLBhjHVt+76nOL4ZiPItNYid
         nGI42aZ4luzYjgM1tFyxovFAci4h8TMEEqB6BMikU5H6bH2g9sPPJxuCz6VCH9FH6fOj
         ue+r+EZk9P2qjJedkx5KvHA8v8VzHoHdsWSTIFUddIFvlcHWquo7KTshMzgChUGNq21q
         +FYbJhXQ6oez4y5tU3/DimGPvN0pnmAwV6bJIEW938fGRgM5hVWPjQqowTsDeoFFfBkP
         4Rx7WpdvhWUerxUTPnGEwlpXZ3k12nupBvnGwHafwxLqkn+POmnJFOhsF6zmzpWfJZKp
         ZoIg==
X-Forwarded-Encrypted: i=1; AJvYcCUE+GbbUkTgVeAJ1aeeyImoQlQwwSdHWh9Iidrzi9ijx/uVtGUZ/DKm07bqq2xxc7VVVZyzIwd88ZpC@vger.kernel.org, AJvYcCUgR0BNS8tvXxMVKltDIjER6vwL8tL3HHCcz04cmC+EnwYOq+NidS3woNV8qqFlqybyEA7pCQX7IiZc6A==@vger.kernel.org, AJvYcCUx0/4rHspBOwqvWNZ+rHV9qPVHYtNNK3BxEOExF1giOdrWRflGD8yv4bxTf84Sog3eEjC5s5Hba6p6DQre@vger.kernel.org
X-Gm-Message-State: AOJu0YxvSGFYwwgcW4TWxw9v6/J5WcurKP9PbiujhKp3/V8ep9gbNa5Y
	/NDvCObhcHKr/1lhb7zJdKZ1SoBjQ3GyemxT11oZEyZDrhxsEBry5ZKN
X-Gm-Gg: ASbGncuLQ50SB9Pn+w0650bfi/plAXtfedn0S6Jy8X6/3Q+CDEc2QESjg4uogsN9esB
	Rfr8UWYVKMyygVMpETNGDlzvA2/SKF3OoN5D686r3tlV+RS+0mFscKe9J0NydwynZWhN/m/G8jL
	yTKqemtTiWE39ccAuxz7jaMzw7RVFjo6Vx6dYtM/X6T4Idlo8lIL8hfhJ5SqYup4naM7Fgozhbh
	/r1D8ZbY0EYoDXHQstAH1JKMkVXhCYHXwtAIEZcnzA3bdMSAeXFuyrlPFfEGXoMV0sEMwUkrpm1
	rTEwq86M2sli9+LEVuQ8noUk9OX0M97MhmIiGNfQbn2PjHNAgsNXm2mfAhqCCUiZHJx/YbJXN+K
	7PA0f0WWT5BvCBj8/IxWYTrGoJuxSSN0T
X-Google-Smtp-Source: AGHT+IETkItWG/CMQfiNp+JYdOeMiJ6C1plNmuE3wk0XkqNXdVHYZtofeYVl4MX3IzErWDL2bWT3Vw==
X-Received: by 2002:ac8:59cf:0:b0:4a3:1b23:2862 with SMTP id d75a77b69052e-4a8062447bamr79364131cf.50.1751127534142;
        Sat, 28 Jun 2025 09:18:54 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44e13d800sm119698485a.71.2025.06.28.09.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 09:18:53 -0700 (PDT)
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
	Paolo Sabatino <paolo.sabatino@gmail.com>,
	sales@fdhisi.com
Subject: [PATCH 1/8] dt-bindings: vendor-prefixes: Add Fuda Hisi Microelectronics
Date: Sat, 28 Jun 2025 12:18:38 -0400
Message-ID: <20250628161850.38865-2-jefflessard3@gmail.com>
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

From: Andreas Färber <afaerber@suse.de>

Assign vendor prefix "fdhisi", based on their domain name.

Cc: sales@fdhisi.com
Signed-off-by: Andreas Färber <afaerber@suse.de>
Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3a..9e4d251e71 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -531,6 +531,8 @@ patternProperties:
     description: Fastrax Oy
   "^fcs,.*":
     description: Fairchild Semiconductor
+  "^fdhisi,.*":
+    description: Fuzhou Fuda Hisi Microelectronics Co., Ltd.
   "^feixin,.*":
     description: Shenzhen Feixin Photoelectic Co., Ltd
   "^feiyang,.*":
-- 
2.43.0


